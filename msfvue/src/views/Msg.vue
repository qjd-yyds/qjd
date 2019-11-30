<template>
  <div>
    <p class="title">消息</p>
    <ul class="msg">
      <li>
        <img :src="icon[0]">
        <p>赞和评论</p>
      </li>
      <li>
        <img :src="icon[1]">
        <p>评论</p>
      </li>
      <li>
        <img :src="icon[2]">
        <p>粉丝</p>
      </li>
    </ul>
    <div class="notice">
      <img :src="icon[3]">
      <div class="not">
        <p>通知消息</p>
        <p>消息消息...</p>
      </div>
      <div class="day">
        星期三
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      icon:[
        require('../../public/img/zan.png'),
        require('../../public/img/com.png'),
        require('../../public/img/pans.png'),
        require('../../public/img/notice.png')
      ]
    }
  }
}
</script>
<style scoped>
    *{
      box-sizing: border-box;
    }
  /* 页头样式 */
    .title{
      text-align: center;
      margin:0;
      padding:.9rem 0;
      background: #fde044;
      font-size:1rem;
      font-weight: 500;
    }
  /* 第二行图标样式 */
    .msg{
      list-style: none;
      padding: 1rem 0;
      margin: 0;
      display: flex;
      flex-wrap: nowrap;
      justify-content: space-around;
      border-bottom:.6rem solid #efefef;
    }
    .msg img{
      width:3rem;
    }
    .msg p{
      margin: 0;
      text-align: center;
      margin-top:.1rem;
      font-size:.7rem;
    }
  /* 消息样式 */
    .notice{
      display:flex;
      padding: 1rem;
      position: relative;
      border:.05rem solid rgba(225,225,225,.4);
    }
    .notice img{
      width: 2.5rem;
      height:2.5rem;
    }
    .not{margin-left:.4rem;}
    .not>p{
      margin:0;
    }
    .not>p:first-child{
      font-size:.8rem;
      font-weight: 700;
      margin-top:.2rem;
    }
    .not>p:nth-child(2){
      color:#aaa;
      font-size:.6rem;
    }
    .day{
      position: absolute;
      right:1rem;
      color:#999;
      font-size:.6rem;
    }

</style>