<template>
  <div class="container">
    <div class="pub">
      <img @click="toIndex" :src="del">
      <button @click="toPub">发布</button>
    </div>
    <div class="addimg">
      <van-uploader
        :before-read="beforeRead"
        :after-read="afterRead" 
        v-model="fileList"
        multiple
        :max-count="5"
      />
    </div>
    <div class="ntitle">
      <input type="text" placeholder="标题 : 这一刻的美食心情(5-20个字)">
    </div>
    <div class="ncontent">
      <textarea name="" cols="50" rows="4" maxlength="140" placeholder="内容:分享你的美食体验,馋坏那些吃不到的人吧!(140字以内)"></textarea>
      <!-- <input type="text" placeholder="内容 : 分享你的美食体验,馋坏那些吃不到的人吧!"> -->
      <div class="nshop">
        <p>
          <img :src="nshop">
          <select id="select" v-on:change="showValue" v-model="index" onmousedown="if(this.options.length>6){this.size=6}" onblur="this.size=1" onchange="this.size=1">
            <option disabled selected value="a">美食坐标</option>
            <option v-for="(c,i) of shop" :key="i" :value="c.index">{{c.name}}</option>
          </select>
        </p>
      </div>
    </div>
    <div class="decide">
      <span>推荐指数 : </span>
      <van-rate v-model="value" />
      <!-- <div v-for="i of 5" :key="i"></div> -->
    </div>
  </div>
</template>
<script>
import Index from "./Index"
export default {
  data(){
    return {
      fileList: [],
      value:0,
      del:require('../../public/img/del2.png'),
      // add:require('../../public/img/add.png'),
      nshop:require('../../public/img/nshop.png'),
      food:require('../../public/img/food4.jpg'),
      index:"a",
      shop:[
        {index:2,name:"乡佳米糕(二圣庙前店)"},
        {index:3,name:"老头儿油爆虾(萧山店)"},
        {index:4,name:"橱创东北老家(信义坊店)"},
      ],
    }
  },
  methods:{
    toIndex(){
      this.$router.push('/Index');
    },
    showValue(){
      console.log(this.index);
    },
    // 返回布尔值
    beforeRead(file) {
      if (file.type !== 'image/jpeg') {
        this.$toast('请上传 jpg 格式图片');
        return false;
      }
      return true;
    },
    // 返回 Promise
    asyncBeforeRead(file) {
      return new Promise((resolve, reject) => {
        if (file.type !== 'image/jpeg') {
          this.$toast('请上传 jpg 格式图片');
          reject();
        } else {
          resolve();
        }
      });
    },
    afterRead(file) {
      // 此时可以自行将文件上传至服务器
      // console.log(file);
      // console.log('aa',file.file);
      // let avatar = file.content
      // this.axios.post("up/img", {
      //   file: avatar.replace(/data:image\/.*;base64,/, '')
      // }).then(res => {  
      // console.log(res.data);
    // })
    },
    toPub(){

    }
  }
}
</script>
<style scoped>
    *{
      box-sizing: border-box;
    }
.container{padding:0 .8rem;}
  /* pub样式 */
    .pub{
      display: flex;
      justify-content: space-between;
      padding:.6rem;
    }
    .pub>img{
      width:1.4rem;
      height:1.4rem;
    }
    .pub>button{
      outline:0;
      border:0;
      background:#fde044;
      padding:.4rem 1.2rem;
      border-radius:1rem;
      font-size:.8rem;
    }
  /* 添加图片 */
  .addimg{
    padding:1rem 0;
      border-top:.01rem solid #eee;
      border-bottom:.012rem solid #eee;
  }
    /* .addimg{
      display: flex;
      flex-wrap: wrap;
      padding:1rem 0;
      border-top:.01rem solid #eee;
      border-bottom:.012rem solid #eee;
    }
    .addimg>img{
      width:7rem;
      border-radius:.6rem;
      margin-right: .8rem;
    }
    .addimg div{
      width:7rem;
      height:7rem;
      text-align: center;
      border:.2rem dashed #eee;
      line-height:8rem;
      border-radius:.6rem;
    } */
  /* 笔记标题样式 */
    .ntitle{border-bottom:.02rem solid #eee;}
    .ntitle>input,.ncontent>input{
      outline: 0;
      border:0;
      width:100%;
      font-size:.8rem;
      padding:1.2rem 0;
    }
    .ncontent{
      height:8rem;
      border-bottom:.1rem solid #eee;
      position: relative;
    }
    .nshop{
      position: absolute;
      bottom:.4rem;
      display: flex;
    }
    .ncontent>textarea{
      border:0;
      font-size:.8rem;
      
    }
    .nshop img{
      width:1.2rem;
      height:1.2rem;
      vertical-align: middle;
    }
    .nshop>p{
      margin:0;
      background:rgba(225,225,225,.3);
      padding:.4rem .8rem;
      border-radius:1rem;
      font-size:.8rem;
    }
    /* 下拉框样式 */
     #select{
      border: 0;
      background: transparent;
      appearance:none;
       -moz-appearance:none; /* Firefox */
       -webkit-appearance:none; /* Safari 和 Chrome */
    }
    #select select{
      background: transparent;
      border:none;
      outline: none;
    }
  /* 推荐指数 */
    .decide{
      padding:1rem 0;
    }
    .decide>span{
      font-size:.8rem;
    }
    /* .decide>div{
      display: inline-block;
      width:1rem;
      height:1rem;
      border:.1rem solid #aaa;
      border-radius:50%;
      margin-right: .2rem;

    } */
</style>