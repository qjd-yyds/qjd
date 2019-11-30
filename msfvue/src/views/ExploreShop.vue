<template>
  <div>
    <!-- 页头 -->
    <ul class="title">
      <li class="position">
        <span>{{this.$store.getters.getCity}}</span>
        <router-link to="./ChoCity">
          <img :src="iconImg2[0]">
        </router-link>  
      </li>
      <li class="near">
        附近美食
      </li>
      <li>
        <img class="search" :src="iconImg2[1]">
      </li>
    </ul>
    <!-- tab -->
    <ul class="tab-title" @click="change2">
      <li data-id="m0" :class="cur[0]?mat:maf">全部</li>
      <li data-id="m1" :class="cur[1]?mat:maf">火锅/自助</li>
      <li data-id="m2" :class="cur[2]?mat:maf">龙虾/烧烤</li>
      <li data-id="m3" :class="cur[3]?mat:maf">浪漫西餐</li>
      <li data-id="m4" :class="cur[4]?mat:maf">经典中餐</li>
      <!-- <li v-for="(item,i) of liname" :key="i" @click="change" :data-id="'tab'+i"></li> -->
    </ul>
    <mt-tab-container v-model="active" swipeable="">
      <mt-tab-container-item id="m0">
        <propage1></propage1>
      </mt-tab-container-item>
      <mt-tab-container-item id="m1">
        <propage2></propage2>
      </mt-tab-container-item>
      <mt-tab-container-item id="m2">
        <propage3></propage3>
      </mt-tab-container-item>
      <mt-tab-container-item id="m3">
        <propage4></propage4>
      </mt-tab-container-item>
      <mt-tab-container-item id="m4">
        <propage5></propage5>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
//  
  import ProPage1 from "../components/ProPages/ProPage1.vue"
  import ProPage2 from "../components/ProPages/ProPage2.vue"
  import ProPage3 from "../components/ProPages/ProPage3.vue"
  import ProPage4 from "../components/ProPages/ProPage4.vue"
  import ProPage5 from "../components/ProPages/ProPage5.vue"
export default {
  components:{
    "propage1":ProPage1,
    "propage2":ProPage2,
    "propage3":ProPage3,
    "propage4":ProPage4,
    "propage5":ProPage5,
  },
  data(){
    return {
      iconImg2:[
        require('../../public/img/down.png'),
        require('../../public/img/search2.png')
      ],
      active:'m0',
      swipeable:true,
      cur:[true,false,false,false,false],
      mat:{ma:true},
      maf:{ma:false}
    }
  },
  methods:{
    change2(e){
      if(e.target.nodeName=="LI"){
        this.active=e.target.dataset.id;
      }  
    }
  },
  watch:{
    active(){
      console.log(this.active);
      var index=this.active.slice(1);
      for(var i in this.cur){
        if(i==index){
          this.cur[i]=true;
        }else{
          this.cur[i]=false;
        }
      }
    }
  }
}
</script>
<style scoped>
    *{
      box-sizing: border-box;
    }
  /* title样式 */
    .title{
      list-style: none;
      padding:0;
      margin:0;
      display: flex;
      flex-wrap: nowrap;
      justify-content:space-between;
      position: relative;
      padding:1.1rem .6rem;
      background: #fde044;
    }
    .position{
      display: flex;
      font-size:.8rem;
    }
    .position img{
      width:.8rem;
      height:.8rem;
      margin-top:.2rem;
      margin-left:.2rem;
    }
    .search{
      display: block;
      width:1.2rem;
    }
    .near{
      display: inline-block;
      font-size:1rem;
      /* font-weight: bold; */
    }
  /* tab样式 */
  .tab-title{
      display:flex;
      padding:0;
      margin:0;
      list-style: none;
      font-size:.8rem;
      color:#aaa;
      background-color:#efefef;
      padding:.4rem;
      overflow-x:auto;
      white-space: nowrap;
      -webkit-overflow-scrolling : touch;
    }
    .tab-title::-webkit-scrollbar {  /*隐藏滚动条*/
      display: none; 
    }
    .tab-title li{
      padding:.3rem .6rem;
      margin:0 .2rem;
      border-radius:.8rem;
      background:#fff;
    }
    /* 点击li的样式 */
    .ma{
      background:#fde044 !important;
      color:#222;
    }
</style>