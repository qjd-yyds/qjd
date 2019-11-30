<template>
  <div id="shop">
    <div class="shop_top" @click="toShopDet" >
      <img class="img1" :src="note[0].mpic" alt>
      <span class="span1">{{note[0].mshop}}</span>
      <div  class="imgbao">
        <img :src="Shop.src2" alt>
        <img :src="Shop.src2" alt>
        <img :src="Shop.src2" alt>
        <img :src="Shop.src2" alt>
        <img :src="Shop.src2" alt>
      </div>
      <div class="a_xp">
        <a href>
          <img :src="Shop.src3" alt>
        </a>
      </div>
    </div>
    <div class="shop_bottom" >
      <img class="img1" :src="Shop.src4">
      <span class="bottom_span">{{Shop.gps}}</span>
      <img class="img2" :src="Shop.src5" alt>
    </div>
  </div>
</template>

<script>
import shopDetails from "../../views/ShopDetails"
export default {
  props:["note"],
  data() {
    return {
      Shop: {
        src1: require("../../assets/imgs/tt.jpg"),
        src2: require("../../assets/p_text/tj.png"),
        src3: require("../../assets/imgs/you.png"),
        src4: require("../../assets/imgs/dw.png"),
        src5: require("../../assets/imgs/phione.png"),
        dname: "付小姐在成都(下沙店)",
        gps: "杭州市黄姑山路",
        num: "10"
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
  height: 120px;
  border-bottom: 12px solid #f7f7f7;
}
#shop .shop_top {
  height: 70px;
  border-bottom: 1px solid #ccc;
}
#shop .shop_bottom {
  height: 50px;
}
#shop .shop_top .img1 {
  float: left;
  position: relative;
  left: 1rem;
  top: 1rem;
  width: 34px;
  height: 34px;
}
#shop .shop_top .span1 {
  float: left;
  position: relative;
  left: 1.5rem;
  top: 0.5rem;
}
#shop .shop_top .a_xp {
  float: right;
  position: relative;
  left: 8rem;
  bottom: 0.7rem;
}
#shop .shop_top .imgbao {
  position: relative;
  top: 2.2rem;
  right: 8.25rem;
}
#shop .shop_bottom .img1 {
  position: relative;
  top: 0.8rem;left:0.5rem
}
#shop .shop_bottom .img2 {
  float: right;
  position: relative;
  top: 0.4rem;
}
#shop .shop_bottom .bottom_span {
  color: #989898;
  font-size: 13px;
  position: relative;
  top: 0.5rem;
  left: 0.7rem;
}
</style>
