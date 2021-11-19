<template>
    <div>
        <b-row>
            <b-col md="3">
                <b-input-group size="sm" prepend="Select Boat" class="mb-4">
                    <b-form-select
                            @change="getCabins"
                            v-model="itinerary_setup.step3.boat_id"
                            v-validate="'required'"
                            id="boat"
                            name="boat"
                            size="sm"
                            v-bind:class="{ 'is-invalid': errors.has('boat') }">
                        <option value="-1">Please Choose 1</option>
                        <option v-for="boat in boats" :value="boat.id">{{ boat.name }}</option>
                    </b-form-select>
                </b-input-group>

                <b-input-group size="sm" prepend="Deposit per person" class="mb-4">
                    <b-input
                            v-model="itinerary_setup.step3.deposit_per_person"
                            type="number"
                            size="sm">
                    </b-input>
                </b-input-group>
                <b-row class="bg-light border border-secondary m-0">
                    <b-col class="p-2">
                        <b-form-checkbox v-model="itinerary_setup.step3.is_private_charter_active" switch>
                            Offer Private Charter
                        </b-form-checkbox>
                    </b-col>
                </b-row>
                <div class="bg-white p-2 border-bottom border-left border-right border-secondary text-justify">
                    <b-input
                            v-model="itinerary_setup.step3.private_charter_price"
                            :disabled="!JSON.parse(itinerary_setup.step3.is_private_charter_active)"
                            type="number"
                            placeholder="Amount"
                            size="sm"
                    ></b-input>
                </div>
                <b-row class="bg-light border border-secondary m-0 mt-2">
                    <b-col class="p-2">
                        <b-form-checkbox v-model="itinerary_setup.step3.is_early_bird_active" switch>
                            Early Bird
                        </b-form-checkbox>
                    </b-col>
                </b-row>
                <div class="bg-white p-2 border-bottom border-left border-right border-secondary text-justify">
                    <b-input
                            v-model="itinerary_setup.step3.early_bird_cut_off_date"
                            :disabled="!JSON.parse(itinerary_setup.step3.is_early_bird_active)"
                            type="date"
                            placeholder="Date"
                            size="sm"
                    ></b-input>
                </div>
                <b-row class="bg-light border border-secondary m-0 mt-2">
                    <b-col class="p-2">
                        <b-form-checkbox v-model="itinerary_setup.step3.is_referral_active" switch>
                            Enable BRING A FRIEND promo ?
                        </b-form-checkbox>
                    </b-col>
                </b-row>
                <div class="bg-white p-2 border-bottom border-left border-right border-secondary text-justify">
                    <b-input
                            v-model="itinerary_setup.step3.referral_price"
                            :disabled="!JSON.parse(itinerary_setup.step3.is_referral_active)"
                            type="number"
                            placeholder="Amount"
                            size="sm"
                    ></b-input>
                </div>
                
            </b-col>
            <b-col>
                <b-row class="mb-3">
                    <b-col cols="7">
                        <b-row>
                            <b-col>
                                <b-alert show variant="primary">
                                    <b-form-checkbox v-model="itinerary_setup.step3.is_cabin_same_price" name="check-button" switch class="text-muted">
                                        Same Price
                                    </b-form-checkbox>
                                </b-alert>
                            </b-col>
                        </b-row>
                        <b-row class="mb-4">
                            <b-col>
                                <fieldset class="border px-2 pb-2">
                                <legend  class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Price per Person</legend>
                                    <b-input
                                            v-model="itinerary_setup.step3.price_per_person"
                                            :disabled="!itinerary_setup.step3.is_cabin_same_price"
                                            type="number"
                                            placeholder="Regular Price"
                                            size="sm"
                                            class="mb-3"
                                    ></b-input>
                                    <b-input
                                            v-model="itinerary_setup.step3.early_bird_price"
                                            :disabled="!itinerary_setup.step3.is_cabin_same_price || !JSON.parse(itinerary_setup.step3.is_early_bird_active)"
                                            type="number"
                                            placeholder="Early Bird Price"
                                            size="sm"
                                    ></b-input>
                                </fieldset>
                            </b-col>
                            <b-col>
                                <fieldset class="border px-2 pb-2">
                                <legend  class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Cabin Price</legend>
                                    <b-input
                                        placeholder="Regular Price"
                                        v-model="itinerary_setup.step3.cabin_price"
                                        :disabled="!itinerary_setup.step3.is_cabin_same_price"
                                        type="number"
                                        class="mb-2 mr-sm-2 mb-sm-0 mt-2"
                                        size="sm"
                                    ></b-input>
                                    <b-input
                                        placeholder="Early Bird Price"
                                        v-model="itinerary_setup.step3.cabin_early_bird_price"
                                        :disabled="!itinerary_setup.step3.is_cabin_same_price || !JSON.parse(itinerary_setup.step3.is_early_bird_active)"
                                        type="number"
                                        class="mb-2 mr-sm-2 mb-sm-0 mt-2"
                                        size="sm"
                                    ></b-input>
                                </fieldset>
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col>
                                <fieldset class="border px-2 pb-2">
                                    <legend  class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Disclaimer</legend>
                                    <b-form-textarea
                                            id="textarea"
                                            v-model="itinerary_setup.step3.disclaimer"
                                            placeholder="Enter disclaimer..."
                                            rows="3"
                                            max-rows="6"
                                    ></b-form-textarea>
                                </fieldset>
                            </b-col>
                        </b-row>
                    </b-col>
                    <b-col>
                        <fieldset class="border px-2 pb-2">
                        <legend  class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Cabin Options</legend>
                            <b-row class="bg-light border border-secondary m-0">
                                <b-col class="p-2">
                                    <b-form-checkbox v-model="itinerary_setup.step3.is_shared_offered" switch>
                                            Offer Single Occupancy (Shared Cabin)
                                        </b-form-checkbox>
                                </b-col>
                            </b-row>
                            <div class="bg-white p-2 border-bottom border-left border-right border-secondary text-justify">
                                Shared cabin is where a solo traveler will share the whole cabin with another solo traveler that made a separate booking.
                            </div>

                            <b-row class="bg-light border border-secondary m-0 mt-2">
                                <b-col class="p-2">
                                    <b-form-checkbox v-model="itinerary_setup.step3.is_private_offered" switch>
                                            Offer Single Occupancy (Private Cabin)
                                        </b-form-checkbox>
                                </b-col>
                            </b-row>
                            <div class="bg-white p-2 border-bottom border-left border-right border-secondary text-justify">
                                Single Occupancy is where a solo traveler decides to book the whole cabin privately and will not be sharing the cabin with anyone else.
                            </div>

                            <b-row class="bg-light border border-secondary m-0 mt-2">
                                <b-col class="p-2">
                                    <b-form-checkbox v-model="itinerary_setup.step3.is_double_offered" switch>
                                            Offer Double Occupancy - 2 pax
                                        </b-form-checkbox>
                                </b-col>
                            </b-row>
                            <div class="bg-white p-2 border-bottom border-left border-right border-secondary text-justify">
                                Double Occupancy is where the cabin is occupied by two travelers that traveled and booked together.
                            </div>

                            
                        </fieldset>
                    </b-col>
                </b-row>
                <b-table
                        striped
                        small
                        hover
                        show-empty
                        :fields="room_fields"
                        :items="this.itinerary_setup.step3.itinerary_cabins">
                    <template slot="cabin_type" slot-scope="row">
                        {{ row.item.cabin_type.name }}
                    </template>
                    <template slot="price_per_person" slot-scope="row">
                        <b-input
                                :disabled="itinerary_setup.step3.is_cabin_same_price"
                                v-model="row.item.price_per_person"
                                type="number"
                                placeholder="Price per Person"
                                size="sm"
                        ></b-input>
                    </template>
                    <template slot="cabin_price" slot-scope="row">
                        <b-input
                                :disabled="itinerary_setup.step3.is_cabin_same_price"
                                v-model="row.item.cabin_price"
                                type="number"
                                placeholder="Cabin Price"
                                size="sm"
                        ></b-input>
                    </template>
                    <template slot="early_bird_price" slot-scope="row">
                        <b-input
                                :disabled="!itinerary_setup.step3.is_early_bird_active || itinerary_setup.step3.is_cabin_same_price"
                                v-model="row.item.early_bird_price"
                                type="number"
                                placeholder="Early Bird Price"
                                size="sm"
                        ></b-input>
                    </template>
                    <template slot="cabin_early_bird_price" slot-scope="row">
                        <b-input
                                :disabled="!itinerary_setup.step3.is_early_bird_active || itinerary_setup.step3.is_cabin_same_price"
                                v-model="row.item.cabin_early_bird_price"
                                type="number"
                                placeholder="Cabin Early Bird Price"
                                size="sm"
                        ></b-input>
                    </template>
                    <template slot="ambassador_allocation" slot-scope="row">
                        <b-input
                                v-model="row.item.ambassador_allocation"
                                type="number"
                                placeholder="Ambassador Allocation"
                                size="sm"
                                :max="row.item.occupancy"
                        ></b-input>
                    </template>
                </b-table>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js'
    export default {
        props: ['itinerary_setup'],
        data(){
            return {
                boats:[],
                room_same_price:{
                    is_same_price: false,
                    price_per_person:'',
                    cabin_price:'',
                    early_bird_price: '',
                    cabin_early_bird_price: ''
                },
                room_fields:[
                    {key: 'code', label: 'Cabin Position'},
                    {key: 'cabin_type', label: 'Cabin Type'},
                    {key: 'occupancy', label: 'Occupancy'},
                    {key: 'price_per_person', label: 'Price per Person'},
                    {key: 'early_bird_price', label: 'Early Bird Price'},
                    {key: 'cabin_price', label: 'Cabin Price'},
                    {key: 'cabin_early_bird_price', label: 'Cabin Early Bird Price'},
                    {key: 'ambassador_allocation', label: 'Ambassador Allocation'},
                    // {key: 'assign_ambassador', name: 'Assign Room to Ambassador'}
                ]
            }
        },
        methods:{
            validateInputs(){
                this.$emit('nextStep');
            },
            getCabins(id){
                if(this.itinerary_setup.step1.id == -1){
                    let boat = this.boats.find(x => x.id == id);
                    if(typeof boat != "undefined"){
                        this.itinerary_setup.step3.itinerary_cabins = boat.boat_cabins;
                    }else{
                        this.itinerary_setup.step3.itinerary_cabins = [];
                    }
                }else{
                    let current = this.itinerary_setup.step3.current_itinerary_cabin.filter(x => x.boat_id == id);
                    if(current.length == 0){
                        let boat = this.boats.find(x => x.id == id);
                        if(typeof boat != "undefined"){
                            this.itinerary_setup.step3.itinerary_cabins = boat.boat_cabins;
                        }else{
                            this.itinerary_setup.step3.itinerary_cabins = [];
                        }
                    }else{
                        this.itinerary_setup.step3.itinerary_cabins = this.itinerary_setup.step3.current_itinerary_cabin;
                    }

                }


            },
            step3GetAll(){
                this.axios.get('itinerary/step3_get_all').then(
                    (response) => {
                        this.boats = response.data;
                    },
                    (errorResponse) => {

                    }
                );
            }
        },
        watch:{
            itinerary_setup:{
                handler(val){
                    if(val.step3.is_cabin_same_price){
                        this.itinerary_setup.step3.itinerary_cabins.filter(x => {
                            x.price_per_person = val.step3.price_per_person;
                            x.cabin_price = val.step3.cabin_price;
                            x.early_bird_price = val.step3.early_bird_price;
                            x.cabin_early_bird_price = val.step3.cabin_early_bird_price;
                        });
                    }
                },
                deep:true,
                immediate: true
            }
        },
        mounted(){
            this.step3GetAll();
        },
        mixins:[SwalMixin]
    }
</script>

<style scoped>

</style>