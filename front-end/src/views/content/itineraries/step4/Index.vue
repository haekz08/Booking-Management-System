<template>
    <b-row>
        <b-col>
            <fieldset class="border p-3">
            <legend  class="w-auto"><i class="fa fa-fw fa-caret-right"></i>Add Ons</legend>
                <b-list-group>
                    <!-- <b-list-group-item v-for="inclusion in itinerary_setup.step4.itinerary_inclusions">
                        <b-form-checkbox :checked="selected" name="check-button" switch>
                        Switch Checkbox
                        </b-form-checkbox>
                        <hr>
                    </b-list-group-item> -->
                    <b-card v-for="add_on in itinerary_setup.step4.itinerary_add_ons">
                        <div slot="header">
                            <b-form-checkbox :checked="add_on.is_selected" @change="toggleAddOn(add_on)" name="check-button" switch>
                            {{add_on.description}}
                            </b-form-checkbox>
                        </div>
                        <b-card-text>
                            <b-row>
                                <b-col>
                                    <b-form-group
                                        :description="errors.has('price'+add_on.id) ? '' : '*This field is required.'"
                                        :invalid-feedback="!errors.has('price'+add_on.id) ? '' : '*'+errors.first('price'+add_on.id)"
                                        :state="false"
                                        label="Price"
                                        :label-for="'price'+add_on.id"
                                    >
                                        <input type="number" :disabled="!add_on.is_selected" step="any" min="0" class="form-control" v-model="add_on.price" :state="true" v-validate="'required|decimal:2|min_value:1'" :id="'price'+add_on.id" :name="'price'+add_on.id" v-bind:class="{ 'is-invalid': errors.has('price'+add_on.id) }">
                                    </b-form-group>
                                </b-col>
                                <b-col>
                                    <b-form-group
                                        :description="errors.has('available_qty'+add_on.id) ? '' : '*This field is required.'"
                                        :invalid-feedback="!errors.has('available_qty'+add_on.id) ? '' : '*'+errors.first('available_qty'+add_on.id)"
                                        :state="false"
                                        label="Available Qty"
                                        :label-for="'available_qty'+add_on.id"
                                    >
                                        <input type="number" :disabled="!add_on.is_selected" step="any" min="1" class="form-control" v-model="add_on.available_qty" :state="true" v-validate="'required|decimal:2|min_value:1'" :id="'available_qty'+add_on.id" :name="'available_qty'+add_on.id" v-bind:class="{ 'is-invalid': errors.has('available_qty'+add_on.id) }">
                                    </b-form-group>
                                </b-col>
                            </b-row>
                        </b-card-text>
                    </b-card>
                </b-list-group>
            </fieldset>
        </b-col>
        <b-col>
            <fieldset class="border p-3">
            <legend  class="w-auto"><i class="fa fa-fw fa-caret-right"></i>Inclusions</legend>
                <b-list-group>
                    <b-list-group-item v-for="inclusion in itinerary_setup.step4.itinerary_inclusions">
                        <b-form-checkbox :checked="inclusion.is_selected" @change="inclusion.is_selected=!inclusion.is_selected" name="check-button" switch>
                        {{inclusion.description}}
                        </b-form-checkbox>
                    </b-list-group-item>
                </b-list-group>
            </fieldset>
        </b-col>
        <b-col>
            <fieldset class="border p-3">
            <legend  class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Exclusions</legend>
                <b-list-group>
                    <b-list-group-item v-for="exclusion in itinerary_setup.step4.itinerary_exclusions">
                        <b-form-checkbox :checked="exclusion.is_selected" @change="exclusion.is_selected=!exclusion.is_selected" name="check-button" switch>
                        {{exclusion.description}}
                        </b-form-checkbox>
                    </b-list-group-item>
                </b-list-group>
            </fieldset>
        </b-col>
    </b-row>
</template>

<script>
    export default {
        props:{
            itinerary_setup: {
                type: Object,
                default: () => {}
            }
        },
        data() {
            return {
                selected:false
            }
        },
        created(){
            this.getSetupOptions();
        },
        mounted(){

        },
        methods:{
            checkValue(){
                if(this.itinerary_setup.step1.id != -1){
                    this.itinerary_setup.step4.itinerary_inclusions.filter((data) => {
                        let isSelected = this.itinerary_setup.step4.current_inclusions.find(x => x.id == data.id);
                        if(isSelected){
                            data.is_selected = true;
                        }else{
                            data.is_selected = false;
                        }
                    });

                    this.itinerary_setup.step4.itinerary_exclusions.filter((data) => {
                        let isSelected = this.itinerary_setup.step4.current_exclusions.find(x => x.id == data.id);
                        if(isSelected){
                            data.is_selected = true;
                        }else{
                            data.is_selected = false;
                        }
                    });

                    this.itinerary_setup.step4.itinerary_add_ons.filter((data) => {
                        let isSelected = this.itinerary_setup.step4.current_add_ons.find(x => x.add_on_id == data.id);
                        if(isSelected){
                            console.log(isSelected);
                            data.is_selected = true;
                            data.price = isSelected.price;
                            data.available_qty = isSelected.available_qty;
                        }else{
                            data.is_selected = false;
                            data.available_qty = 1;
                        }
                    });
                }
            },
            validateInputs(){
                //this.$emit('nextStep');
                //this.$emit('nextStep');
            },
            toggleAddOn(add_on){
                add_on.is_selected=!add_on.is_selected;
                this.errors.remove('price'+add_on.id);
            },
            getSetupOptions() {
                this.axios.get('itinerary/step4_get_options')
                    .then(
                        response => {
                            console.log(response.data);
                            if(this.itinerary_setup.step4.itinerary_inclusions.length==0){
                                response.data.inclusions.forEach(e => {
                                    if(e.is_default_checked==1){
                                        e.is_selected=true;
                                    }else{
                                        e.is_selected=false;
                                    }
                                    this.itinerary_setup.step4.itinerary_inclusions.push(e);
                                });
                            }
                            if(this.itinerary_setup.step4.itinerary_exclusions.length==0){
                                response.data.exclusions.forEach(e => {
                                    if(e.is_default_checked==1){
                                        e.is_selected=true;
                                    }else{
                                        e.is_selected=false;
                                    }
                                    this.itinerary_setup.step4.itinerary_exclusions.push(e);
                                });
                            }

                            
                            if(this.itinerary_setup.step4.itinerary_add_ons.length==0){
                                response.data.add_ons.forEach(e => {
                                    if(e.is_default_offered==1){
                                        e.is_selected=true;
                                    }else{
                                        e.is_selected=false;
                                    }
                                    this.itinerary_setup.step4.itinerary_add_ons.push(e);
                                });
                            }

                            this.checkValue();
                        }
                    );
            }
        }
    }
</script>

<style scoped>

</style>