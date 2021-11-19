<template>
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
                <h5 class="parent_sign text-uppercase"><i class="fa fa-fw fa-map"></i> City & Ports</h5>
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
            <b-row>
                <b-col md="3">
                    <b-card no-body>
                        <div slot="header">
                            <strong>Fill in the form</strong>
                        </div>
                        <div class="p-2">
                            <b-form
                                    id="city_ports_form"
                                    @submit.prevent="saveCityPorts"
                                    data-vv-scope="city_ports_form"
                            >
                                <b-form-group
                                        :description="errors.has('city_ports_form.city') ? '' : '*This field is required.'"
                                        :invalid-feedback="!errors.has('city_ports_form.city') ? '' : '*'+errors.first('city_ports_form.city')"
                                        :state="false"
                                        label="City *">
                                    <b-form-input
                                            v-model="city_ports.name"
                                            v-validate="'required'"
                                            id="city"
                                            name="city"
                                            trim
                                            v-bind:class="{ 'is-invalid': errors.has('city_ports_form.city') }">
                                    </b-form-input>
                                </b-form-group>
                            </b-form>
                        </div>
                    </b-card>
                </b-col>
                <b-col md="9">
                    <b-card no-body>
                        <div slot="header">
                            <b-row>
                                <b-col sm="5" class="d-flex align-items-center">
                                    <div>
                                        <i class="fa fa-fw fa-map-marker"></i>
                                        <strong>Ports</strong>
                                    </div>
                                </b-col>
                                <b-col sm="7" class="text-right">
                                    <b-button variant="dark" class="px-4" size="sm" @click="addPort">
                                        <i class="fa fa-plus"></i> Add Port
                                    </b-button>
                                    <b-modal
                                            header-text-variant="light"
                                            header-bg-variant="dark" footer-bg-variant="dark"
                                            centered
                                            v-model="port_modal_dialog"
                                            @close="clearPortInputs"
                                            size="md"
                                            body-class="p-0"
                                            no-close-on-backdrop no-close-on-esc>
                                        <template slot="modal-title">
                                            <div>
                                                <h5 class="text-uppercase"><i class="fa fa-plus"></i> Port</h5>
                                            </div>
                                        </template>
                                        <div class="custom-modal-body">
                                            <b-form
                                                    id="port_form"
                                                    @submit.prevent="savePort"
                                                    data-vv-scope="port_form">
                                                <b-form-group
                                                        :description="errors.has('port_form.port') ? '' : '*This field is required.'"
                                                        :invalid-feedback="!errors.has('port_form.port') ? '' : '*'+errors.first('port_form.port')"
                                                        :state="false"
                                                        label="Port *">
                                                    <b-form-input
                                                            v-model="port.name"
                                                            v-validate="'required'"
                                                            id="port"
                                                            name="port"
                                                            trim
                                                            v-bind:class="{ 'is-invalid': errors.has('port_form.port') }"></b-form-input>
                                                </b-form-group>
                                            </b-form>
                                        </div>
                                        <div slot="modal-footer" class="w-100">
                                            <b-button variant="success" disabled v-if="is_saving" size="sm"
                                                      class="float-right">
                                                <template>
                                                    <b-spinner small type="grow"></b-spinner>
                                                    Saving Data...
                                                </template>
                                            </b-button>
                                            <b-button
                                                    type="submit"
                                                    form="port_form"
                                                    variant="success"
                                                    class="float-right"
                                                    size="sm"
                                                    v-else
                                            >
                                                <i class="fa fa-save"></i> Save
                                            </b-button>
                                        </div>
                                    </b-modal>
                                </b-col>
                            </b-row>
                        </div>
                        <div class="p-2">
                            <b-table @row-dblclicked="updatePort" show-empty striped small hover
                                     :fields="port_fields"
                                     :items="port_holder"
                                     bordered
                                     class="mb-0"
                            >
                                <template slot="actions" slot-scope="row">
                                    <b-button size="sm" class="mr-1 btn btn-success" @click="updatePort(row.item, row.index)">
                                        <i class="fa fa-pencil"></i>
                                    </b-button>
                                    <b-button size="sm" class="mr-1 btn btn-danger" @click="removePort(row.item)">
                                        <i class="fa fa-trash"></i>
                                    </b-button>
                                </template>
                            </b-table>
                        </div>
                    </b-card>
                </b-col>
            </b-row>
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
    </b-modal>
</template>

<script>
    import {bus} from '@/main.js';
    import SwalMixin from '@/views/mixins/Swal.js'

    export default {
        name: "FormModal",
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
        data() {
            return {
                is_saving: false,
                city_ports: {
                    id: -1,
                    name: '',
                    ports: []
                },
                port_fields: [
                    {key: 'name', name: 'Port'},
                    {key: 'actions', name: 'Actions', class: 'text-center'},
                ],
                port_holder: [],
                port_modal_dialog: false,
                port_index: -1,
                port: {
                    id: -1,
                    name: '',
                    is_removed: 0
                }
            }
        },
        watch: {
            city_ports: {
                handler(val) {
                    this.port_holder = val.ports.filter(x => x.is_removed == 0);
                },
                deep: true
            }
        },
        methods: {
            saveAndExit() {
                this.saveCityPorts( (response) => {
                    this.open_modal.modal_status = false;
                });
            },
            saveRetain() {
                this.saveCityPorts( (response) => {
                });
            },
            closeModal() {
                this.open_modal.modal_status = false;
            },
            addPort() {
                this.port_modal_dialog = true;
            },
            updatePort(port, index) {
                this.port_index = index;
                this.port = JSON.parse(JSON.stringify(port));
                this.port_modal_dialog = true;
            },
            saveCityPorts(callback) {
                this.$validator.validateAll('city_ports_form').then((result) => {
                    if (result) {
                        this.is_saving = true;
                        this.axios.post('maintenance/itinerary_city/save', this.city_ports).then(
                            response => {
                                this.is_saving = false;
                                this.city_ports = response.data;
                                this.swalTransactionCompleted();
                                callback(response.data);
                            }
                        );
                    }
                });
            },
            savePort() {
                this.$validator.validateAll('port_form').then((result) => {
                    if (result) {
                        if(this.port_index == -1){
                            this.city_ports.ports.push(this.port);
                        }else{
                            let selected_port = this.city_ports.ports[this.port_index];
                            selected_port.name = this.port.name;
                        }
                        this.swalTransactionCompleted();
                        this.clearPortInputs()
                    }
                })
            },
            removePort(port){
                this.swalConfirmDelete((data) => {
                    if (data.value) {
                        port.is_removed = 1;
                        this.swalTransactionCompleted();
                    }
                });
            },
            clearPortInputs() {
                this.port = {
                    id: -1,
                    name: '',
                    is_removed: 0
                };
                this.port_index = -1;
                this.$validator.reset();
            }
        },
        mounted(){
            console.log(this.form_data);
          this.city_ports = this.form_data;
        },
        mixins:[SwalMixin]
    }
</script>

<style scoped>

</style>