<template>
  <div class="container">
    <!-- 页头 -->
    <ul class="title">
      <li class="position">
        <span>{{this.$store.getters.getCity}}</span>
        <router-link to="./ChoCity">
          <img :src="iconImg[0]">
        </router-link>  
      </li>
      <li class="mname">
        觅食蜂
      </li>
      <li>
        <router-link to="./Search">
          <img class="search" :src="iconImg[1]">
        </router-link>  
      </li>
    </ul>
    <!-- tab -->
    <ul class="tab-title" @click="change">
      <li :class="current[0]?liat:liaf" data-id="tab0">推荐</li>
      <li :class="current[1]?liat:liaf" data-id="tab1">贴秋膘</li>
      <li :class="current[2]?liat:liaf" data-id="tab2">值得一去的小众餐厅</li>
      <li :class="current[3]?liat:liaf" data-id="tab3">人均100以下</li>
      <li :class="current[4]?liat:liaf" data-id="tab4">人均100-200</li>
      <!-- <li v-for="(item,i) of liname" :key="i" @click="change" :data-id="'tab'+i"></li> -->
    </ul>
    <mt-tab-container v-model="active" swipeable="">
      <mt-tab-container-item id="tab0">
        <notepage1></notepage1>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab1">
        <notepage2></notepage2>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab2">
        <notepage3></notepage3>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab3">
        <notepage4></notepage4>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab4">
        <notepage5></notepage5>
      </mt-tab-container-item>
    </mt-tab-container>

  </div>
</template>
<script>
// 
  import NotePage1 from "../components/NotePages/NotePage1.vue"
  import NotePage2 from "../components/NotePages/NotePage2.vue"
  import NotePage3 from "../components/NotePages/NotePage3.vue"
  import NotePage4 from "../components/NotePages/NotePage4.vue"
  import NotePage5 from "../components/NotePages/NotePage5.vue"
export default {
  components:{
    "notepage1":NotePage1,
    "notepage2":NotePage2,
    "notepage3":NotePage3,
    "notepage4":NotePage4,
    "notepage5":NotePage5
  },
  data(){
    return {
      iconImg:[
        require('../../public/img/down.png'),
        require('../../public/img/search2.png')
      ],
      // liname:["推荐","贴秋膘","人均50以下","人均50-100","人均100-200","秋冬饮食"],
      active:'tab0',
      swipeable:true,
      current:[true,false,false,false,false],
      liat:{lia:true},
      liaf:{lia:false},
    }
  },
  methods:{
    change(e){
      if(e.target.nodeName=="LI"){
        this.active=e.target.dataset.id;
      }
    }
  },
  watch:{
    active(){
      console.log(this.active);
      var index=this.active.slice(3);
      for(var i in this.current){
        if(i==index){
          this.current[i]=true;
        }else{
          this.current[i]=false;
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
.container{
  padding-bottom:1.5rem;
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
    .mname{
      display: inline-block;
      font-size:1rem;
      font-weight: bold;
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
    .lia{
      background:#fde044 !important;
      color:#222;
    }
</style>