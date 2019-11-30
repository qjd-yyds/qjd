<template>
  <div class="container">
    <div @click="toProDet"  v-for="(m,i) of menus" :key="i" class="menu">
      <div class="capD" :data-id="m.mid" ></div>
      <div>
        <img :src="m.mpic">
      </div>
      <div class="desc">
        <p class="stitle">{{m.mtitle}}</p>
        <p class="sname">{{m.mshop}}</p>
        <div>
          <div class="price">
            <div>
              <span>￥{{m.mprice}}</span>
              <span>
                <del>{{m.moprice}}</del>
              </span>
            </div>
          </div>
        </div>
      </div>
        <button class="btn" @click="toPay">购买</button>
    </div>
    <div class="more">暂无更多数据</div>
  </div>
</template>
<script>
import Note from "../../views/Note.vue";
import Pay from "../../views/pay.vue";
export default {
  props:["menus"],
  data() {
    return {};
  },
  methods: {
    toProDet(e) {
      if (e.target.nodeName !== "BUTTON") {
        var id=e.target.dataset.id;
        //console.log(id)
        this.$router.push(`/Note/${id}`);
      }
    },

    toPay() {
      this.$router.push("/Pay");
    }
  }
};
</script>
<style scoped>
* {
  box-sizing: border-box;
}
.container {
  background: #efefef;
}
.capD{
  width:100%;
  height:100px;
  position: absolute;
  z-index: 998;
}
.menu {
  width:100%;
  height:100px;
  padding: 0.4rem;
  display: flex;
  background: #fff;
  margin-bottom: 0.4rem;
  position: relative;
}
.menu img {
  width: 7rem;
  height:84px;
  border-radius: 0.5rem;
}
.desc {
  padding: 0.4rem;
}
.desc p {
  margin: 0;
}
.stitle {
  font-size: 0.9rem;
  font-weight: bold;
}
.sname {
  color: #aaa;
  font-size: 0.6rem;
}
.price {
  position: absolute;
  bottom: 0.5rem;
  display: flex;
  justify-content: space-between;
}
.price > div span:first-child {
  font-size: 1rem;
  color: #fde044;
  margin-right: 0.2rem;
}
.price > div span:nth-child(2) {
  font-size: 0.5rem;
  color: #aaa;
}
.btn {
  border: 0;
  outline: 0;
  position: absolute;
  left:18rem;top:3rem;
  background: #f00;
  border-radius: 1rem;
  width:4rem;
  height:2rem;
  display: block;
  color: #fff;
  z-index: 999;
  /* position: absolute; */
}

.more {
  text-align: center;
  height: 3rem;
  color: #aaa;
  line-height: 1.5rem;
}
</style>