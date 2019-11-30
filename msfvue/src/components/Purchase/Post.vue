<template>
  <div id="top">
    <div class="tx" @click="toAuthor">
        <a href="">
            <img class="img1" :src="upic" alt="">
        </a>
        <div class="txt">
            <span class="name">{{ncname}}</span><img :src="Post.src2" alt=""><br>
            <span class="fabu">{{count}}篇觅食笔记,{{fans}}位粉丝</span>
            <mt-button class="gz">+关注</mt-button>
        </div>
    </div>
  </div>
</template>

<script>
import userNote from "../../views/UserNote.vue"
export default {
    props:["author","upic","ncname","count","fans"],
    data(){
      return{
        Post:{
          src1:require('../../assets/post_img/tx.jpg'),
          src2:require('../../assets/post_img/vip.png'),
        //   uname:"柠檬西米露",num:"22",fs:"22"
            }
        }
    },
    methods:{
        toAuthor(e){
            if(e.target.nodeName!=="BUTTON"){
                this.$router.push('/userNote');
            }
        }
    },
    beforeDestroy() {
       console.log(this.author); 
    }
};
</script>

<style scoped>
#top {
  width: 100%;
  height: 5rem;
}
#top .img1{
    width:2.5rem;
    height:2.5rem;
    border-radius: 50%;
    float: left;
    position: relative;
    top:1.25rem;left:1rem
}
#top .tx .txt{
    float: left;
    position: relative;
    top :1.20rem;left: 1.5rem;
}
#top .tx .txt .name{
    font-size:16px;
}
#top .tx .txt .fabu{
    font-size: 12px;
}
#top .tx .txt .gz{
    background-color:#fde142;
    border-radius:3.2rem; 
    height:2.4rem;
    width:6rem;
    float:right;
    position: relative;
    left:5rem;bottom: 1rem;
    
}
</style>
