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
        <div slot="guests_cabin" slot-scope="row" class="text-center">
          <b-dropdown split text="Options" size="sm" class="ml-2" variant="dark">
            <template v-slot:button-content>
              <i class='fa fa-fw fa-gear'></i> Actions
            </template>
            <b-dropdown-item @click="guestsCabin(row)">Update Cabin Assignment</b-dropdown-item>
            <b-dropdown-item @click="duplicate(row.item.id)">Duplicate Itinerary</b-dropdown-item>
            <b-dropdown-item @click="createBooking(row.item.id)">Create Booking</b-dropdown-item>
          </b-dropdown>
          <!-- <b-dropdown split text="Options" size="sm" class="ml-2" variant="primary">
            <template v-slot:button-content>
              <i class='fa fa-fw fa-envelope'></i> Email
            </template>
            <b-dropdown-item @click="emailBoatManifest(row.item.id)">Boat Manifest</b-dropdown-item>
            <b-dropdown-item @click="emailCrewList(row.item.id)">Crew List</b-dropdown-item>
          </b-dropdown> -->
          <b-dropdown split text="Options" size="sm" class="ml-2" variant="light">
            <template v-slot:button-content>
              <i class='fa fa-fw fa-print'></i> View
            </template>
            <b-dropdown-item @click="displayManifest(row.item.id)">Boat Manifest</b-dropdown-item>
            <b-dropdown-item @click="displayCrewList(row.item.id)">Crew List</b-dropdown-item>
          </b-dropdown>
        </div>

        <div class="text-center  my-2" slot="table-busy">
          <br>
          <b-spinner small class="align-middle"></b-spinner>
          <br><br>
          <strong>Loading</strong>
        </div>
        <div slot="itinerary" slot-scope="row">
          <div>{{row.item.itinerary_country.name}}</div>
          <div class="small text-muted">
                        <span>
                        <div
                          :style="'display:inline;margin-top:2px;padding:1px 5px;color:#fff;border-radius:5px;background:'+row.item.itinerary_brand.color+'!important'">{{row.item.itinerary_brand.description}}</div> | {{row.item.itinerary_city_from.name}} to {{row.item.itinerary_city_to.name}}
                        </span>
          </div>
        </div>

        <div slot="ambassador" slot-scope="row">
          {{(row.item.itinerary_ambassador != null) ? row.item.itinerary_ambassador.full_name : ''}}
        </div>
        <div slot="lock" slot-scope="row">
          <i v-if="JSON.parse(row.item.is_displayed)" class="fa fa-check h2 text-success"></i>
          <i v-else class="fa fa-check h2 text-danger"></i>
        </div>
        <div slot="available_slot" slot-scope="row">
          <strong>{{row.item.total_cabin_occupancy.default - row.item.total_guest_occupancy.default}}</strong> place/s
          available
        </div>

        <template slot="action" slot-scope="row">
          <b-button
            variant="danger"
            size="sm"
            @click="deleteRow(row)"
          >
            <i class="fa fa-trash"></i> Delete
          </b-button>
        </template>


        <template slot="color" slot-scope="row">
          <input type="color" class="form-control" :value="row.item.color" disabled>
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

    <b-modal
      v-model="cabin_guests_modal"
      size="xl"
      header-text-variant="light"
      header-bg-variant="primary"
    >
      <template slot="modal-title">
        <div>
          <h5><i class='fa fa-fw fa-file-text'> </i> Cabin Guests Assignment</h5>
        </div>
      </template>
      <b-row>
        <template v-for="(cabin, index) in this.cabin_guests">
          <b-col md="3">
            <h4>{{ cabin.cabin_description.code }} - {{ cabin.cabin_description.cabin_type.name }}
              <span :class="{'text-danger':cabin.slot_left == 0 , 'text-muted':cabin.slot_left > 0}"
                    style="font-size: 12px; font-style: italic;">Slot Left ({{ cabin.slot_left }})</span>
            </h4>
            <b-list-group style="padding: 10px; border: 1px solid #dacece;" :key="index"
                          v-if="cabin.booking_cabins.length > 0" @dragover.prevent="dragOver" @drop.prevent="drop"
                          @dragenter="dragEnter($event, cabin)" @dragleave.prevent="dragLeave($event, cabin)">
              <template v-for="(guest, index) in cabin.booking_cabins">
                <b-list-group-item draggable="true" @dragend="dragEnd($event, cabin, guest, index)"
                                   @dragstart="dragStart($event,cabin, guest)"
                                   style=" font-size:12px; cursor:pointer; text-transform: uppercase;">Guest {{index +
                  1}} -
                  OCCUPANCY: {{ guest.occupancy }}
                </b-list-group-item>
              </template>
            </b-list-group>
            <b-list-group style="padding: 10px; border: 1px solid #dacece;" :key="index"  v-else
                          @dragover.prevent="dragOver" @drop.prevent="drop"
                          @dragleave.prevent="dragLeave($event, cabin)"
                          @dragenter="dragEnter($event, cabin)">
              <b-list-group-item style="font-size: 12px; border: 1px solid green; text-transform: uppercase;">Available
                places {{ cabin.slot_left }}
              </b-list-group-item>
            </b-list-group>
          </b-col>
        </template>
      </b-row>
      <div slot="modal-footer" class="w-100">
        <div class="float-right">
          <b-row>
            <b-col>
              <b-button variant="success" disabled v-if="is_saving" size="sm">
                <template>
                  <b-spinner small type="grow"></b-spinner>
                  Saving Data...
                </template>
              </b-button>
              <b-button
                variant="success"
                class="float-right"
                size="sm"
                v-else
                @click="save"
              >
                <i class="fa fa-save"></i> Save & Exit
              </b-button>
            </b-col>
          </b-row>
        </div>
      </div>
    </b-modal>

    <b-modal
            id="modal-prevent-closing"
            ref="modal"
            title="Enter Email - Crew List"
            v-model="crew_list_email_modal"
    >
        <form ref="form" @submit.stop.prevent="sendCrewList">
            <b-form-group
                    label="Email *"
                    label-for="email_crew_list"
                    :description="errors.has('email') ? '' : '*This field is required.'"
                    :invalid-feedback="!errors.has('email') ? '' : '*'+errors.first('email').replace(/_/g, ' ')"
                    :state="false"
            >
                <b-form-input
                        :disabled="is_sending"
                        type="email"
                        id="email_crew_list"
                        name="email"
                        v-validate="'required|email'"
                        v-model="crew_list_email"
                        trim
                        v-bind:class="{ 'is-invalid': errors.has('email') }"
                ></b-form-input>
            </b-form-group>
        </form>

        <template v-slot:modal-footer>
            <b-button  @click="crew_list_email_modal=false" :disabled="is_sending">
                Cancel
            </b-button>
            <b-button variant="success" @click="handleOk" :disabled="is_sending">
                <template v-if="!is_sending">
                    Send
                </template>
                <template v-else>
                    <b-spinner small type="grow"></b-spinner>
                    Sending
                </template>
            </b-button>
        </template>
    </b-modal>

  </div>
</template>

<script>
  import {bus} from '@/main.js'
  import SwalMixin from '@/views/mixins/Swal.js'
  import FormOptions from "bootstrap-vue/src/mixins/form-options";

  export default {
    name: 'itineraries-table',
    components: {FormOptions},
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
      },
      top_right_btn: {
        type: String,
        default: '',
        required: false
      }
    },
    data() {
      return {
        is_saving: false,
        cabin_guests_modal: false,
        cabin_guests: [],
        source: {},
        destination: [],

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
        is_sending: false,
        crew_list_email: '',
        crew_list_email_modal: false,
        crew_list_email_state:null,
        selected_itinerary_id:-1
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
      this.getAll();
    },
    watch: {
      cabin_guests: {
        handler(val) {
          // console.log('logs', val)
        },
        deep: true
      },
      cabin_guests_modal: {
        handler(val) {
          if (!val) {
            this.is_saving = false;
          }
        },
        deep: true
      },
      crew_list_email_modal:{
          handler(val){
              if(!val){
                  this.crew_list_email = '';
              }
          },
          deep:true,
          immediate:true
      }
    },

    methods: {
      duplicate(id){
          this.swalConfirmSubmit((data)=>{
              if (data.value) {
                  this.is_saving = true;
                  this.axios.post('itinerary/duplicate',{id:id}).then(response => {
                      this.swalTransactionCompleted();
                      this.is_saving = false;
                      this.getAll();
                  }).catch(error => {
                      this.swalRequestError();
                      this.is_saving = false;
                  });
              }
          });
      },
      displayManifest(id) {
          let routeData = this.$router.resolve({path: '/print/boat-manifest/' + id});
          window.open(routeData.href, '_blank', "width=1200, height=600");
      },
      displayCrewList(id) {
          let routeData = this.$router.resolve({path: '/print/crew-list/' + id});
          window.open(routeData.href, '_blank', "width=1200, height=600");
      },
      emailBoatManifest(id) {
          this.axios.post('send_email/boat_manifest', {id:id}).then(response => {
              this.swal_transaction_completed_data.text = "Email Sent!";
              this.swalTransactionCompleted();
          }).catch(error => {
              this.swalRequestError();
          });
      },
      handleOk(bvModalEvt) {
          bvModalEvt.preventDefault()
          this.sendCrewList()
      },
      emailCrewList(id) {
          this.crew_list_email_modal = true;
          this.selected_itinerary_id = id
      },
      sendCrewList(){
          this.$validator.validateAll().then(result=> {
              if (result) {
                  this.is_sending=true;
                  this.axios.post('send_email/crew_list', {id: this.selected_itinerary_id, email: this.crew_list_email}).then(response => {
                      this.swal_transaction_completed_data.text = "Email Sent!";
                      this.is_sending=false;
                      this.swalTransactionCompleted();
                  }).catch(error => {
                      this.is_sending=false;
                      this.swalRequestError();
                  });
              }
          });
      },
      save() {
        this.swal_confirm_submit_data.text = "Are you sure?";
        this.swalConfirmSubmit((data) => {
          if (data.value) {
            this.is_saving = true;
            this.axios.put("/bookings/update_cabin_assignment", this.cabin_guests).then(
              response => {
                this.getAll();
                this.is_saving = false;
                this.cabin_guests_modal = false;
                this.swalTransactionCompleted();
              }
            )
          }
        });
        // console.log(this.cabin_guests);
      },
      dragOver() {
        // console.log('dragover')
      },
      drop(e) {
        // console.log('drop')
      },
      dragStart(e,cabin, guest) {
        e.target.classList.add("current_draggable_item");
      },
      dragEnd(e, cabin, guest, index) {
        e.target.classList.remove("current_draggable_item");
        // console.log('destination', this.destination);
        // console.log('source', guest);
        if (guest.occupancy <= this.destination.slot_left) {
          cabin.booking_cabins.splice(index, 1);
          this.destination.booking_cabins.push(guest)
          cabin.slot_left = cabin.slot_left + guest.occupancy;
          this.destination.slot_left = this.destination.slot_left - guest.occupancy;
          // console.log('destination', this.destination.slots_left);
          // console.log('end', cabin, guest);
        } else {
          if (this.destination.slot_left == 1) {
            this.swal_transaction_warning_data.text = "1 available slot/s left!";
            this.swalTransactionWarning();
          } else {
            this.swal_transaction_warning_data.text = "No available slot/s!";
            this.swalTransactionWarning();
          }
        }
      },
      dragEnter(e, cabin) {
        this.destination = cabin;
      },
      dragLeave(e){
      },
      guestsCabin(row) {
        this.cabin_guests_modal = true;
        this.cabin_guests = JSON.parse(JSON.stringify(row.item.itinerary_cabins_for_booking));
      },
      end(cabin, guest) {
        // console.log(cabin, guest);
        cabin.slot_left = cabin.slot_left + guest.occupancy;
      },
      getAll() {
        this.loading = true;
        this.axios.get(this.api_url + '?page=' + this.list.current_page + '&per_page=' + this.selected_display_no + '&search=' + this.search_term).then(response => {
          // this.list = (response.data.data) ? response.data.data : response.data;
          let result = response.data.itineraries;
          this.list = result
          this.loading = false;
          //console.log(result)
        }).catch(error => console.log(error));
      },
      clickTopRightBtn() {
        //this.$emit('openModal',this.selected);
        bus.$emit('serverSidePaginatedTableTopRightBtnClicked');
      },
      rowDbClicked(item) {
        bus.$emit('serverSidePaginatedTableDbClick', item);
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
      },
      createBooking(id){
        this.$router.push('/book/itinerary/'+id)
      }
    }
  }
</script>

<style>
  .current_draggable_item{
    border: 3px solid #20a8d8 ;
  }
  .hovering{
    background-color:red !important;
  }
</style>
