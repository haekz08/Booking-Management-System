<template>
  <div class="animated fadeIn">
    <b-row>
      <b-col>
        <server-side-paginated-table
                :fields="table_settings.fields"
                :api_url="table_settings.api_url"
                :delete_url="table_settings.delete_url"
                ref="displayTable"
                top_right_btn="Add New Ambassador"
        />
      </b-col>
    </b-row>
    <form-modal
        :open_modal="form_modal"
        :form_data="form_data"
        modal_size="xl"
    />
  </div>
</template>
<script>
    import {bus} from '@/main.js';
    import ServerSidePaginatedTable from '@/views/helpers/ServerSidePaginatedTable.vue';
    import FormModal from '@/views/content/maintenance/boat_ambassadors/FormModal.vue';
    export default {
        components: {ServerSidePaginatedTable,FormModal},
        data: () => {
            return {
                searchTimeout: () => ({
                    type: Function,
                    default: () => ({})
                }),
                table_settings:{
                    api_url:'maintenance/ambassadors/get_all',
                    delete_url:'maintenance/ambassadors/delete',
                    fields:[
                        {key: 'full_name', label:'Name'},
                        {key: 'action', label:'Action',class:'action_col'},
                    ]
                },
                is_saving:false,
                form_modal:{
                    modal_status:false
                },
                form_data:{
                    id:-1,
                    guest_title_id:"",
                    instructor_profile:"",
                    first_name:"",
                    last_name:"",
                    middle_name:"",
                    phone_number:"",
                    email:"",
                    passport_number:"",
                    expiration_date:"",
                    nationality_id:"",
                    birth_date:{
                        default:'',
                        other_formats:{
                            format_2:0
                        }
                    },
                    pob_country:"",
                    pob_city:"",
                    current_residency:"",
                    ambassador_media:[]
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
                this.resetFormData();
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
                this.form_data = {
                    id:-1,
                    guest_title_id:"",
                    first_name:"",
                    last_name:"",
                    middle_name:"",
                    phone_number:"",
                    email:"",
                    passport_number:"",
                    expiration_date:"",
                    nationality_id:"",
                    birth_date:{
                        default:'',
                        other_formats:{
                            format_2:0
                        }
                    },
                    pob_country:"",
                    pob_city:"",
                    current_residency:"",
                    ambassador_media:[]
                };
            }
        }
    }
</script>
