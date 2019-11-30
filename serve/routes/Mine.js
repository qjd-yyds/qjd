var express=require("express");
var router=express.Router();
var pool=require("../pool");
router.get("/umsg",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请登录"})
    return
  }
  var sql=`select * from msf_user where uid=?`
  pool.query(sql,[uid],(err,result)=>{
    err&&console.log(err);
    res.send(result);
  })
})
router.get("/Nodes",(req,res)=>{
  var uid=req.session.uid;
  var sql="select * from msf_notes_hz where user_id=?";
  pool.query(sql,[uid],(err,result)=>{
    err&&console.log(err);
    res.send(result)
  })
})
router.get("/Collect",(req,res)=>{
  var uid=req.session.uid;
  var sql="select nid,npic,ntitle,heart,ncname from msf_notes_hz join msf_user on user_id=uid";
  pool.query(sql,(err,result)=>{
    err&&console.log(err);
    res.send(result)
  })
})
router.get("/uplove",(req,res)=>{
  var {heart,nid} =req.query;
  var sql="update msf_notes_hz set heart=? where nid=?";
  pool.query(sql,[heart,nid],(err,result)=>{
    if(err)throw err;
    res.send(result);
  })
})
module.exports=router;