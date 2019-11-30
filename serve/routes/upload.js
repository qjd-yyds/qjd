// var express=require("express");
// var router=express.Router();
// var fs=require("fs");
// var pool=require("../pool");
// router.post('/img', function(req, res){
//   //接收前台POST过来的base64
//   var imgData = req.body.file;
//   //过滤data:URL
//   var base64Data = imgData;
//   var dataBuffer = new Buffer(base64Data, 'base64');
//   fs.writeFile("images/notes", dataBuffer, function(err) {
//       if(err){
//         res.send(err);
//       }else{
//         res.send("保存成功！");
//       }
//   });
// });
// module.exports=router;