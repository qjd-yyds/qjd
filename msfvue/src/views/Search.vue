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
    <div class="hots">
      <p>热门搜索</p>
      <ul>
        <li v-for="(h,i) of hots" :key="i">{{h}}</li>
      </ul>
    </div> 
  </div>
</template>
<script>
// import SearchInput from '../components/SearchInput.vue'
export default {
  components:{
    // "searchinput":SearchInput
  },
  data(){
    return{
      kw:"",
      hots:["火锅","烤肉","值得一起去的小众餐厅","奶茶"],
      icon:[
        require('../../public/img/s-small.png'),
        require('../../public/img/delete.png'),
      ],
      value:this.kw,
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
      this.$router.push({
        path:'/searchnotes',
        name:'searchnotes',
        query:{key:this.value}
      });
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
  }
}
</script>
<style scoped>
 
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
    *{
      box-sizing: border-box;
    }
  /* 热门搜索样式 */
  .hots{padding:0 .6rem;}
  .hots>p{
    font-size:.9rem;
    color:#666;
    font-weight: 500;
  }
  .hots>ul{
    list-style: none;
    padding:0;
    display: flex;
    flex-wrap: wrap;
  }
  .hots>ul>li{
    color:#999;
    font-size:.8rem;
    padding:.4rem .8rem;
    /* border:.002rem solid #efefef; */
    border-radius:1rem;
    margin-right: .4rem;
    background: rgba(200,200,200,.2);
  }
</style>