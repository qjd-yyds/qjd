SET NAMES UTF8;
DROP DATABASE IF EXISTS msf;
CREATE DATABASE msf CHARSET=UTF8;
USE msf;
/**用户信息**/
CREATE TABLE msf_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),#用户名
  upwd VARCHAR(32), #密码
  ubirthday DATE default '1999-11-11', #生日
  uphone VARCHAR(32) default '暂无', #电话
  upic VARCHAR(128) default 'images/user/avatar1.jpg',   #头像
  ncname VARCHAR(32) default '一个用户', #昵称
  usex bool default 1 , #性别    
  udesc VARCHAR(32) default '这个人很懒,暂时没留下笔记' #描述    
  );
  
/**插入用户信息**/
INSERT INTO msf_user VALUES(NULL,'qian1234','123456','1995-7-3','13567821774','images/user/avatar1.jpg','三墩镇最靓的仔',1,DEFAULT);
INSERT INTO msf_user VALUES(NULL,'zhou1234','123456','1995-9-12','13764855675','images/user/avatar2.jpg','油炸少女嘎吱脆',2,DEFAULT);
INSERT INTO msf_user VALUES(NULL,'fu1234','123456','1993-11-5','17936542890','images/user/avatar3.jpg','林琳绫Are one',2,DEFAULT);
INSERT INTO msf_user VALUES(NULL,'huang1234','123456','1997-8-13','13528746995','images/user/avatar4.jpg','傻小豆',1,DEFAULT);
INSERT INTO msf_user VALUES(NULL,'yan1234', '123456', '1996-5-15','15463284222','images/user/avatar5.jpg','烟火emmy',DEFAULT,DEFAULT);
INSERT INTO msf_user VALUES(NULL,'jiang1234','123456','1998-4-1','15463284222','images/user/avatar6.jpg','一不将就',DEFAULT,DEFAULT);
/**创建店铺表**/
CREATE TABLE msf_shop(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  sname VARCHAR(128),#店铺名称
  scount INT, #相关笔记数
  saddress VARCHAR(128), #店铺地址
  stype VARCHAR(128), #店铺类型(火锅/西餐/中餐/烧烤)
  scity VARCHAR(128), #店铺城市
  spic VARCHAR(128) #店铺头像
);
INSERT INTO msf_shop VALUES(NULL,'外婆湾·淳安外婆的记忆和味道(临湖总店)','1','(千岛湖)千岛湖镇新安大街19-16号','中餐','杭州','images/shop/shop1.jpg');
INSERT INTO msf_shop VALUES(NULL,'乡佳米糕(二圣庙前店)','4','杭州市下城区二圣庙前52-1号','休闲美食','杭州','images/shop/shop2.jpg');
INSERT INTO msf_shop VALUES(NULL,'老头儿油爆虾(萧山店)','8','市心中路288号银隆百货商场3楼','烧烤','杭州','images/shop/shop3.jpg');
INSERT INTO msf_shop VALUES(NULL,'橱创东北老家(信义坊店)','1','信义坊商街25-26号','中餐','杭州','images/shop/shop4.jpg');
INSERT INTO msf_shop VALUES(NULL,'一品轩·东坡家宴(湖滨店)','2','上城区延安路229号','中餐','杭州','images/shop/shop5.jpg');
INSERT INTO msf_shop VALUES(NULL,'秋风红菜精致寿司(临平银泰店)','2','迎宾路世纪大道100号临平映泰负一楼B13B','休闲美食','杭州','images/shop/shop6.jpg');
INSERT INTO msf_shop VALUES(NULL,'湘之荷品质湘菜(莫干山路店)','4','杭州市莫干山54号迎新版饭店内(省广电斜对面)','中餐','杭州','images/shop/shop7.jpg');
/*菜单店铺分割线*/
INSERT INTO msf_shop VALUES(NULL,'名港海鲜网红火锅(黄姑山店)','2','杭州市黄姑山路48号','火锅','杭州','images/shop/shop8.jpg');
INSERT INTO msf_shop VALUES(NULL,'鸟语花香餐厅(曙光路)','1','西湖区曙光路150-1号','中餐','杭州','images/shop/shop9.jpg');
INSERT INTO msf_shop VALUES(NULL,'两岸咖啡(曙光路店)','3','西湖区曙光路71号','休闲美食','杭州','images/shop/shop10.jpg');
INSERT INTO msf_shop VALUES(NULL,'馍家(西溪银泰店)','2','弘德路与余杭塘路交叉口西溪银泰VF茶马花街','中餐','杭州','imagesimages//shop/shop11.jpg');
INSERT INTO msf_shop VALUES(NULL,'九样儿烧烤(武林路店)','4','武林路163号西湖D11时尚城二楼206','烧烤','杭州','images//shop/shop12.jpg');
INSERT INTO msf_shop VALUES(NULL,'墩上村(汇和城店)','1','江干区新风路619号汇合城1L','中餐','杭州','images/shop/shop13.jpg');
/** 创建美食记录表notes**/
CREATE TABLE msf_notes_hz(
  nid INT PRIMARY KEY AUTO_INCREMENT,
  npic VARCHAR(128),#主图片路径
  ntitle VARCHAR(128), #标题
  ndesc VARCHAR(300), #描述
  ratings INT, #推荐指数
  ntime VARCHAR(128), #发布时间
  user_id INT(32), #发布者id
  uupic VARCHAR(128),#用户头像路径
  ucname VARCHAR(32),#用户昵称
  shop_id INT(64), #店铺id
  ncity VARCHAR(4), #城市
  heart INT(32),#点赞数
  ncar1 VARCHAR(128), #笔记轮播图
  ncar2 VARCHAR(128), #笔记轮播图
  ncar3 VARCHAR(128), #笔记轮播图
  ncar4 VARCHAR(128), #笔记轮播图
  ncar5 VARCHAR(128), #笔记轮播图 
  FOREIGN KEY(user_id) REFERENCES msf_user(uid),
  FOREIGN KEY(shop_id) REFERENCES msf_shop(sid)
);
INSERT INTO msf_notes_hz VALUES(NULL,'images/notes/npic1.jpg','是当地外婆家的味道吗?','点完菜很快就上了第一份拍黄瓜，,又叫了一份东坡肉，杭州卤鸭，西湖藕韵， 随着全体帅气小哥齐呼：外婆给您上叫花鸡了，小哥端上了叫花鸡，还有开锤仪式，一锤、二锤、三锤，每敲一锤都送一声不同的祝福。 叫花鸡，杭帮冷菜拼盘（各种单价西湖藕韵16、香干马兰头12、素烧鸭12、西山子凉粉8）30元。 马蹄响铃（豆腐皮20克、肉沬10克）12元 西山施豆腐（3元）经济实惠又好吃，当然是吃一次点一次了。',4,'2019-11-25',1,'images/user/avatar1.jpg','三墩镇最靓的仔',1,'杭州',4,'images/notes/ncar/ncar1/ncar1.jpg','images/notes/ncar/ncar1/ncar2.jpg','images/notes/ncar/ncar1/ncar3.jpg','images/notes/ncar/ncar1/ncar4.jpg','images/notes/ncar/ncar1/ncar5.jpg');
INSERT INTO msf_notes_hz VALUES(NULL,'images/notes/npic2.jpg','喜欢乡佳,是应为叫出来的米香骗不了人呀!','最近新发现的「乡佳米糕」,简直就是糯米甜食控的天堂啊！这家米糕店，尽管藏在很深的小巷子里不显眼，但因为实在好吃，才刚开一个多月，像美食菌这样的资深吃货早已来了一茬又一茬。我们南方人向来爱吃糯糯的甜食，所以对它的品质可是真挑。',3,'2019-11-25',1,'images/user/avatar1.jpg','三墩镇最靓的仔',2,'杭州',5,'images/notes/ncar/ncar1/ncar1.jpg','images/notes/ncar/ncar1/ncar2.jpg','images/notes/ncar/ncar1/ncar3.jpg','images/notes/ncar/ncar1/ncar4.jpg','images/notes/ncar/ncar1/ncar5.jpg');
INSERT INTO msf_notes_hz VALUES(NULL,'images/notes/npic3.jpg','百吃不厌爱你千遍的油爆虾','西湖藕韵口感甜糯、糖醋里脊酸甜适中、老头儿油爆沼虾酥脆可口，酱爆茄子、邬山腐皮白菜味道也不错。尤其值得一提的是宋嫂鱼羹，味道远胜我前一晚在其他地方吃的，那家做的居然是酸味的。如果不是这位朋友，我恐怕要带着对宋嫂鱼羹的误解离开杭州。餐厅的服务也很好，会询问每桌顾客对菜品的意见。',5,'2019-11-26',1,'images/user/avatar1.jpg','三墩镇最靓的仔',3,'杭州',5,'images/notes/ncar/ncar1/ncar1.jpg','images/notes/ncar/ncar1/ncar2.jpg','images/notes/ncar/ncar1/ncar3.jpg','images/notes/ncar/ncar1/ncar4.jpg','images/notes/ncar/ncar1/ncar5.jpg');
INSERT INTO msf_notes_hz VALUES(NULL,'images/notes/npic4.jpg','这家东北菜正宗吗?','临时找了一家吃东北菜!在信义坊的一侧,还是比较好找的~首先上了个[橱创大拉皮],皮很有韧性,有点像宽的番薯粉,个人不是很喜欢这个粉,有点南郊,味道有点像拌的两旁![小鸡炖蘑菇]这个菜里也有番薯粉丝,不辣,小孩子可以吃,但是鸡肉味一般,肉质有松散,应该是冷冻鸡肉![水煮肉片]和[羊肉串]最满意!只要这个两个菜没有让我失望!环境装修灯光有点偏暗!服务并没有特别要求也很好!只是有人看我拍照看不习惯!大家可以尝试,但是并不推荐',3,'2019-11-27',2,'images/user/avatar2.jpg','油炸少女嘎吱脆',4,'杭州',5,'images/notes/ncar/ncar1/ncar1.jpg','images/notes/ncar/ncar1/ncar2.jpg','images/notes/ncar/ncar1/ncar3.jpg','images/notes/ncar/ncar1/ncar4.jpg','images/notes/ncar/ncar1/ncar5.jpg');
INSERT INTO msf_notes_hz VALUES(NULL,'images/notes/npic5.jpg','可以靠湖看风景?','桃花酿:有种丹丹的香味,反正喝了也不会醉.海带:好吃!炒豆干:有点咸!虾仁:好吃!很清爽的一道菜,上面裹了淀粉还是啥的,我决的是有点多余了.鲈鱼:才上来的时候有点凉,所以我对这道菜的印象不深很好,味道很淡.糕:看起来很好吃,吃的也还行,精致.汤:味道怪,不好喝',4,'2019-11-19',3,'images/user/avatar3.jpg','林琳绫Are one',5,'杭州',0,'images/notes/ncar/ncar1/ncar1.jpg','images/notes/ncar/ncar1/ncar2.jpg','images/notes/ncar/ncar1/ncar3.jpg','images/notes/ncar/ncar1/ncar4.jpg','images/notes/ncar/ncar1/ncar5.jpg');
INSERT INTO msf_notes_hz VALUES(NULL,'images/notes/npic6.jpg','慢慢内陷的吐司来喽','“委身”于筼筜湖边上的别墅区，独立一栋别墅显得高端大气！乘上电梯，带你进入不一样的体验。开放式的厨房，围桌体验，比较直观。 称寿司为“巅”，可见主打寿司已经到了巅峰境界。每一款寿司都是师傅现做的，师傅很贴心的询问口味，酱油芥末是否适合个人口味。精致的前菜上桌之后，现做的各式各样的寿司征服了我的胃，紧接着味增汤和餐后水果收尾，很有仪式感的一餐！高端又大气！',4,'2019-11-18',3,'images/user/avatar3.jpg','林琳绫Are one',6,'杭州',0,'images/notes/ncar/ncar1/ncar1.jpg','images/notes/ncar/ncar1/ncar2.jpg','images/notes/ncar/ncar1/ncar3.jpg','images/notes/ncar/ncar1/ncar4.jpg','images/notes/ncar/ncar1/ncar5.jpg');
INSERT INTO msf_notes_hz VALUES(NULL,'images/notes/npic7.jpg','好吃的湘菜,很过瘾','​​湘之荷，初看名字就仿佛有荷香袅袅而至。作为一个无辣不欢的湖北妹纸，虽已在杭6年，却心心念念惦记着那一口舌尖上的香辣。之前都是去川菜馆解馋，第一次拔草湘菜馆，竟然有大惊喜。餐厅环境雅致，人均大概150, ​我和朋友一共点了6个菜，都非常不错。土味烧牛蛙是被朋友安利的，但我们去的时候没有了，换成了酸汤烧牛蛙，想不到竟然也鲜美无比。剁椒芳香浓郁，经过熬煮让汤水黄澄澄一片，牛蛙吸饱了汤汁，酸酸辣辣的味道能轻易把人的胃口瞬间打开，夹起一筷子送入嘴里，刺激味蕾又嫩滑无比，能满足人所有的味觉体验。',4,'2019-11-23',1,'images/user/avatar1.jpg','三墩镇最靓的仔',7,'杭州',0,'images/notes/ncar/ncar1/ncar1.jpg','images/notes/ncar/ncar1/ncar2.jpg','images/notes/ncar/ncar1/ncar3.jpg','images/notes/ncar/ncar1/ncar4.jpg','images/notes/ncar/ncar1/ncar5.jpg');
/**创建评论表comment**/
CREATE TABLE msf_comment(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cdesc VARCHAR(128),#评论
  note_id INT, #笔记id
  user_id INT, #评论者用户id
  user_name VARCHAR(128), #评论者用户名
  FOREIGN KEY(note_id) REFERENCES msf_notes_hz(nid),
  FOREIGN KEY(user_id) REFERENCES msf_user(uid)
);
INSERT INTO msf_comment VALUES(NULL,'可以尝尝,嘿嘿',1,6,'一不将就');
INSERT INTO msf_comment VALUES(NULL,'互关注互点赞互收藏鸭!~',1,5,'烟火emmy');
INSERT INTO msf_comment VALUES(NULL,'谢谢分享',2,4,'傻小豆');
INSERT INTO msf_comment VALUES(NULL,'种草!',2,3,'林琳绫Are one');
INSERT INTO msf_comment VALUES(NULL,'不错哦',3,2,'油炸少女嘎吱脆');
INSERT INTO msf_comment VALUES(NULL,'ok',3,1,'三墩镇最靓的仔');
INSERT INTO msf_comment VALUES(NULL,'吃吃吃!',4,6,'一不将就');
INSERT INTO msf_comment VALUES(NULL,'赞',4,5,'烟火emmy');
/**创建点赞表**/
CREATE TABLE msf_like(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,#评论者id
  user_upic VARCHAR(128),   #点赞用户头像
  note_id INT, #笔记id
  status BOOL,
  FOREIGN KEY(user_id) REFERENCES msf_user(uid),
  FOREIGN KEY(note_id) REFERENCES msf_notes_hz(nid)
);
INSERT INTO msf_like VALUES(NULL,1,'images/user/avatar1.jpg',1,true);
INSERT INTO msf_like VALUES(NULL,2,'images/user/avatar2.jpg',1,true);
INSERT INTO msf_like VALUES(NULL,3,'images/user/avatar3.jpg',1,true);
INSERT INTO msf_like VALUES(NULL,4,'images/user/avatar4.jpg',1,true);
INSERT INTO msf_like VALUES(NULL,5,'images/user/avatar5.jpg',2,true);
INSERT INTO msf_like VALUES(NULL,6,'images/user/avatar6.jpg',2,true);
INSERT INTO msf_like VALUES(NULL,1,'images/user/avatar1.jpg',2,true);
INSERT INTO msf_like VALUES(NULL,2,'images/user/avatar2.jpg',2,true);
INSERT INTO msf_like VALUES(NULL,3,'images/user/avatar3.jpg',2,true);
INSERT INTO msf_like VALUES(NULL,4,'images/user/avatar4.jpg',3,true);
INSERT INTO msf_like VALUES(NULL,5,'images/user/avatar5.jpg',3,true);
INSERT INTO msf_like VALUES(NULL,6,'images/user/avatar6.jpg',3,true);
INSERT INTO msf_like VALUES(NULL,3,'images/user/avatar3.jpg',3,true);
INSERT INTO msf_like VALUES(NULL,2,'images/user/avatar2.jpg',3,true);
INSERT INTO msf_like VALUES(NULL,1,'images/user/avatar1.jpg',4,true);
INSERT INTO msf_like VALUES(NULL,2,'images/user/avatar2.jpg',4,true);
INSERT INTO msf_like VALUES(NULL,4,'images/user/avatar4.jpg',4,true);
INSERT INTO msf_like VALUES(NULL,5,'images/user/avatar5.jpg',4,true);
INSERT INTO msf_like VALUES(NULL,6,'images/user/avatar6.jpg',4,true);
/**创建菜单**/
CREATE TABLE msf_menu(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  mtitle VARCHAR(128),#菜单标题
  mshop VARCHAR(128), #菜单店铺
  mprice DECIMAL(4,2), #原价
  moprice DECIMAL(4,2), #打折后价格
  mpic VARCHAR(128), #菜单图片
  mshop_id INT,#菜单对应店铺id 外键
  mlist1 VARCHAR(128),#菜单菜品
  mlist2 VARCHAR(128),#菜单菜品
  mlist3 VARCHAR(128),#菜单菜品
  mlist4 VARCHAR(128),#菜单菜品
  mlistp1 VARCHAR(128), #菜单菜品价格(与菜品对应)
  mlistp2 VARCHAR(128), #菜单菜品价格(与菜品对应)
  mlistp3 VARCHAR(128), #菜单菜品价格(与菜品对应)
  mlistp4 VARCHAR(128), #菜单菜品价格(与菜品对应)
  mcar1 VARCHAR(128), #菜单轮播图
  mcar2 VARCHAR(128), #菜单轮播图
  mcar3 VARCHAR(128), #菜单轮播图
  mcar4 VARCHAR(128), #菜单轮播图
  mcar5 VARCHAR(128), #菜单轮播图
  mtype VARCHAR(128),#店铺类型(火锅/西餐/中餐/烧烤)
  FOREIGN KEY(mshop_id) REFERENCES msf_shop(sid)
);
INSERT INTO msf_menu VALUES(NULL,'[2-3人餐]打卡圣地-名港海鲜网红火锅','名港海鲜网红火锅(黄姑山店)','97.00','31.90','images/menu/menu1.jpg',8,'红烧鸡块','淡菜葱油','炒时蔬','米饭×3份','45','28','18','6','images/menu/carousel1/mcar1.jpg','images/menu/carousel1/mcar2.jpg','images/menu/carousel1/mcar3.jpg','images/menu/carousel1/mcar4.jpg','images/menu/carousel1/mcar5.jpg','火锅');
INSERT INTO msf_menu VALUES(NULL,'[双人盛宴]桃红柳绿·莺啼燕语·鸟语花香(该活动不可延期)','鸟语花香餐厅(曙光路)','112.00','97.76','images/menu/menu2.jpg',9,'明虾','生蚝','花蛤','望海资助调味料','70','30','10','12','images/menu/carousel2/mcar1.jpg','images/menu/carousel2/mcar2.jpg','images/menu/carousel2/mcar3.jpg','images/menu/carousel2/mcar4.jpg','images/menu/carousel2/mcar5.jpg','火锅');
INSERT INTO msf_menu VALUES(NULL,'[单人盛宴]新品上市·匠心西餐16年(提前一天预约)','两岸咖啡(曙光路店)','192.00','33.40','images/menu/menu3.jpg',10,'葡萄柚果咖','台湾凤梨果咖','台湾柳丁茉莉花茶','冰爽杨梅汁',48,48,48,48,'images/menu/carousel3/mcar1.jpg','images/menu/carousel3/mcar2.jpg','images/menu/carousel3/mcar3.jpg','images/menu/carousel3/mcar4.jpg','images/menu/carousel3/mcar5.jpg','中餐');
INSERT INTO msf_menu VALUES(NULL,'[双人套餐]馍家·大西北的味道','馍家(西溪银泰店)','52.00','14.89','images/menu/menu4.jpg',11,'红柚凉皮','招牌油泼面','招牌肉夹馍','有机小米粥',12,19,10,6,'images/menu/carousel4/mcar1.jpg','images/menu/carousel4/mcar2.jpg','images/menu/carousel4/mcar3.jpg','images/menu/carousel4/mcar4.jpg','images/menu/carousel4/mcar5.jpg','中餐');
INSERT INTO msf_menu VALUES(NULL,'[双人套餐]串烧圣地·精致双人餐','九样儿烧烤(武林路店)','110.00','37.32','images/menu/menu5.jpg',12,'特色肥牛/特色五花肉二选一','会长大的烤肠','烤鸡翅','粉丝娃娃菜',58.00,16.00,20.00,16.00,'images/menu/carousel5/mcar1.jpg','images/menu/carousel5/mcar2.jpg','images/menu/carousel5/mcar3.jpg','images/menu/carousel5/mcar4.jpg','images/menu/carousel5/mcar5.jpg','烧烤');
INSERT INTO msf_menu VALUES(NULL,'[双人套餐]与你相约·品弄家惬意','墩上村(汇和城店)','96.00','28.00','images/menu/menu6.jpg',13,'铁锅杂鱼','衢州爆炒肉','蒜泥油麦菜','米饭×2份',48.00,28.00,16.00,4.00,'images/menu/carousel6/mcar1.jpg','images/menu/carousel6/mcar2.jpg','images/menu/carousel6/mcar3.jpg','images/menu/carousel6/mcar4.jpg','images/menu/carousel6/mcar5.jpg','中餐');

/**创建订单表**/
CREATE TABLE msf_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  otitle VARCHAR(128),#订单标题
  oshop VARCHAR(128), #订单店铺
  opic VARCHAR(128), #订单图片
  oprice DECIMAL(4,2), #订单价格
  otime DATE, #订单时间
  olive  VARCHAR(128),#订单有效天数
  onumber VARCHAR(16),#订单号
  user_id  INT, #购买订单用户id【外键】
  FOREIGN KEY(user_id) REFERENCES msf_user(uid)
);
INSERT INTO msf_order VALUES(NULL,'[双人套餐]与你相约·品弄家惬意','墩上村(汇和城店)','images/menu/menu6.jpg',28.00,'2019-12-7',5,1573718098900041,1);
INSERT INTO msf_order VALUES(NULL,'[双人套餐]馍家·大西北的味道','馍家(西溪银泰店)','images/menu/menu4.jpg',52.00,'2019-12-8',5,1574814584874125,1);
INSERT INTO msf_order VALUES(NULL,'[双人套餐]串烧圣地·精致双人餐','九样儿烧烤(武林路店)','images/menu/menu5.jpg',28.00,'2019-12-10',5,4154821857515484,1);

/** 创建用户粉丝表 **/
CREATE TABLE msf_fans(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  up_id  INT, #用户id【外键】
  fan_id INT, #用户粉丝id【外键】,
  status BOOL,
  FOREIGN KEY(up_id) REFERENCES msf_user(uid),
  FOREIGN KEY(fan_id) REFERENCES msf_user(uid)
);
INSERT INTO msf_fans VALUES(NULL,1,2,1);
INSERT INTO msf_fans VALUES(NULL,1,3,1);
INSERT INTO msf_fans VALUES(NULL,1,4,1);
INSERT INTO msf_fans VALUES(NULL,2,1,1);
INSERT INTO msf_fans VALUES(NULL,2,6,1);
INSERT INTO msf_fans VALUES(NULL,3,2,1);
INSERT INTO msf_fans VALUES(NULL,3,5,1);
INSERT INTO msf_fans VALUES(NULL,3,6,1);
INSERT INTO msf_fans VALUES(NULL,4,1,1);
INSERT INTO msf_fans VALUES(NULL,4,2,1);
INSERT INTO msf_fans VALUES(NULL,4,3,1);
INSERT INTO msf_fans VALUES(NULL,5,2,1);
INSERT INTO msf_fans VALUES(NULL,5,3,1);
INSERT INTO msf_fans VALUES(NULL,6,2,1);
INSERT INTO msf_fans VALUES(NULL,6,3,1);
INSERT INTO msf_fans VALUES(NULL,6,5,1);













