<template>
    <div>
        <b-row>
            <b-col md="3">
                <b-form-group
                        :description="errors.has('ambassador') ? '' : '*This field is required.'"
                        :invalid-feedback="!errors.has('ambassador') ? '' : '*'+errors.first('ambassador')"
                        :state="false"
                        label="Ambassador *">
                    <b-form-select
                            @change="selectMainAmbassador"
                            v-model="itinerary_setup.step2.ambassador_id"
                            v-validate="'required'"
                            id="ambassador"
                            name="ambassador"
                            v-bind:class="{ 'is-invalid': errors.has('ambassador') }">
                        <option value="-1">Select Ambassador</option>
                        <option v-for="row_ambassador in ambassadors" :value="row_ambassador.id">{{
                            row_ambassador.full_name }}
                        </option>
                    </b-form-select>
                </b-form-group>
                <template md="3" v-for="crew_type in itinerary_crews">
                    <b-form-group
                            :label="crew_type.description">
                        <b-form-select
                                :value="isEmpty(crew_type.id)"
                                @change="addItineraryCrews($event, crew_type.id)"
                        >
                            <option value="null">Select {{ crew_type.description }}</option>
                            <option v-for="crew in crew_type.boat_crews" :selected="isSelected(crew_type.id, crew.id)"
                                    :value="crew.id">{{
                                crew.first_name+" "+crew.last_name }}
                            </option>
                        </b-form-select>
                    </b-form-group>
                </template>
            </b-col>
            <b-col md="9">
                <b-row align-v="center" class="modal-loader" v-if="!is_enabled">
                    <b-col>
                        <i class="fa fa-info h2"></i>
                        <br>
                        <strong>Note: This module is not available. </strong>
                        <br>
                        <strong>The ITINERARY BRAND you have chosen doesn't need an AMBASSADOR</strong>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col>
                        <b-alert show variant="primary">
                            <b-form-checkbox v-model="itinerary_setup.step2.is_locked_to_ambassador" switch>
                                Lock this package to Ambassador
                            </b-form-checkbox>
                        </b-alert>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col>
                        <fieldset class="border p-2">
                        <legend class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Ambassador Access Codes</legend>
                        <b-form @submit.prevent="saveAmbassadorAccessCode">
                            <b-row>
                                <b-col md="5">
                                    <b-input
                                            class="mb-2 mr-sm-2 mb-sm-0"
                                            placeholder="Code"
                                            :disabled="itinerary_setup.step2.ambassador_id == -1"
                                            v-model="ambassador_access_code.code"
                                    ></b-input>
                                </b-col>
                                <b-col md="5">
                                    <b-input
                                            type="number"
                                            class="mb-2 mr-sm-2 mb-sm-0"
                                            placeholder="Discount"
                                            :disabled="itinerary_setup.step2.ambassador_id == -1"
                                            v-model="ambassador_access_code.discount_amount"
                                    ></b-input>
                                </b-col>
                                <b-col md="2">
                                    <b-button
                                            :variant="ambassador_access_code_index == -1 ? 'primary' : 'success'"
                                            type="submit"
                                    >
                                        <i class="fa fa-fw fa-plus" v-if="this.ambassador_access_code_index == -1"></i>
                                        <i class="fa fa-fw fa-save" v-if="this.ambassador_access_code_index != -1"></i>
                                    </b-button>
                                </b-col>
                            </b-row>
                        </b-form>
                        <b-row class="mt-3">
                            <b-col>
                                <b-table
                                    striped
                                    small
                                    hover
                                    show-empty
                                    :fields="ambassador_access_code_fields"
                                    :items="access_codes.filter(x => x.ambassador_id == itinerary_setup.step2.ambassador_id)">
                                <template slot="is_active" slot-scope="row">
                                    <b-form-checkbox v-model="row.item.is_active" switch>
                                    </b-form-checkbox>
                                </template>
                                <template slot="actions" slot-scope="row">
                                    <b-button size="sm" class="mr-1 btn btn-success" f
                                            @click="updateAmbassadorCode(row.item, row.index)">
                                        <i class="fa fa-pencil"></i>
                                    </b-button>
                                    <b-button size="sm" class="btn btn-danger"
                                            @click="removeAmbassadorCode(row.item)">
                                        <i class="fa fa-trash"></i>
                                    </b-button>
                                </template>
                            </b-table>
                            </b-col>
                        </b-row>
                    </fieldset>
                    </b-col>
                </b-row>
                <b-row class="mt-2">
                    <b-col>
                        <fieldset class="border p-2">
                        <legend class="w-auto"><i class="fa fa-fw fa-caret-right "></i>Other Access Codes</legend>
                        <b-form @submit.prevent="saveOtherAccessCode">
                            <b-row>
                                <b-col md="4">
                                    <b-form-select
                                            v-model="other_access_code.ambassador_id">
                                        <option value="">Ambassador / Agent</option>
                                        <option v-for="row_ambassador in ambassadors.filter(x => x.id != itinerary_setup.step2.ambassador_id)"
                                                :value="row_ambassador.id">{{row_ambassador.full_name }}
                                        </option>
                                    </b-form-select>
                                </b-col>
                                <b-col md="3">
                                    <b-input
                                            class="mb-2 mr-sm-2 mb-sm-0"
                                            placeholder="Code"
                                            v-model="other_access_code.code"
                                    ></b-input>
                                </b-col>
                                <b-col md="3">
                                    <b-input
                                            type="number"
                                            class="mb-2 mr-sm-2 mb-sm-0"
                                            placeholder="Discount"
                                            v-model="other_access_code.discount_amount"
                                    ></b-input>
                                </b-col>
                                <b-col md="2">
                                    <b-button
                                            :variant="other_access_code_index == -1 ? 'primary' : 'success'"
                                            type="submit"
                                    >
                                        <i class="fa fa-fw fa-plus" v-if="this.other_access_code_index == -1"></i>
                                        <i class="fa fa-fw fa-save" v-if="this.other_access_code_index != -1"></i>
                                    </b-button>
                                </b-col>
                            </b-row>
                        </b-form>
                        <b-row class="mt-3">
                            <b-col>
                                <b-table
                                        striped
                                        small
                                        hover
                                        show-empty
                                        :fields="other_access_code_fields"
                                        :items="access_codes.filter(x => x.ambassador_id != itinerary_setup.step2.ambassador_id)">
                                    <template slot="ambassador" slot-scope="row">
                                        {{ getAmbassadorName(row.item.ambassador_id) }}
                                    </template>
                                    <template slot="is_active" slot-scope="row">
                                        <b-form-checkbox v-model="row.item.is_active" switch>
                                        </b-form-checkbox>
                                    </template>
                                    <template slot="actions" slot-scope="row">
                                        <b-button size="sm" class="mr-1 btn btn-success"
                                                @click="updateOtherCode(row.item, row)">
                                            <i class="fa fa-pencil"></i>
                                        </b-button>
                                        <b-button size="sm" class="btn btn-danger"
                                                @click="removeOtherCode(row.item)">
                                            <i class="fa fa-trash"></i>
                                        </b-button>
                                    </template>
                                </b-table>
                            </b-col>
                        </b-row>
                    </fieldset>
                    </b-col>
                </b-row>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js';
    export default {
        props: ['itinerary_setup','is_enabled'],
        data() {
            return {
                ambassadors: [],
                itinerary_crews: [],
                access_codes: [],
                ambassador_access_code_fields: [
                    {key: 'code', name: 'Code'},
                    {key: 'discount_amount', name: 'Discount'},
                    {key: 'is_active', name: 'Status'},
                    {key: 'actions', name: 'Actions'}
                ],
                other_access_code_fields: [
                    {key: 'ambassador', name: 'Ambassador'},
                    {key: 'code', name: 'Code'},
                    {key: 'discount_amount', name: 'Discount'},
                    {key: 'is_active', name: 'Status'},
                    {key: 'actions', name: 'Actions'}
                ],
                ambassador_access_code_index: -1,
                ambassador_access_code: {
                    id: -1,
                    ambassador_id: '',
                    code: '',
                    discount_amount: '',
                    is_active: true,
                    is_removed: 0
                },
                other_access_code_index: -1,
                other_access_code: {
                    id: -1,
                    ambassador_id: '',
                    code: '',
                    discount_amount: '',
                    is_active: true,
                    is_removed: 0
                }
            }
        },
        methods: {
            validateInputs(){
                this.$emit('nextStep');
            },
            addItineraryCrews(boat_crew_id, crew_type) {
                let type = this.itinerary_setup.step2.itinerary_crews.find(x => x.crew_type_id == crew_type);
                if(typeof type == "undefined"){
                    if(crew_type != "null"){
                        this.itinerary_setup.step2.itinerary_crews.push(
                            {
                                crew_type_id: crew_type,
                                crew_id: boat_crew_id
                            }
                        );
                    }else{
                        let index = this.itinerary_setup.step2.itinerary_crews.indexOf(type);
                        this.itinerary_setup.step2.itinerary_crews.splice(index, 1);
                    }
                }else{
                    if(type.crew_type_id != "null"){
                        let index = this.itinerary_setup.step2.itinerary_crews.indexOf(type);
                        this.itinerary_setup.step2.itinerary_crews.splice(index, 1);
                        this.itinerary_setup.step2.itinerary_crews.push(
                            {
                                crew_type_id: crew_type,
                                crew_id: boat_crew_id
                            }
                        );
                    }
                }
            },
            isEmpty(crew_type_id) {
                let check = this.itinerary_setup.step2.itinerary_crews.find(x => {
                    return x.crew_type_id == crew_type_id
                });
                return typeof check != "undefined" ? check.crew_id : null;
            },
            isSelected(crew_type_id, crew_id) {
                if(this.itinerary_setup.step1.id == -1){
                    let check = this.itinerary_setup.step2.itinerary_crews.find(x => {
                        x.crew_type_id == crew_type_id && x.crew_id == crew_id
                    });
                    return check;
                }else{
                    let check = this.itinerary_setup.step2.itinerary_crews.find(x => {
                        x.crew_type_id == crew_type_id && x.id == crew_id
                    });
                    if(typeof check != "undefined")
                    return check;
                }

            },
            step2GetAll() {
                this.axios.get('itinerary/step2_get_all').then(
                    (response) => {
                        this.ambassadors = response.data.ambassadors;
                        this.itinerary_crews = response.data.crew_types;
                    },
                    (errorResponse) => {

                    }
                );
            },
            saveAmbassadorAccessCode() {
                if (this.itinerary_setup.step2.ambassador_id == -1) {
                    this.swal_transaction_warning_data.text = ' Select Main Ambassador first!';
                    this.swalTransactionWarning();
                    return;
                }
                if (this.ambassador_access_code_index != -1) {
                    let is_existing = this.access_codes.find(x => x.code == this.ambassador_access_code.code);
                    let update = this.access_codes[this.ambassador_access_code_index];
                    if (typeof is_existing != "undefined") {
                        if (is_existing.code == update.code) {
                            update.code = this.ambassador_access_code.code;
                            update.discount_amount = this.ambassador_access_code.discount_amount;
                            this.resetAmbassadorAccessCode();
                        } else {
                            this.swal_transaction_warning_data.text = this.ambassador_access_code.code + ' is already existing!';
                            this.swalTransactionWarning();
                        }
                    } else {
                        update.code = this.ambassador_access_code.code;
                        update.discount_amount = this.ambassador_access_code.discount_amount;
                        this.resetAmbassadorAccessCode();
                    }


                } else {
                    let is_existing = this.access_codes.find(x => x.code == this.ambassador_access_code.code);
                    if (is_existing) {
                        this.swal_transaction_warning_data.text = this.ambassador_access_code.code + ' is already existing!';
                        this.swalTransactionWarning();
                        return;
                    }
                    this.ambassador_access_code.ambassador_id = this.itinerary_setup.step2.ambassador_id;
                    this.itinerary_setup.step2.access_codes.push(this.ambassador_access_code);
                    this.resetAmbassadorAccessCode();
                }
            },
            updateAmbassadorCode(code, index) {
                let get_index = this.access_codes.indexOf(code);
                this.ambassador_access_code_index = get_index;
                this.ambassador_access_code = JSON.parse(JSON.stringify(code));
            },
            removeAmbassadorCode(code) {
                this.swalConfirmDelete((data) => {
                    if (data.value) {
                        code.is_removed = 1;
                        this.swalTransactionCompleted();
                    }
                });
            },
            resetAmbassadorAccessCode() {
                this.ambassador_access_code_index = -1;
                this.ambassador_access_code = {
                    id: -1,
                    ambassador_id: '',
                    code: '',
                    discount_amount: '',
                    is_active: true,
                    is_removed: 0
                }
                this.swalTransactionCompleted();
            },
            saveOtherAccessCode() {
                if (this.other_access_code_index != -1) {
                    let is_existing = this.access_codes.find(x => x.code == this.other_access_code.code);
                    let update = this.access_codes[this.other_access_code_index];
                    if (typeof is_existing != "undefined") {
                        if (is_existing.code == update.code) {
                            update.code = this.other_access_code.code;
                            update.discount_amount = this.other_access_code.discount_amount;
                            this.resetOtherAccessCode();
                        } else {
                            this.swal_transaction_warning_data.text = this.other_access_code.code + ' is already existing!';
                            this.swalTransactionWarning();
                        }
                    } else {
                        update.code = this.other_access_code.code;
                        update.discount_amount = this.other_access_code.discount_amount;
                        this.resetOtherAccessCode();
                    }
                } else {
                    let is_existing = this.access_codes.find(x => x.code == this.other_access_code.code);
                    if (is_existing) {
                        this.swal_transaction_warning_data.text = this.other_access_code.code + ' is already existing!';
                        this.swalTransactionWarning();
                        return;
                    }
                    this.itinerary_setup.step2.access_codes.push(this.other_access_code);
                    this.resetOtherAccessCode();
                }
            },
            resetOtherAccessCode() {
                this.other_access_code_index = -1;
                this.other_access_code = {
                    id: -1,
                    ambassador_id: '',
                    code: '',
                    discount_amount: '',
                    is_active: true,
                    is_removed: 0
                }
                this.swalTransactionCompleted();
            },
            getAmbassadorName(ambassador_id) {
                if (typeof ambassador_id != "undefined") {
                    let ambassador = this.ambassadors.find(x => x.id == ambassador_id);
                    return typeof ambassador != "undefined" ? ambassador.full_name : '';
                }
            },
            selectMainAmbassador(evt) {
                this.other_access_code.ambassador_id = "";
            },
            updateOtherCode(code, index) {
                let get_index = this.access_codes.indexOf(code);
                this.other_access_code_index = get_index;
                this.other_access_code = JSON.parse(JSON.stringify(code));
            },
            removeOtherCode(code) {
                this.swalConfirmDelete((data) => {
                    if (data.value) {
                        code.is_removed = 1;
                        this.swalTransactionCompleted();
                    }
                });
            }
        },
        watch: {
            itinerary_setup: {
                handler(val) {
                    this.access_codes = val.step2.access_codes.filter(x => x.is_removed == 0);
                },
                deep: true,
                immediate: true
            }
        },
        mounted() {
            this.$nextTick(() => {
                this.step2GetAll();
            });
        },
        mixins: [SwalMixin]
    }
</script>

<style scoped>

</style>