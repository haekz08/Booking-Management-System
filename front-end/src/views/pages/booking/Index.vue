<template>
  <div class="app flex-row">
    <div class="container mt-5">
        <b-row class="justify-content-center">
            <b-col lg="4" md="6" sm="12" v-for="country in country_list">
                <b-carousel
                    id="carousel-1"
                    :interval="4000"
                    controls
                    indicators
                    background="#ababab"
                    img-width="1024"
                    img-height="480"
                    >
                    <!-- Text slides with image -->
                    <template v-if="country.itinerary_country_media.length>0">
                    <b-carousel-slide  v-for="(media, index) in country.itinerary_country_media">
                        <template v-slot:img>
                            <img
                                class="country-image-slider"
                                :src="assets_path.MEDIA_UPLOADS + media.new_file_name"
                            >
                        </template>
                    </b-carousel-slide>
                    </template>
                    <b-carousel-slide v-else>
                        <template v-slot:img>
                            <img
                                class="country-image-slider"
                                :src="assets_path.MEDSAILING_ASSETS + 'image-not-found.jpg'"
                            >
                        </template>
                    </b-carousel-slide>
                </b-carousel>
                <div class="card rounded-0">
                    <div class="card-block p-2 clearfix">
                        <i class="fa fa-ship bg-primary p-2 font-2xl mr-2 float-left"></i>
                        <div class="h5 text-primary mb-0 mt-h">{{country.name}}</div>
                        <div class="text-muted text-uppercase font-weight-bold font-xs">COUNTRY</div>
                    </div>
                    <div class="card-footer p-x-1 py-h" v-for="brand in brand_list">
                        <a class="font-weight-bold font-xs btn-block text-muted" href="#" @click.prevent="goToItinerary(country.slug,brand.slug)">{{brand.description}} Itineraries<i class="fa fa-angle-right float-right font-lg"></i></a>
                    </div>
                </div>
            </b-col>
        </b-row>
    </div>

  </div>
</template>

<script>
import {assets_path} from '@/config';
export default {
  name: 'BookingIndex',
  data(){
      return{
          loading:false,
          brand_list:[],
          country_list:[]
      }
  },
  created() {
      this.assets_path = assets_path;
      this.getAllBrands();
  },
  methods:{
      getAllBrands(){
        this.loading = true;
        this.axios.get('booking/itinerary_countries').then(response => {
            // this.list = (response.data.data) ? response.data.data : response.data;
            let result=response.data;
            this.country_list=result.itinerary_countries;
            this.brand_list=result.itinerary_brands;

        }).catch(error => console.log(error));
      },
      goToItinerary(country_slug,brand_slug){
          this.$router.push('/booking/'+country_slug+'/'+brand_slug);
      }
  }
}
</script>
