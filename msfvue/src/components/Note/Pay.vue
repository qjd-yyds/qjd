<template>
    <div class="pay">
        <span>￥{{note[0].mprice}}</span>
        <p>蜂蜜抵扣后价格</p>
        <mt-button class="bt">立即抢购</mt-button>
    </div>
</template>

<script>
export default {
    props:["note"],
    data(){
        return{
            
        }
    }
}
</script>

<style scoped>
.pay{
    width: 100%;
    height:55px;
    background:#ffffff;
}
.pay span{
    width:83px;
    height:29px;
    float: left;
    position: relative;
    left:1rem;top:0.5rem;
    font-size: 22px;
    font-weight: 600;
    color:#ff5b00;
}
.pay p{

    display:inline-block;
    position: relative;
    right:4rem;top:1.5rem;
    font-size: 12px;
}
.pay .bt{
    width: 135px;
    height:37px;
    float: right;
    position: relative;
    top:0.55rem;right:1.5rem;
    background:#ff5b00;
    border-radius: 50px;
    color:#ffffff;
}
</style>
