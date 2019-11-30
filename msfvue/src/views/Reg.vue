<template>
  <div>
    <!-- 品牌的背景图 -->
    <div id="f1">
      <!-- 叉叉退出按钮 -->
      <div class="cro" @click="toback">
        <img src="../assets/img/圈叉.png" alt>
      </div>
      <!-- 小蜜蜂图标 -->
      <div class="mf">
        <img src="../assets/img/mf.png" alt>
      </div>
    </div>
    <div id="f2">
      <h4>现在就加入觅食蜂的大家庭吧!</h4>
      <input type="text" placeholder="请输入4~10位用户名" v-model="uname" ref="na" @click="yz1">
      <div class="yz" :style="vis1">
        <img :src="yzVis1?require('../assets/img/true.png'):require('../assets/img/false.png')" alt>
        <span ref="yz1">请输入正确用户名格式</span>
      </div>
      <input type="password" placeholder="请输入6~12位密码" v-model="upwd" @click="yz2">
      <div class="yz" :style="vis2">
        <img :src="yzVis2?require('../assets/img/true.png'):require('../assets/img/false.png')" alt>
        <span ref="yz2">请输入正确的密码格式</span>
      </div>
      <input type="password" placeholder="重复输入密码" v-model="spwd" ref="sd" @click="yz3">
      <div class="yz" :style="vis3">
        <img :src="yzVis3?require('../assets/img/true.png'):require('../assets/img/false.png')" alt>
        <span ref="yz3">请先确认密码是否一致</span>
      </div>
      <button @click="mreg" :disabled="yzVis3==false||yzVis2==false||yzVis1==false">立即加入</button>
      <div></div>
      <span>遇到问题?</span>
      <a href="javascript:;">联系客服</a>
    </div>
    <!-- 第三方 -->
    <div id="f3">
      <div class="f3-1">使用第三方账号</div>
      <div class="f3-2">
        <img src="../assets/img/vx.png" alt>
      </div>
      <span class="f3-3">
        登录注册即表示同意觅食蜂
        <a href="javascript:;">用户协议</a>和
        <a href="javascript:;">隐私政策</a>
      </span>
    </div>
  </div>
</template>
<script>
import { reg } from "../assets/js/api/reg.js";
export default {
  mounted() {
    this.$refs.na.focus();
  },
  data() {
    return {
      uname: "",
      upwd: "",
      spwd: "",
      yzVis1: false,
      yzVis2: false,
      yzVis3: false,
      vis1: "visibility: hidden",
      vis2: "visibility: hidden",
      vis3: "visibility: hidden"
    };
  },
  methods: {
    yz1() {
      var unameReg = /\w{4,10}/;
      this.vis1 = "visibility: visible";
      if (unameReg.test(this.uname)) {
        this.yzVis1 = true;
        this.$refs.yz1.innerHTML = "用户名格式正确";
        this.$refs.yz1.style.color = "green";
      } else if (!unameReg.test(this.uname)) {
        this.yzVis1 = false;
        this.$refs.yz1.innerHTML = "请输入正确用户名格式";
        this.$refs.yz1.style.color = "red";
      }
    },
    yz2() {
      var upwdReg = /\w{6,12}/;
      this.vis2 = "visibility: visible";
      if (upwdReg.test(this.upwd)) {
        this.yzVis2 = true;
        this.$refs.yz2.innerHTML = "密码的格式正确";
        this.$refs.yz2.style.color = "green";
      } else if (!upwdReg.test(this.upwd)) {
        this.yzVis2 = false;
        this.$refs.yz2.innerHTML = "请输入正确的密码格式";
        this.$refs.yz2.style.color = "red";
      }
    },
    yz3() {
      this.vis3 = "visibility: visible";
      if (this.upwd !== "") {
        if (this.upwd == this.spwd) {
          this.yzVis3 = true;
          this.$refs.yz3.innerHTML = "输入的密码一致";
          this.$refs.yz3.style.color = "green";
        } else if (this.upwd !== this.spwd) {
          this.yzVis3 = false;
          this.$refs.yz3.innerHTML = "请确认密码是否一致";
          this.$refs.yz3.style.color = "red";
        }
      }else{
        this.yzVis3 = false;
          this.$refs.yz3.innerHTML = "请确认密码是否一致";
          this.$refs.yz3.style.color = "red";
      }
    },
    toback() {
      this.$router.push("/Index");
    },
    mreg() {
      var value = `uname=${this.uname}&upwd=${this.upwd}`;
      reg(value).then(result => {
        if (result.code == 0) {
          this.$messagebox("提示", "账号已经存在");
          this.uname = "";
          this.upwd = "";
          this.spwd = "";
        } else if (result.code == 1) {
          this.$toast("注册成功!");
          this.$router.push("/Login");
        }
      });
    }
  },
  watch: {
    uname() {
      this.yz1();
    },
    upwd() {
      this.yz2();
    },
    spwd() {
      this.yz3();
    }
  }
};
</script>
<style scoped>
* {
  margin: 0;
  padding: 0;
}
#f1 {
  width: 100%;
  height: 12rem;
  background: #f8ca1d;
  position: relative;
}
/* 叉叉布局 */
#f1 > .cro {
  position: absolute;
  width: 1.25rem;
  height: 1.25rem;
  top: 1rem;
  right: 1rem;
}
#f1 > .cro img {
  width: 100%;
  height: 100%;
}
/* 小蜜蜂 */
#f1 > .mf {
  position: absolute;
  width: 7rem;
  height: 7rem;
  left: 50%;
  top: 50%;
  margin-left: -3.5rem;
  margin-top: 3.5rem;
  overflow: hidden;
}
#f1 > .mf img {
  width: 100%;
  height: 100%;
}
#f2 {
  width: 75%;
  height: 15rem;
  margin: 0 auto;
  margin-top: 25%;
  text-align: center;
}
#f2 > .yz {
  font-size: 12px;
  color: red;
  display: flex;
  justify-content: center;
  align-items: center;
}
#f2 > .yz > img {
  height: 0.75rem;
  width: 0.75rem;
}
#f2 span {
  font-size: 13px;
}
#f2 a {
  text-decoration: none;
  font-size: 13px;
  color: #2bb6e2;
}
#f2 h4 {
  margin-bottom: 8%;
}
#f2 input {
  width: 70%;
  height: 1rem;
  padding: 2% 0% 2% 4%;
  border: 1px solid #feda50;
}
#f2 button {
  width: 75%;
  height: 15%;
  color: rgb(250, 239, 239);
  font-size: 14px;
  border: 0px solid #feda50;
  background: red;
  border-radius: 10px;
}
#f3 {
  margin: 0 auto;
  margin-top: 5%;
  text-align: center;
  color: #71706d;
}
#f3 > .f3-1 {
  font-size: 14px;
}
#f3 > .f3-3 {
  font-size: 12px;
}
#f3 > .f3-3 > a {
  color: #2bb6e2;
}
</style>
