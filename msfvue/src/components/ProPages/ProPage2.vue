<template>
  <div>
    <pros :menus="menus"></pros>
  </div>
</template>
<script>
import Pros from "./Pros.vue";
export default {
  components: {
    pros: Pros
  },
  props:["mid"],
  data() {
    return {
      menus:[]
    };
  },
  methods: {
    loadnDetail() {
      this.axios.get("/pshop/agentshop").then(res => {
        console.log(res);
        var arr = res.data.result;
        arr = arr.filter((elem, i, arr) => {
          return {
            mpic: elem.mpic,
            mtitle: elem.mtitle,
            mshop: elem.mshop,
            mprice: elem.mprice,
            moprice: elem.moprice
          };
        });
        console.log(arr);
        this.menus = arr;
      });
    }
  },
  created() {
    this.loadnDetail();
  }
};
</script>
<style scoped>
</style>