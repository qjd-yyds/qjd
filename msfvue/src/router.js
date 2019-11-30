import Vue from 'vue'
import Router from 'vue-router'
import Purchase from './views/Purchase.vue'
import Note from './views/Note.vue'
import ShopDetails from './views/ShopDetails.vue'
import UserNote from './views/UserNote.vue'
import User from './components/UserNote/User.vue'
//zj
import ChoCity from "./views/ChoCity.vue"
import Index from "./views/Index.vue"
import Search from "./views/Search.vue"
import SearchNotes from "./views/SearchNotes.vue"
import Publish from "./views/Publish.vue"
//qjd
import Login from './views/Login.vue'
import Mine from './views/Mine.vue'
import Myorder from './views/Myorder.vue'
import OrderDetails from './views/OrderDetails.vue'
import Reg from './views/Reg.vue'
//fhm
import AccountSet from "./views/AccountSet.vue"
import pay from "./views/pay.vue"
import paysuc from "./views/paysuc.vue"
//test
import note1 from "./components/NotePages/NotePage1.vue"

Vue.use(Router)

//2:为组件配置访问路径
Vue.use(Router)
export default new Router({
  routes: [
    {path:'/',component:Index,meta:{keepAlive:true}},
    //hsh
    {path:'/Purchase/:nid',component:Purchase,props:true}, 
    {path:'/Note/:id',component:Note,meta:{keepAlive:true},props:true},
    {path:'/ShopDetails',component:ShopDetails,meta:{keepAlive:true}},
    {path:'/UserNote',component:UserNote,meta:{keepAlive:true}},
    {path:'/User',component:User,meta:{keepAlive:true}},
    //zj
    {path:'/chocity',component:ChoCity,meta:{keepAlive:true}},
    {path:'/index',component:Index,meta:{keepAlive:true}},
    {path:'/search',component:Search},
    {path:'/searchnotes',component:SearchNotes,name:"searchnotes"},
    {path:'/publish',component:Publish,meta:{keepAlive:true}},
    //qjd
    {path:"/Login",component:Login,meta:{keepAlive:true}},
    {path:"/Mine",component:Mine},
    {path:"/Myorder",component:Myorder,meta:{keepAlive:true}},
    {path:"/OrderDetails/:oid",component:OrderDetails,props:true,meta:{keepAlive:true}},
    {path:"/Reg",component:Reg,meta:{keepAlive:true}},
    //fhm
    {path:'/paysuc',component:paysuc},
    {path:'/pay',component:pay},
    {path:'/AccountSet',component:AccountSet,meta:{keepAlive:true}},
    // test
    // {path:'/note1',component:note1,meta:{keepAlive:true}}

  ]
})