<template>
  <div>
    <!-- 轮播图 -->
    <mt-swipe
      class="container"
      style="width:95%;height:3rem;margin:.2rem auto;"
      :auto="3000"
      @change="handleChange"
    >
      <mt-swipe-item>
        <img :src="carousel[0]">
      </mt-swipe-item>
      <mt-swipe-item>
        <img :src="carousel[1]">
      </mt-swipe-item>
      <mt-swipe-item>
        <img :src="carousel[2]">
      </mt-swipe-item>
      <mt-swipe-item>
        <img :src="carousel[3]">
      </mt-swipe-item>
      <mt-swipe-item>
        <img :src="carousel[4]">
      </mt-swipe-item>
    </mt-swipe>
    <!-- 笔记 -->
    <div class="notes">
      <ul class="notes1">
        <li v-for="(f,i) of foods" :key="i">
          <img :src="f.src">
          <p>{{f.des}}</p>
          <div class="author">
            <img :src="f.pic">
            <span>{{f.uname}}</span>
            <span class="pri">
              <img :src="icon[0]">
              {{f.pri}}
            </span>
          </div>
        </li>
      </ul>
      <ul class="notes2">
        <li v-for="(f,i) of foods2" :key="i">
          <img :src="f.src">
          <p>{{f.des}}</p>
          <div class="author">
            <img :src="f.pic">
            <span>{{f.uname}}</span>
            <span class="pri">
              <img :src="icon[0]">
              {{f.pri}}
            </span>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      carousel: [
        require("../../assets/imgs/jsb.png"),
        require("../../assets/imgs/jsb.png"),
        require("../../assets/imgs/jsb.png"),
        require("../../assets/imgs/jsb.png"),
        require("../../assets/imgs/jsb.png")
      ],
      foods: [
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        }
      ],
      foods2: [
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/jsb.png"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/jsb.png"),
          pri: 30
        }
      ],

      icon: [
        require("../../assets/imgs/jsb.png"),
        require("../../assets/imgs/jsb.png")
      ]
    };
  },
  methods: {
    handleChange(index) {}
  }
};
</script>
<style scoped>
.container img {
  width: 100%;
}
.notes {
  display: flex;
}
.notes1,
.notes2 {
  list-style: none;
  /* padding:0 .2rem; */

  width: 50%;
  /* width:100%; */
  background: #efefef;
  /* display: flex;
    flex-wrap: wrap;
    justify-content: space-around; */
}
.notes1 {
  padding: 0 0.1rem 0 0.2rem;
}
.notes2 {
  padding: 0 0.2rem 0 0.1rem;
}
.notes li {
  width: 100%;
  background: #fff;
  margin: 0.2rem 0;
  border-radius: 0.1rem;
}
.notes li > img {
  width: 100%;
  border-radius: 0.1rem 0.1rem 0 0;
}
.notes li > p {
  font-size: 0.4rem;
  margin: 0.2rem;
}

.author {
  display: flex;
  padding: 0.1rem 0.2rem;
  position: relative;
}
.author > img {
  width: 0.5rem;
  border-radius: 50%;
}
.pri > img {
  width: 0.5rem;
  vertical-align: middle;
  margin-top: -0.1rem;
}
.pri {
  position: absolute;
  right: 0.1rem;
}
</style>