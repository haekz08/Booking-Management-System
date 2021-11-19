<template>
    <div>
        <b-card class="custom-card-for-table">
            <div slot="header">
                <b-row>
                    <b-col sm="5" class="d-flex align-items-center">
                        <div>
                            <i class='fa fa-database'></i><strong>&nbsp;{{totalRows}}&nbsp;</strong>
                            <small>Result/s found</small>
                            <template v-if="totalSelected!=0">
                                &nbsp;
                                |
                                &nbsp;
                                <i class='fa fa-check'></i><strong>&nbsp;{{totalSelected}}&nbsp;</strong>
                                <small>item/s selected</small>
                            </template>
                        </div>
                    </b-col>
                    <b-col sm="7" class="text-right">
                        <b-button @click="openModal" variant="dark" class="px-4" size="sm"  v-if="modalBtn!=''"><i class="fa fa-plus"></i>
                            {{modalBtn}}
                        </b-button>
                    </b-col>
                </b-row>
            </div>
            <b-row class="mb-3">
                <b-col sm="12">
                    <b-input-group>
                        <b-input-group-prepend>
                            <b-input-group-text class="bg-dark"><i class="fa fa-search"></i></b-input-group-text>
                        </b-input-group-prepend>
                        <b-form-input
                                type="text"
                                class="form-control"
                                placeholder="Search"
                                autocomplete="off"
                                size="sm"
                                v-model="searchTerm"
                        />
                        <b-input-group-append>
                            <b-button @click="clearSearch" variant="secondary" class="px-4" size="sm" :disabled="searchTerm==''">
                                <i class="fa fa-close"></i>
                            </b-button>
                            <!--<i class="fa fa-close"></i>-->
                        </b-input-group-append>
                    </b-input-group>
                </b-col>
            </b-row>
            <b-table
                    :dark="dark"
                    :hover="hover"
                    :striped="striped"
                    :bordered="bordered"
                    :small="small"
                    :fixed="fixed"
                    responsive="sm"
                    :items="tItems"
                    :fields="captions"
                    :busy="loading"
                    show-empty
                    :per-page="perPage"
                    :current-page="currentPage"
                    :filter="searchTerm"
                    @filtered="onFiltered"
                    selectable
                    selectedVariant="primary"
                    select-mode="single"
                    @row-dblclicked="rowDbClicked"
            >
                <div class="text-center text-danger my-2" slot="table-busy">
                    <b-spinner small class="align-middle"></b-spinner>
                    <br><br>
                    <strong>Loading...</strong>
                </div>
            </b-table>
            <nav>
                <b-pagination
                        :disabled="loading"
                        align="right"
                        :total-rows="totalRows"
                        :per-page="perPage"
                        v-model="currentPage"
                        prev-text="Prev"
                        next-text="Next"
                        hide-goto-end-buttons
                >
                </b-pagination>
            </nav>
        </b-card>
    </div>
</template>

<script>
    import {bus} from '@/main.js'

    export default {
        name: 'non-server-side-paginated-table',
        inheritAttrs: false,
        props: {
            hover: {
                type: Boolean,
                default: true
            },
            striped: {
                type: Boolean,
                default: true
            },
            bordered: {
                type: Boolean,
                default: true
            },
            small: {
                type: Boolean,
                default: true
            },
            fixed: {
                type: Boolean,
                default: true
            },
            fields: {
                type: [Array, Object],
                default: () => []
            },
            dark: {
                type: Boolean,
                default: false
            },
            tableData: {
                type: [Array, Function],
                default: () => []
            },
            modalBtn: {
                type: String,
                default: '',
                required: false
            },
            perPage: {
                type: Number,
                default: 5
            }
        },
        data: () => {
            return {
                selected: [],
                result:[],
                loading: false,
                searchTimeout: () => ({
                    type: Function,
                    default: () => ({})
                }),
                searchTerm: '',
                currentPage: 1,
                totalRows: 0,
            }
        },
        computed: {
            tItems: function () {
                return this.tableData;
            },
            captions: function () {
                return this.fields
            },
            totalSelected: function () {
                return parseInt(this.selected.length);
            }
        },
        mounted() {
            //this.getAll();
            this.totalRows=this.tableData.length;
        },
        methods: {
            clearSearch(){
                this.searchTerm=''
            },
            onFiltered(filteredItems) {
                // Trigger pagination to update the number of buttons/pages due to filtering
                this.totalRows = filteredItems.length
                this.currentPage = 1
            },
            rowDbClicked(item){
                bus.$emit('nonServerSidePaginatedTableDbClick',item);
            }
        }
    }
</script>
