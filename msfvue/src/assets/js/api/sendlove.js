import {baseURL} from "../config"
import axios from "axios"
function sendlove(value){
  return new Promise(function(resolve,reject){
    axios.get(baseURL+"/Mine/uplove",{params:value}).then(res=>{
      resolve(res.data)
    }).catch(err=>{
      reject(err)
    })
  })
}
export {sendlove}