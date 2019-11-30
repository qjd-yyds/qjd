<template>
  <div>
    <mt-navbar v-model="active" id="tab">
      <mt-tab-item id="d1">评论·{{ccount}}</mt-tab-item>
      <mt-tab-item id="d2">点赞·{{lcount}}</mt-tab-item>
      <mt-tab-item id="d3">收藏</mt-tab-item>
    </mt-navbar>
    <mt-tab-container v-model="active" class="tab1">
      <mt-tab-container-item id="d1">
        <!-- <p>成为第一个评论的人吧!</p> -->
        <ul class="com">
          <li v-for="(c,i) of com" :key="i">
            <span class="uname">{{c.user_name}}</span>&nbsp;:&nbsp;{{c.cdesc}}
          </li>
        </ul>
      </mt-tab-container-item>
      <mt-tab-container-item id="d2">
        <!-- <P>还没人点赞</P> -->
        <ul class="hpic" >
          <li v-for="(p,i) of lpic" :key="i"><img :src="p.user_upic"></li>
        </ul>
      </mt-tab-container-item>
      <mt-tab-container-item id="d3">
        <p>点击收藏</p>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>

<script>
export default {
  props:["com","ccount","lpic","lcount"],
  data() {
    return {
      active: "d1"
    };
  },
  created(){
  }
};
</script>

<style scoped>
.uname{
  color:#111;
}
.tab1 {
  /* height: 60px; */
  border-bottom: 12px solid #f7f7f7;
}
.tab1 p {
  text-align: center;
  font-size: 16px;
}

#tab .mint-tab-item.is-selected {
  border-bottom: 3px solid #fde142;
  color: #000;
}
.com{
  padding:.8rem;
  font-size:.8rem;
  color:#666;
}
.hpic{
  padding:.5rem;
  display: flex;
}
.hpic img{
  width:1.5rem;
  height:1.5rem;
  border:.1rem solid #efefef; 
  border-radius:50%;
  margin-right:.3rem;
}
</style>
