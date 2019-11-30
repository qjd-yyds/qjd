<template>
  <div>
    <div id="container">
      <ul>
        <li v-for="(value,i) of this.list" :key="i" @click="love($event,i)">
          <router-link :to="`/Purchase/${value.nid}`">
            <!-- 图片 -->
            <div class="pic">
              <img v-lazy="value.npic" alt>
            </div>
          </router-link>
          <!-- 说明 -->
          <div>
            <!-- 标题 -->
            <div class="title">
              <span>{{value.ntitle}}</span>
            </div>
            <!-- 用户信息 与点赞-->
            <div class="user">
              <div class="info">
                <img src="images/user/avatar6.jpg" alt>
                <span>{{value.ncname}}</span>
              </div>
              <div class="love">
                <span class="islove" data-img="img"></span>
                <span>{{value.heart}}</span>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import { myCollect } from "../../assets/js/api/myCollect.js";
import{sendlove} from "../../assets/js/api/sendlove.js"
export default {
  data() {
    return {
      list: [],
      ucollect: [],
      msgCollect:""
    };
  },
  methods: {
    love(e,i){
      if(e.target.dataset.img=="img"){
      if(e.target.className=="islove"){
        e.target.className="on";
        this.list[i].heart++
        var value1={nid:this.list[i].nid,heart:this.list[i].heart}
        sendlove(value1)
      }else{
        this.list[i].heart--
        e.target.className="islove"
        var value2={nid:this.list[i].nid,heart:this.list[i].heart}
        sendlove(value2)
      }
      }
    },
    collectLoad() {
      myCollect().then(res => {
        this.list = res;
        this.msgCollect=res.length;
        for (var i of this.list) {
          this.ucollect.push(i.user_id);
        };
        this.$emit('func',this.msgCollect)
      });
    }
  },
  created() {
    this.collectLoad();
  }
};
</script>
<style scoped>
a {
  text-decoration: none;
  color: #4c4c4b;
  font-size: 13px;
}
#container {
  width: 100%;
}
#container ul {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  /*padding-top:0.5rem;*/
  padding: 0.5rem 0.2rem;
  justify-content: space-between;
}
#container li {
  width: 44%;
  background: #fff;
  border: 1px solid #fff;
  border-radius: 0.5rem;
  padding: 0.3rem;
  margin-bottom: 0.3rem;
}
.pic img {
  width: 100%;
  height: 11rem;
}
.title {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  font-size: 15px;
  color: #000;
}
.user {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: 0.25rem;
}
.user span {
  display: inline-block;
  font-size: 13px;
  line-height: 15px;
  vertical-align: middle;
}
.user img {
  width: 17px;
  vertical-align: middle;
  border-radius: 50%;
}
.user .islove{
  width:17px;
  height:17px;
  background: url('../../assets/img/love.png') no-repeat center;
  background-size: 17px 17px;
}
.on{
  width:17px;
  height:17px;
  background: url('../../assets/img/redLove.png') no-repeat center;
  background-size: 17px 17px;
}
.user > .info,
.user > .love {
  height: 20px;
  display: table-cell;
}
.user img {
  margin-right: 0.25rem;
}
</style>