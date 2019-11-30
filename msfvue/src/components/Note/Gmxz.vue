<template>
  <div class="father">
    <div class="top">
      <p class="title1">购买须知</p>
      <ul class="ul1">
        <li class="li_list">
          <img src="../../assets/imgs/sz.jpg" alt>
          <span class="span1">有效期5天</span>
        </li>
        <li class="li_list">
          <img src="../../assets/imgs/dh.jpg" alt>
          <span class="span1">不需要预约</span>
        </li>
        <li class="li_list">
          <img src="../../assets/imgs/rmb.jpg" alt>
          <span class="span1">不支持退款</span>
        </li>
        <li class="li_list">
          <img src="../../assets/imgs/dc.jpg" alt>
          <span class="span1">仅限堂食</span>
        </li>
      </ul>
    </div>
    <div class="bottom">
      <div class="text">
        <p>1.兑换时间:周一至周日11:00-13:30,17:00-20:30。</p>
        <p>2.兑换有效期:购买商品成功后,您需要在5日之内至指定门店领取抢购的商品,过期作废</p>
        <p>3.每人每7天每店限购1次</p>
        <p>4.因为该商品为活动商品,故不支持退款,敬请谅解。</p>
        <p>5.限堂食,不提供餐前外带</p>
        <p>6.仅限本人手机使用,如发现购买后产生其他商业行为本平台有权对违规账户进行处置。</p>
        <p>7.此套餐不与店内其他优惠活动其享,每桌仅限使用1份,多人同行不可分桌。</p>
        <p>8.请在点单前(在吧台)出示览食蜂订单,否则商家有权要求以正常价格买单。</p>
        <p>9.如需发票请咨询觅食蜂客服,由觅食蜂提供。</p>
        <p>10.在您使用觅食蜂过程中,有任何疑问、投诉、建议,或者您想加入觅食蜂杭州站福利群,请联系电话/微信:15952100613</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.father {
  width: 100%;
  height:32rem;
}
.father .top {
  border-bottom: 0.05px solid #efefef;
}
.father .top .title1 {
  width: 4rem;
  border-bottom: 3px solid #fcc12d;
  height: 1.56rem;
  font-weight: 800;
  margin-left: 9.71rem;
  margin-top: 1rem;
}
ul {
  list-style: none;
  padding: 0;
  margin-left: 1.4rem;
}
.father .top .ul1 {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.father .top .ul1 .li_list {
  width: 110px;
}
.father .top .span1 {
  color: #ccc;
  position: relative;
  bottom: 0.1rem;
  left: 0.4rem;
  font-size: 0.8rem;
}
.bottom {
  height: 20rem;
  border-bottom:1.5rem solid #efefef; 
}
.bottom .text{
  margin: 10px 15px 0 15px;
}
.bottom p {
  margin: 0;
  font-size: 13px;
  padding: 2.5px 0;
}
</style>
