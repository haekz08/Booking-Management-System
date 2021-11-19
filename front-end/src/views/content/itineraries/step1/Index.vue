<template>
    <div>
        <b-tabs pills card class="mb-0">
            <b-tab title="Details" active>
                <b-card-text>
                    <b-row class="pt-3 mb-0">
                        <b-col>
                            <fieldset class="border p-3">
                            <legend  class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Display Option</legend>
                            <b-alert show variant="primary">
                                <b-form-checkbox v-model="itinerary_setup.step1.is_displayed" name="check-button" switch class="text-muted">
                                    Open for Booking
                                </b-form-checkbox>
                            </b-alert>
                            </fieldset>
                            <b-form-group
                                :description="errors.has('itinerary_brand') ? '' : '*This field is required.'"
                                :invalid-feedback="!errors.has('itinerary_brand') ? '' : '*'+errors.first('itinerary_brand')"
                                :state="false"
                                label="Itinerary Brand"
                                label-for="itinerary_brand"
                                class="mb-4 mt-4 text-muted">
                                    <b-form-select 
                                        v-model="itinerary_setup.step1.itinerary_brand_id"
                                        v-validate="'required'" 
                                        id="itinerary_brand" 
                                        name="itinerary_brand" 
                                        size="sm"
                                        @change="checkIfAmbassadorEnabled"
                                        v-bind:class="{ 'is-invalid': errors.has('itinerary_brand') }">
                                            <option value="">Please select Brand</option>
                                            <option v-for="itinerary_brand in step1_settings_options.itinerary_brands" :value="itinerary_brand.id">{{itinerary_brand.description}}</option>
                                    </b-form-select>
                            </b-form-group>
                            <b-form-group
                                :description="errors.has('itinerary_country') ? '' : '*This field is required.'"
                                :invalid-feedback="!errors.has('itinerary_country') ? '' : '*'+errors.first('itinerary_country')"
                                :state="false"
                                label="Itinerary Country"
                                label-for="itinerary_country"
                                class="mb-4 text-muted" >
                                    <b-form-select 
                                        v-model="itinerary_setup.step1.itinerary_country_id"
                                        v-validate="'required'" 
                                        id="itinerary_country" 
                                        name="itinerary_country" 
                                        size="sm"
                                        v-bind:class="{ 'is-invalid': errors.has('itinerary_country') }">
                                            <option value="">Please select Country</option>
                                            <option v-for="itinerary_country in step1_settings_options.itinerary_countries" :value="itinerary_country.id">{{itinerary_country.name}}</option>
                                    </b-form-select>
                            </b-form-group>
                        </b-col>
                        <b-col>
                            <fieldset class="border p-3">
                            <legend  class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Check In Details</legend>
                                <b-form-group
                                    :description="errors.has('check_in_date') ? '' : '*This field is required.'"
                                    :invalid-feedback="!errors.has('check_in_date') ? '' : '*'+errors.first('check_in_date')"
                                    :state="false"
                                    label="Date"
                                    label-for="check_in_date"
                                    class="mb-4 text-muted"
                                >
                                    <b-form-input v-model="itinerary_setup.step1.check_in_date" v-validate="'required'" id="check_in_date" name="check_in_date" v-bind:class="{ 'is-invalid': errors.has('check_in_date') }" size="sm" type="date"></b-form-input>
                                </b-form-group>
                                <b-row class="mb-4">
                                    <b-col>
                                        <b-form-group
                                                :description="errors.has('check_in_time_hh') ? '' : ''"
                                                :invalid-feedback="!errors.has('check_in_time_hh') ? '' : '*'+errors.first('check_in_time_hh')"
                                                :state="false"
                                                label="Time"
                                                label-for="check_in_time_hh"
                                                class="m-0 p-0 text-muted"
                                        >
                                            <b-form-select 
                                                v-model="itinerary_setup.step1.check_in_time_hh" 
                                                :options="hour_options" 
                                                size="sm"
                                                v-validate="'required'" 
                                                id="check_in_time_hh" 
                                                name="check_in_time_hh" 
                                                v-bind:class="{ 'is-invalid': errors.has('check_in_time_hh') }"
                                                ></b-form-select>
                                        </b-form-group>
                                    </b-col>
                                    <b-col>
                                        <label>&nbsp;</label>
                                        <b-form-group
                                                :description="errors.has('check_in_time_mm') ? '' : ''"
                                                :invalid-feedback="!errors.has('check_in_time_mm') ? '' : '*'+errors.first('check_in_time_mm')"
                                                :state="false"
                                                label=""
                                                label-for="check_in_time_mm"
                                                class="m-0 p-0"
                                        >
                                            <b-form-select 
                                                v-model="itinerary_setup.step1.check_in_time_mm" 
                                                :options="minute_options" 
                                                size="sm"
                                                v-validate="'required'" 
                                                id="check_in_time_mm" 
                                                name="check_in_time_mm" 
                                                v-bind:class="{ 'is-invalid': errors.has('check_in_time_mm') }"
                                                ></b-form-select>
                                        </b-form-group>
                                    </b-col>
                                    <b-col>
                                        <label>&nbsp;</label>
                                        <b-form-group
                                                :description="errors.has('check_in_time_meridian') ? '' : ''"
                                                :invalid-feedback="!errors.has('check_in_time_meridian') ? '' : '*'+errors.first('check_in_time_meridian')"
                                                :state="false"
                                                label=""
                                                label-for="check_in_time_meridian"
                                                class="m-0 p-0"
                                        >
                                            <b-form-select 
                                                v-model="itinerary_setup.step1.check_in_time_meridian" 
                                                :options="meridian_options" 
                                                size="sm"
                                                v-validate="'required'" 
                                                id="check_in_time_meridian" 
                                                name="check_in_time_meridian" 
                                                v-bind:class="{ 'is-invalid': errors.has('check_in_time_meridian') }"
                                                ></b-form-select>
                                        </b-form-group>
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col>
                                        <b-form-group
                                            :description="errors.has('city_id_from') ? '' : '*This field is required.'"
                                            :invalid-feedback="!errors.has('city_id_from') ? '' : '*'+errors.first('city_id_from')"
                                            :state="false"
                                            label="City"
                                            label-for="city_id_from"
                                            class="text-muted">
                                                <b-form-select 
                                                    v-model="itinerary_setup.step1.city_from"
                                                    v-validate="'required'" 
                                                    id="city_from" 
                                                    name="city_from" 
                                                    size="sm"
                                                    v-bind:class="{ 'is-invalid': errors.has('city_from') }"
                                                    @change="setPortsFrom">
                                                        <option value="">Please select City</option>
                                                        <option v-for="itinerary_city in step1_settings_options.itinerary_cities" :value="itinerary_city">{{itinerary_city.name}}</option>
                                                </b-form-select>
                                        </b-form-group>
                                    </b-col>
                                    <b-col>
                                        <b-form-group
                                            :description="errors.has('port_id_from') ? '' : '*This field is required.'"
                                            :invalid-feedback="!errors.has('port_id_from') ? '' : '*'+errors.first('port_id_from')"
                                            :state="false"
                                            label="Port"
                                            label-for="port_id_from"
                                            class="text-muted">
                                                <b-form-select 
                                                    v-model="itinerary_setup.step1.city_port_id_from"
                                                    v-validate="'required'" 
                                                    id="port_id_from" 
                                                    name="port_id_from" 
                                                    size="sm"
                                                    v-bind:class="{ 'is-invalid': errors.has('port_id_from') }"
                                                    :disabled="ports_from.length > 0 ? false : true">
                                                        <option value="">Please select City</option>
                                                        <option v-for="port in ports_from" :value="port.id">{{port.name}}</option>
                                                </b-form-select>
                                        </b-form-group>
                                    </b-col>
                                </b-row>
                            </fieldset>
                        </b-col>
                        <b-col>
                            <fieldset class="border p-3">
                            <legend  class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Check Out Details</legend>
                                <b-form-group
                                    :description="errors.has('check_out_date') ? '' : '*This field is required.'"
                                    :invalid-feedback="!errors.has('check_out_date') ? '' : '*'+errors.first('check_out_date')"
                                    :state="false"
                                    label="Date"
                                    label-for="check_out_date"
                                    class="mb-4 text-muted"
                                >
                                    <b-form-input v-model="itinerary_setup.step1.check_out_date" v-validate="'required'" id="check_out_date" name="check_out_date" v-bind:class="{ 'is-invalid': errors.has('check_out_date') }" size="sm" type="date"></b-form-input>
                                </b-form-group>
                                <b-row class="mb-4">
                                    <b-col>
                                        <b-form-group
                                                :description="errors.has('check_out_time_hh') ? '' : ''"
                                                :invalid-feedback="!errors.has('check_out_time_hh') ? '' : '*'+errors.first('check_out_time_hh')"
                                                :state="false"
                                                label="Time"
                                                label-for="check_out_time_hh"
                                                class="m-0 p-0 text-muted"
                                        >
                                            <b-form-select 
                                                v-model="itinerary_setup.step1.check_out_time_hh" 
                                                :options="hour_options" 
                                                size="sm"
                                                v-validate="'required'" 
                                                id="check_out_time_hh" 
                                                name="check_out_time_hh" 
                                                v-bind:class="{ 'is-invalid': errors.has('check_out_time_hh') }"
                                                ></b-form-select>
                                        </b-form-group>
                                    </b-col>
                                    <b-col>
                                        <label>&nbsp;</label>
                                        <b-form-group
                                                :description="errors.has('check_out_time_mm') ? '' : ''"
                                                :invalid-feedback="!errors.has('check_out_time_mm') ? '' : '*'+errors.first('check_out_time_mm')"
                                                :state="false"
                                                label=""
                                                label-for="check_out_time_mm"
                                                class="m-0 p-0"
                                        >
                                            <b-form-select 
                                                v-model="itinerary_setup.step1.check_out_time_mm" 
                                                :options="minute_options" 
                                                size="sm"
                                                v-validate="'required'" 
                                                id="check_out_time_mm" 
                                                name="check_out_time_mm" 
                                                v-bind:class="{ 'is-invalid': errors.has('check_out_time_mm') }"
                                                ></b-form-select>
                                        </b-form-group>
                                    </b-col>
                                    <b-col>
                                        <label>&nbsp;</label>
                                        <b-form-group
                                                :description="errors.has('check_out_time_meridian') ? '' : ''"
                                                :invalid-feedback="!errors.has('check_out_time_meridian') ? '' : '*'+errors.first('check_out_time_meridian')"
                                                :state="false"
                                                label=""
                                                label-for="check_out_time_meridian"
                                                class="m-0 p-0"
                                        >
                                            <b-form-select 
                                                v-model="itinerary_setup.step1.check_out_time_meridian" 
                                                :options="meridian_options" 
                                                size="sm"
                                                v-validate="'required'" 
                                                id="check_out_time_meridian" 
                                                name="check_out_time_meridian" 
                                                v-bind:class="{ 'is-invalid': errors.has('check_out_time_meridian') }"
                                                ></b-form-select>
                                        </b-form-group>
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col>
                                        <b-form-group
                                            :description="errors.has('city_id_to') ? '' : '*This field is required.'"
                                            :invalid-feedback="!errors.has('city_id_to') ? '' : '*'+errors.first('city_id_to')"
                                            :state="false"
                                            label="City"
                                            label-for="city_id_to"
                                            class="text-muted">
                                                <b-form-select 
                                                    v-model="itinerary_setup.step1.city_to"
                                                    v-validate="'required'" 
                                                    id="city_to" 
                                                    name="city_to" 
                                                    size="sm"
                                                    v-bind:class="{ 'is-invalid': errors.has('city_to') }"
                                                    @change="setPortsTo">
                                                        <option value="">Please select City</option>
                                                        <option v-for="itinerary_city in step1_settings_options.itinerary_cities" :value="itinerary_city">{{itinerary_city.name}}</option>
                                                </b-form-select>
                                        </b-form-group>
                                    </b-col>
                                    <b-col>
                                        <b-form-group
                                            :description="errors.has('port_id_to') ? '' : '*This field is required.'"
                                            :invalid-feedback="!errors.has('port_id_to') ? '' : '*'+errors.first('port_id_to')"
                                            :state="false"
                                            label="Port"
                                            label-for="port_id_to"
                                            class="text-muted">
                                                <b-form-select 
                                                    v-model="itinerary_setup.step1.city_port_id_to"
                                                    v-validate="'required'" 
                                                    id="port_id_to" 
                                                    name="port_id_to" 
                                                    size="sm"
                                                    v-bind:class="{ 'is-invalid': errors.has('port_id_to') }"
                                                    :disabled="ports_to.length > 0 ? false : true">
                                                        <option value="">Please select City</option>
                                                        <option v-for="port in ports_to" :value="port.id">{{port.name}}</option>
                                                </b-form-select>
                                        </b-form-group>
                                    </b-col>
                                </b-row>
                            </fieldset>
                        </b-col>
                    </b-row>
                </b-card-text>
            </b-tab>
            <b-tab title="Gallery">
                <b-card-text>
                    <b-row class="pt-3 mb-0">
                        <b-col class="mb-0">
                            <media @mediaComponentUpdateSelectedImages="updateMedia" :current_images="itinerary_setup.step1.itinerary_media"/>
                        </b-col>
                    </b-row>
                </b-card-text>
            </b-tab>
        </b-tabs>
    </div>
</template>

<script>
    import {bus} from '@/main.js'
    import Media from '@/views/helpers/Media.vue';
    export default {
        props:{
            itinerary_setup: {
                type: Object,
                default: () => {}
            }
        },
        components: {Media},
        data() {
            return {
                hour_options: [
                    { value: null, text: 'HH', disabled: true},
                    { value: 1, text: '01' },
                    { value: 2, text: '02' },
                    { value: 3, text: '03' },
                    { value: 4, text: '04' },
                    { value: 5, text: '05' },
                    { value: 6, text: '06' },
                    { value: 7, text: '07' },
                    { value: 8, text: '08' },
                    { value: 9, text: '09' },
                    { value: 10, text: '10' },
                    { value: 11, text: '11' },
                    { value: 12, text: '12' }
                ],
                minute_options: [
                    { value: null, text: 'MM', disabled: true},
                    { value: '00', text: '00' },
                    { value: '05', text: '05' },
                    { value: '10', text: '10' },
                    { value: '15', text: '15' },
                    { value: '20', text: '20' },
                    { value: '25', text: '25' },
                    { value: '30', text: '30' },
                    { value: '35', text: '35' },
                    { value: '40', text: '40' },
                    { value: '45', text: '45' },
                    { value: '50', text: '50' },
                    { value: '55', text: '55' }
                ],
                meridian_options: [
                    { value: 'AM', text: 'AM' },
                    { value: 'PM', text: 'PM' }
                ],
                step1_settings_options:{},
                ports_from:[],
                ports_to:[],
                itinerary_setup_watcher:{},
            }
        },
        watch: {
            itinerary_setup_watcher:{
                handler(val){
                    //console.log(val);
                    this.itinerary_setup.step1.city_id_from = val.city_from.id;
                    this.itinerary_setup.step1.city_id_to = val.city_to.id;
                },
                deep:true
            }
        },
        created(){
            this.getSetupOptions();
            this.itinerary_setup_watcher=this.itinerary_setup.step1;
            if(this.itinerary_setup.step1.city_from!=""){
                this.ports_from=this.itinerary_setup.step1.city_from.ports;
            }
            if(this.itinerary_setup.step1.city_to!=""){
                this.ports_to=this.itinerary_setup.step1.city_to.ports;
            }   
        },
        methods:{
            validateInputs(){
                //this.$emit('nextStep');
                this.$validator.validateAll().then(result=>{
                    if(result){
                        this.$emit('nextStep');
                    }
                });
            },
            checkIfAmbassadorEnabled(value){
                let result = this.step1_settings_options.itinerary_brands.find(x => x.id === value);
                if(result.is_ambassador_required==1){
                    this.$emit('changeComponentStatus',true,2);
                }else{
                    this.$emit('changeComponentStatus',false,2);
                }
            },
            getSetupOptions() {
                this.axios.get('itinerary/step1_get_options')
                    .then(
                        response => {
                            this.step1_settings_options = response.data;
                        }
                    );
            },
            setPortsFrom(data){
                if(typeof data.ports != 'undefined' && data.ports != '')
                {
                    this.ports_from=data.ports;
                    if(data.ports.length<=0){
                        this.itinerary_setup.step1.city_port_id_from="";
                    }
                }else{
                    this.ports_from=[];
                    this.itinerary_setup.step1.city_port_id_from="";
                }
                
            },
            setPortsTo(data){
                if(typeof data.ports != 'undefined' && data.ports != '')
                {
                    this.ports_to=data.ports;
                    if(data.ports.length<=0){
                        this.itinerary_setup.step1.city_port_id_to="";
                    }
                }else{
                    this.ports_to=[];
                    this.itinerary_setup.step1.city_port_id_to="";
                }
            },
            updateMedia(data){
                this.itinerary_setup.step1.itinerary_media=data;
            }
        }
    }
</script>

<style scoped>
</style>