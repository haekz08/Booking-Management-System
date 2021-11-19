<template>
    <div class="animated fadeIn">
        <b-row>
            <b-col>
                <server-side-paginated-table
                        :fields="table_settings.fields"
                        :api_url="table_settings.api_url"
                        :delete_url="table_settings.delete_url"
                        ref="displayTable"
                        top_right_btn="Add City & Ports"
                />
            </b-col>
        </b-row>
        <form-modal
                v-if="form_modal.modal_status"
                :open_modal="form_modal"
                :form_data="form_data"
                modal_size="xl"
        >
        </form-modal>
    </div>
</template>

<script>
    import {bus} from '@/main.js';
    import ServerSidePaginatedTable from '@/views/helpers/ServerSidePaginatedTable.vue';
    import FormModal from './FormModal';
    export default {
        name: "city_ports",
        components:{
            ServerSidePaginatedTable,
            FormModal
        },
        data(){
            return{
                table_settings:{
                    api_url:'maintenance/itinerary_city/get_all',
                    delete_url:'maintenance/itinerary_city/delete',
                    fields:[
                        {key: 'name', label:'Name'},
                        {key: 'ports.length', label:'Number of Ports'},
                        {key: 'action', label:'Action', class:'action_col'}
                    ]
                },
                form_modal:{
                    modal_status:false
                },
                form_data:{
                    id:-1,
                    name:'',
                    ports: []
                }
            }
        },
        watch:{
            form_modal:{
                handler(val){
                    if(!val.modal_status)
                        this.$refs.displayTable.getAll();
                },
                deep:true
            }
        },
        created(){
            bus.$on('serverSidePaginatedTableTopRightBtnClicked', ()=>{
                this.form_data=JSON.parse(JSON.stringify({ id:-1, name:'',ports: [] }));
                this.form_modal.modal_status=true;
            });
            bus.$on('serverSidePaginatedTableDbClick', (data)=>{
                this.form_data=JSON.parse(JSON.stringify(data));
                this.form_modal.modal_status=true;
            });
        }
    }
</script>

<style scoped>

</style>