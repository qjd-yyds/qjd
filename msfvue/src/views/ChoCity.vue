<template>
  <div>
    <div class="title">
      <router-link to="./Index">
        <img src="../../public/img/back.png">
      </router-link>
      城市选择
    </div>
    <div class="position">
      <img src="../../public/img/position.png">
      <span>{{this.$store.getters.getCity}}</span>
    </div>
    <div class="hotcity">
      <p>热门城市</p>
      <ul @click="changeCity">
        <li v-for="(s,i) of cImgs" :key="i"><img :src="s.src" :data-c="s.name" :data-v="s.val"></li>
      </ul>
    </div>
    <div class="allcities">
      <p>所有城市</p>
      <ul @click="changeCity">
        <li v-for="(c,i) of cities" :key="i" :data-c="c.city" :data-v="c.val">{{c.city}}</li>
      </ul>
    </div>
    <p class="more">觅食蜂正在为您开拓更多城市，敬请期待</p>
  </div>
</template>
<script>
export default {
  data(){
    return {
      cImgs:[
        {src:require('../../public/img/sh.jpg'),name:"上海",val:"sh"},
        {src:require('../../public/img/gz.jpg'),name:"广州",val:"gz"},
        {src:require('../../public/img/sz.jpg'),name:"深圳",val:"sz"},
        {src:require('../../public/img/nj.jpg'),name:"南京",val:"nj"}
      ],
      cities:[
        {city:"上海",val:"sh"},
        {city:"广州",val:"gz"},
        {city:"深圳",val:"sz"},
        {city:"南京",val:"nj"},
        {city:"北京",val:"bj"},
        {city:"杭州",val:"hz"},
        {city:"武汉",val:"wh"},
        {city:"天津",val:"tj"},
        {city:"成都",val:"cd"},
        {city:"重庆",val:"cq"}
      ]
    }
  },
  methods:{
    changeCity(e){
      if(e.target.nodeName=="LI"||e.target.nodeName=="IMG"){
        var city=e.target.dataset.c;
        var val=e.target.dataset.v;
        console.log(city);
        console.log(val);
        this.$store.commit("changeCity1",city);
        this.$store.commit("changeVal1",val);
        console.log(this.$store.getters.getVal);
      }
    }
  }
}
</script>
<style scoped>
  *{
    box-sizing: border-box;
  }
  .title{
    position: relative;
    text-align: center;
    font-size: 1rem;
    line-height: 1rem;
    font-weight: bold;
    padding: 1.2rem;
    padding-top:3rem;
  }
  .title img{
    position: absolute;
    width:1.2rem;
    left:.8rem;
    /*margin-top:0rem; */
  }
  .position{
    font-size:.8rem;
    line-height: .8rem;
    font-weight: 500;
    padding:.4rem;
    padding-top:1rem;
  }
  .position>img{
    width:1.4rem;
    vertical-align: middle;
    margin-right:.4rem;
    margin-top:-.1rem;
  }
  .hotcity>p,
  .allcities>p{
    background: #eee;
    padding:.4rem;
    padding-left:.6rem;
    color:#ccc;
    font-size:.8rem;
  }
  .hotcity>ul,
  .allcities>ul{
    padding:0;
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
  }
  .allcities>ul{
    justify-content: flex-start;
    padding-left: .5rem;
  }
  .hotcity>ul li{
    width:48%;
    margin-bottom:.2rem;
  }
  .hotcity>ul li>img{
    width:100%;
  }
  .allcities li{
    width:31%;
    height:1.8rem;
    /* border:0.0026rem solid red; */
    background-color:rgba(255,200,65,.6);
    border-radius:15px;
    margin-bottom:.4rem;
    margin-right:.44rem;
    text-align: center;
    line-height: 1.8rem;
    font-size:.8rem;
  }
  .more{
    text-align: center;
    color:#aaa;
    margin-top:1.4rem;
    font-size:.9rem;
  }
</style>