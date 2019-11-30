<template>
  <div id="container">
    <mt-navbar v-model="selected">
      <mt-tab-item id="1">全部订单</mt-tab-item>
      <mt-tab-item id="2">待使用</mt-tab-item>
      <mt-tab-item id="3">待分享笔记</mt-tab-item>
      <mt-tab-item id="4">退货单</mt-tab-item>
    </mt-navbar>
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="1">
        <div id="dd" v-for="(value,i) of this.list" :key="i" @click="details">
          <div class="f1">
            <div class="pic">
              <img :src="value.opic" alt>
            </div>
            <div class="f1-r">
              <div class="t1">{{value.otitle}}</div>
              <div class="t2">{{value.oshop}}</div>
              <div class="t3">{{value.opirce}}</div>
            </div>
          </div>
          <div class="f2">
            <span>有效期至{{value.otime}}</span>
            <button :data-btn="value.oid">去使用</button>
          </div>
        </div>
        <!-- 到底啦! -->
        <div class="di">
          <span>没有更多数据了!</span>
        </div>
      </mt-tab-container-item>
      <!-- 待使用 -->
      <mt-tab-container-item id="2">
        <div id="dd" v-for="(value,i) of this.list" :key="i" @click="details">
          <div class="f1">
            <div class="pic">
              <img :src="value.opic" alt>
            </div>
            <div class="f1-r">
              <div class="t1">{{value.otitle}}</div>
              <div class="t2">{{value.oshop}}</div>
              <div class="t3">{{value.opirce}}</div>
            </div>
          </div>
          <div class="f2">
            <span>有效期至{{value.otime}}</span>
            <!-- <router-link :to="`/OrderDetails/${value.user_id}`"> -->
            <button :data-btn="value.oid">去使用</button>
            <!-- </router-link> -->
          </div>
        </div>
        <div class="di">
          <span>没有更多数据了!</span>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="3">
        <div class="free">
          <img src="../../assets/img/buy.png" alt>
          <div class="free-bottom">吃点好的很有必要,赶紧下单吧!</div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="4">
        <div class="free">
          <img src="../../assets/img/buy.png" alt>
          <div class="free-bottom">吃点好的很有必要,赶紧下单吧!</div>
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
import { myorder } from "../../assets/js/api/myorder.js";
export default {
  data() {
    return {
      selected: "1",
      list: []
    };
  },
  methods: {
    celAll() {
      myorder().then(res => {
        for (var value of res) {
          value.otime = value.otime.split("T")[0];
          this.list.push(value);
        }
        // console.log(this.list)
      });
    },
    details(event) {
      var e = event.target;
      if (e.nodeName == "BUTTON") {
        var oid = e.dataset.btn;
        console.log(oid);
        this.$router.push(`/OrderDetails/${oid}`);
      }
    }
  },
  created() {
    this.celAll();
  }
};
</script>
<style scoped>
.mint-tab-container-item {
  background: #f4efef;
  margin-top: 0.25rem;
}
#container {
  margin-top: 40px;
}
.mint-tab-item-label {
  font-size: 15px;
}
.mint-navbar .mint-tab-item.is-selected {
  border-bottom: 3px solid #feda50;
  color: #000;
  font-weight: bold;
}
/* 订单详情 */
#dd {
  margin: 0 auto;
  width: 95%;
  height: 8rem;
  border-radius: 10px;
  background-color: #fff;
  padding: 0.25rem;
  box-shadow: 0 0 12px #d0cecd;
  margin-top: 0.45rem;
}
#dd > .f1 {
  display: flex;
}
#dd > .f1 > .pic {
  width: 4.5rem;
  height: 4.5rem;
  overflow: hidden;
  border-radius: 10px;
}
#dd > .f1 > .pic img {
  width: 100%;
  height: 100%;
}
.f1-r {
  margin-left: 1rem;
  width: 75%;
}
.f1-r > .t1,
.f1-r > .t2,
.f1-r > .t3 {
  margin-top: 0.25rem;
}
.f1-r > .t1 {
  font-size: 15px;
  font-weight: bold;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.f1-r > .t2 {
  color: #a8a8a8;
  font-size: 13px;
}
.f1-r > .t3 {
  color: red;
  font-size: 14px;
  margin-top: 0.6rem;
}
.f2 {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 1rem;
}
.f2 span {
  color: #a8a8a8;
  font-size: 13px;
  height: 1rem;
  line-height: 1rem;
}
.f2 button {
  border: 1px solid #fff;
  background: #feda50;
  padding: 0.45rem;
  border-radius: 10px;
}
.di {
  margin-top: 10%;
  width: 100%;
  height: 100%;
  text-align: center;
}
/* 第三张 第四张*/
.free {
  margin-top: 10rem;
  height: 36rem;
  width: 100%;
  text-align: center;
}
.free img {
  width: 5rem;
  height: 5rem;
}
</style>
