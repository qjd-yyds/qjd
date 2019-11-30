<template>
    <div class="father">
        <div class="pl_div">
            <input @keydown.13="putCom" v-model="value" type="text" class="pinglun" placeholder="来,一起聊聊你的想法">
        </div>
        <img  src="../../assets/imgs/xxx.png" alt="" style="float:right">
        <img  src="../../assets/imgs/wjx.png" alt="" style="float:right">
    </div>
</template>

<script>
export default {
    props:["nid"],
    data(){
        return{
            value:""
        }
    },
    methods:{
        putCom(){
            // this.axios.post("notes/comment",
            //     Qs.stringify({
            //         nid:this.nid,
            //         com:this.value,
            //     })
            // ).then(res=>{
            //     console.log(res.data);
            // })
            this.axios.get("notes/comment",{
                params:{
                    nid:this.nid,
                    com:this.value
                }
            }).then(res=>{
                if(res.data.code==-1){
                    this.$messagebox.confirm("您还未登录，请登录")
                    .then(res=>{
                        this.$router.push("/login");
                    })
                }else{
                    this.$toast("添加成功");
                    console.log(res.data);
                }
          
                
            })
            
        }
    }
}
</script>

<style scoped>
.father{
    width:100%;
    height:48px;
    background: #ffffff;
}
.father .pl_div{
    width:275px;height:35px;
    border-radius: 55px;
    background:#efefef;
    position: relative;
    top:0.4rem;left:1rem;
}
.father .pl_div .pinglun{
    height:30px;width:250px;
    position: relative;
    left:12px;top:2px;
    border: 0px;
    font-size: 13px;
    outline: none;
    background:#efefef; 
}
.father img{
    position: relative;
    top:-1.6rem;
}
</style>
