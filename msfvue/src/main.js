import Vue from 'vue'
import App from './App.vue'
import router from './router'
// 引入vue-lazyload
import lazyload from "vue-lazyload"
Vue.use(lazyload,
  {
  throttleWait:500,
  attempt:2,
  })
//引入vuex
import store from './store/index'
//#引入和配置mint-ui组件库
//1:完整引入mint-ui组件库
import MintUI from "mint-ui"
//2:单独引入mint-ui样式文件
import "mint-ui/lib/style.css"
//3:将mint-ui对象注册vue实例中
Vue.use(MintUI)
//4:引入字体图片样式文件
import "./font/iconfont.css"
import "./assets/mint-ui.styl"
//9.引入vantui
import Vant from 'vant';
import 'vant/lib/index.css';
Vue.use(Vant);

//main.js 脚手架
//5:引入第三方axios
import axios from "axios"
//6:配置访问服务器基础路径
axios.defaults.baseURL = "http://127.0.0.1:5050/"
//7:保存session 信息
//每次ajax访问服务器将session id
//发送服务器验证使用
axios.defaults.withCredentials = true
//8：将axiosz注册Vue实例中 注意配置不能配置在vue对象后面
Vue.prototype.axios = axios


new Vue({
  router,
  render: h => h(App),
  store
}).$mount('#app')
