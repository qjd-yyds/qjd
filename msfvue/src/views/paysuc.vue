<template>
  <div class="paysuc">
    <div class="backcolor3">
      <img :src="back" >
      <span>支付成功</span>
    </div>
    <div class="success">
      <img :src="succ" alt="">
    </div>
    <p class="font1">订单支付成功!</p>
    <p class="font2">本次下单为您节省 <span>￥26.65元</span>~</p>
    <div>
      <button class="button1">查看订单</button>
      <button @click="toExplore" class="button2">继续探店</button>
    </div>
  </div>
</template>
<script>
  import index from "./Index.vue"
export default {
  data(){
    return{
      succ:require('../../public/imgs/succ.png'),
      back:require('../../public/imgs/back.png'),
    }
  },
  methods:{
    toExplore(){
      this.$router.push("/index");
    }
  }
}
</script>
<style scoped>
  .paysuc{
    /* display: flex; */
    background: rgb(244, 240, 236);
    width: 100%;
    height: 42rem;
  }
  .backcolor3{
    position: relative;
    background: white;
    height: 3rem;
  }
  .backcolor3>img{
    position: absolute;
    width: 1.5rem;
    height: 1.5rem;
    top: 0.9rem;
  }
  .backcolor3>span{
    position: absolute;
    left: 10rem;
    top: 0.9rem;
    font-weight: bold;
  }
  .success>img{
    width: 6rem;
    height: 6rem;
    margin-left: 9rem;
    margin-top: 2rem;
  }
  .font1{
    font-weight: bold;
    font-size: 1.3rem;
    text-align: center;
    margin-top: 0.5rem;
  }
  .font2{
    font-size: 1rem;
    text-align: center;
    margin-top: 0.5rem;
  }
  .font2>span{
    color: coral;
    font-weight: bold;
  }
  
  .button1{
    border-color: #f9b40c;
    background: white;
    border-radius: 0.4rem;
    width: 8rem;
    height: 2rem;
    font-weight: bold;
    margin-left: 2rem;
    margin-right: 2rem;
  }
    .button2{
    /* border-color: white; */
    background: #f9b40c;
    border-radius: 0.4rem;
    width: 8rem;
    height: 2rem;
    font-weight: bold;
    margin-left: 1rem;
    margin-right: 1rem;
  }
</style>