<template>
  <div class="animated fadeIn">
    <b-row>
      <b-col>
        <server-side-paginated-table
                :fields="table_settings.fields"
                :api_url="table_settings.api_url"
                :delete_url="table_settings.delete_url"
                ref="displayTable"
                top_right_btn="Add New Guest Title"
        />
      </b-col>
    </b-row>
    <form-modal
        :open_modal="form_modal"
        :form_data="form_data"
    />
  </div>
</template>
<script>
    import {bus} from '@/main.js';
    import ServerSidePaginatedTable from '@/views/helpers/ServerSidePaginatedTable.vue';
    import FormModal from '@/views/content/maintenance/guest_titles/FormModal.vue';
    export default {
        components: {ServerSidePaginatedTable,FormModal},
        data: () => {
            return {
                searchTimeout: () => ({
                    type: Function,
                    default: () => ({})
                }),
                table_settings:{
                    api_url:'maintenance/guest_titles/get_all',
                    delete_url:'maintenance/guest_titles/delete',
                    fields:[
                        {key: 'description', label:'Name'},
                        {key: 'action', label:'Action',class:'action_col'},
                    ]
                },
                is_saving:false,
                form_modal:{
                    modal_status:false
                },
                form_data:{
                    id:-1,
                    description:'',
                }
            }
        },
        created(){
            bus.$on('serverSidePaginatedTableTopRightBtnClicked', ()=>{
                this.resetFormData();
                this.form_modal.modal_status=true;
            });
            bus.$on('formModalClose', ()=>{
                this.form_modal.modal_status=false;
            });
            bus.$on('serverSidePaginatedTableDbClick', (data)=>{
                this.form_data=JSON.parse(JSON.stringify(data));
                this.form_modal.modal_status=true;
            });
            bus.$on('formModalTransactionCompleted', ()=>{
                this.$refs.displayTable.getAll();
            });
        },
        mounted(){
        },
        computed: {
        },
        methods:{
            resetFormData(){
                this.form_data.id=-1;
                this.form_data.description='';
            }
        }
    }
</script>
