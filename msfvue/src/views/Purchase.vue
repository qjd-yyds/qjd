<template>
  <div id="d1">
    <top_post class="isFixed1 isFixed2" :upic="upic" :ncname="ncname" :count="count" :fans="fans" :author="author"></top_post>
    <!-- <post  :upic="upic" :ncname="ncname" :count="count" :fans="fans" :author="author" class="fixed"></post> -->
    <!-- <div class="back">
      <img @click="toIndex" src="../assets/imgs/bac.png">
    </div> -->
    <topimg :carlist="carlist"></topimg>
    <post :upic="upic" :ncname="ncname" :count="count" :fans="fans" :author="author"></post>
    <p_text :ndetail="ndetail"></p_text>
    <shop :shop="shop"></shop>
    <my_list :com="com" :ccount="ccount" :lpic="lpic" :lcount="lcount"></my_list>
    <msbj></msbj>
    <fixed class="f1" :nid="nid"></fixed>
  </div>
</template>

<script>
//1:引入顶部图片子组件
import Topimg from "../components/Purchase/Topimg.vue";
//2:引入用户信息栏子组件
import Post from "../components/Purchase/Post.vue";
//3:引入P_text子组件
import P_text from "../components/Purchase/P_text.vue";
//4:引入shop商铺子组件
import Shop from "../components/Purchase/Shop.vue";
//5:引入list评论列表组件
import List from "../components/Purchase/List.vue";
import Msbj from "../components/Purchase/Msbj.vue";
import fixed from "../components/Purchase/fixed.vue";
import top_post from "../components/Purchase/top_post.vue";

import Index from "../views/Index.vue"
export default {
  components: {
    top_post: top_post,
    topimg: Topimg, //顶部图片
    post: Post,
    p_text:P_text,
    "shop":Shop,
    "my_list":List,
    "msbj":Msbj,
    fixed: fixed
  },
  props:["nid"],
  data(){
    return{
      ndetail:[],
      carlist:[],
      author:[],
      shop:{},
      upic:'',
      ncname:'',
      count:'',
      fans:'',
      com:[],
      ccount:'',
      lpic:[],
      lcount:''
    }
  },
  
  methods:{
    toIndex(){
      this.$router.push("/Index");
    },
    loadnDetail(){
      this.axios.get("notes/ndetail",{
        params:{nid:this.nid}
      }).then(res=>{
        // console.log(res);
        var res=res.data.data;
        this.ndetail=res.ndetail[0];
        // 五张轮播图
        this.carlist[0]=res.ndetail[0].ncar1;
        this.carlist[1]=res.ndetail[0].ncar2;
        this.carlist[2]=res.ndetail[0].ncar3;
        this.carlist[3]=res.ndetail[0].ncar4;
        this.carlist[4]=res.ndetail[0].ncar5;
        // console.log(this.carlist);//__ob__: Observer不可枚举数组，需要转为可枚举
        this.carlist=JSON.parse(JSON.stringify(this.carlist));
        // this.author=res.author;
        this.author[0]=JSON.parse(JSON.stringify(res.author[0][0]));
        this.author[1]=JSON.parse(JSON.stringify(res.author[1][0]));
        this.author[2]=JSON.parse(JSON.stringify(res.author[2][0]));
        this.author[3]=JSON.parse(JSON.stringify(res.author[3]));
        this.author[4]=JSON.parse(JSON.stringify(res.author[4][0]));
        this.author[5]=JSON.parse(JSON.stringify(res.author[5]));
        this.author[6]=JSON.parse(JSON.stringify(res.author[6][0]));
        this.shop=JSON.parse(JSON.stringify(res.shop[0]));
        // console.log(this.ndetail);
        // console.log(this.author);
        // console.log(this.shop);
        this.upic=this.author[0].upic;
        this.ncname=this.author[0].ncname;
        this.count=this.author[1].count;
        this.fans=this.author[2].fans;
        this.com=this.author[3];
        this.ccount=this.author[4].ccount;
        this.lpic=this.author[5];
        this.lcount=this.author[6].lcount;
        // console.log(this.com);
        // console.log(this.ccount);
        // console.log(this.lpic);
      })
    },
    handleScroll() {
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      // console.log(scrollTop);
      var d1 = document.getElementById("d1");
      var top = d1.firstElementChild;
      // console.log(top);
      if (scrollTop > 400) {
        top.classList.remove("isFixed1");
      } else if (scrollTop < 400) {
        top.classList.add("isFixed1");
      }
    }
  },
  created(){
    this.loadnDetail();
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  destroyed() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  
};
</script>

<style scoped>
.isFixed1 {
  display: none;
}
.isFixed2 {
  position: fixed;
  background-color: #fff;
  top: 0;
  z-index: 999;
}
  /* .fixed{
    position: fixed;
    z-index: 999;
  } */
  .back{
    position: fixed;
    top:1rem;
    left:1rem;
    z-index:999;
  }
  .back>img{
    width:2rem;
    height:2rem;
  }
  .f1 {
  position: fixed;
  bottom: 0;
}
</style>
