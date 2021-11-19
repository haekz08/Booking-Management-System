<template>
    <b-modal header-text-variant="light" header-bg-variant="dark" footer-bg-variant="dark" centered
             v-model="open_modal.modal_status" :size="modal_size" body-class="p-0" no-close-on-backdrop no-close-on-esc>
        <template slot="modal-title">
            <div>
                <h5 class="parent_sign text-uppercase" @click="goToParent"><i :class="modal_sign"></i> {{ modal_parent
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
            <b-tabs v-model="system_route_tab" content-class="mt-3">
                <b-tab active>
                    <template slot="title">
                        <i class="fa fa-fw fa-map-signs"></i> System Route
                    </template>
                    <b-row>
                        <b-col md="3">
                            <b-card no-body>
                                <div slot="header">
                                    <strong>Fill in the form </strong>
                                    <span v-if="route.id != -1" class="card-title text-uppercase"><strong>( {{ modal_current }} )</strong></span>
                                </div>
                                <div class="p-2">
                                    <b-form id="system_route_form" @submit.prevent="save"
                                            data-vv-scope="system_route_form">
                                        <b-form-group
                                                :description="errors.has('system_route_form.path') ? '' : '*This field is required.'"
                                                :invalid-feedback="!errors.has('system_route_form.path') ? '' : '*'+errors.first('system_route_form.path')"
                                                :state="false"
                                                label="Path *">
                                            <b-form-input
                                                    v-model="route.path"
                                                    v-validate="'required'"
                                                    id="path"
                                                    name="path"
                                                    trim
                                                    v-bind:class="{ 'is-invalid': errors.has('system_route_form.path') }">
                                            </b-form-input>
                                        </b-form-group>
                                        <b-form-group
                                                label="Redirect">
                                            <b-form-input v-model="route.redirect" trim></b-form-input>
                                        </b-form-group>
                                        <b-form-group
                                                :description="errors.has('system_route_form.name') ? '' : '*This field is required.'"
                                                :invalid-feedback="!errors.has('system_route_form.name') ? '' : '*'+errors.first('system_route_form.name')"
                                                :state="false"
                                                label="Name *">
                                            <b-form-input
                                                    v-model="route.name"
                                                    v-validate="'required'"
                                                    id="name"
                                                    name="name"
                                                    trim
                                                    v-bind:class="{ 'is-invalid': errors.has('system_route_form.name') }">
                                            </b-form-input>
                                        </b-form-group>
                                        <b-form-group
                                                :description="errors.has('system_route_form.component') ? '' : '*This field is required.'"
                                                :invalid-feedback="!errors.has('system_route_form.component') ? '' : '*'+errors.first('system_route_form.component')"
                                                :state="false"
                                                label="Component *">
                                            <b-form-input
                                                    v-model="route.component"
                                                    v-validate="'required'"
                                                    id="component"
                                                    name="component"
                                                    trim
                                                    v-bind:class="{ 'is-invalid': errors.has('system_route_form.component') }"></b-form-input>
                                        </b-form-group>
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
                                                <i class='fa fa-database'></i><strong> Children</strong>
                                            </div>
                                        </b-col>
                                        <b-col sm="7" class="text-right">
                                            <b-button class="btn btn-success" @click="openChildModal">
                                                <i class="fa fa-plus"></i> Child Route
                                            </b-button>
                                        </b-col>
                                    </b-row>
                                </div>
                                <b-modal
                                        header-text-variant="light"
                                        header-bg-variant="dark" footer-bg-variant="dark"
                                        centered
                                        v-model="child_dialog"
                                        @close="clearInputs"
                                        size="md"
                                        body-class="p-0"
                                        no-close-on-backdrop no-close-on-esc>
                                    <template slot="modal-title">
                                        <div>
                                            <h5 class="text-uppercase"><i class="fa fa-plus"></i> Child
                                                Route<span></span></h5>
                                        </div>
                                    </template>
                                    <div class="custom-modal-body">
                                        <b-form id="child_route_form"
                                                @submit.prevent="saveChild"
                                                data-vv-scope="child_route_form">
                                            <b-form-group
                                                    :description="errors.has('child_route_form.path') ? '' : '*This field is required.'"
                                                    :invalid-feedback="!errors.has('child_route_form.path') ? '' : '*'+errors.first('child_route_form.path')"
                                                    :state="false"
                                                    label="Path *">
                                                <b-form-input
                                                        v-model="childRoute.path"
                                                        v-validate="'required'"
                                                        id="path"
                                                        name="path"
                                                        trim
                                                        v-bind:class="{ 'is-invalid': errors.has('child_route_form.path') }"></b-form-input>
                                            </b-form-group>
                                            <b-form-group
                                                    label="Redirect">
                                                <b-form-input v-model="childRoute.redirect" trim></b-form-input>
                                            </b-form-group>
                                            <b-form-group
                                                    :description="errors.has('child_route_form.name') ? '' : '*This field is required.'"
                                                    :invalid-feedback="!errors.has('child_route_form.name') ? '' : '*'+errors.first('child_route_form.name')"
                                                    :state="false"
                                                    label="Name *">
                                                <b-form-input
                                                        v-model="childRoute.name"
                                                        v-validate="'required'"
                                                        id="name"
                                                        name="name"
                                                        trim
                                                        v-bind:class="{ 'is-invalid': errors.has('child_route_form.name') }"></b-form-input>
                                            </b-form-group>
                                            <b-form-group
                                                    :description="errors.has('child_route_form.component') ? '' : '*This field is required.'"
                                                    :invalid-feedback="!errors.has('child_route_form.component') ? '' : '*'+errors.first('child_route_form.component')"
                                                    :state="false"
                                                    label="Component *">
                                                <b-form-input
                                                        v-model="childRoute.component"
                                                        v-validate="'required'"
                                                        id="component"
                                                        name="component"
                                                        trim
                                                        v-bind:class="{ 'is-invalid': errors.has('child_route_form.component') }"></b-form-input>
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
                                                form="child_route_form"
                                                variant="success"
                                                class="float-right"
                                                size="sm"
                                                v-else
                                        >
                                            <i class="fa fa-save"></i> Save
                                        </b-button>
                                    </div>
                                </b-modal>
                                <b-table @row-dblclicked="selectChildRoute" striped small hover show-empty bordered
                                         :fields="fields"
                                         :items="route.children.filter(x => x.is_removed == 0)">
                                    <template slot="actions" slot-scope="row">
                                        <b-button size="sm" class="mr-1 btn btn-success" @click="updateChild(row.item)">
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
                </b-tab>
                <b-tab>
                    <template slot="title">
                        <i class="fa fa-fw fa-cubes"></i> Route Meta
                    </template>
                    <route-meta-form :route="route"></route-meta-form>
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
            <b-button
                    form="system_route_form"
                    type="submit"
                    variant="success"
                    class="float-right"
                    size="sm"
                    v-else
            >
                <i class="fa fa-save"></i> Save
            </b-button>
        </div>
    </b-modal>
</template>

<script>
    import SwalMixin from '@/views/mixins/Swal.js';
    import RouteMetaForm from './RouteMetaForm';

    export default {
        components: {
            RouteMetaForm
        },
        name: "SystemRouteForm",
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
                system_route_tab: 0,
                child_dialog: false,
                modal_sign: '',
                modal_parent: '',
                modal_current: '',
                is_saving: false,
                fields: [
                    {key: 'name', name: 'Name'},
                    {key: 'path', name: 'Path'},
                    {key: 'actions', name: 'Actions', class: 'text-center'},
                ],
                route: {
                    id: -1,
                    parent_id: -1,
                    path: '',
                    redirect: '',
                    name: '',
                    component: '',
                    is_removed: 0,
                    children: [],
                    route_metas: []
                },
                childRoute: {
                    id: -1,
                    parent_id: -1,
                    path: '',
                    redirect: '',
                    name: '',
                    component: '',
                    is_removed: 0,
                }
            }
        },
        created() {
            this.modal_sign = 'fa fa-fw fa-map-signs';
            this.modal_parent = this.form_data.parent == null ? 'Main' : this.form_data.parent.name;
            if (Object.entries(this.form_data).length > 0) {
                this.modal_current = this.form_data.name;
                this.route.parent_id = this.form_data.id;
                this.route = this.form_data;
            }

        },
        methods: {
            goToParent() {
                if (this.route.parent_id == -1)
                    return;
                this.getRoute(this.route.parent_id);
            },
            selectChildRoute(route) {
                this.getRoute(route.id);
            },
            getRoute(id) {
                this.is_saving = true;
                this.axios.get('maintenance/routes/get_route?id=' + id).then(
                    response => {
                        this.route = response.data;
                        this.modal_current = this.route.name;
                        this.modal_parent = this.route.parent == null ? 'Main' : this.route.parent.name;
                        this.is_saving = false;
                    }
                );
            },
            save() {
                this.$validator.validateAll('system_route_form').then((result) => {
                    if (result) {
                        this.swalConfirmSubmit((data) => {
                            if (data.value) {
                                this.is_saving = true;
                                this.axios.post('maintenance/routes/save_route', this.route).then(
                                    response => {
                                        this.is_saving = false;
                                        this.route = response.data;
                                        this.modal_current = this.route.name;
                                        this.swalTransactionCompleted();
                                    }
                                );
                            }
                        });

                    } else {
                        this.system_route_tab = 0;
                    }
                });
            },
            openChildModal() {
                this.child_dialog = true;
            },
            removeChild(item) {
                this.swalConfirmDelete((data) => {
                    if (data.value) {
                        item.is_removed = 1;
                        this.swalTransactionCompleted();
                    }
                });
            },
            updateChild(item) {
                this.childRoute = JSON.parse(JSON.stringify(item));
                this.child_dialog = true;
            },
            saveChild() {
                this.$validator.validateAll('child_route_form').then((result) => {
                    if(result){
                        if (this.childRoute.id != -1) {
                            let update = this.route.children.find(x => x.id == this.childRoute.id);
                            update.redirect = this.childRoute.redirect;
                            update.component = this.childRoute.component;
                            update.name = this.childRoute.name;
                            update.path = this.childRoute.path;
                        } else {
                            this.childRoute.parent_id = this.route.id;
                            this.route.children.push(this.childRoute);
                        }

                        this.child_dialog = false;
                        this.clearInputs();
                    }
                });
            },
            clearInputs() {
                this.childRoute = {
                    id: -1,
                    parent_id: -1,
                    path: '',
                    redirect: '',
                    name: '',
                    component: '',
                    is_removed: 0,
                }
            }
        },
        mixins: [SwalMixin]
    }
</script>

<style scoped>
    .parent_sign {
        cursor: pointer;
    }

    .card-body {
        overflow: auto;
        height: 380px;
    }
</style>