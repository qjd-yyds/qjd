import axios from "axios"
import { baseURL } from "../config"
function myCollect() {
  return new Promise(
    function(resolve,reject){
      axios.get(baseURL+"/Mine/Collect").then(res=>{
        resolve(res.data);
      }).catch(err=>{
        reject(err)
      })
    }
  )
}
export{myCollect}