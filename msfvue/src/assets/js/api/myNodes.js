import axios from "axios"
import { baseURL } from "../config"
function myNodes() {
  return new Promise(
    function(resolve,reject){
      axios.get(baseURL+"/Mine/Nodes").then(res=>{
        resolve(res.data);
      }).catch(err=>{
        reject(err)
      })
    }
  )
}
export{myNodes}