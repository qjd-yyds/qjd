import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    city:"杭州",
    val:"hz"
  },
  mutations: {
    changeCity1(state,newcity){
      state.city=newcity;
      
    },
    changeVal1(state,nval){
      state.val=nval;
    }
  },
  getters:{
    getCity(state){
      return state.city;
    },
    getVal(state){
      return state.val;
    }
  },
  actions: {
    
  },
  modules: {
  }
})
