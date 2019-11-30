<template>
  <div>
    <!-- 背景图 -->
    <div id="f1">
      <div class="intercalate">
        <img src="../assets/img/智能机器人.png"/>
        <img @click="toSet" src="../assets/img/设置.png"/>   
      </div>
      <!-- 用户表 -->
      <div id="f2">
        <!-- 头像 -->
        <div class="avatar">
          <img :src="avatar" alt=""/>
        </div>
        <!-- 右边部分 -->
        <div class="r-user">
          <div class="tname">{{ncname}}</div>
          <div class="bname">
            <ul>
              <li>
                <div>13</div>
                <a >粉丝</a>
              </li>
              <li>
                <div>52</div>
                <a >关注</a>
              </li>
              <li>
                <div>13</div>
                <a >赞</a>
              </li>
              <li>
                <div>0</div>
                <a >收藏</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="book" @click="book">
          <span>
            <img src="../assets/img/签到.png" alt />
          </span>
          <span>连续3天</span>
        </div>
        <!-- 个人签名 -->
      </div>
      <!-- 个人签名 -->
      <div id="f3">
        <span>{{udesc}}</span>
      </div>
    </div>
    <!-- 我的相关 -->
    <div id="f4">
      <ul>
        <li>
          <a href="javascript:;">
            <img src="../assets/img/蜂蜜罐.png" alt />
            <div>我的蜂蜜</div>
          </a>
        </li>
        <li>
          <router-link to="./Myorder">
            <img src="../assets/img/订单.png" alt />
            <div>我的订单</div>
          </router-link>
        </li>
        <li>
          <a href="javascript:;">
            <img src="../assets/img/礼物.png" alt />
            <div>邀请有礼</div>
          </a>
        </li>
        <li>
          <a href="javascript:;">
            <img src="../assets/img/等级.png" alt />
            <div>我的等级</div>
          </a>
        </li>
      </ul>
    </div>
    <!-- 空白部分 选择页面 -->
    <div id="f5">
      <div class="M">
        <div class="lM" @click="sw" :class="act1">
          <span>我的笔记·</span>
          <span>{{Nodescount}}</span>
        </div>
        <div class="rM" @click="sw" :class="act2">
          <span>我的收藏·</span>
          <span>{{Collcount}}</span>
        </div>
      </div>
    </div>
    <div id="f6">
      <!-- 笔记列表 -->
      <MyNodes v-show="act1.active==true" :ncname="ncname" :avatar="avatar" @funM="getNodescount"></MyNodes>
      <!-- 收藏列表 -->
      <MyCollect v-show="act2.active==true" @func="getCollcount"></MyCollect>
      <!-- 分享 -->
      <MyShare></MyShare>
    </div>
  </div>
</template>
<script>
import MyCollect from "../components/Mine/MyCollect"
import MyNodes from "../components/Mine/MyNodes"
import MyShare from "../components/Mine/MyShare"
import AccountSet from "./AccountSet"
import {msgload} from "../assets/js/api/msgload.js"
export default {
  data(){
    return{
      avatar:"",
      ncname:"",
      udesc:"",
      Collcount:"",
      Nodescount:"",
      act1:{
        active:true
      },
      act2:{
        active:false
      }
    }
  },
  methods:{
    getCollcount(data){
      this.Collcount=data
    },
    getNodescount(data){
      this.Nodescount=data
    },
    sw(){
     if(this.act1.active!==true){
       this.act1.active=true;
       this.act2.active=false;
     }else{
       this.act1.active=false;
       this.act2.active=true;
     }
    },
    book(){
      this.$toast("今日签到奖励已领取")
    },
    toSet(){
      this.$router.push('/AccountSet');
    },
    userLoad(){
      msgload().then(res=>{
        if (res.code==-1){
          this.$router.push("/Login");
          return
        }
        this.avatar=require(`../../public/${res[0].upic}`)
        this.ncname=res[0].ncname;
        this.udesc=res[0].udesc;
      })
    }
  },
  created(){
    this.userLoad()
  },
  components:{MyCollect,MyNodes,MyShare},
  watch:{
    $route(){
      if(this.$route.path.indexOf("index")!=-1)
      this.userLoad()
    }
  }
};
</script>
<style scoped>
  *{margin:0;padding:0;}
a {
  text-decoration: none;
  color: #4c4c4b;
}
/* 设置机器人样式 */
*{margin:0;padding:0;}
#f1 {
  background: #feda50;
  width: 100%;
  height: 14.5rem;
  position: relative;
}
#f1 > .intercalate {
  display: flex;
  justify-content: space-between;
  width: 5rem;
  margin-left: 75%;
  padding-top:1rem;
}
/* 用户样式 */
#f2 {
  display: flex;
  height: 5rem;
  width: 100%;
  margin-top: 1rem;
}
/* 头像样式 */
#f2 > .avatar {
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
  overflow: hidden;
  margin-left: 1rem;
}
#f2 > .avatar img {
  width: 100%;
  height: 100%;
}
/* 头像右边 */
#f2 > .r-user {
  width: 12rem;
  margin-left: 1rem;
}
/* 关注列表 */
#f2 > .bname {
  margin-top: 8%;
}
.bname ul {
  list-style: none;
  display: flex;
  justify-content: space-between;
  justify-items: center;
  font-size: 13px;
}
.bname li {
  text-align: center;
}
/* 签到样式 */
#f2 > .book {
  font-size: 0.75rem;
  background: #fff;
  width: 6rem;
  height: 1.5rem;
  line-height: 1.5rem;
  display: flex;
  justify-items: center;
  justify-content: space-around;
  border-top-left-radius: 1rem;
  border-bottom-left-radius: 1rem;
}
#f2 > .book img {
  height: 1.5rem;
  width: 1.5rem;
}
/* 个人签名 */
#f3 {
  margin-left: 1rem;
  font-size: 15px;
}
/* 我的相关 */
#f4 {
  margin: 0 auto;
  width: 80%;
  height: 5rem;
  background: #fff;
  position: absolute;
  left: 10%;
  top: 12.5rem;
  border: 1px solid #ccc;
  border-radius: 7px;
}
#f4 ul {
  height: 100%;
  list-style: none;
  display: flex;
  justify-content: space-around;
  text-align: center;
  font-size: 13px;
  align-items: center;
}
/* 选择页面 */
#f5 {
  text-align: center;
}
#f5::before {
  display: block;
  content: "";
  height: 4rem;
}
#f5 > .M {
  width: 60%;
  height: 2rem;
  margin: 0 auto;
  margin-bottom: 1px;
  display: flex;
  justify-content: space-around;
}
#f5 > .M > .lM,
#f5 > .M > .rM {
  height: 2rem;
  line-height: 2rem;
  font-size: 16px;
}
.active {
  color: #ff7e06;
  border-bottom: 2px solid #f5d246;
}
#f6{
  background:#eae6e6;
}
#f6::after{
  display: block;
  content: "";
  clear: both;
}
</style>
