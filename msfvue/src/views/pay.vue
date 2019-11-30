<template>
  <div class="payment">
    <div class="pay">
      <img :src="error" />
      <span id="payfor">订单支付</span>
      <span id="paytime">14:57</span>
    </div>
    <div class="menu">
      <p class="the1">【双人餐】冬季星光龙虾蟹，热身强筋通气血</p>
      <span class="pice">￥26.65</span>
      <span class="add">龙虾百年小烤吧（星光城店）</span>
    </div>
      <!-- 开关组件 -->
      <div class="switchClose">
        <img :src="fengmi"  />
        <span id="deduction">蜂蜜￥0.09元</span>
        <mt-switch id="switch" v-model="val" @change="changeval">
        </mt-switch>
      </div> 
      <div> 
        <mt-radio  align="right" v-model="value" :options="['支付宝支付', '微信支付']">
          </mt-radio>  
      </div>
        <div class="care">
        <div id="category">购买须知</div>          
        <div>
          <img :src="more" class="con">
        </div>
        </div>
        <div class="backcolor">
            <ul>
              <li>
                <img :src="history1" />
                <span class="time">有效期5天</span> 
              </li>
              <li>
                <img :src="phone1" />
                <span class="time">不需要预约</span> 
              </li>
              <li>
                <img :src="money1"/>
                <span class="time">不支持退款</span> 
              </li>
              <li>
                <img :src="food1" />
                <span class="time">仅限堂食</span> 
              </li>
            </ul>
        <div class="backcolor2">
          <p id="font2">温馨提示：本商品不支持退款</p>
          <button @click="payFor" class="paybutton">确认支付￥26.65</button>
        </div>
    </div>
    
  </div>
</template>
<script>
  import paysuc from "./paysuc.vue"
export default {
  data() {
    return {
      food1:require('../../public/imgs/food.png'),
      money1:require('../../public/imgs/money.png'),
      phone1:require('../../public/imgs/phone.png'),
      history1:require('../../public/imgs/history.png'),
      more:require('../../public/imgs/more.png'),
      paytreasure:require("../../public/imgs/zhifubao.png"),
      fengmi: require("../../public/imgs/fengmi.png"),
      error: require("../../public/imgs/cuowu.png"),
      val: false, //默认关闭状态
      value:[]
    };
  },
  methods: {
    payFor(){
      this.$router.push('/paysuc');
    }
  }
};
</script>
<style scoped>
    .pay {
      display: flex;
      /* text-align: center; */
      justify-content: space-around;
      margin-top: 1rem;
    }
    .payment span {
      display: block;
    }
    .pay > img {
      height: 2rem;
      left: 1rem;
      top: 1rem;
      display: block;
    }
    #payfor {
      font-size: 1.1rem;
      font-weight: bold;
      top: 1rem;
      left: 10rem;
    }
    #paytime {
      /* position: absolute; */
      right: 1rem;
      top: 1rem;
      color: gray;
    }
    .menu .the1 {
      font-weight: bold;
      text-align: center;
      padding-top: 1rem;
      border-top: 0.01rem solid rgb(234, 231, 231);
    }
    .menu .pice {
      color: darkorange;
      font-weight: bold;
    }
    .menu .add {
      color: rgb(158, 152, 152);
      font-size: 0.1rem;
      margin-left: 13rem;
      margin-top: -1rem;
    }
    #switch {
      margin-right: 1rem;
    }
    .switchClose{
        display: flex;
        border-top: 0.6rem solid rgb(238, 236, 236);  
        margin-top: 1.01rem;  
    }
    .switchClose>img{
      margin-top: 0.5rem;
    }
    #deduction{
        margin-top:1rem;
    }
    #switch{
        margin-top: 1rem;
        left: 12rem;
    }
    #category{
      line-height:3rem;
      font-size: 1rem;
      color: rgb(73, 72, 72);    
    }
    .care{
      position: relative;
      border-top: 0.6rem solid rgb(238, 236, 236);  
      margin-top: 1.01rem;      
    }
    .care .con{
      position: absolute;
      right:0rem;
      height: 1rem;
      top: 1rem;
    }
  .backcolor{
    background: rgba(243, 239, 239, 0.867);
    width: 25rem;
    height: 17rem;
  }
  .backcolor>ul{
    list-style:none;
    display: flex;
    font-size: 0.9rem;
    color: darkgray;     
    padding:0.5rem;
    flex-wrap: wrap;
    margin:0;
  }
  .backcolor li{
    display: flex;
    margin-right: 1rem;
  }
  .backcolor>ul>li>img{
    height:1.4rem; 
    width:1.4rem; 
    margin-top: 1.35rem;
    margin-right: .2rem;  
  }
  .time{
    margin-top: 1rem;
  }
  .backcolor2{
    background:rgb(244, 230, 213);
    width: 25rem;
    height: 6rem;
    margin-top: 4rem;
  }
  #font2{
    text-align: center;
    font-size: 0.8rem;
    color: darkgoldenrod;
    padding: 0.8rem;
  }
  .paybutton{
    background: rgb(234, 113, 6);
    width: 25rem;
    height: 3rem;
    color: white;
    border:0;
    outline:0;
  }
</style>