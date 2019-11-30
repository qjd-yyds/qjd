<template>
  <div>
    <div class="search">
      <img @click="toSearNotes" :src="icon[0]" class="ise">
      <input class="inputs" type="text" placeholder="搜索美食笔记" v-model="value">
      <img v-show="isshow" @click="del" :src="icon[1]" class="ide">
      <router-link to="./Index" style="text-decoration:none;color:#222;">
        <span>取消</span>
      </router-link>  
    </div>
    <notes :foods="foods" :foods2="foods2"></notes>
  </div>
</template>
<script>
// import SearchInput from '../components/SearchInput.vue'
import Notes from '../components/NotePages/Notes.vue'
export default {
  // props:["key"],
  components:{
    // "searchinput":SearchInput,
    "notes":Notes
  },
  data(){
    return {
      foods:[],
      foods2:[],
    
      icon:[
        require('../../public/img/s-small.png'),
        require('../../public/img/delete.png'),
      ],
      value:'',
      isshow:false
    }
  },
  methods:{
    del(){
      if(this.value){
        this.value="";
      }
    },
    toSearNotes(){
      var key=this.value;
      this.axios.get("notes/searchnotes",{
        params:{key,city:this.$store.getters.getVal}
      }).then(res=>{
        console.log(res.data.data);
        var list=res.data.data;
        for(var i in list){
          if(list[i].nid==null){
            list.splice(i);
          }
        }
        this.foods=list;
        this.foods2=list.concat();
      })
     }
  },
  watch:{
    value(){
      if(this.value.length>0){
        this.isshow=true;
      }else{
        this.isshow=false;
      }
    }
  },
  mounted(){
    var key=this.$route.query.key;
    this.value=key;
    this.axios.get("notes/searchnotes",{
      params:{key,city:this.$store.getters.getVal}
    }).then(res=>{
      console.log(res.data.data);
      var list=res.data.data;
      for(var i in list){
        if(list[i].nid==null){
          list.splice(i);
        }
      }
      this.foods=list;
      this.foods2=list.concat();
    })
  }
}

</script>
<style scoped>
   *{
      box-sizing: border-box;
    }
  /* 搜索框样式 */
    .search{
      padding:2.2rem .6rem;
      position: relative;
    }
    .search>input{
      outline: 0;
      border: 0;
      background: #efefef;
      padding:.5rem 1.6rem;
      width:85%;
      border-radius:1rem;
      font-size:.7rem;
    }
    .ise{
      width:1.6rem;
      position: absolute;
      top:2.4rem;
    }
    .ide{
      width:1.2rem;
      position: absolute;
      top:2.5rem;
      right:4.4rem;
      display: none;
    }
    /* 删除按钮的显示和隐藏 */
    .inputs::-ms-ide { display: none; }
    .inputs:valid+.ide { display: block; }
    .search span{
      font-size: 1rem;
      font-weight: 600;
      margin-left:.4rem;
    }
</style>