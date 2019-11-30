var express=require("express");
var router=express.Router();
var pool=require("../pool");

//显示所有笔记
router.get("/getnotes",(req,res)=>{
  var city=req.query.city;
  // var sql="select nid,npic,ntitle,user_id from msf_notes where ncity=?";
  // var sql="(SELECT nid,npic,ntitle,ncname,upic,user_id,uid,heart FROM msf_notes LEFT OUTER JOIN msf_user ON user_id=uid) UNION (SELECT nid,npic,ntitle,ncname,upic,user_id,uid,heart FROM msf_notes RIGHT OUTER JOIN msf_user ON user_id=uid)";
  var sql=`SELECT nid,npic,ntitle,ncname,upic,user_id,uid,heart FROM msf_notes_${city} JOIN msf_user ON user_id=uid`;
  // var sql="(select upic,ncname,nid,npic,ntitle from msf_notes left outer join msf_user on user_id=uid left outer join msf_like on nid=note_id) UNION (select upic,ncname,nid,npic,ntitle,note_id from msf_notes right outer join msf_user on user_id=uid right outer join msf_like on nid=note_id) group by note_id";
  // var sql="select count(note_id) as heart,note_id from msf_notes join msf_like on nid=note_id group by note_id order by note_id";
  // var sql="select count(note_id),note_id,nid,uid from msf_notes join msf_like on nid=note_id group by note_id join msf_user on user_id=uid";

  pool.query(sql,(err,result)=>{
    if(err)
      throw err;
    // res.send({
    //   code:1,
    //   msg:"查询成功",
    //   data:result
    // })
    res.send({
      code:1,
      msg:"查询成功",
      data:result})
    
  })
})

//显示笔记详情页
router.get("/ndetail",(req,res)=>{
  var nid=req.query.nid;
  var output={};
  pool.query("select * from msf_notes_hz where nid=?",[nid],(err,result)=>{
    if(err)
      throw err;
    output.ndetail=result;
    var uid=output.ndetail[0].user_id;
    var sid=output.ndetail[0].shop_id;
    pool.query("select uid,ncname,upic from msf_user where uid =?;select count(nid) as count from msf_notes_hz where user_id=?;select count(fid) as fans from msf_fans where up_id=?;select cdesc,user_name from msf_comment where note_id=?;select count(cid) as ccount from msf_comment where note_id=?;select user_upic from msf_like where note_id=?;select count(lid) as lcount from msf_like where note_id=?",[uid,uid,uid,nid,nid,nid,nid],(err,res2)=>{
      if(err)
        throw err;
      output.author=res2;
      // res.send({data2:output})
      pool.query("select sid,sname,scount,saddress,spic from msf_shop where sid=?",[sid],(err,res3)=>{
        if(err)
          throw err;
        output.shop=res3;
        res.send({
          data:output
        })
      })
    })
  })
})

//添加评论
router.get("/comment",(req,res)=>{
  var uid=req.session.uid;
  var nid=req.query.nid;
  var com=req.query.com;
  if(!uid){
    res.send({code:-1,msg:"请登录"});
    return;
  }
  pool.query("select ncname from msf_user where uid=?",[uid],(err,result)=>{
    if(err)
      throw err;
    // var ncname=result[0];
    res.send(result)
    // pool.query("insert into msf_comment(cdesc,note_id,user_id,user_name) value(?,?,?,?)",[com,nid,uid,ncname],(err,res)=>{
    //   if(err)
    //     throw err;
    //   if(res.affectedRows>0){
    //     res.send({
    //       code:200,
    //       msg:"comment suc"
    //     })
    //   }
      
    // })
  })
})

//搜索笔记
router.get("/searchnotes",(req,res)=>{
  var city=req.query.city;
  var key=req.query.key;
  var sql=`SELECT nid,npic,ntitle,uupic as upic,ucname as ncname,heart FROM msf_notes_${city} where ndesc like concat('%',?,'%')`;
  // var sql=`SELECT nid,npic,ntitle,user_id,ncname,upic,,uid,heart FROM msf_notes_${city} JOIN msf_user where user_id=uid and ndesc like concat('%',?,'%')`;
  pool.query(sql,[key],(err,result)=>{
    if(err)
      throw err;
    if(result.length>0){
      
      res.send({
        code:1,
        msg:"查询成功",
        data:result
      });
    }else{
      res.send({
        code:-1,
        msg:"未查询到"
      })
    }
  })
})
module.exports=router;