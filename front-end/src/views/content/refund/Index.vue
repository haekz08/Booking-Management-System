<template>
  <div class="animated fadeIn">
    <b-row>
      <b-col>
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
            </b-row>
          </div>

          <b-row class="mb-3">
            <b-col sm="2">
              <b-form-select v-model="selected_display_no" :options="options" size="sm"
                             @change="changeDisplayNo"></b-form-select>
            </b-col>
            <b-col sm="6" offset-sm="4">
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
            :dark="false"
            :hover="true"
            :striped="true"
            :bordered="true"
            :small="true"
            :fixed="true"
            responsive="sm"
            :items="list.data"
            :fields="columns"
            :busy="loading"
            show-empty
          >
            <div class="text-center  my-2" slot="table-busy">
              <br>
              <b-spinner small class="align-middle"></b-spinner>
              <br><br>
              <strong>Loading</strong>
            </div>

            <template slot="breakdown" slot-scope="row">
              <b-button
                size="sm"
                @click="breakdown(row.item.refund_details)"
              >
                <i class="fa fa-search"></i> Breakdown
              </b-button>
            </template>

            <template slot="reference_booking" slot-scope="row">
              {{ row.item.booking.reference_code_char }} - {{ row.item.booking.reference_code }}
            </template>

            <template slot="amount" slot-scope="row">
              <div class="text-right">&euro; {{ calculateAmount(row.item.refund_details).toLocaleString('en-US',{
                minimumFractionDigits: 2 }) }}
              </div>
            </template>

            <template slot="status" slot-scope="row">
              <div class="text-center text-uppercase font-weight-bold">{{ row.item.status }}</div>
            </template>

            <template slot="action" slot-scope="row">
              <b-button
                variant="success"
                size="sm"
                @click="approve(row.item)"
                v-if="row.item.status_id == 0"
              >
                <i class="fa fa-check"></i> Approve
              </b-button>
            </template>
          </b-table>
        </b-card>
      </b-col>
    </b-row>

    <!-- BREAKDOWN MODAL -->
    <b-modal
      v-model="breakdown_modal"
    >
      <template slot="modal-title">
        <div>
          <h5><i class='fa fa-fw fa-list-alt'></i> REFUND BREAKDOWN</h5>
        </div>
      </template>
      <b-list-group>
        <b-list-group-item class="font-weight-bold">
          Name
          <span class="pull-right">
           Amount
          </span>
        </b-list-group-item>
        <template v-for="(guest, index) in breakdown_data">
          <b-list-group-item class="p-3" :key="index">
            {{ guest.booking_cabin.guest_details.full_name.trim() == "" ? "Guest "+ parseInt(index+1) :
            guest.booking_cabin.guest_details.full_name }}

            <span class="pull-right">
            &euro; {{ parseFloat(guest.amount_refunded).toLocaleString('en-US',{
            minimumFractionDigits: 2 }) }}
              </span>
          </b-list-group-item>
        </template>
        <b-list-group-item class="font-weight-bold text-right">
          TOTAL : &euro; {{ calculateAmount(breakdown_data).toLocaleString('en-US',{
          minimumFractionDigits: 2 }) }}
        </b-list-group-item>
      </b-list-group>
      <div slot="modal-footer" class="w-100">
        <div class="float-right">
          <b-row>
            <b-col>
              <b-button
                class="float-right"
                @click="breakdown_modal = false"
              >
                Close
              </b-button>
            </b-col>
          </b-row>
        </div>
      </div>
    </b-modal>
    <!-- END OF BREAKDOWN MODAL -->
  </div>
</template>

<script>
  import SwalMixin from '@/views/mixins/Swal.js'
  export default {
    name: "RefundIndex",
    data() {
      return {
        searchTimeout: () => ({
          type: Function,
          default: () => ({})
        }),

        breakdown_modal: false,
        breakdown_data: [],

        loading: false,
        list: {
          data: [],
          from: 1,
          to: 0,
          current_page: 1,
          total: 0,
          per_page: 1,
        },
        search_term: '',
        options: [
          {value: 10, text: 'Display 10 records'},
          {value: 25, text: 'Display 25 records'},
          {value: 50, text: 'Display 50 records'},
          {value: 100, text: 'Display 100 records'}
        ],
        selected_display_no: 10,
        columns: [
          {key: 'breakdown', label: '', class: 'text-center'},
          {key: 'reference_booking', label: 'Booking'},
          {key: 'description', label: 'Reason'},
          {key: 'amount', label: 'Amount'},
          {key: 'status', label: 'Status'},
          {key: 'action', label: 'Action', class: 'action_col'},
        ]

      }
    },
    created() {
      this.getAll();
    },
    methods: {
      approve(refund){
        this.swalConfirmSubmit((data) => {
          if(data.value){
            this.axios.put('refund/approve', refund).then(response => {
              this.getAll();
              this.swalTransactionCompleted();
            });
          }
        });
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
      calculateAmount(details) {
        if (details.length == 0)
          return 0;

        return details.reduce((previous, current) => {
          return parseFloat(previous) + parseFloat(current.amount_refunded);
        }, 0);
      },
      getAll() {
        this.loading = true;
        this.axios.get('refund/get_all' + '?page=' + this.list.current_page + '&per_page=' + this.selected_display_no + '&search=' + this.search_term).then(response => {
          let result = response.data;
          this.list = result
          this.loading = false;
          console.log(result)
        }).catch(error => console.log(error));
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
      breakdown(details) {
        this.breakdown_data = JSON.parse(JSON.stringify(details));
        this.breakdown_modal = true;
      }
    },
    mixins:[SwalMixin]
  }
</script>

<style scoped>
</style>
