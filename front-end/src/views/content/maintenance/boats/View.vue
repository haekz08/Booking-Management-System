<template>
    <div class="animated fadeIn">
        <b-row>
            <b-col>
                <server-side-paginated-table
                        :fields="table_settings.fields"
                        :api_url="table_settings.api_url"
                        :delete_url="table_settings.delete_url"
                        ref="displayTable"
                        top_right_btn="Add New Boat"
                />
            </b-col>
        </b-row>
        <form-modal
                v-if="form_modal.modal_status"
                :open_modal="form_modal"
                :form_data="form_data"
                modal_size="xl"
        ></form-modal>
    </div>
</template>

<script>
    import {bus} from '@/main.js';
    import ServerSidePaginatedTable from '@/views/helpers/ServerSidePaginatedTable.vue';
    import FormModal from '@/views/content/maintenance/boats/FormModal.vue';
    export default {
        components:{
            ServerSidePaginatedTable,
            FormModal
        },
        data(){
            return {
                table_settings:{
                    fields:[
                        {key: 'name', label:'Boat Name'},
                        {key: 'boat_type.name', label:'Type'},
                        {key: 'boat_brand.name', label:'Brand'},
                        {key: 'boat_model.name', label:'Model'},
                        {key: 'total_occupancy', label:'Total Occupancy'},
                        {key: 'action', label:'Action', class:'action_col'}
                    ],
                    api_url: 'maintenance/boats/get_all',
                    delete_url: 'maintenance/boats/delete'
                },
                is_saving:false,
                form_modal:{
                    modal_status:false
                },
                form_data:{
                    id:-1,
                    name:'',
                }
            }
        },
        watch:{
            form_modal:{
                handler(val){
                    if(!val.modal_status){
                        this.$refs.displayTable.getAll();
                    }
                },
                deep:true
            }
        },
        created(){
            bus.$on('serverSidePaginatedTableTopRightBtnClicked', ()=>{
                this.form_data=JSON.parse(JSON.stringify({ id:-1, name:'' }));
                this.form_modal.modal_status=true;
            });
            bus.$on('serverSidePaginatedTableDbClick', (data)=>{
                this.form_data=JSON.parse(JSON.stringify(data));
                this.form_modal.modal_status=true;
            });
            bus.$on('mediaComponentSaveChangesClicked', (images)=>{
            });
        }
    }
</script>

<style scoped>

</style>