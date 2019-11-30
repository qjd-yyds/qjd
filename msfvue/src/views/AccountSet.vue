<template>
  <div class="title">
    <div class="set">
      <img :src="back" @click="toMine">
      <span>账号设置</span>
    </div>
    <div class="pic">
      <div>头像</div>
      <van-uploader id="uploader" v-model="fileList" :max-count="1"/>
      <div>
        <img :src="more" class="icon">                
      </div>
    </div>
    <div class="care">
      <div id="category">昵称</div>
      <!-- <span id="c1"></span>-->
      <van-cell is-link @click="showPopup">{{name}}</van-cell>
      <van-popup v-model="show">
        <input type="text" v-model="val"/>
        <button @click="change">确认修改</button>
      </van-popup>
    </div>
    <div class="care">
      <div id="category">性别</div>
      <span id="c2">你是小哥哥还是小姐姐?</span>           
    </div>
    <div class="care">
      <div id="category">生日</div>
    <van-cell is-link @click="showPopupFn">
    <van-field v-model="timeValue" placeholder="悄悄告诉我吧！" readonly />        
    </van-cell>
    <!-- 弹出层 -->

    <van-popup v-model="showDate" :style="{width: '80%' }">
    <!-- 开始时间 -->
    <van-datetime-picker 
    @cancel="cancelFn" 
    @confirm="confirmFn" 
    v-model="startTime" 
    type="date" 
    />
    </van-popup>
    </div>
    <div class="care">
      <div id="category">手机号码</div>
      <span id="c3">18227425216</span>           
    </div>
    <div class="care">
      <div id="category">个人描述</div>
      <span id="c4">签名写得好，小伙伴不会少</span>           
    </div>
    <div class="ground">
      <div class="gory">关于觅食蜂</div>           
    </div>
    <div class="exitbutton">
      <button class="exit">退出登录</button>            
    </div>
  </div>
</template>
<script>
  // import Mine from "./Mine.vue"
  import Index from "./Index.vue"
export default {
  data(){
    return{
      back:require('../../public/imgs/back.png'),
      color:require('../../public/imgs/color.png'),
      more:require('../../public/imgs/more.png'),
      fileList:[],
      show1:false,
      name:"觅食蜂Macyset",
      val:"",    
      // time:"悄悄告诉我吧！",
      showDate:false,
      currentDate: new Date(),//开始时间不能超过当前时间
      startTime:new Date(),//开始时间
      endTime:new Date(),//结束时间,
      timeValue:''
    }
  },
  methods:{
    toMine(){
      this.$router.push('/Index');
    },
      showPopup(){
        this.show=true;
    },
    change() {
      this.name = this.val;
      this.show= false
    },
    showPopup() {
      this.show= true;
      this.val = this.name
    },
    showPopupFn(){
     this.showDate=true; 
    },
    cancelFn(){
      this.showDate=false;
      this.strarTime="";
    },
    confirmFn(){ // 确定按钮
    console.log(111);
      this.timeValue = this.timeFormat(this.currentDate);
      this.showDate=false;
    },
    timeFormat(time) { // 时间格式化 2019-09-08
        let year = time.getFullYear();
        let month = time.getMonth() + 1;
        let day = time.getDate();
        return year + '年' + month + '月' + day + '日'
      }
  },
  mounted(){
      this.timeFormat(new Date());
  }
}
</script>
<style scoped>
  .title{
    position: relative;
    text-align: center;
    font-size: 1rem;
    /* line-height:3.9rem; */
    font-weight: bold; /*字体粗细,定义粗字体*/
    padding: .6rem;
    padding-top:1rem;
    font:"微软雅黑";
  }
  .title>img{
    position: absolute;
    width: 1.5rem;
    left: 1rem;
    margin-top: 1.4rem;
  }
  .set{
      display: flex;
      position: relative;
      line-height: 3rem;
      background: white;
  }
  .set>span{
      position:absolute;
      left: 45%;
  }
  .set>img{
    width: 1.5rem;
    height: 1.5rem;
  }
  .pic{
    margin-top:2.9rem;
    padding: 1rem 0.2rem;
    display: flex;
    justify-content:space-between;
    border-top: 0.01rem solid rgb(234, 231, 231);
  }
  .pic div{
    height: 100px;
    line-height: 100px;
    font-size: 0.6rem;
    color: gray;
  }
  .pic img{
    height: 100px;
    margin: 0.5rem;
  }
  .pic .icon{
    height: 1rem;
    margin: 1.1rem;
  }
  .care{
    position: relative;
    margin-top:0.2rem;
    padding: 0rem 0.2rem;
    display: flex;
    border-top: 0.01rem solid rgb(234, 231, 231);
  }
  #category{
    line-height:3rem;
    font-size: 0.6rem;
    color: gray; 
    width: 2rem;   
  }
.van-cell__value--alone {
    color: #323233;
    text-align: left;
    left: 5rem;
}
  .care .con{
    position: absolute;
    right:0rem;
    height: 1rem;
    top: 1rem;
  }
  #c1{
    /* height: 2rem; */
     line-height:3rem;
    font-size:0.8rem;
    /* margin-top: 2.1rem; */
    margin-left: 7rem;
    text-align: center;
  }
  #c2{
    line-height:3rem;
    font-size:0.6rem;
    margin-left: 7rem;
    text-align: center;
    color: darkgray;
  }
  #c3{
    line-height:3rem;
    font-size:0.6rem;
    margin-left:5.5rem;
    text-align: center;
  }
  #c4{
    line-height:3rem;
    font-size:0.6rem;
    margin-left:5.5rem;
    text-align: center;
    color: darkgray;
  }
  .ground{
    position: relative;
    margin-top: 0.2rem;
    padding-top: 0rem 0.2rem;
    display: flex;
    height: 3rem;
  }
  .ground .gory{
    position: absolute;
    right: 18rem;
    height: 1rem;
    top: 1rem;
    font-size: 0.8rem;
}
    .ground .con2{
    position: absolute;
    right:0rem;
    height: 1rem;
    top: 1rem;
  }
  .exitbutton{
    position: relative;
  }
.exit{
  position: absolute;
  padding: 1.5rem;
  line-height: 0rem;
  width: 24rem;
  height: 2rem;
  top: 5rem;
  left: -1rem;
  outline: 0;
  background: white;
  font-size: 1rem;
  border: 0.01rem solid rgb(234, 231, 231);
}
</style>