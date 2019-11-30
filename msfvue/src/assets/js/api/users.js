import axios from "axios";
import {baseURL} from "../config"
function users(value){
  return new Promise(
    function(resolve,reject){
      axios.get(baseURL+"/users/signin",value).then(result=>{
        resolve(result.data)
      }).catch(()=>{
        reject("请求失败")
      })
    }
  )
}
export {
  users
}