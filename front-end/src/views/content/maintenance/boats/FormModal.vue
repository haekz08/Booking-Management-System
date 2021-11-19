<template>
    <div>
        <b-modal
                header-text-variant="light"
                header-bg-variant="dark"
                footer-bg-variant="dark"
                centered
                v-model="open_modal.modal_status"
                @close="closeModal"
                :size="modal_size"
                body-class="p-0"
                no-close-on-backdrop
                no-close-on-esc
        >
            <template slot="modal-title">
                <div>
                    <h5 class="parent_sign text-uppercase"><i class="fa fa-fw fa-ship"></i> {{ form_title
                        }}<span></span></h5>
                </div>
            </template>
            <b-row align-v="center" class="modal-loader" v-if="is_saving">
                <b-col>
                    <b-spinner></b-spinner>
                    <br><br>
                    <strong>Loading</strong>
                </b-col>
            </b-row>
            <div class="custom-modal-body">
                <b-tabs v-model="boat_tab" content-class="mt-3">
                    <b-tab active>
                        <template slot="title">
                            <i class="fa fa-list fa-fw"></i> Boat Set Up
                        </template>
                        <b-row>
                            <b-col md="3">
                                <b-card no-body>
                                    <div slot="header">
                                        <strong>Fill in the form</strong>
                                    </div>
                                    <div class="p-2">
                                        <b-form id="boat_form" @submit.prevent="saveBoatSetting">
                                            <b-form-group
                                                    :description="errors.has('name') ? '' : '*This field is required.'"
                                                    :invalid-feedback="!errors.has('name') ? '' : '*'+errors.first('name')"
                                                    :state="false"
                                                    label="Boat Name">
                                                <b-form-input
                                                        v-model="boat_setting.name"
                                                        v-validate="'required'"
                                                        id="name"
                                                        name="name"
                                                        trim
                                                        v-bind:class="{ 'is-invalid': errors.has('name') }">
                                                </b-form-input>
                                            </b-form-group>

                                            <b-form-group
                                                    :description="errors.has('type') ? '' : '*This field is required.'"
                                                    :invalid-feedback="!errors.has('type') ? '' : '*'+errors.first('type')"
                                                    :state="false"
                                                    label="Type">
                                                <b-form-select
                                                        v-model="boat_setting.boat_type_id"
                                                        v-validate="'required'"
                                                        id="type"
                                                        name="type"
                                                        v-bind:class="{ 'is-invalid': errors.has('type') }">
                                                    <option value="">Select Type</option>
                                                    <option v-for="bt in boat_settings_options.boat_types" :value="bt.id">{{ bt.name }}
                                                    </option>
                                                </b-form-select>
                                            </b-form-group>

                                            <b-form-group
                                                    :description="errors.has('brand') ? '' : '*This field is required.'"
                                                    :invalid-feedback="!errors.has('brand') ? '' : '*'+errors.first('brand')"
                                                    :state="false"
                                                    label="Brand">
                                                <b-form-select
                                                        v-model="boat_setting.boat_brand_id"
                                                        v-validate="'required'"
                                                        id="brand"
                                                        name="brand"
                                                        v-bind:class="{ 'is-invalid': errors.has('brand') }">
                                                    <option value="">Select Brand</option>
                                                    <option v-for="bb in boat_settings_options.boat_brands" :value="bb.id">{{ bb.name }}
                                                    </option>
                                                </b-form-select>
                                            </b-form-group>

                                            <b-form-group
                                                    :description="errors.has('model') ? '' : '*This field is required.'"
                                                    :invalid-feedback="!errors.has('model') ? '' : '*'+errors.first('model')"
                                                    :state="false"
                                                    label="Model">
                                                <b-form-select
                                                        v-model="boat_setting.boat_model_id"
                                                        v-validate="'required'"
                                                        id="model"
                                                        name="model"
                                                        v-bind:class="{ 'is-invalid': errors.has('model') }">
                                                    <option value="">Select Model</option>
                                                    <option v-for="bm in boat_settings_options.boat_models" :value="bm.id">{{ bm.name }}
                                                    </option>
                                                </b-form-select>
                                            </b-form-group>
                                        </b-form>
                                    </div>
                                </b-card>
                            </b-col>
                            <b-col md="9 ml-0 pl-0">
                                <b-card no-body>
                                    <div slot="header">
                                        <b-row>
                                            <b-col sm="5" class="d-flex align-items-center">
                                                <div>
                                                    <i class='fa fa-database'></i><strong> Boat Cabins</strong>
                                                </div>
                                            </b-col>
                                            <b-col sm="7" class="text-right">
                                                <b-button variant="dark" class="px-4" size="sm" @click="addCabin">
                                                    <i class="fa fa-plus"></i> Add Cabin
                                                </b-button>
                                                
                                            </b-col>
                                        </b-row>
                                    </div>
                                    <div class="p-2">
                                        <b-table @row-dblclicked="updateCabin" show-empty striped small hover
                                            :fields="boat_cabin_fields"
                                            :items="boat_cabin_holder"
                                            bordered
                                            class="mb-0"
                                            >
                                            <template slot="cabin_type" slot-scope="row">
                                                {{ getCabinType(row.item.cabin_type_id) }}
                                            </template>
                                            <template slot="actions" slot-scope="row">
                                                <!-- <b-button size="sm" class="mr-1 btn btn-success"f
                                                        @click="updateCabin(row.item, row.index)">
                                                    <i class="fa fa-pencil"></i>
                                                </b-button> -->
                                                <b-button size="sm" class="btn btn-danger" @click="removeCabin(row.item)">
                                                    <i class="fa fa-trash"></i> Delete
                                                </b-button>
                                            </template>
                                        </b-table>
                                    </div>
                                </b-card>
                            </b-col>
                        </b-row>
                    </b-tab>
                    <b-tab>
                        <template slot="title">
                            <i class="fa fa-picture-o fa-fw"></i> Boat Images
                        </template>
                        <media @mediaComponentUpdateSelectedImages="updateBoatMedia" :current_images="boat_setting.boat_media"/>
                    </b-tab>
                </b-tabs>
            </div>
            <div slot="modal-footer" class="w-100">
                <b-button variant="success" disabled v-if="is_saving" size="sm" class="float-right">
                    <template>
                        <b-spinner small type="grow"></b-spinner>
                        Saving Data...
                    </template>
                </b-button>
                <b-button variant="success" disabled v-if="is_saving" size="sm" class="float-right mr-3">
                    <template>
                        <b-spinner small type="grow"></b-spinner>
                        Saving Data...
                    </template>
                </b-button>

                <b-button
                        v-if="!is_saving"
                        @click="saveAndExit"
                        type="submit"
                        variant="success"
                        class="float-right"
                        size="sm"
                >
                    <i class="fa fa-save"></i> Save & Exit
                </b-button>
                <b-button
                        v-if="!is_saving"
                        @click="saveRetain"
                        type="submit"
                        variant="success"
                        class="float-right mr-3"
                        size="sm"
                >
                    <i class="fa fa-save"></i> Save
                </b-button>
            </div>
            <cabin-modal
                    v-if="cabin_modal.status"
                    :cabin_modal="cabin_modal"
                    @addBoatCabin="addBoatCabin"
            ></cabin-modal>
        </b-modal>
    </div>
</template>

<script>
    import {bus} from '@/main.js';
    import CabinModal from './CabinFormModal'
    import SwalMixin from '@/views/mixins/Swal.js'
    import Media from '@/views/helpers/Media.vue';

    export default {
        components: {
            CabinModal,
            Media
        },
        props: {
            open_modal: {
                type: [Array, Object],
                default: () => []
            },
            form_data: {
                type: [Array, Object],
                default: () => []
            },
            modal_size: {
                type: String,
                required: false,
                default: 'md'
            },
            header_title: {
                type: String,
                required: false,
                default: 'md'
            }
        },
        watch: {
            boat_setting: {
                handler(val) {
                    this.form_title = val.id == -1 ? 'Boat Setup' : val.name;
                    let data = val.boat_cabins.filter(x => x.is_deleted == 0);
                    this.boat_cabin_holder = data;
                },
                deep: true
            }
        },
        data() {
            return {
                boat_tab:0,
                form_title: '',
                is_saving: false,
                boat_setting: {
                    id: -1,
                    name: '',
                    boat_type_id: "",
                    boat_brand_id: "",
                    boat_model_id: "",
                    boat_media: [],
                    boat_cabins: []
                },
                boat_cabin_holder: [],
                boat_settings_options: {
                    boat_types: [],
                    boat_brands: [],
                    boat_models: [],
                    cabin_types: []
                },
                media_modal_status: {
                    boat_media_modal_status: false
                },
                cabin_modal: {
                    status: false,
                    data: {}
                },
                boat_cabin_fields: [
                    {key: 'code', name: 'Cabin Position'},
                    {key: 'cabin_type', name: 'Cabin Type'},
                    {key: 'occupancy', name: 'Occupancy'},
                    {key: 'actions', name: 'Actions', class: 'text-center'},
                ]
            }
        },
        methods: {
            getBoatSetupOptions() {
                this.axios.get('maintenance/boats/get_boat_setup_options')
                    .then(
                        response => {
                            this.boat_settings_options = response.data;
                        }
                    );
            },
            closeModal() {
                this.open_modal.modal_status = false;
            },
            saveBoatSetting(callback) {
                this.$validator.validateAll().then((result) => {
                    if (result) {
                        if (this.boat_cabin_holder == 0) {
                            this.swal_transaction_warning_data.text = "Add at least 1 cabin!";
                            this.swalTransactionWarning();
                            return;
                        }
                        this.swalConfirmSubmit((data) => {
                            if (data.value) {
                                this.is_saving=true;
                                this.axios.post('maintenance/boats/save', this.boat_setting).then(
                                    response => {
                                        this.is_saving = false;
                                        this.boat_setting = response.data;
                                        this.swalTransactionCompleted();
                                        callback(response.data);
                                    }
                                );
                            }
                        });
                    }else{
                        this.boat_tab=0;
                    }
                });
            },
            saveRetain(){
                this.saveBoatSetting( (response) => {
                });
            },
            saveAndExit(){
                this.saveBoatSetting(
                    (response) => {
                        this.open_modal.modal_status = false;
                    }
                );
            },
            addCabin() {
                this.cabin_modal.status = true;
                this.cabin_modal.data = {};
            },
            addBoatCabin(boat_cabin) {
                if (boat_cabin.hasOwnProperty('index')) {
                    let cabin = this.boat_setting.boat_cabins[boat_cabin.index];
                    cabin.code = boat_cabin.code;
                    cabin.cabin_description = boat_cabin.cabin_description;
                    cabin.cabin_type_id = boat_cabin.cabin_type_id;
                    cabin.occupancy = boat_cabin.occupancy;
                    cabin.cabin_media = boat_cabin.cabin_media;
                } else {
                    this.boat_setting.boat_cabins.push(boat_cabin);
                }
            },
            updateCabin(cabin, index) {
                cabin.index = index;
                this.cabin_modal.status = true;
                this.cabin_modal.data = JSON.parse(JSON.stringify(cabin));
            },
            removeCabin(cabin) {
                this.swalConfirmDelete((data) => {
                    if (data.value) {
                        cabin.is_deleted = 1;
                        this.swalTransactionCompleted();
                    }
                });
            },
            getCabinType(cabin_type_id) {
                if (this.boat_settings_options.cabin_types.length > 0) {
                    let type = this.boat_settings_options.cabin_types.find(x => x.id == cabin_type_id);
                    return type.name;
                }
            },
            updateBoatMedia(data){
                this.boat_setting.boat_media=data;
            }
        },
        created(){
            this.getBoatSetupOptions();
        },
        mounted() {
            this.$nextTick(() => {
                this.form_title = this.form_data.id == -1 ? 'Boat Setup' : this.form_data.name;
                if (this.form_data.id != -1)
                    this.boat_setting = this.form_data;
            });
            
        },
        mixins: [SwalMixin]
    }
</script>

<style scoped>

</style>