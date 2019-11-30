import axios from "axios";
import{baseURL} from "../config";
function msgload(){
  return new Promise(
    function(resolve,reject){
      axios.get(baseURL+"/Mine/umsg").then(res=>{
        resolve(res.data)
      })
      .catch(err=>{
        reject(err)
      })
    }
  )
}
export{msgload}