<template>
  <div>
    <mt-swipe :auto="0">
      <mt-swipe-item v-for="(item,i) of carlist" :key="i">
        <img :src="item" class="img">
        <!-- <img :src="ndetail.ncar2" class="img">
        <img :src="ndetail.ncar3" class="img">
        <img :src="ndetail.ncar4" class="img">
        <img :src="ndetail.ncar5" class="img"> -->
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>

<script>
import { Swipe, SwipeItem } from "mint-ui";

export default {
  props:["carlist"],
  components: {
    "mt-swipe": Swipe,
    "mt-swipe-item": SwipeItem
  },
  data() {
    return {
      
    };
  },
  mounted(){
    // console.log(this.ncar);
  }
};
</script>

<style scoped>
img {
  width: 100%;
  height: 24rem; 

}
.mint-swipe {
  height: 24rem;
}

</style>