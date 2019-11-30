<template>
  <div>
    <div class="father">
    </div>
    <div class="body">
      <h3>{{details.uname}}</h3>
      <mt-button class="btn">我想去</mt-button>
      <ul class="ul1">
        <li>
          <span>{{details.leixing}}</span>
        </li>
        <li>
          <span>{{details.juli}}</span>
        </li>
        <li class="li_last">
          <img src="../../assets/imgs/dw2.png" alt>
          <span>{{details.dizhi}}</span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
    data(){
        return{
            details:{uname:"虾百年烧烤吧(星耀城店)",leixing:"烤肉",juli:"1.3km",dizhi:"体育场路218号杭州日报老大楼东南一层"},
        }
    }
};
</script>

<style scoped>
.father {
  content: "";
  width: 100%;
  height: 12rem;
  background: url("../../assets/imgs/carousel3.jpg") no-repeat;
  filter: blur(5px);
  z-index: -1;
}
.body{
    width: 100%;
     color: white;
     position: absolute;
     top:1.2rem;
}
.body .btn{
    position: relative;
    bottom:1.7rem;left:18rem;
    width:60px;
    height:26px;
    font-size: 12px;
    background: #fde142;
    color:black;
    border-radius:50px; 
}
h3 {
  position: relative;
  left: 1rem;
  margin: 0;
  padding: 10px 0;
}
ul {
  list-style: none;
  padding: 0;
  font-size: 12px;
  margin: 0 15px 0 15px;
}
.ul1 {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}
.ul1 li {
  width: 50px;
  height: 35px;
}
.ul1 .li_last {
  width: 100%;
  height: 55px;
  line-height: 55px;
  border-top:1px solid #ffffff;
}
.ul1 .li_last img{
    position: relative;
    top:0.3rem;
}
</style>
