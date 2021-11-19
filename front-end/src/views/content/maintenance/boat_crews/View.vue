<template>
  <div class="animated fadeIn">
    <b-row>
      <b-col>
        <server-side-paginated-table
                :fields="table_settings.fields"
                :api_url="table_settings.api_url"
                :delete_url="table_settings.delete_url"
                ref="displayTable"
                top_right_btn="Add New Crew"
        />
      </b-col>
    </b-row>
    <form-modal
        :open_modal="form_modal"
        :form_data="form_data"
        modal_size="lg"
    />
  </div>
</template>
<script>
    import {bus} from '@/main.js';
    import ServerSidePaginatedTable from '@/views/helpers/ServerSidePaginatedTable.vue';
    import FormModal from '@/views/content/maintenance/boat_crews/FormModal.vue';
    export default {
        components: {ServerSidePaginatedTable,FormModal},
        data: () => {
            return {
                searchTimeout: () => ({
                    type: Function,
                    default: () => ({})
                }),
                table_settings:{
                    api_url:'maintenance/boat_crews/get_all',
                    delete_url:'maintenance/boat_crews/delete',
                    fields:[
                        {key: 'full_name', label:'Name'},
                        {key: 'crew_type_description', label:'Crew Type'},
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
                    first_name:"",
                    last_name:"",
                    middle_name:"",
                    phone_number:"",
                    email:"",
                    passport_number:"",
                    expiration_date:"",
                    nationality_id:"",
                    birth_date:{
                        default:"",
                        other_formats:{
                            format_2:0
                        }
                    },
                    pob_country:"",
                    pob_city:"",
                    current_residency:"",
                    crew_type_id:""
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
                    crew_type_id:''
                }
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
                this.form_data.first_name='';
                this.form_data.last_name='';
                this.form_data.middle_name='';
                this.form_data.crew_type_id='';
            }
        }
    }
</script>
