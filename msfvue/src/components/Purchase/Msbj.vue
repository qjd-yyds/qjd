<template>
  <div class="father">
    <div class="title">
      <img class="img1" :src="Msbj.src" alt>
      <span class="span1">{{Msbj.title}}</span>
    </div>
    <div class="notes">
      <ul class="notes1">
        <li v-for="(f,i) of foods" :key="i">
          <img :src="f.src">
          <p>{{f.des}}</p>
          <div class="author">
            <img :src="f.pic">
            <span>{{f.uname}}</span>
            <img class="exp" :src="icon[1]" alt="">
            <span class="pri">
              <img :src="icon[0]">{{f.pri}}
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
            <img class="exp" :src="icon[1]" alt="">
            <span class="pri">
              <img :src="icon[0]">{{f.pri}}
            </span>
          </div>
        </li>
      </ul>
    </div>
    <p class="p_end">好厉害呀!看完了所有文章！<br> 快来分享一下你的美食心得把!</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      icon: [require('../../assets/imgs/hx.png'),
      require('../../assets/post_img/vip.png')],
      foods: [
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "久久",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "久久",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "久久",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "久久",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        }
      ],
      foods2: [
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "久久",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "十元里美酱",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        },
        {
          src: require("../../assets/imgs/topimag1.jpg"),
          des: "【杭州美食】无法抗拒的神仙冰淇淋",
          uname: "名港海鲜城",
          pic: require("../../assets/imgs/tx.jpg"),
          pri: 30
        }
      ],
      Msbj: {
        src: require("../../assets/imgs/jsb.png"),title: "更多觅食笔记",
      }
    };
  }
};
</script>

<style scoped>
.father {
  width: 100%;
}
.title {
  height: 3rem;
  width: 7.5rem;
  /* float: left; */
  position: relative;
  left: 8rem;
  border-bottom: 2px solid #fde142;
}
.title .img1 {
  position: relative;
  top: 1.4rem;
}
.title .span1 {
  position: relative;
  top: 1.2rem;
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
  padding: 0 0.5rem 0 0.5rem;
}
.notes2 {
  padding: 0 0.5rem 0 0.2rem;
}
.notes li {
  width: 100%;
  background: #fff;
  margin: 0.5rem 0;
  border-radius: 0.1rem;
  padding-bottom:.5rem;
}
.notes li > img {
  width: 100%;
  border-radius: 0.5rem 0.5rem 0 0;
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
  width: 1rem;
  border-radius: 60%;
}
.author > span {
 font-size: 0.4rem;
 color:#ccc;
}
.author > .exp {
width:2.5rem;
 border-radius:0rem;
}
.pri > img {
  width: 1rem;
  vertical-align: middle;
  margin-top: -0.1rem;
}
.pri {
  position: absolute;
  right: 0.1rem;
}
.p_end{
  background: #efefef;
  height:8rem;
  text-align: center;
  line-height: 3;
  margin:0;
  position: relative;
  top:-1rem;
  color:#ccc;
}
</style>
