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
            <b-button href="#" v-b-toggle.filter variant="primary" class="text-left"><i class="fa fa-fw fa-sliders"></i>Advanced Search Options</b-button>
          </b-col>
        </b-row>
      </div>
      <b-row class="m-0 mb-3">
        <b-col class="p-0">
          <b-collapse id="filter" accordion="filter" role="tabpanel">
              <b-card-body class="p-0 py-2">
                  <b-row class="m-0">
                    <b-col class="p-2">
                      <fieldset class="border p-2">
                        <legend class="w-auto h6"><i class="fa fa-fw fa-caret-right "></i>Type of Trip&nbsp;</legend>
                        <b-form-checkbox
                            v-model="selected_itinerary_brands_all"
                            :indeterminate="selected_itinerary_brands_indeterminate"
                            @change="toggleAllItineraryBrands"
                            >
                            Select All
                        </b-form-checkbox>
                        <b-form-checkbox
                            v-for="option in itinerary_brands"
                            v-model="selected_itinerary_brands"
                            :key="option.id"
                            :value="option.id"
                            name="itinerary_brands"
                            stacked
                        >
                            {{ option.description }}
                        </b-form-checkbox>
                      </fieldset>
                    </b-col>
                    <b-col class="p-2">
                      <fieldset class="border p-2">
                        <legend class="w-auto h6"><i class="fa fa-fw fa-caret-right "></i>Country&nbsp;</legend>
                        <b-form-checkbox
                            v-model="selected_itinerary_countries_all"
                            :indeterminate="selected_itinerary_countries_indeterminate"
                            @change="toggleAllItineraryCountries"
                            >
                            Select All
                        </b-form-checkbox>
                        <b-form-checkbox
                            v-for="option in itinerary_countries"
                            v-model="selected_itinerary_countries"
                            :key="option.id"
                            :value="option.id"
                            name="itinerary_countries"
                            stacked
                        >
                            {{ option.name }}
                        </b-form-checkbox>
                      </fieldset>
                    </b-col>
                    <b-col class="p-2">
                      <fieldset class="border p-2">
                        <legend class="w-auto h6"><i class="fa fa-fw fa-caret-right "></i>City From&nbsp;</legend>
                        <b-form-checkbox
                            v-model="selected_itinerary_cities_from_all"
                            :indeterminate="selected_itinerary_cities_from_indeterminate"
                            @change="toggleAllItineraryCitiesFrom"
                            >
                            Select All
                        </b-form-checkbox>
                        <b-form-checkbox
                            v-for="option in itinerary_cities"
                            v-model="selected_itinerary_cities_from"
                            :key="option.id"
                            :value="option.id"
                            name="itinerary_cities_from"
                            stacked
                        >
                            {{ option.name }}
                        </b-form-checkbox>
                      </fieldset>
                    </b-col>
                    <b-col class="p-2">
                      <fieldset class="border p-2">
                        <legend class="w-auto h6"><i class="fa fa-fw fa-caret-right "></i>City To&nbsp;</legend>
                        <b-form-checkbox
                            v-model="selected_itinerary_cities_to_all"
                            :indeterminate="selected_itinerary_cities_to_indeterminate"
                            @change="toggleAllItineraryCitiesTo"
                            >
                            Select All
                        </b-form-checkbox>
                        <b-form-checkbox
                            v-for="option in itinerary_cities"
                            v-model="selected_itinerary_cities_to"
                            :key="option.id"
                            :value="option.id"
                            name="itinerary_cities_to"
                            stacked
                        >
                            {{ option.name }}
                        </b-form-checkbox>
                      </fieldset>
                    </b-col>
                  </b-row>
                  <b-row class="m-0 mt-2">
                    <b-col class="p-0 text-right">
                      <b-button @click="getAll" variant="dark" class="px-4" size="sm"><i class="fa fa-sliders"></i>
                          Apply Filters
                      </b-button>
                    </b-col>
                  </b-row>
              </b-card-body>
          </b-collapse>
        </b-col>
      </b-row>
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
        <div slot="crews" slot-scope="row">
            <span class="d-block" v-for="(crew, index) in row.item.itinerary_crews">
             {{crew.full_name}} ({{crew.crew_type.description}})
            </span>
        </div>
        <div slot="boat_name" slot-scope="row">
          {{row.item.itinerary_boat.boat_brand.name}} - 
          {{row.item.itinerary_boat.boat_type.name}}
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

        <div slot="type_of_trip" slot-scope="row">
          <span>
          <div
            :style="'display:inline;margin-top:2px;padding:1px 5px;color:#fff;border-radius:5px;background:'+row.item.itinerary_brand.color+'!important'">{{row.item.itinerary_brand.description}}</div>
          </span>
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
        
        <template slot="slots_remaining" slot-scope="row">
          {{row.item.total_guest_occupancy.default}}/{{row.item.total_cabin_occupancy.default}}
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
  </div>
</template>

<script>
  import {bus} from '@/main.js'
  import SwalMixin from '@/views/mixins/Swal.js'

  export default {
    name: 'itineraries-table',
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

        itinerary_brands: [],
        selected_itinerary_brands:[],
        selected_itinerary_brands_all: false,
        selected_itinerary_brands_indeterminate: false,

        itinerary_countries: [],
        selected_itinerary_countries:[],
        selected_itinerary_countries_all: false,
        selected_itinerary_countries_indeterminate: false,

        itinerary_cities: [],
        selected_itinerary_cities_from:[],
        selected_itinerary_cities_from_all: false,
        selected_itinerary_cities_from_indeterminate: false,
        
        selected_itinerary_cities_to:[],
        selected_itinerary_cities_to_all: false,
        selected_itinerary_cities_to_indeterminate: false,
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
      filter_itinerary_brand: {
        handler(val) {
          this.getAll();
        },
        deep: true
      },
      selected_itinerary_brands(newVal, oldVal) {
          // Handle changes in individual flavour checkboxes
          if (newVal.length === 0) {
          this.selected_itinerary_brands_indeterminate = false
          this.selected_itinerary_brands_all = false
          } else if (newVal.length === this.itinerary_brands.length) {
          this.selected_itinerary_brands_indeterminate = false
          this.selected_itinerary_brands_all = true
          } else {
          this.selected_itinerary_brands_indeterminate = true
          this.selected_itinerary_brands_all = false
          }
      },
      selected_itinerary_countries(newVal, oldVal) {
          // Handle changes in individual flavour checkboxes
          if (newVal.length === 0) {
          this.selected_itinerary_countries_indeterminate = false
          this.selected_itinerary_countries_all = false
          } else if (newVal.length === this.itinerary_countries.length) {
          this.selected_itinerary_countries_indeterminate = false
          this.selected_itinerary_countries_all = true
          } else {
          this.selected_itinerary_countries_indeterminate = true
          this.selected_itinerary_countries_all = false
          }
      },
      selected_itinerary_cities_from(newVal, oldVal) {
          // Handle changes in individual flavour checkboxes
          if (newVal.length === 0) {
          this.selected_itinerary_cities_from_indeterminate = false
          this.selected_itinerary_cities_from_all = false
          } else if (newVal.length === this.itinerary_cities.length) {
          this.selected_itinerary_cities_from_indeterminate = false
          this.selected_itinerary_cities_from_all = true
          } else {
          this.selected_itinerary_cities_from_indeterminate = true
          this.selected_itinerary_cities_from_all = false
          }
      },
      selected_itinerary_cities_to(newVal, oldVal) {
          // Handle changes in individual flavour checkboxes
          if (newVal.length === 0) {
          this.selected_itinerary_cities_to_indeterminate = false
          this.selected_itinerary_cities_to_all = false
          } else if (newVal.length === this.itinerary_cities.length) {
          this.selected_itinerary_cities_to_indeterminate = false
          this.selected_itinerary_cities_to_all = true
          } else {
          this.selected_itinerary_cities_to_indeterminate = true
          this.selected_itinerary_cities_to_all = false
          }
      },
    },
    methods: {
      getAll() {
        this.loading = true;
        this.axios.get(this.api_url,
          {
            params: {
                        itinerary_brands: this.selected_itinerary_brands,
                        itinerary_countries: this.selected_itinerary_countries,
                        itinerary_cities_from: this.selected_itinerary_cities_from,
                        itinerary_cities_to: this.selected_itinerary_cities_to,

                        page: this.list.current_page,
                        per_page: this.selected_display_no,
                        search: this.search_term
                    }
          }
        ).then(response => {
          // this.list = (response.data.data) ? response.data.data : response.data;

          let result = response.data.itineraries;
          this.list = result;

          this.itinerary_brands = response.data.itinerary_brands
          this.itinerary_countries = response.data.itinerary_countries
          this.itinerary_cities = response.data.itinerary_cities
          
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
      toggleAllItineraryBrands(checked) {
          
          if(checked){
              let result = this.itinerary_brands.map((a) => (a.id));
              this.selected_itinerary_brands = result;
          }else{
              this.selected_itinerary_brands = [];
          }
      },
      toggleAllItineraryCountries(checked) {
          
          if(checked){
              let result = this.itinerary_countries.map((a) => (a.id));
              this.selected_itinerary_countries = result;
          }else{
              this.selected_itinerary_countries = [];
          }
      },
      toggleAllItineraryCitiesFrom(checked) {
          
          if(checked){
              let result = this.itinerary_cities.map((a) => (a.id));
              this.selected_itinerary_cities_from = result;
          }else{
              this.selected_itinerary_cities_from = [];
          }
      },
      toggleAllItineraryCitiesTo(checked) {
          
          if(checked){
              let result = this.itinerary_cities.map((a) => (a.id));
              this.selected_itinerary_cities_to = result;
          }else{
              this.selected_itinerary_cities_to = [];
          }
      },
    }
  }
</script>

<style>
</style>
