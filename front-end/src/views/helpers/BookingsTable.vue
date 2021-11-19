<template>
  <div>
    <b-card>
      <div slot="header">
        <b-row>
          <b-col sm="5" class="d-flex align-items-center">
            <div v-if="!loading">
              <i class='fa fa-database'></i><strong>&nbsp;{{list.total}}&nbsp;</strong>
              <small>Result/s found</small>
            </div>
            <div v-else>
              <strong>&nbsp;Fetching result...&nbsp;</strong>
            </div>
          </b-col>
          <b-col sm="7" class="text-right">
            <!-- <b-button @click="clickTopRightBtn" variant="dark" class="px-4" size="sm"  v-if="top_right_btn!=''"><i class="fa fa-plus"></i>
                {{top_right_btn}}
            </b-button> -->
          </b-col>
        </b-row>
      </div>
      <b-row class="mb-3">
        <b-col sm="2">
          <b-form-select v-model="selected_display_no" :options="options" size="sm"
                         @change="changeDisplayNo"></b-form-select>
        </b-col>
        <b-col sm="2">
          <b-form-select v-model="filter_itinerary_brand" size="sm">
            <option value="-1">Select Itinerary Brand</option>
            <template v-for="ib in itinerary_brands">
              <option :value="ib.id">{{ ib.description }}</option>
            </template>
          </b-form-select>
        </b-col>
        <b-col sm="6" offset-sm="2">
          <b-input-group>
            <b-input-group-prepend>
              <b-input-group-text class="bg-dark"><i class="fa fa-search"></i></b-input-group-text>
            </b-input-group-prepend>
            <b-form-input
              type="text"
              class="form-control"
              placeholder="Search"
              autocomplete="off"
              size="sm"
              @keypress.native="searching"
              @keyup.native="search"
              v-model="search_term"
            />
            <b-input-group-append>
              <b-button @click="clearSearch" variant="secondary" class="px-4" size="sm" :disabled="search_term==''">
                <i class="fa fa-close"></i>
              </b-button>
              <!--<i class="fa fa-close"></i>-->
            </b-input-group-append>
          </b-input-group>
        </b-col>
      </b-row>
      <b-table
        selectable
        selectedVariant="primary"
        select-mode="single"
        :dark="dark"
        bordered
        :hover="hover"
        responsive="sm"
        :items="table_items"
        :fields="captions"
        :busy="loading"
        show-empty
        @row-dblclicked="rowDbClicked"
        head-variant="light"
      >
        <div class="text-center  my-2" slot="table-busy">
          <br>
          <b-spinner small class="align-middle"></b-spinner>
          <br><br>
          <strong>Loading</strong>
        </div>
        <div slot="refund" slot-scope="row">
          <b-button disabled v-if="is_saving_booking_refund" size="sm">
            <template>
              <b-spinner small type="grow"></b-spinner>
              Saving Data...
            </template>
          </b-button>
          <div class="text-center" v-else>
            <b-button size="sm" @click="refundBooking(row.item)">Request Refund</b-button>
          </div>
        </div>
        <div slot="guest" slot-scope="row">
          <div>{{row.item.user.first_name}} {{row.item.user.last_name}} <span class="badge badge-info" v-if="row.item.admin_booking==1">Booked by Admin</span></div>
          <div class="small text-muted">
                        <span>
                        <template>Reference Number: {{row.item.reference_code}}</template>
                        </span> | Email: {{row.item.user.email}}
          </div>
        </div>
        <div slot="itinerary" slot-scope="row">
          <div>{{row.item.itinerary_details.itinerary_brand.description}}</div>
          <div class="small text-muted">

            {{row.item.itinerary_details.itinerary_country.name}} |
            <template>{{row.item.itinerary_details.itinerary_city_from.name}} to
              {{row.item.itinerary_details.itinerary_city_to.name}}
            </template>
          </div>
        </div>
        <template slot="guest_number" slot-scope="row">
          {{row.item.guests.length}}
        </template>
        <template slot="outstanding_balance" slot-scope="row">
          <div class="text-right">
            <strong>{{row.item.active_invoice.invoice_balance.other_formats.format_1}}</strong>
          </div>
        </template>
      </b-table>
      <nav v-if="list.total>0">
        <b-pagination
          :disabled="loading"
          @input="getAll"
          align="right"
          :total-rows="total_rows"
          :per-page="per_page"
          v-model="list.current_page"
        >
        </b-pagination>
      </nav>
    </b-card>
  </div>
</template>

<script>
  import {bus} from '@/main.js'
  import SwalMixin from '@/views/mixins/Swal.js'

  export default {
    name: 'bookings-table',
    inheritAttrs: false,
    mixins: [SwalMixin],
    props: {
      hover: {
        type: Boolean,
        default: true
      },
      striped: {
        type: Boolean,
        default: true
      },
      bordered: {
        type: Boolean,
        default: true
      },
      small: {
        type: Boolean,
        default: true
      },
      fixed: {
        type: Boolean,
        default: true
      },
      fields: {
        type: [Array, Object],
        default: () => []
      },
      dark: {
        type: Boolean,
        default: false
      },
      api_url: {
        type: String,
        required: true
      },
      delete_url: {
        type: String,
        required: true
      }
    },
    data() {
      return {
        is_saving_booking_refund: false,
        refund: {
          id: -1,
          booking_id: -1,
          description: '',
          details: []
        },
        selected: [],
        list: {
          data: [],
          from: 1,
          to: 0,
          current_page: 1,
          total: 0,
          per_page: 1,
        },
        result: [],
        loading: true,
        searchTimeout: () => ({
          type: Function,
          default: () => ({})
        }),
        search_term: '',
        options: [
          {value: 10, text: 'Display 10 records'},
          {value: 25, text: 'Display 25 records'},
          {value: 50, text: 'Display 50 records'},
          {value: 100, text: 'Display 100 records'}
        ],
        selected_display_no: 10,
        filter_itinerary_brand: -1,
        itinerary_brands: []
      }
    },
    computed: {
      table_items: function () {
        return this.list.data;
      },
      per_page: function () {
        return parseInt(this.list.per_page);
      },
      total_rows: function () {
        return parseInt(this.list.total);
      },
      captions: function () {
        return this.fields
      },
      total_selected: function () {
        return parseInt(this.selected.length);
      }
    },
    mounted() {
      this.getItineraryBrands();
    },
    watch: {
      filter_itinerary_brand: {
        handler(val) {
          this.getAll();
        },
        deep: true
      }
    },
    methods: {
      refundBooking(booking) {
        this.swal_confirm_submit_data.title = 'Please confirm your submission.',
          this.swal_confirm_submit_data.text = "You want to refund your booking?",
          this.swal_confirm_submit_data.confirmButtonText = "Yes",
          this.swal_confirm_submit_data.cancelButtonText = "No",
          this.swalConfirmSubmit((data) => {
            if (data.value) {
              this.is_saving_booking_refund = true;
              this.refund.booking_id = booking.id;
              this.refund.description = 'REFUND BOOKING!';
              this.refund.details = booking.guests;
              this.axios.post("/refund/save_per_booking", this.refund).then(
                response => {
                  this.refund = {
                    id: -1,
                    booking_id: -1,
                    description: '',
                    details: []
                  };
                  this.is_saving_booking_refund = false;
                  this.swalTransactionCompleted();
                }
              )
            }
          })
      },
      getItineraryBrands() {
        this.axios.get('/maintenance/itinerary_brands/get_all').then(
          response => {
            this.itinerary_brands = response.data;
            this.getAll();
          }
        );
      },
      getAll() {
        this.loading = true;
        this.axios.get(this.api_url + '?page=' + this.list.current_page + '&per_page=' + this.selected_display_no + '&search=' + this.search_term + '&brand=' + this.filter_itinerary_brand).then(response => {
          // this.list = (response.data.data) ? response.data.data : response.data;
          let result = response.data;
          this.list = result
          this.loading = false;
          console.log(result)
        }).catch(error => console.log(error));
      },
      clickTopRightBtn() {
        //this.$emit('openModal',this.selected);
        bus.$emit('bookingsTableTopRightBtnClicked');
      },
      rowDbClicked(item) {
        bus.$emit('bookingsTableDbClick', item.id);
      },
      searching() {
        this.loading = true;
        clearTimeout(this.searchTimeout);
      },
      search() {
        this.searchTimeout = setTimeout(() => {
          this.list.current_page = 1;
          this.getAll();
          clearTimeout(this.searchTimeout);
        }, 1000);
      },
      clearSearch() {
        this.search_term = ''
        this.getAll();
      },
      changeDisplayNo() {
        this.loading = true;
        this.list.current_page = 1;
        this.getAll();
      },
      deleteRow(row) {
        this.swalConfirmDelete((data) => {
          if (data.value) {
            this.loading = true;
            this.axios.delete(this.delete_url, {data: row.item}).then(response => {
              this.getAll();
              this.swal_transaction_completed_data.text = "Record successfully deleted.";
              this.swalTransactionCompleted();
              this.loading = false;
            }).catch(error => {
              this.swalRequestError();
              this.loading = false;
            });
          }
        });
      }
    }
  }
</script>
