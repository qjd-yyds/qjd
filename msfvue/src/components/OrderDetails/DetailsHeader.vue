<template>
  <div id="Myheader">
    <!-- <div><img src="../../assets/img/左箭头.png" alt=""></div>
    <div>我的订单</div> -->
    <mt-header fixed title="订单详情">
      <router-link to="/Myorder" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
  </div>
</template>
<script>
export default {
  
}
</script>
<style scoped>
  .mint-header{
    background-color: #fff;
    color:#4c4c4b;
    font-size:18px;
    font-weight: 800
  }
</style>
