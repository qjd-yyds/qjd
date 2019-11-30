<template>
  <div>
    <!-- 品牌的背景图 -->
    <div id="f1">
      <!-- 叉叉退出按钮 -->
      <div class="cro" @click="toback">
        <img src="../assets/img/圈叉.png" alt="">
      </div>
      <!-- 小蜜蜂图标 -->
      <div class="mf">
        <img src="../assets/img/mf.png" alt="">
      </div>
    </div>
    <div id="f2">
      <h4>用户登录</h4>
      <input type="text" placeholder="用户名" v-model="uname" ref="na">
      <input type="password" placeholder="密码" v-model="upwd">
      <button @click="login">立即登录</button>
      <div></div>
      <span >遇到问题?</span><router-link to="/Reg">点击注册</router-link>
    </div>
    <!-- 第三方 -->
    <div id="f3">
      <div class="f3-1">使用第三方账号</div>
      <div class="f3-2"><img src="../assets/img/vx.png" alt=""></div>
      <span class="f3-3">登录注册即表示同意觅食蜂<a href="javascript:;">用户协议</a>和<a href="javascript:;">隐私政策</a></span>
    </div>
  </div>
</template>
<script>
import {users} from "../assets/js/api/users.js"
export default {
  mounted(){
    this.$refs.na.focus();
  },
  data(){
    return{
      uname:"",
      upwd:""
    }
  },
  methods:{
    toback(){
      this.$router.push("/index")
    },
    login(){
      // var value=`uname=${this.uname}&upwd=${this.upwd}`;
      var value={params:{uname:this.uname,upwd:this.upwd}}
      users(value).then(
        result=>{
          if(result.ok==1){
            this.$toast("登录成功");
            this.$router.push("/index")
          }else{
            this.$toast("密码或者用户名错误!");
            this.uname="";
            this.upwd="";
            this.$refs.na.focus();
          }
        }
      )
    }
  }
}
</script>
<style scoped>
*{margin:0;padding:0}
#f1{
  width:100%;
  height:12rem;
  background: #f8ca1d;
  position: relative;
}
/* 叉叉布局 */
#f1>.cro{
  position: absolute;
  width:1.25rem;
  height:1.25rem;
  top:1rem;
  right:1rem;
}
#f1>.cro img{
  width:100%;
  height:100%;
}
/* 小蜜蜂 */
#f1>.mf{
  position: absolute;
  width:7rem;
  height:7rem;
  left: 50%;
  top:50%;
  margin-left: -3.5rem;
  margin-top: 3.5rem;
  overflow: hidden;
}
#f1>.mf img{
  width:100%;
  height:100%;
}
#f2{
  width:75%;
  height:13rem;
  margin:0 auto;
  margin-top:25%;
  text-align: center
}
#f2 span{
  font-size:13px;
}
#f2 a{
  text-decoration: none;
  font-size:13px;
  color:#2bb6e2
}
#f2 h4{
  margin-bottom: 8%;
}
#f2 input{
  width:70%;
  height:1rem;
  margin-bottom:5%;
  padding: 2% 0% 2% 4%;
  border: 1px solid #feda50;
}
#f2 button{
  width:75%;
  height:15%;
  color:#000;
  font-size:14px;
  border: 0px solid #feda50;
  border-radius: 10px;
  background: #f8ca1d
}
#f3{
  margin:0 auto;
  margin-top:5%;
  text-align: center;
  color:#71706d
}
#f3>.f3-1{
  font-size:14px;
}
#f3>.f3-3{
  font-size:12px;
}
#f3>.f3-3>a{
  color:#2bb6e2
}
</style>
