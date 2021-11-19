<template>
  <div class="animated fadeIn">
    <b-row>
      <b-col>
            <media :current_images="media"/>
      </b-col>
    </b-row>
  </div>
</template>
<script>
    import {bus} from '@/main.js';
    import SwalMixin from '@/views/mixins/Swal.js'
    import Media from '@/views/helpers/Media.vue';
    export default {
        components: {Media},
        data: () => {
            return {
                searchTimeout: () => ({
                    type: Function,
                    default: () => ({})
                }),
                media:[]
            }
        },
        created(){
        },
        mounted(){
        },
        computed: {
        },
        methods:{
        }
    }
</script>
