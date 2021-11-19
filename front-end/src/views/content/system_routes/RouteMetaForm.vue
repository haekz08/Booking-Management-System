<template>
    <b-row>
        <b-col md="3">
            <b-card no-body>
                <div slot="header">
                    <strong>Fill in the form </strong>
                    <!--<span v-if="route.id != -1" class="card-title text-uppercase"><strong>( {{ modal_current }} )</strong></span>-->
                </div>
                <div class="p-2">
                    <b-form id="route_meta_form" @submit.prevent="save_route_meta" data-vv-scope="route_meta_form">
                        <b-form-group
                                :description="errors.has('route_meta_form.meta_name') ? '' : '*This field is required.'"
                                :invalid-feedback="!errors.has('route_meta_form.meta_name') ? '' : '*'+errors.first('route_meta_form.meta_name')"
                                :state="false"
                                label="Meta Name *">
                            <b-form-input
                                    v-model="route_meta.name"
                                    v-validate="'required'"
                                    id="meta_name"
                                    name="meta_name"
                                    trim
                                    v-bind:class="{ 'is-invalid': errors.has('route_meta_form.meta_name') }">
                            </b-form-input>
                        </b-form-group>
                        <b-form-group
                                :description="errors.has('route_meta_form.meta_value') ? '' : '*This field is required.'"
                                :invalid-feedback="!errors.has('route_meta_form.meta_value') ? '' : '*'+errors.first('route_meta_form.meta_value')"
                                :state="false"
                                label="Meta Value *">
                            <b-form-input
                                    v-model="route_meta.value"
                                    v-validate="'required'"
                                    id="meta_value"
                                    name="meta_value"
                                    trim
                                    v-bind:class="{ 'is-invalid': errors.has('route_meta_form.meta_value') }">
                            </b-form-input>
                        </b-form-group>
                        <b-button type="submit" form="route_meta_form" class="btn btn-success pull-right"><i
                                class="fa fa-fw fa-save"></i> Save Route Meta
                        </b-button>
                    </b-form>
                </div>
            </b-card>
        </b-col>
        <b-col md="9">
            <b-card>
                <div slot="header">
                    <b-row>
                        <b-col sm="5" class="d-flex align-items-center">
                            <div>
                                <i class='fa fa-database'></i><strong> Route Metas</strong>
                            </div>
                        </b-col>
                    </b-row>
                </div>
                <b-table @row-dblclicked="selectRouteMeta" striped small hover show-empty bordered :fields="fields"
                         :items="remaining_route_meta">
                    <template slot="actions" slot-scope="row">
                        <b-button size="sm" class="mr-1 btn btn-success" @click="updateChild(row.item, row.index)">
                            <i class="fa fa-pencil"></i>
                        </b-button>
                        <b-button size="sm" class="mr-1 btn btn-danger" @click="removeChild(row.item)">
                            <i class="fa fa-trash"></i>
                        </b-button>
                    </template>
                </b-table>
            </b-card>
        </b-col>
    </b-row>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js';

    export default {
        props: {
            route: {
                type: [Array, Object],
                default: () => []
            },
        },
        data() {
            return {
                fields: [
                    {key: 'name', name: 'Meta Name'},
                    {key: 'value', name: 'Meta Value'},
                    {key: 'actions', name: 'Actions', class: 'text-center'}
                ],
                route_index: -1,
                route_meta: {
                    id: -1,
                    name: '',
                    value: '',
                    is_removed: 0
                },
                remaining_route_meta: []
            }
        },
        watch: {
            route: {
                handler(val) {
                    this.remaining_route_meta = val.route_metas.filter(x => x.is_removed == 0);
                },
                deep: true
            }
        },
        created() {
            this.initializeRoutes();
        },
        methods: {
            initializeRoutes() {
                this.remaining_route_meta = this.route.route_metas.filter(x => x.is_removed == 0);
            },
            save_route_meta() {
                this.$validator.validateAll('route_meta_form').then((result) => {
                    if (result) {
                        if (this.route_index == -1) {
                            this.route.route_metas.push(this.route_meta);
                        } else {
                            let selected_route = this.route.route_metas[this.route_index];
                            selected_route.name = this.route_meta.name;
                            selected_route.value = this.route_meta.value;
                        }
                        this.reset_route_meta();
                        this.swalTransactionCompleted();

                    }
                });
            },
            selectRouteMeta() {

            },
            reset_route_meta() {
                this.route_meta = {
                    id: -1,
                    name: '',
                    value: '',
                    is_removed: 0
                };
                this.$nextTick(() => {
                    this.errors.clear();
                    this.$nextTick(() => {
                        this.route_index = -1;
                        this.$validator.reset();
                    });
                });
            },
            updateChild(meta, index) {
                let selected_meta = JSON.parse(JSON.stringify(meta));
                this.route_index = index;
                this.route_meta = selected_meta;
            },
            removeChild(meta) {
                this.swalConfirmDelete((data) => {
                    if (data.value) {
                        meta.is_removed = 1;
                        this.swalTransactionCompleted();
                    }
                });
            }
        },
        mixins: [SwalMixin]
    }
</script>

<style scoped>

</style>