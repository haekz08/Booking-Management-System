<template>
    <div class="animated fadeIn">
        <b-row>
            <b-col>
                <itineraries-table
                        :fields="table_settings.fields"
                        :api_url="table_settings.api_url"
                        :delete_url="table_settings.delete_url"
                        ref="displayTable"
                        top_right_btn="Create Itinerary"
                />
            </b-col>
        </b-row>
    </div>
</template>


<script>
    import {bus} from '@/main.js';
    import ItinerariesTable from '@/views/helpers/ItinerariesTable.vue';
    export default{
        components:{
          ItinerariesTable
        },
        data(){
            return {
                table_settings:{
                    api_url:'itinerary/get_all',
                    delete_url:'test',
                    fields:[
                        {key: 'guests_cabin', label:'Guests Cabin'},
                        {key: 'check_in.other_formats.format_1', label:'Departure Date'},
                        {key: 'itinerary', label:'Itinerary'},
                        {key: 'ambassador', label:'Ambassador'},
                        {key: 'available_slot', label:'Remaining Slot'},
                        {key: 'lock', label:'Visible'},
                    ]
                },
                itinerary_setup:{
                    step1:{},
                    step2:{},
                    step3:{},
                    step4:{}
                }
            }
        },
        methods:{
        },
        created(){
            bus.$on('serverSidePaginatedTableTopRightBtnClicked', ()=>{

            });
            bus.$on('serverSidePaginatedTableDbClick', (data)=>{
                this.itinerary_setup.step1 = {
                    id: data.id,
                    is_displayed: data.is_displayed,
                    itinerary_brand_id: data.itinerary_brand.id,
                    itinerary_country_id: data.itinerary_country.id,
                    check_in_date: data.check_in.default_date,
                    check_in_time_hh: data.check_in.hh,
                    check_in_time_mm: data.check_in.mm,
                    check_in_time_meridian: data.check_in.meridian,
                    check_out_date: data.check_out.default_date,
                    check_out_time_hh: data.check_out.hh,
                    check_out_time_mm: data.check_out.mm,
                    check_out_time_meridian: data.check_out.meridian,

                    //city from
                    city_from: data.itinerary_city_from, //full object
                    city_id_from: data.itinerary_city_from.id,
                    //port from
                    city_port_id_from: data.port_from.id,


                    //city to
                    city_to: data.itinerary_city_to,
                    city_id_to: data.itinerary_city_to.id,
                    city_port_id_to: data.port_to.id,

                    itinerary_media: data.itinerary_media
                };

                const crews = [];
                data.itinerary_crews.forEach((data) => {
                    crews.push({
                        crew_id: data.id,
                        crew_type_id: data.crew_type_id
                    });
                });

                this.itinerary_setup.step2 = {
                    ambassador_id: data.ambassador_id,
                    is_ambassador_required: data.itinerary_brand.is_ambassador_required,
                    is_locked_to_ambassador: data.is_locked_to_ambassador,
                    access_codes: data.ambassador_itinerary_codes,
                    itinerary_crews: crews
                };

                const cabins = [];

                data.itinerary_cabins.forEach((cabin) => {
                    cabins.push({
                        id: cabin.id,
                        boat_id: cabin.boat_id,
                        cabin_type: cabin.cabin_type,
                        cabin_type_id: cabin.cabin_type_id,
                        code: cabin.code,
                        occupancy: cabin.occupancy,
                        price_per_person: cabin.pivot.price_per_person,
                        cabin_price: cabin.pivot.cabin_price,
                        early_bird_price: cabin.pivot.early_bird_price,
                        cabin_early_bird_price: cabin.pivot.cabin_early_bird_price,
                        ambassador_allocation: cabin.pivot.ambassador_allocation,
                    })
                });

                this.itinerary_setup.step3 = {
                    boat_id: data.boat_id,
                    is_private_charter_active: data.is_private_charter_active,
                    is_early_bird_active: data.is_early_bird_active,
                    early_bird_cut_off_date: data.early_bird_cut_off_date,
                    private_charter_price: data.private_charter_price,
                    is_referral_active: data.is_referral_active,
                    referral_price: data.referral_price,
                    itinerary_cabins: cabins,
                    current_itinerary_cabin: cabins,
                    deposit_per_person: data.deposit_per_person,

                    is_shared_offered:data.is_shared_offered,
                    is_private_offered:data.is_private_offered,
                    is_double_offered:data.is_double_offered,

                    is_cabin_same_price: data.is_cabin_same_price,
                    price_per_person: data.price_per_person,
                    cabin_price: data.cabin_price,
                    early_bird_price: data.early_bird_price,
                    cabin_early_bird_price: data.cabin_early_bird_price,

                    disclaimer: data.disclaimer
                };

                this.itinerary_setup.step4 = {
                    itinerary_add_ons:[],
                    current_add_ons: data.add_ons,
                    itinerary_inclusions:[],
                    current_inclusions: data.inclusions,
                    itinerary_exclusions:[],
                    current_exclusions: data.exclusions
                };

                //console.log(data);
                this.$router.push({
                    name:'Create',
                    params: this.itinerary_setup
                });
            });
        }
    }
</script>

<style scoped>

</style>
