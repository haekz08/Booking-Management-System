<template>
    <div class="animated fadeIn">
        <div class="steps-holder d-flex align-items-center justify-content-center">
            <template v-for="load_component in registered_component">
                <div v-if="load_component.connector" class="dot-connector"
                     :class="load_component.id<=selected_component.id ? 'dot-success' : ''"></div>
                <div :class="load_component.id<=selected_component.id ? 'dot-success' : ''"
                     class="dot  d-flex align-items-center justify-content-center"
                     @click="loadComponent(load_component)">
                    {{ load_component.id }}
                    <span class="step-description">{{ load_component.label }}</span>
                </div>
            </template>
        </div>
        <b-row>
            <b-col>
                <b-card
                        header-text-variant="white"
                        header-bg-variant="dark"
                        footer-text-variant="white"
                        footer-bg-variant="dark"
                        class="mb-0"
                        body-class="steps-component-holder">
                    <div slot="header">
                        <b-row>
                            <b-col class="d-flex align-items-center">
                                <strong>{{selected_component.label}}</strong>
                            </b-col>
                            <b-col>
                                <div class="text-right">
                                    <button v-if="selected_component.show_prev" @click="prev" type="button"
                                            class="btn btn-primary btn-sm mr-2 prev-next-btn">
                                        <strong><i class="fa fa-angle-double-left"></i></strong>
                                    </button>
                                    <button v-if="selected_component.show_next" @click="next" type="button"
                                            class="btn btn-primary btn-sm prev-next-btn">
                                        <strong><i class="fa fa-angle-double-right"></i>
                                        </strong>
                                    </button>
                                    <button v-else @click="save" type="button"
                                            class="btn btn-warning btn-sm create-btn">
                                        <strong>
                                            <template v-if="itinerary_setup.step1.id==-1">
                                                <i class="fa fa-fw fa-check"></i>
                                                SAVE AS DRAFT
                                            </template>
                                            <template v-else>
                                                <i class="fa fa-fw fa-save"></i>
                                                SAVE CHANGES
                                            </template>
                                        </strong>
                                    </button>
                                </div>
                            </b-col>
                        </b-row>
                    </div>
                    <b-card-text>
                        <b-row align-v="center" class="modal-loader" v-if="is_saving">
                            <b-col>
                                <b-spinner></b-spinner>
                                <br><br>
                                <strong>Creating Itinerary....</strong>
                            </b-col>
                        </b-row>
                        <component
                                ref="stepsComponent"
                                :is="selected_component.component"
                                :itinerary_setup="itinerary_setup"
                                :is_enabled="selected_component.enabled"
                                @nextStep="nextComponent"
                                @changeComponentStatus="changeComponentStatus"
                        />
                    </b-card-text>
                    <div slot="footer">
                        <div class="text-right">
                            <button v-if="selected_component.show_prev" @click="prev" type="button"
                                    class="btn btn-primary btn-sm mr-2 prev-next-btn">
                                <strong><i class="fa fa-angle-double-left"></i></strong>
                            </button>
                            <button v-if="selected_component.show_next" @click="next" type="button"
                                    class="btn btn-primary btn-sm prev-next-btn">
                                <strong><i class="fa fa-angle-double-right"></i>
                                </strong>
                            </button>
                            <button v-else @click="save" type="button" class="btn btn-warning btn-sm create-btn">
                                <strong>
                                    <template v-if="itinerary_setup.step1.id==-1">
                                        <i class="fa fa-fw fa-check"></i>
                                        SAVE AS DRAFT
                                    </template>
                                    <template v-else>
                                        <i class="fa fa-fw fa-save"></i>
                                        SAVE CHANGES
                                    </template>
                                </strong>
                            </button>
                        </div>
                    </div>
                </b-card>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js'
    import Step1 from './step1/Index';
    import Step2 from './step2/Index';
    import Step3 from './step3/Index';
    import Step4 from './step4/Index';

    export default {
        name: "Create",
        mixins: [SwalMixin],
        components: {
            Step1,
            Step2,
            Step3,
            Step4
        },
        data() {
            return {
                selected_component: {},
                registered_component: [
                    {
                        id: 1,
                        label: 'Itinerary Details',
                        component: 'Step1',
                        connector: false,
                        enabled: true,
                        show_prev: false,
                        show_next: true
                    },
                    {
                        id: 2,
                        label: 'Ambassador Codes',
                        component: 'Step2',
                        connector: true,
                        enabled: false,
                        show_prev: true,
                        show_next: true
                    },
                    {
                        id: 3,
                        label: 'Boat Cabins',
                        component: 'Step3',
                        connector: true,
                        enabled: true,
                        show_prev: true,
                        show_next: true
                    },
                    {
                        id: 4,
                        label: 'Add Ons',
                        component: 'Step4',
                        connector: true,
                        enabled: true,
                        show_prev: true,
                        show_next: false
                    }
                ],
                is_saving: false,
                itinerary_setup: {
                    step1: {
                        id: -1,
                        is_displayed: false,
                        itinerary_brand_id: "",
                        itinerary_country_id: "",
                        check_in_date: "",
                        check_in_time_hh: null,
                        check_in_time_mm: null,
                        check_in_time_meridian: 'AM',
                        city_from: "",
                        city_to: "",
                        city_id_from: "",
                        check_out_date: "",
                        check_out_time_hh: null,
                        check_out_time_mm: null,
                        check_out_time_meridian: 'AM',
                        city_id_to: "",
                        city_port_id_from: "",
                        city_port_id_to: "",
                        itinerary_media: []
                    },
                    step2: {
                        ambassador_id: -1,
                        is_locked_to_ambassador: false,
                        access_codes: [],
                        itinerary_crews: []
                    },
                    step3: {
                        boat_id: -1,
                        is_private_charter_active: false,
                        is_early_bird_active: false,
                        is_referral_active: false,
                        referral_price: 0,
                        early_bird_cut_off_date: '',
                        private_charter_price: '',
                        itinerary_cabins: [],
                        deposit_per_person: 0,
                        is_shared_offered:1,
                        is_private_offered:1,
                        is_double_offered:1,
                        is_cabin_same_price: false,
                        price_per_person:'',
                        cabin_price:'',
                        early_bird_price: '',
                        cabin_early_bird_price: '',

                        disclaimer:''
                    },
                    step4: {
                        itinerary_add_ons: [],
                        itinerary_inclusions: [],
                        itinerary_exclusions: []
                    }
                }
            }
        },
        methods: {
            loadComponent(step) {
                if (this.selected_component.id > step.id)
                    this.selected_component = step;
            },
            disabledStep2() {
            },
            next() {
                this.$refs.stepsComponent.validateInputs();
            },
            prev() {
                let current_component = this.selected_component;
                let current_component_index = this.registered_component.indexOf(current_component);

                //change component
                let next_component = this.registered_component[current_component_index - 1];
                this.selected_component = next_component;
            },
            nextComponent() {
                let current_component = this.selected_component;
                let current_component_index = this.registered_component.indexOf(current_component);

                //change component
                let next_component = this.registered_component[current_component_index + 1];
                this.selected_component = next_component;
            },
            changeComponentStatus(status, component_id) {
                let component = this.registered_component.find(x => x.id === component_id);
                component.enabled = status;
            },
            save() {
                this.swalConfirmSubmit((data) => {
                    if (data.value) {
                        this.is_saving = true;
                        this.axios.post('itinerary/save', this.itinerary_setup).then(response => {
                            //this.closeModal();
                            // this.transactionCompleted();
                            this.swalTransactionCompleted();
                            this.is_saving = false;
                            this.$router.push('/itineraries')
                        }).catch(error => {
                            this.swalRequestError();
                            this.is_saving = false;
                        });
                    }
                });
            },
        },
        mounted() {
            this.selected_component = this.registered_component[0];
        },
        created() {
            if (Object.keys(this.$route.params).length !== 0) {
                this.itinerary_setup = this.$route.params;
                if (this.itinerary_setup.step2.is_ambassador_required == 1) {
                    this.changeComponentStatus(true, 2);
                } else {
                    this.changeComponentStatus(false, 2);
                }
            }
        }
    }
</script>

<style>
    .steps-component-holder {
        position: relative;
    }

    .steps-holder {
        margin-bottom: 40px;
    }

    .dot {
        background-color: #fff;
        border-radius: 50%;
        display: inline-block;
        color: #2c3f4c;
        text-align: center;
        height: 45px;
        width: 45px;
        font-size: 16px;
        position: relative;
        cursor: pointer;
    }

    .step-description {
        position: absolute;
        top: 105%;
        width: 150px;
        color: #2c3f4c;
        font-size: 14px;
    }

    .dot-connector {
        display: inline-block;
        background-color: #fff;
        width: 150px;
        height: 5px;
    }

    .dot-success {
        background: #96c03d !important;
        color: #fff !important;
        font-weight: bold;
    }

    .prev-next-btn {
        width: 30px;
    }

    .create-btn {
        width: 170px;
    }
</style>