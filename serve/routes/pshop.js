var express=require("express");
var router=express.Router();
var pool=require("../pool");

router.get("/agentshop",(req,res)=>{

	pool.query("select * from msf_menu ",[],(err,result)=>{
		if(err) throw err;
		res.send({
			result,
		})
	})
})

router.get("/ashop_mid",(req,res)=>{
	var mid=req.query.mid;
	pool.query("select * from msf_menu where mid=?",[mid],(err,result)=>{
		if(err) throw err;
		res.send({
			result,
		})
	})
})

router.get("/allshop",(req,res)=>{
	var sql=`SELECT * FROM msf_menu JOIN msf_shop ON mshop_id=sid`
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({
			data:result
		})
	})
})


module.exports=router;