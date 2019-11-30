<template>
  <div>
    <mt-swipe :auto="0">
        <mt-swipe-item>
          <img :src="note[0].mcar1" class="img">
        </mt-swipe-item>
        <mt-swipe-item>
          <img :src="note[0].mcar2" class="img">
        </mt-swipe-item>
        <mt-swipe-item>
          <img :src="note[0].mcar3" class="img">
        </mt-swipe-item>
        <mt-swipe-item>
          <img :src="note[0].mcar4" class="img">
        </mt-swipe-item>
        <mt-swipe-item>
          <img :src="note[0].mcar5" class="img">
        </mt-swipe-item>

    </mt-swipe>
  </div>
</template>

<script>
import { Swipe, SwipeItem } from "mint-ui";

export default {
  props: ["note"],
  components: {
    "mt-swipe": Swipe,
    "mt-swipe-item": SwipeItem
  },
  data() {
    return {
      
    };
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