<template>
  <div>
    <User></User>
    <msbj></msbj>
  </div>
</template>

<script>
import User from "../components/UserNote/User.vue";
import Msbj from "../components/Purchase/Msbj.vue";
export default {
  components:{
    "User":User,
    "msbj":Msbj
  }
}
</script>

<style>

</style>
