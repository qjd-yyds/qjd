<template>
  <div>
    <div class="notes">
      <ul class="notes1">
        <li @click="toNoteDet" v-for="(f,i) of foods" :key="i" :data-nid="f.nid">
          <img v-lazy="f.npic" :data-nid="f.nid" >
          <p :data-nid="f.nid">{{f.ntitle}}</p>
          <div class="author" :data-nid="f.nid">
            <img :src="f.npic"  :data-nid="f.nid">
            <span :data-nid="f.nid">{{f.ncname}}</span>
            <span class="pri" id="heart"><img @click="like" id="heart" :src="icon[0]">{{f.heart}}</span>
          </div>
        </li>
      </ul>
      <ul class="notes2">
        <li v-for="(f,i) in reverseFood" :key="i">
          <img v-lazy="f.npic">
          <p>{{f.ntitle}}</p>
          <div class="author">
            <img :src="f.upic">
            <span>{{f.ncname}}</span>
            <span class="pri"><img id="heart" :src="icon[0]">{{f.heart}}</span>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
  import Purchase from '../../views/Purchase.vue'
import { setTimeout } from 'timers';
export default {
  props:["foods","foods2"],
  data(){
    return {
      icon:[
        require('../../../public/img/heartc.png'),
        require('../../../public/img/hearta.png')
      ],
      islike:false,
      isshow:true
    }
  },
  methods:{
    /*lazyload(){
      var imgs=document.getElementsByClassName("img")
      var availHeight=window.screen.availHeight;
      var scrollTop=document.body.scrollTop||document.documentElement.scrollTop||window.pageXOffset
      for(var i=0;i<imgs.length;i++){
        if(imgs[i].offsetTop-scrollTop<availHeight){
          var src=imgs[i].dataset.src;
          if(src){
            if(this.isshow){
            this.isshow=false;
            imgs[i].setAttribute("src",src)
            imgs[i].removeAttribute("data-src")
            setTimeout(function(){
              this.isshow=true
            },500)
            }
          }
        }
      }
    },*/
    toNoteDet(e){
      if(e.target.id!=="heart"){
        var nid=e.target.dataset.nid;
        this.$router.push(`/Purchase/${nid}`)
      }
        
    },
    like(){

    }
  },
  computed: {
    reverseFood(){
      return this.foods2.reverse();
    }
  },
  mounted(){
    window.addEventListener("scroll",this.lazyload,true)
  }
}
</script>
<style scoped>
  *{
    box-sizing: border-box;
  }
  .notes{
    display: flex;
    padding:0 .6rem;
    background:#fff;
    padding-top:.4rem;
  }
  .notes1,.notes2{
    list-style: none;
    /* padding:0 .2rem; */
    margin:0;
    width:50%;
    /* width:100%; */
    background: #efefef;
    /* display: flex;
    flex-wrap: wrap;
    justify-content: space-around; */
  }
  .notes1{padding:0 .3rem 0 0;}
  .notes2{padding:0 0 0 .3rem;}
  .notes li{
    width:100%;
    background: #fff;
    margin-bottom:.4rem;
    border-radius:.2rem;
    padding-bottom:1rem;
  }
  .notes li>img{
    width:100%;
    border-radius:.3rem .3rem 0 0;
  }
  .notes li>p{
    font-size: .8rem;
    margin:.4rem;
  }
  

  .author{
    display: flex;
    padding:.2rem .4rem;
    position: relative;
    font-size:.6rem;
    color:#888;
  }
  .author>img{
    width:1rem;
    height:1rem;
    border-radius:50%;
  }
  .pri>img{
    width:1.2rem;
    vertical-align: middle;
    margin-top:-.2rem;
  }
  .pri{
    position: absolute;
    right: .3rem;

  }
</style>