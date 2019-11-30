import { baseURL } from "../config"
import axios from "axios"

function myorder() {
    return new Promise(
        function(resolve, reject) {
            axios.get(baseURL + "/order/all")
                .then(res => {
                    resolve(res.data)
                })
                .catch(err => {
                    reject(err)
                })
        }
    )
}
export { myorder }