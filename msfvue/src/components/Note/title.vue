<template>
<div class="father">
    <h4>{{note[0].mtitle}}</h4>
    <div v-for="(com,i) of combo" :key="i">
         <img :src="com.src" alt=""><span>{{com.text}}</span>
    </div>
    <p>￥{{note[0].moprice}}</p>
    <span class="price">￥{{note[0].mprice}}</span>
    <mt-button class="btn">马上抢</mt-button>
</div>
</template>

<script>
export default {
    props:["note"],
    data(){
        return{
            combo:[
                {src:require('../../assets/imgs/piang.png'),text:"7人正在抢购，只剩2个啦"},
                {src:require('../../assets/imgs/di.png'),text:"可用蜂蜜抵扣最多30%的支付金额"},
            ],
            msp:{title:"【2-3人餐】 打卡圣地-名港海鲜网红火锅",pic1:28.42,pic2:119.00}
        }
    }
}
</script>

<style scoped>
*{
    margin:0;
}
.father{
    width:100%;
    height:160px;
    border-bottom:12px solid #f7f7f7;
}
.father h4{
    width:330px;
    height:42px;
    position: relative;
    left:1.7rem;top:1rem;
   
}
.father div{
    position: relative;
    top:1.3rem;left:1rem; 
}
.father div img, {
    float: left;
}
.father div span{
    font-size: 12px;
    position: relative;
    bottom:0.25rem;left:0.23rem
}
.father p{
    position: relative;
    top:1.5rem;left:1rem;
    color: #fcc12d;
    font-size: 19px;
}
.father .price{
    float: left;
    font-size: 12px;
    position: relative;
    top:1.6rem;left:1.25rem;
    text-decoration: line-through;
    color:#ccc;
}
.father .btn{
    width: 4rem;
    height:1.9rem;
    float:right;
    position: relative;
    right:1rem;
    background:#ff5b00
    0;
    color:#fff;
    font-size: 12px;
    border-radius: 3.2rem;
}
</style>
