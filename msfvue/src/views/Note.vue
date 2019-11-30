<template>
  <div id="note" v-if="x">
    <div class="back">
      <img @click="toIndex" src="../assets/imgs/bac.png">
    </div>
    <carousel_top v-if="x" :note="note"></carousel_top>
    <t :note="note"></t>
    <shop2 v-if="x" :note="note"></shop2>
    <File :note="note"></File>
    <Gmxz :note="note"></Gmxz>
    <pay class="pay_s" :note="note"></pay>
  </div>
</template>

<script>
//1:引入顶部图片子组件
import carousel_top from "../components/Note/carousel_top.vue";
//2:引入马上抢子组件
import title from "../components/Note/title.vue";
//3:引入马上抢子组件
import shop2 from "../components/Note/shop2.vue";
//3:引入菜单抢子组件
import File from "../components/Note/File.vue";
//3:引入购买须知子组件
import Gmxz from "../components/Note/Gmxz.vue";
//3:引入立即抢购子组件
import Pay from "../components/Note/Pay.vue";

import Index from "../views/Index.vue";

export default {
  components: {
   
    carousel_top: carousel_top,
    t: title,
    shop2: shop2,
    File: File,
    Gmxz: Gmxz,
    pay: Pay
  },
  props: ["mid"],
  data(){
      return{
          note:[] ,
          x:false,
      }
  },
  methods: {
    toIndex() {
      this.$router.push("/Index");
    },
    loadnDetail() {
      console.log(this.$route);
      this.axios
        .get("pshop/ashop_mid", {
          params: { mid: this.$route.params.id }
        })
        .then(res => {
          console.log(res);
          var arr = res.data.result;
          console.log(arr);
          arr = arr.filter((elem, i, arr) => {
            return {
              mcar1: elem.mcar1,
              mcar2: elem.mcar2,
              mcar3: elem.mcar3,
              mcar4: elem.mcar4,
              mcar5: elem.mcar5,
              mid: elem.mid,
              mlist1: elem.mlist1,
              mlist2: elem.mlist2,
              mlist3: elem.mlist3,
              mlist4: elem.mlist4,
              mlistp1: elem.mlistp1,
              mlistp2: elem.mlistp2,
              mlistp3: elem.mlistp3,
              mlistp4: elem.mlistp4,
              moprice: elem.moprice,
              mpic: elem.mpic,
              mprice: elem.mprice,
              mshop: elem.mshop,
              mshop_i: elem.mshop_i,
              mtitle: elem.mtitle,
              mtype: elem.mtype
            };
          });
          console.log(arr);
          this.note = arr;
          this.x=true;
        });
    }
  },
  created() {
    this.loadnDetail();
  }
};
</script>

<style scoped>
.pay_s {
  position: fixed;
  bottom: 0;
}
.back {
  position: fixed;
  top: 1rem;
  left: 1rem;
  z-index: 999;
}
.back > img {
  width: 2rem;
  height: 2rem;
}
</style>
