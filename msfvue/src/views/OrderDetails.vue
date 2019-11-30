<template>
  <div>
    <DetailsHeader></DetailsHeader>
    <div id="p">
      <!-- 套餐跳转 -->
      <div class="meal">
        <span class="limit-line">{{otitle}}</span>
        <div class="arrow">
          <router-link to="/Note">
            <img src="../assets/img/右箭头.png" alt>
          </router-link>
        </div>
      </div>
      <!-- 订单 -->
      <div class="dd">
        <!-- 商品 -->
        <div class="product">
          <div class="left">
            <img :src="opic" alt>
          </div>
          <div class="right">
            <span class="r1">订单号:{{onumber}}</span>
            <span class="r2">{{oshop}}</span>
          </div>
        </div>
        <!-- 有效期 -->
        <div class="lmtime">
          <span>有效期至:{{otime}}</span>
        </div>
      </div>
      <!-- 扫码 -->
      <div class="sao">
        <mt-button size="large" type="danger">
          <img src="../assets/img/扫码.png" height="20" width="20" slot="icon">
          扫码使用
        </mt-button>
        <div class="explain">
          <img src="../assets/img/叹号.png" alt>
          <p>请认真查看购买须知,到店后扫描店内二维码使用,若扫码遇到问题,请在工作人员的帮助下使用<a>店码核销</a></p>
        </div>
      </div>
      <!-- 购买须知 -->
      
      <div id="instruction">
        <h3>购买须知</h3>
        <p>1.兑换时间:<span>周一至周日10:00-24:00下午茶兑换时间13:00-16:00(法定节假日通用)。</span></p>
        <p>2.兑换有效期:购买商品成功后,你需要在<span>5</span>日之内至指定门店领取抢购的商品,国企作废。</p>
        <p>3.每人每<span>5</span>天每店限购1次。</p>
        <p>4.因为该商品伪活动商品<span>故不支持退款</span>敬请谅解。</p>
        <p>5.<span>限食堂</span>不提供餐前外带。</p>
        <p>6.仅限本人手机使用，如发现购买后产生其他商业行为本平台有权对违规账户进行处置。</p>
        <p>7.此套餐不与店内其他优惠活动功响，每桌仅限使用1份，多人同行不可分桌。</p>
        <p>8.请在点单前(在吧台)出示觅食蜂订单,否则商家有权要求以正常价格买单</p>
        <p>9.如需发票请咨询觅食蜂客服,由觅食蜂提供</p>
        <p>10.在你失意觅食蜂过程中,有任何疑问,投诉,建议,或者你想加入觅食蜂杭州站福利群,请联系电话/微信:13567821774</p>
      </div>
    </div>
  </div>
</template>
<script>
import DetailsHeader from "../components/OrderDetails/DetailsHeader";
import WriteOff from '../components/OrderDetails/WriteOff';
import {mydetails} from "../assets/js/api/mydetails"
export default {
  data() {
    return {
      otitle:"",
      otime:"",
      onumber:"",
      oshop:"",
      opic:""
    };
  },
  methods: {
    detLoad(){
      mydetails({oid:this.oid}).then(result=>{
        console.log(result[0])
        this.otitle=result[0].otitle
        this.otime=result[0].otime.split('T')[0]
        this.onumber=result[0].onumber
        this.oshop=result[0].oshop
        this.opic=result[0].opic

      })
    }
  },
  props:["oid"],
  created(){
    this.detLoad()
  },
  components: { DetailsHeader,WriteOff }
  
};
</script>
<style scoped>
#p {
  padding: 0 0.625rem;
  margin-top: 5%;
}
.meal {
  margin-top: 3rem;
  display: flex;
  height: 2rem;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 1rem;
  border-bottom: 1px solid #ccc;
}
.limit-line {
  width: 70%;
  overflow: hidden;
  height: 2rem;
  font-size: 1.15rem;
  line-height: 2rem;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.meal > .arrow {
  height: 2rem;
  width: 2rem;
  overflow: hidden;
}
.meal > .arrow img {
  width: 100%;
  height: 100%;
}
.left {
  width: 7rem;
  height: 5.5rem;
  overflow: hidden;
  border-radius: 5px;
}
.left img {
  width: 100%;
  height: 100%;
}
.dd > .product {
  display: flex;
  background: #f0eeee;
  border-radius: 5px;
}
.dd > .product > .right {
  padding-left: 5%;
}
.dd > .product > .right span {
  margin-top: 0.35rem;
}
.dd > .product > .right > .r1 {
  font-size: 14px;
  font-weight: bolder;
}
.dd > .product > .right > .r2 {
  color: #4c4c4b;
  font-size: 12px;
}
.dd > .product > .right > span {
  display: inline-block;
}
.lmtime {
  margin-top: 3%;
  color: #4c4c4b;
  font-size: 14px;
  padding-bottom: 1.35rem;
  border-bottom: 1px solid #ccc;
}
/* 按钮 */
.mint-button--danger {
  background: #feda50;
  color: black;
}
/* 扫码说明 */
.sao>.explain{
  margin-top:2%;
  vertical-align: middle;
  display:flex;
}
.sao>.explain>img{
  width:1.25rem;
  height:1.25rem;
}
.sao>.explain>p{
  color:#4c4c4b;
  font-size:15px;
}
.sao>.explain>p>a{
  text-decoration: none;
  color:darkorange;
}

#instruction{
  font-size:0.94rem;
  margin-top:10%;
}
#instruction>p{
  margin:1rem 0;
}
#instruction>p>span{
  color:red
}
</style>
