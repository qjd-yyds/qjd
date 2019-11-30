const express=require("express");
const cors=require("cors");
const session=require("express-session")
const bodyParser = require('body-parser');
// 引入路由模块
var users=require("./routes/users");
var notes=require("./routes/notes");
var mine=require("./routes/Mine");
var order=require("./routes/order");
var pshop=require("./routes/pshop");
// var up=require("./routes/upload")
// 创建服务器
var app=express();
app.use(
  cors({
    origin:['http://localhost:8080',"http://127.0.0.1:8080"],
    credentials:true
  })
)
app.use(session({
  secret:"128位安全字符串",
  resave:true,         //请求更新数据 
  saveUninitialized:true,//保存初始数据
  // cookie:{maxAge:60*1000*30},//过期时间ms
}))
app.listen(5050);
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
app.use(express.static('public'));

// 使用路由器来管理路由
app.use("/users",users);
app.use("/notes",notes);
app.use("/mine",mine);
app.use("/order",order);
app.use("/pshop",pshop);
// app.use("/up",up)