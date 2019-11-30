<template>
  <div>
    <!-- 轮播图 -->
    <mt-swipe class="container" 
    style="width:95%;height:7.5rem;margin:.2rem auto;" 
    :auto="3000" @change="handleChange">
      <mt-swipe-item>
        <img :src="carousel[0]">
      </mt-swipe-item>
      <mt-swipe-item>
        <img :src="carousel[1]">
      </mt-swipe-item>
      <mt-swipe-item>
        <img :src="carousel[2]">
      </mt-swipe-item>
      <mt-swipe-item>
        <img :src="carousel[3]">
      </mt-swipe-item>
      <mt-swipe-item>
        <img :src="carousel[4]">
      </mt-swipe-item>
    </mt-swipe>
    <!-- 笔记 -->
    <notes :foods="foods" :foods2="foods2"></notes>
  </div>
</template>
<script>
import Notes from './Notes.vue'
export default {
  components:{
    "notes":Notes
  },
  data(){
    return {
      carousel:[
        require('../../../public/img/car1.jpg'),
        require('../../../public/img/car2.jpg'),
        require('../../../public/img/car3.jpg'),
        require('../../../public/img/car4.jpg'),
        require('../../../public/img/car5.jpg')
      ],
      
      foods:[],
      foods2:[]
    }
  },
  methods:{
    handleChange(index){},
    loadNotes(){
      this.axios.get("notes/getnotes",{
        params:{city:this.$store.getters.getVal}
      }).then(result=>{
        var list=result.data.data;
        // console.log(list);
        for(var i in list){
          if(list[i].nid==null){
            list.splice(i);
          }
        }
        this.foods=list;
        this.foods2=list.concat();
        // console.log(this.foods);
        // console.log(list);
      }).catch(err=>{
        console.log(err);
      })
    }
  },
  created(){
    this.loadNotes();
  }
}
</script>
<style scoped>
    *{
      box-sizing: border-box;
    }
  .container img{
    width:100%;
  }
  
</style>