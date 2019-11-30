<template>
  <div id="f1">
    <div>
      <ul class="ul1">
        <li>
          <img @click="toPur" src="../../assets/imgs/fh.png" alt>
        </li>
        <li>
          <img src="../../assets/imgs/fx.png" alt>
        </li>
      </ul>
      <div class="avatar">
        <img src="../../assets/imgs/tx.jpg" alt>
      </div>
      <div class="user">
        <div>熬夜吃生姜</div>
        <div>
          <ul class="ul2">
            <li>
              <div>0</div>
              <a href>粉丝</a>
            </li>
            <li>
              <div>6</div>
              <a href>关注</a>
            </li>
            <li>
              <div>0</div>
              <a href>赞</a>
            </li>
            <li>
              <div>0</div>
              <a href>收藏</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <mt-button class="btn">+关注</mt-button>
      <p class="p1">这个人有点害羞，还没想好怎么介绍自己</p>
  </div>
</template>

<script>
import Purchase from "../../views/Purchase"
export default {
  methods:{
    toPur(){
      this.$router.push('/Purchase');
    }
  }
};
</script>

<style scoped>
a {
  color: black;
  text-decoration: none;
}
.ul1 {
  margin: 0;
  padding: 10px 12px 0 12px;
  list-style: none;
  display: flex;
  justify-content: space-between;
}
#f1 {
  background: #feda50;
  width: 100%;
  height: 14.5rem;
}
.avatar {
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
  overflow: hidden;
  margin-left: 1rem;
}
.avatar img {
  width: 100%;
  height: 100%;
}
#f1 .user {
  width: 150px;
  height: 85px;
  float: left;
  position: relative;
  left: 6rem;
  bottom: 3.5rem;
}
#f1 .user .ul2 {
  margin: 0;
  padding: 0;
  list-style: none;
  display: flex;
  justify-content: space-between;
}
#f1 .btn {
  float: right;
  position: relative;
  right: 1.2rem;
  bottom: 2rem;
  width: 80px;
  height: 38px;
  border-radius: 50px;
}
#f1 .p1{
  font-size: 12px;
  float: left;
  position: relative;
  right:7rem;
}
</style>


