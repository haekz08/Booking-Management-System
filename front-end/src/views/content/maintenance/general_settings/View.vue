<template>
    <div class="animated fadeIn">
        <b-row>
            <b-col>
                <b-card>
                    <template v-slot:header>
                        <b-row>
                            <b-col md="5">
                                <span class="text-uppercase font-weight-bold"><i class="fa fa-fw fa-cogs"></i> Site Setup</span>
                            </b-col>
                            <b-col md="7 text-right">
                                <b-button :disabled="is_saving || is_loading" class="btn px-4 btn-dark btn-sm text-uppercase"
                                         type="submit" form="site_setup_form">
                                    <span v-if="!is_saving && !is_loading">
                                        <i class="fa fa-fw fa-save"></i> Save Setup
                                    </span>
                                    <span v-if="is_loading">
                                        <i class="fa fa-spinner fa-pulse fa-fw"></i> Loading
                                    </span>
                                    <span v-if="is_saving">
                                        <i class="fa fa-spinner fa-pulse fa-fw"></i> Saving Setup
                                    </span>
                                </b-button>
                            </b-col>
                        </b-row>
                    </template>
                    <form @submit.prevent="save" id="site_setup_form">
                        <b-row>
                            <b-col md="3">
                                <b-form-group
                                        class="text-uppercase font-weight-bold"
                                        label="Currency:"
                                        label-for="currency"
                                >
                                    <b-form-input
                                            :disabled="is_saving || is_loading"
                                            id="currency"
                                            v-model="site_setup.currency"
                                            type="text"
                                            placeholder="Enter Currency"
                                    ></b-form-input>
                                </b-form-group>
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="12">
                                <b-form-group
                                        class="text-uppercase font-weight-bold"
                                        label="Paypal SDK URL:"
                                        label-for="paypal_sdk_url"
                                >
                                <b-form-textarea
                                        :disabled="is_saving || is_loading"
                                        id="paypal_sdk_url"
                                        v-model="site_setup.paypal_sdk_url"
                                        placeholder="Enter Paypal SDK URL..."
                                        rows="5"
                                ></b-form-textarea>
                                </b-form-group>
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="12">
                                <b-form-group
                                        class="text-uppercase font-weight-bold"
                                        label="Google Analytics:"
                                        label-for="google_analytics"
                                >
                                    <b-form-textarea
                                            :disabled="is_saving || is_loading"
                                            id="google_analytics"
                                            v-model="site_setup.google_analytics"
                                            placeholder="Enter Google Analytics..."
                                            rows="5"
                                    ></b-form-textarea>
                                </b-form-group>
                            </b-col>
                        </b-row>
                    </form>
                </b-card>
            </b-col>
        </b-row>
    </div>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js';
    export default {
        data() {
            return {
                is_saving: false,
                is_loading: false,
                site_setup:{
                    id:-1,
                    currency: "",
                    paypal_sdk_url:"",
                    google_analytics:""
                }
            }
        },
        methods: {
            save() {
                this.is_saving = true;
                this.axios.post("maintenance/general_settings/save", this.site_setup).then(
                    response => {
                        this.site_setup = response.data;
                        this.is_saving = false;
                        this.swalTransactionCompleted();
                    }
                );
            },
            getSiteSetting(){
                this.is_loading = true;
                this.axios.get("maintenance/general_settings/get").then(
                    response => {
                        this.site_setup = response.data;
                        this.is_loading = false;
                    }
                );
            }
        },
        created(){
            this.getSiteSetting();
        },
        mixins:[SwalMixin]
    }
</script>

<style scoped>

</style>