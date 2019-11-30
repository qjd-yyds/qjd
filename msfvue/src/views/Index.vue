<template>
  <div>
    <!-- 页面选择 4个-->
    <noteindex :class="(current[0].selected)?isshowt:isshowf"></noteindex>
    <exploreshop :class="(current[1].selected)?isshowt:isshowf"></exploreshop>
    <msg :class="(current[2].selected)?isshowt:isshowf"></msg>
    <mine :class="(current[3].selected)?isshowt:isshowf"></mine>
    <!-- 底部tabbar -->
    <ul class="tabber">
      <li @click="changeState(0)" :class="(current[0].selected)?pcolora:pcolorc">
        <img :src="(current[0].selected)?icons[0].act:icons[0].com">
        <p>觅食记</p>
      </li>
      <li @click="changeState(1)" :class="(current[1].selected)?pcolora:pcolorc">
        <img :src="(current[1].selected)?icons[1].act:icons[1].com">
        <p>探店</p>
      </li>
      <li @click="changeState(2)" :class="(current[2].selected)?pcolora:pcolorc">
        <img :src="(current[2].selected)?icons[2].act:icons[2].com">
        <p>消息</p>
      </li>
      <li @click="changeState(3)" :class="(current[3].selected)?pcolora:pcolorc">
        <img :src="(current[3].selected)?icons[3].act:icons[3].com">
        <p>我的</p>
      </li>
    </ul>
    <div @click="toPublish" class="publish">
      <img :src="icons[4]">
    </div>
  </div>
</template>
<script>
//1.
import NoteIndex from "./NoteIndex.vue"
//2.
import ExploreShop from "./ExploreShop.vue"
//3.
import Msg from "./Msg.vue"
//4.
import Mine from "./Mine.vue"
import Publish from "./Publish.vue"
export default {
  components:{
    "noteindex":NoteIndex,
    "exploreshop":ExploreShop,
    "msg":Msg,
    "mine":Mine
  },
  data(){
    return {
      icons:[
        {com:require('../../public/img/main.png'),act:require('../../public/img/main-a.png')},
        {com:require('../../public/img/search.png'),act:require('../../public/img/search-a.png')},
        {com:require('../../public/img/msg.png'),act:require('../../public/img/msg-a.png')},
        {com:require('../../public/img/my.png'),act:require('../../public/img/my-a.png')},
        require('../../public/img/publish.png')
      ],
      current:[
        {selected:true},
        {selected:false},
        {selected:false},
        {selected:false}
      ],
      pcolorc:{
        pc:true,
        pa:false
      },
      pcolora:{
        pc:false,
        pa:true
      },
      isshowt:{
        show:true,
        hidden:false 
      },
      isshowf:{
        show:false,
        hidden:true
      }
    }
  },
  methods:{
    changeState(index){
      // console.log(index,this.current[index].selected);
      for(var i=0;i<this.current.length;i++){
        if(i==index){
          this.current[i].selected=true;
        }else{
          this.current[i].selected=false;
        }
      }
    },
    toPublish(){
      this.$router.push('/Publish');
    }
  }
}
</script>
<style scoped>
    *{
      box-sizing: border-box;
    }
  .tabber{
    padding:0;
    margin: 0;
    list-style: none;
    display: flex;
    /* justify-content: space-around; */
    position: fixed;
    bottom:0;
    padding:.4rem .8rem .2rem;
    height: 3.3rem;
    background: #e9e9e9;
    width: 100%;
    z-index:998;
  }
  .tabber p{
    margin: 0;
    text-align: center;
    font-size: .7rem;
  }
  .pc{color:#888;}
  .pa{color:#000;}
  .tabber li{
    text-align: center;
  }
  .tabber>li:first-child{margin-right:3.2rem;}
  .tabber>li:nth-child(2){margin-right:7.6rem;}
  .tabber>li:nth-child(3){margin-right:3rem;}
  /* .tabber>li:first-child{margin-left:.1rem;};
  .tabber>li:nth-child(2){margin-left:0.5rem;margin-right:.5rem;} */
  .tabber img{
    width: 1.6rem;
    display: block;
    margin:0 auto;
  }
  .publish{
    position: fixed;
    bottom: 0.5rem;
    width:3.6rem;
    height:3.6rem;
    line-height: 3.2rem;
    z-index:999;
    left:50%;
    margin-left:-1.6rem;
    background:#fff;
    text-align: center;
    border-radius:50%;
    box-shadow: 0 -.025rem .025rem .025rem #ddd;

  }
  .publish>img{
    width:3.5rem;
    display: inline-block;
    margin-top:0rem;
  }

  /* 选择页面显示或隐藏 */
  .show{display: block}
  .hidden{display: none;}
  
</style>