<template>
    <div class="animated fadeIn">
        <b-row>
            <b-col>
                <server-side-paginated-table
                        :fields="table_settings.fields"
                        :api_url="table_settings.api_url"
                        :delete_url="table_settings.delete_url"
                        ref="displayTable"
                        top_right_btn="Add System Route"
                />
            </b-col>
        </b-row>
        <system-route-form
                v-if="open_modal.modal_status"
                :form_data="form_data"
                :open_modal="open_modal"
                modal_size="xl"
        >
        </system-route-form>
    </div>
</template>

<script>
    import {bus} from '@/main.js';
    import ServerSidePaginatedTable from '@/views/helpers/ServerSidePaginatedTable.vue';
    import SystemRouteForm from '@/views/content/system_routes/SystemRouteForm.vue';
    export default{
        components:{
            ServerSidePaginatedTable,
            SystemRouteForm
        },
        data(){
            return{
                table_settings:{
                    api_url:'maintenance/routes/get_all',
                    delete_url:'test',
                    fields:[
                        {key: 'path', label:'Path'},
                        {key: 'redirect', label:'Redirect'},
                        {key: 'name', label:'Name'},
                        {key: 'component', label:'Component'},
                    ]
                },
                open_modal:{
                    modal_status: false
                },
                form_data:{}
            }
        },
        watch:{
          open_modal:{
              handler(val){
                  if(!val.modal_status){
                    this.$refs.displayTable.getAll();
                  }
              },
              deep: true
          }
        },
        created(){
            bus.$on('serverSidePaginatedTableTopRightBtnClicked', ()=>{
                this.form_data = JSON.parse(JSON.stringify({}));
                this.open_modal.modal_status = true;
            });
            bus.$on('serverSidePaginatedTableDbClick', (data)=>{
                this.form_data = JSON.parse(JSON.stringify(data));
                this.open_modal.modal_status = true;
                console.log(this.form_data);
            });
        }
    }
</script>