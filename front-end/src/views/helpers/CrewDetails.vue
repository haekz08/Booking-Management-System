<template>
    <div class="p-3">
        <b-form-group
            :description="errors.has('ambassador') ? '' : '*This field is required.'"
            :invalid-feedback="!errors.has('ambassador') ? '' : '*'+errors.first('ambassador')"
            :state="false"
            label="Ambassador/ Yoga Instructor">
        <b-form-select
            v-model="form_data.ambassador_id"
            v-validate="'required'"
            id="ambassador"
            name="ambassador"
            v-bind:class="{ 'is-invalid': errors.has('ambassador') }">
                <option value="-1">Select Ambassador</option>
                <option v-for="row_ambassador in other_data.ambassadors" :value="row_ambassador.id">{{
                    row_ambassador.full_name }}
                </option>
        </b-form-select>
    </b-form-group>
    <template v-for="(crew_type, index) in other_data.crew_types">
        <b-form-group
            :description="errors.has('ambassador') ? '' : '*This field is required.'"
            :invalid-feedback="!errors.has('ambassador') ? '' : '*'+errors.first('ambassador')"
            :state="false"
            :label="crew_type.description"
            >
        <b-form-select
            v-bind:class="{ 'is-invalid': errors.has('ambassador') }"
            v-model="form_data.crews[index]">
                <option value="null">Select {{ crew_type.description }}</option>
                <option v-for="crew in crew_type.boat_crews" 
                    :value="crew.id">{{crew.first_name+" "+crew.last_name }}
                </option>
        </b-form-select>
        </b-form-group>
    </template>
    <div class="text-right">
        <b-button
            variant="success"
            size="sm"
            @click="save"
    >
        <i class="fa fa-save"></i> Save
    </b-button>
    </div>
    </div>
</template>

<script>
    import {bus} from '@/main.js'
    import SwalMixin from '@/views/mixins/Swal.js'

    export default {
        name: 'CrewDetails',
        inheritAttrs: false,
        mixins: [SwalMixin],
        props: {
            itinerary: {
                type: [Array, Object],
                default: () => []
            },
            other_data: {
                type: [Array, Object],
                default: () => []
            }
        },
        data() {
            return {
                form_data:{
                    itinerary_id:-1,
                    ambassador_id:-1,
                    crews:[],
                    final_crews:[]
                }
            }
        },
        methods: {
            updateGuestDetails() {
                this.swalConfirmSubmit((data) => {
                    if (data.value) {
                        this.axios.post('bookings/save_guest_booking_details', this.guest_info).then(response => {
                            // this.invoice_payment_modal=false;
                            // this.amount_paid.value=0;
                            // this.getBookingDetails(this.booking_id);
                            this.swal_transaction_completed_data.text = "Guest details successfully updated.";
                            this.swalTransactionCompleted();
                            this.$emit('guest_details_saved');
                        }).catch(error => {
                            this.swalRequestError();
                            this.is_saving = false;
                        });
                    }
                });
            },
            isSelected(crew_type_id, crew_id) {
                let check = this.itinerary.itinerary_crews.find(x => {
                    return x.crew_type_id == crew_type_id && x.id == crew_id
                });
                
                if(typeof check != "undefined"){
                    return true;
                }else{
                    return false;
                }
            },
            save(){
                
                this.swalConfirmSubmit((data) => {
                    if (data.value) {
                        let final_crews = [];
                        this.other_data.crew_types.forEach((data,index) => {
                            if(this.form_data.crews[index]!="null"){
                                let crew = {};
                                crew.itinerary_id = this.form_data.itinerary_id;
                                crew.crew_type_id = data.id;
                                crew.boat_crew_id = this.form_data.crews[index];
                                final_crews.push(crew);
                            }
                        });
                        this.form_data.final_crews = final_crews;
                        this.axios.post('itinerary/update_crews', this.form_data).then(response => {
                            // this.invoice_payment_modal=false;
                            // this.amount_paid.value=0;
                            // this.getBookingDetails(this.booking_id);
                            this.swal_transaction_completed_data.text = "Crew details successfully updated.";
                            this.swalTransactionCompleted();
                            this.$emit('crew_details_saved');
                        }).catch(error => {
                            this.swalRequestError();
                            this.is_saving = false;
                        });
                    }
                });
            }
        },
        created() {
            this.form_data.ambassador_id = this.itinerary.ambassador_id;
            this.form_data.itinerary_id = this.itinerary.id;
            this.other_data.crew_types.forEach((data,index) => {
                let check = this.itinerary.itinerary_crews.find(x => {
                    return x.crew_type_id == data.id
                });
                if(typeof check != "undefined"){
                    this.form_data.crews[index]=check.id
                }else{
                    this.form_data.crews[index]="null"
                }
            });
            
        }
    }
</script>
