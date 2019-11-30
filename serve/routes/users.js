var express=require("express");
var router=express.Router();
var pool=require("../pool");
router.get("/signin",(req,res)=>{
  var {uname,upwd}=req.query;
  var sql="select * from msf_user where uname=? and upwd=?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    err&&console.log(err);
    if(result.length>0){
      req.session.uid=result[0].uid;
      var uid=req.session.uid;
      res.send({ok:1,uid});
    }else{
      res.send({ok:0,msg:"用户名或密码错误!"});
    }
  })
})
router.post("/reg",(req,res)=>{
  var {uname,upwd}=req.body;
  var sql="select * from msf_user where uname=?";
  pool.query(sql,[uname],(err,result)=>{
    if (err) throw err
    if(result.length>0){
      res.send({code:0,message:"账户已存在"});
      return;
    }else{
       sql=`insert into msf_user (uname,upwd) values(?,?)`;
       pool.query(sql,[uname,upwd],(err,result)=>{
          if(err)throw err
          res.send({code:1,message:"注册成功"})
    })
    }
  })
})

router.get("/aaa",(req,res)=>{
  console.log(1)
  res.send("1");
})


module.exports=router;