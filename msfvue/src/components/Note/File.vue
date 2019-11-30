<template>
  <div class="father">
    <p class="title1">{{flie.title}}</p>
    <P class="title2">{{flie.name}}</P>
    <div>
      <ul>
        <li v-for="(elm,i) of caidan" :key="i">
          <span>{{elm.uname}}</span>
          <span>￥{{elm.price}}</span>
        </li>
      </ul>
    </div>
    <P class="title3">{{flie.text}}</P>
  </div>
</template>

<script>
export default {
  props:["note"],
    data(){
        return{
            caidan:[
                {uname:this.note[0].mlist1,price:this.note[0].mlistp1},
                {uname:this.note[0].mlist2,price:this.note[0].mlistp2},
                {uname:this.note[0].mlist3,price:this.note[0].mlistp3},
                {uname:this.note[0].mlist4,price:this.note[0].mlistp4},
            ],
            flie:{title:"菜单",name:"菜单",text:"到店需另付两元餐位费2元每位"}
        }
    }
};
</script>

<style scoped>
.father{
    border-bottom: 12px solid #f7f7f7;;
}
.father .title1 {
  border-bottom: 3px solid #fcc12d;
  width: 2rem;
  height: 1.56rem;
  font-weight: 800;
  margin-left: 171.5px;
}
.father .title2 {
  width: 337px;
  height: 25px;
  text-align: center;
  font-size: 14px;
  font-weight: 600;
  background: #f7f7f7;
  margin-left: 19px;
  line-height: 25px;
}
ul{
    list-style: none;
    padding:0 19px 0 19px;
}
ul li{
 /* position: relative;
    right:1.3rem; */
    margin: 1rem 0 1rem 0 ;
    display: flex;
    justify-content: space-between;
}
.father .title3 {
  width: 337px;
  height: 50px;
  font-size: 14px;
  background: #f7f7f7;
  margin-left: 19px;
  line-height: 50px;
}
</style>
