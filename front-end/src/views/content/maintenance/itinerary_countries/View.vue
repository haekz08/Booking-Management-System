<template>
  <div class="animated fadeIn">
    <b-row>
      <b-col>
        <server-side-paginated-table
                :fields="table_settings.fields"
                :api_url="table_settings.api_url"
                :delete_url="table_settings.delete_url"
                ref="displayTable"
                top_right_btn="Add New Itinerary Country"
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
    import FormModal from '@/views/content/maintenance/itinerary_countries/FormModal.vue';
    export default {
        components: {ServerSidePaginatedTable,FormModal},
        data: () => {
            return {
                searchTimeout: () => ({
                    type: Function,
                    default: () => ({})
                }),
                table_settings:{
                    api_url:'maintenance/itinerary_countries/get_all',
                    delete_url:'maintenance/itinerary_countries/delete',
                    fields:[
                        {key: 'name', label:'Name'},
                        {key: 'action', label:'Action',class:'action_col'},
                    ]
                },
                is_saving:false,
                form_modal:{
                    modal_status:false
                },
                form_data:{
                    id:-1,
                    slug:'',
                    name:'',
                    is_displayed:false,
                    itinerary_country_media: []
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
                this.form_data.slug='';
                this.form_data.name='';
                this.form_data.is_displayed=false;
                this.form_data.itinerary_country_media=[];
            }
        }
    }
</script>
