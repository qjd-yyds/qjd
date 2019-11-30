<template>
    <div class="father">
        <p class="title1">底价一元.探店福利.限量抢购</p>
        <a href="" class="a1" v-for="(elm,i) of pg" :key="i">
            <img :src="elm.src" alt="">
            <p>{{elm.title}}</p>
            <span class="span1">￥{{elm.pic1}}</span><span class="span2">￥{{elm.pic2}}</span>
            <mt-button class="btn">砍价</mt-button>
        </a>
    </div>
</template>

<script>
export default {
    data(){
        return{
            pg:[
                {src:require('../../assets/imgs/tt.jpg'),title:"【双人餐】冬季星光龙虾·热身强身通气血",pic2:"26.65",pic2:"98.00"},
                {src:require('../../assets/imgs/tt.jpg'),title:"【双人餐】冬季星光龙虾·热身强身通气血",pic2:"26.65",pic2:"98.00"}
            ]
        }
    }
}
</script>

<style scoped>
a{
    text-decoration: none;
}
.father .title1 {
  width: 9.5rem;
  border-bottom: 3px solid #fcc12d;
  font-size:12px;
  height: 1.56rem;
  font-weight: 800;
  margin-left: 6.9rem;
  margin-top: 3rem;
}
.a1{
    display: block;
    width:350px;
    height:115px;
    background: #efefef;
    margin:0 12px 20px 12px; 
    border-radius: 5px; 
}
.a1 img{
    width:5.5rem;
    height:5.5rem;
    border-radius: 10px; 
    position: relative;
    left:1rem;top:0.8rem;
}
.a1 p{
    float: right;
    width:238px;
    color:black;
}
.a1 span{
    float: right;
    position: relative;
    bottom:1rem;right:8.5rem;
}
.a1 .span1{
    font-size: 12px;
    text-decoration: line-through;   
    color:#ccc;
    position: relative;
    bottom:0.7rem; 
}
.a1 .span2{
    color:#ff5b00;
}
.a1 .btn{
    width:60px;
    height:30px;
    float: right;
    position: relative;
    bottom:1.5rem;left:2.8rem;
    background: #ff5b00;
    font-size:12px;
    border-radius: 50px;
} 
</style>
