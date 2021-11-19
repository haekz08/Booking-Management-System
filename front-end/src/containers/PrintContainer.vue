<template>
  <div class="app p-4 bg-white">
    <b-row align-v="center" class="check-out-loader" v-if="loading">
      <b-col>
          <b-spinner></b-spinner>
          <br><br>
          <strong>Loading</strong>
      </b-col>
    </b-row>
    <router-view @print="triggerPrint"></router-view>
  </div>
</template>

<script>

export default {
  name: 'PrintContainer',
  data () {
    return {
      loading:true
    }
  },
  created(){
    
  },
  methods:{
    triggerPrint(){
      this.$nextTick(()=>{
          this.loading=false;
          this.$nextTick(()=>{
              //window.print();
          });
      });
      //  setTimeout(()=>{
      //       this.loading=false;
      //       window.print();
      //   },2000);
    }
  }
}
</script>
<style scoped>
</style>

