<template>
    <div>
        <b-modal header-text-variant="light" header-bg-variant="dark" footer-bg-variant="dark" centered
                 v-model="cabin_modal.status" @close="closeModal" size="xl" body-class="p-0"
                 no-close-on-backdrop no-close-on-esc>
            <template slot="modal-title">
                <div>
                    <h5 class="parent_sign text-uppercase">
                        <i class="fa fa-fw fa-pencil" v-if="cabin.hasOwnProperty('index')"></i>
                        <i class="fa fa-fw fa-plus" v-if="!cabin.hasOwnProperty('index')"></i>
                        Cabin</h5>
                </div>
            </template>
            <div class="custom-modal-body">
                <b-row>
                    <b-col md="3">
                        <b-card no-body>
                            <div slot="header">
                                <strong>Fill in the form</strong>
                            </div>
                            <div class="p-2">
                                <b-form id="cabin_form" @submit.prevent="saveBoatCabin">
                                    <b-form-group
                                            :description="errors.has('position') ? '' : '*This field is required.'"
                                            :invalid-feedback="!errors.has('position') ? '' : '*'+errors.first('position')"
                                            :state="false"
                                            label="Cabin Position">
                                        <b-form-input
                                                v-model="cabin.code"
                                                trim
                                                v-validate="'required'"
                                                id="position"
                                                name="position"
                                                v-bind:class="{ 'is-invalid': errors.has('position') }"></b-form-input>
                                    </b-form-group>

                                    <b-form-group
                                            :description="errors.has('type') ? '' : '*This field is required.'"
                                            :invalid-feedback="!errors.has('type') ? '' : '*'+errors.first('type')"
                                            :state="false"
                                            label="Cabin Type">
                                        <b-form-select
                                                v-model="cabin.cabin_type_id"
                                                v-validate="'required'"
                                                id="type"
                                                name="type"
                                                v-bind:class="{ 'is-invalid': errors.has('type') }">
                                            <option value="">Select Type</option>
                                            <option v-for="ct in cabin_types" :value="ct.id">{{ ct.name }}
                                            </option>
                                        </b-form-select>
                                    </b-form-group>
                                    <b-form-group
                                            :description="errors.has('cabin_description') ? '' : '*This field is required.'"
                                            :invalid-feedback="!errors.has('cabin_description') ? '' : '*'+errors.first('cabin_description')"
                                            :state="false"
                                            label="Cabin Description">
                                        <b-form-textarea
                                                id="textarea"
                                                v-model="cabin.cabin_description"
                                                placeholder="Enter Description..."
                                                rows="3"
                                                max-rows="6"
                                        ></b-form-textarea>
                                    </b-form-group>

                                    <b-form-group
                                            :description="errors.has('occupancy') ? '' : '*This field is required.'"
                                            :invalid-feedback="!errors.has('occupancy') ? '' : '*'+errors.first('occupancy')"
                                            :state="false"
                                            label="Occupancy">
                                        <b-form-input
                                                type="number"
                                                v-model="cabin.occupancy"
                                                v-validate="'min_value:1|required'"
                                                id="occupancy" name="occupancy"
                                                v-bind:class="{ 'is-invalid': errors.has('occupancy') }"></b-form-input>
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
                                            <i class='fa fa-picture-o fa-fw'></i><strong> Cabin Images</strong>
                                        </div>
                                    </b-col>
                                </b-row>
                            </div>
                            <div class="p-3">
                                <media @mediaComponentUpdateSelectedImages="updateCabinMedia"
                                :current_images="cabin.cabin_media"/>
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
                <b-button
                        type="submit"
                        variant="success"
                        class="float-right"
                        size="sm"
                        @click="addUpdateExit"
                >
                    <span v-if="cabin.hasOwnProperty('index')"><i class="fa fa-pencil"></i> Update & Exit</span>
                    <span v-if="!cabin.hasOwnProperty('index')"><i class="fa fa-plus-circle"></i> Add & Exit</span>
                </b-button>
            </div>
        </b-modal>
    </div>
</template>

<script>
    import {bus} from '@/main.js';
    import SwalMixin from '@/views/mixins/Swal.js'
    import Media from '@/views/helpers/Media.vue';

    export default {
        components: {
            Media
        },
        props: {
            cabin_modal: {
                type: [Array, Object],
                default: () => []
            },
        },
        data() {
            return {
                cabin_tab:0,
                is_saving: false,
                cabin: {
                    id: -1,
                    cabin_type_id: '',
                    code: '',
                    cabin_description:'',
                    occupancy: 1,
                    is_deleted: 0,
                    cabin_media: []
                },
                cabin_types: []
            }
        },
        methods: {
            getCabinTypes() {
                this.axios.get('maintenance/cabin_types/get_all').then(
                    response => {
                        this.cabin_types = response.data;
                    }
                );
            },
            saveBoatCabin(callback) {
                this.$validator.validateAll().then((result) => {
                    if (result) {
                        this.$emit('addBoatCabin', this.cabin);
                        this.swalTransactionCompleted();
                        this.resetForm();
                        callback();
                    }else{
                        this.cabin_tab=0;
                    }
                });
            },
            addUpdateExit(){
                this.saveBoatCabin(() => {
                    this.closeModal();
                });
            },
            addUpdate(){
                this.saveBoatCabin(() => {
                });
            },
            resetForm() {
                this.cabin = {
                    id: -1,
                    cabin_type_id: '',
                    code: '',
                    cabin_description: '',
                    occupancy: 1,
                    is_deleted: 0,
                    cabin_media: []
                };
                this.$nextTick(() => {
                    this.errors.clear();
                    this.$nextTick(() => {
                        this.$validator.reset();
                    });
                });
            },
            closeModal() {
                this.cabin_modal.status = false;
            },
            updateCabinMedia(data) {
                this.cabin.cabin_media = data;
            }
        },
        mounted() {
            if (JSON.stringify(this.cabin_modal.data) !== JSON.stringify({})) {
                this.cabin = this.cabin_modal.data;
                console.log(this.cabin);
            }
            this.getCabinTypes();
        },
        mixins: [SwalMixin]
    }
</script>

<stlye scoped>

</stlye>