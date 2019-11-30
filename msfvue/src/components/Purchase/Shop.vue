<template>
  <div id="shop">
    <div class="shop_top" @click="toShopDet">
      <img class="img1" :src="shop.spic" alt>
      <div>
        <p class="span1">{{shop.sname}}</p>
        <p class="span2">{{shop.scount}}篇觅食笔记</p>
      </div>
      <div class="a_xp">
        <a href="">
          <img :src="Shop.src3" alt>
        </a>
      </div>
    </div>
    
    <div class="shop_bottom">
      <img :src="Shop.src4" alt>
      <span class="bottom_span">{{shop.saddress}}</span>
    </div>
  </div>
</template>

<script>
import shopDetails from "../../views/ShopDetails"
export default {
  props:["shop"],
  data(){
      return{
      Shop:{
        src1:require('../../assets/imgs/tt.jpg'),
        src2:require("../../assets/p_text/tj.png"),
        src3:require('../../assets/imgs/you.png'),
        src4:require('../../assets/imgs/map.png'),
        dname:"付小姐在成都(下沙店)",
        gps:"下沙金沙大道滟澜星座2栋商铺23号(金沙湖地铁站D口)",
        num:"10"
      }
    }
  },
  methods:{
    toShopDet(){
      this.$router.push('/shopDetails');
  }
  }
};
</script>

<style scoped>
#shop {
  width: 100%;
  height: 100px;
  border-bottom: 12px solid #f7f7f7;
}
#shop .shop_top {
  height: 3rem;
  display: flex;
  padding-left:.8rem;
  margin-top:.5rem;
}
.span1,.span2{
  margin:0;
}

#shop .shop_bottom {
  height: 40px;
  padding-left:.5rem;
}
#shop .shop_top .img1 {
  /* float: left; */
  /* position: relative;
  left: 1rem;
  top: 1rem; */
  width: 34px;
  height: 34px;
  margin-right:.5rem;
}
#shop .shop_top .span1 {
  /* float: left; */
  /* position: relative;
  left: 1.5rem;
  top: 0.5rem; */
  width:18.5rem;
  font-size:1rem;color:#333;
}
#shop .shop_top .span2 {
  /* float: left; */
  /* position: relative;
  top: 2.3rem;
  left:1rem; */
  font-size: 10px;
  color: #989898; 
}
/* #shop .shop_top .a_xp { */
  /* float: right;
  position: relative;
  left: 8rem;bottom:1.5rem; */

/* } */
/* #shop .shop_top img {
   float: left; 
  position: relative;
  top: 2.2rem;
  right: 8.25rem;
} */
#shop .shop_bottom .bottom_span {
  color: #989898   ;
  font-size: 13px;
  position: relative;
  bottom: 0.8rem;
}
</style>
