import axios from "axios"
import { baseURL } from "../config"

function mydetails(obj) {
    console.log(obj)
    return new Promise(
        function(resolve, reject) {
            axios.get(baseURL + "/order/details", { params: obj })
                .then(res => {
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }
    )
}
export {
    mydetails
}