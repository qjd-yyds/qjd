var express = require("express");
var router = express.Router();
var pool = require("../pool")
router.get("/all", (req, res) => {
    var uid = req.session.uid;
    var sql = `select * from msf_order where user_id=?`
    pool.query(sql, [uid], (err, result) => {
        if (err) throw err;
        res.send(result)
    })
})
router.get("/details", (req, res) => {
    var { oid } = req.query;
    var sql = `select * from msf_order where oid=?`
    pool.query(sql, [oid], (err, result) => {
        if (err) throw err
        res.send(result)
    })
})
module.exports = router;