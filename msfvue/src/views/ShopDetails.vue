<template>
    <div>
        <div class="back">
    <img src="../assets/imgs/bac.png">
  </div>
        <top_details></top_details>
        <body_details></body_details>
        <msbj></msbj>
    </div>
</template>

<script>
//1:引入顶部图片子组件
import top_details from "../components/ShopDetails/top_details.vue";
//2:引入限量抢购子组件
import body_details from "../components/ShopDetails/body_details.vue";

import Msbj from "../components/Purchase/Msbj.vue";

export default {
     components:{
            "top_details":top_details,
            "body_details":body_details,
             "msbj":Msbj
    }
}
</script>

<style scoped>
    .back{
    position: fixed;
    top:1rem;
    left:1rem;
    z-index:999;
  }
  .back>img{
    width:2rem;
    height:2rem;
  }
</style>
