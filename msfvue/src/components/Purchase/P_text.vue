<template>
    <div>
        <h3>{{ndetail.ntitle}}</h3>
        <div class="text1">
            <p class="p1">
              {{ndetail.ndesc}}
            </p>
        </div>
        <div class="tj">
            <span>推荐指数&nbsp;&nbsp;:</span>
            <van-rate v-model="value" readonly="" />
            <!-- <img :src="P_text.src" alt="">
            <img :src="P_text.src" alt="">
            <img :src="P_text.src" alt="">
            <img :src="P_text.src" alt="">
            <img :src="P_text.src" alt=""> -->
            <!-- <mt-button class="btn" v-for="(b,i) of btns" :key=i>{{b.list}}</mt-button> -->
            <span class="date">发布于:{{ndetail.ntime}}</span>
        </div>
    </div>
</template>

<script>
export default {
    props:["ndetail"],
    data(){
        return{
            // btns:[
            //     {list:"网红"},{list:"主播"}
            // ],
            // P_text:{
            //     src:require('../../assets/p_text/tj.png'),date:"2019_12_02",text:"  付小姐在成都吃了以后感觉特别赞自,排队的人特别多,我第一次吃,涂个新鲜,大家都说这个是网红店,我也不是特别懂,不够坏境特别美,菜单特别喜庆,说几个必点菜吧,小酥肉,必点,略有点小辣,不过特别酥香,比起其它地方的小酥肉这"
            // },
            value:2
        }
    },
    beforeUpdate(){
        this.value=this.ndetail.ratings;
        console.log(this.ndetail.ratings);
    }
}
</script>

<style scoped>
    h3,span{
        padding-left:1rem;
    }
    .text1{
        padding: 0px 1rem 1rem 1rem;
    }
    .p1{
        font-weight: 500;
        font-size:15px;;
        text-align: justify;
        letter-spacing:1px;
    }
    .tj{
        width:100%;
        height:110px;
        border-bottom: 12px solid #f7f7f7;
    }
    /* .tj span{
        float: left;
    } */
    /* .tj img{
        float: left;
        position: relative;
        top:0.1rem;
        left:0.5rem;
    } */
    .tj .btn{
        float: left;
        width:50px;
        height:30px;
        font-size: 13px;
        border-radius: 80px;
        background:#e0f96d; 
        position: relative;
        top:2.5rem;right: 11rem;
    }
    .tj .date{
        font-size: 12px;
        color:#ccc;
        float: right;
        position: relative;
        right: 0.5rem;top:3.5rem;
    }
</style>
