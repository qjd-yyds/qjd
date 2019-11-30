import axios from "axios";
import {baseURL} from "../config"
function reg(value){
  return new Promise(
    function(resolve,reject){
      axios.post(baseURL+"/users/reg",value).then(result=>{
        resolve(result.data)
      }).catch(()=>{
        reject("请求失败")
      })
    }
  )
}
export {
  reg
}