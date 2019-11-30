<template>
  <div>
    <!-- 轮播图 -->
    
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
  
  
</style>