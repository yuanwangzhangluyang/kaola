#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库，如果存在的话
DROP DATABASE IF EXISTS kl;
#创建数据库，设置编码
CREATE DATABASE kl CHARSET=UTF8;
#进入创建的数据库
USE kl;


/**用户信息**/
CREATE TABLE kl_user(
  uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16) NOT NULL UNIQUE,
  avatar VARCHAR(128), #头像图片路径
  user_name VARCHAR(32),#用户名，如王小明
  gender INT #性别 0-女 1-男
);


/**收货地址信息**/
CREATE TABLE kl_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,			#用户编号
  receiver   VARCHAR(16),	#接收人姓名
  province   VARCHAR(16),	#省
  city	     VARCHAR(16),	#市
  county     VARCHAR(16),	#县
  address    VARCHAR(128),	#详细地址
  cellphone  VARCHAR(16),	#手机
  fixedphone VARCHAR(16),	#固定电话
  postcode   CHAR(6),		#邮编
  tag        VARCHAR(16),	#标签名
  is_default BOOLEAN		#是否为当前用户的默认收货地址
);


/**购物车条目**/
CREATE TABLE kl_shopping_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,			#用户编号
  product_id INT,	        #商品编号
  count INT			#购买数量
);


/**用户订单**/
CREATE TABLE kl_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE kl_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE kl_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/****首页商品****/
CREATE TABLE kl_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  details VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT
);

/*******************/
/******数据导入******/
/*******************/
/**用户信息**/
INSERT INTO kl_user VALUES(1,'dangdang','123456','123@163.com','13800000000',null,'王小明',1);
INSERT INTO kl_user VALUES(2,'dingding','111111','111@163.com','13811111111',null,'赵丽',0);
INSERT INTO kl_user VALUES(3,'yaya','222222','222@163.com','13822222222',null,'李白',1);
INSERT INTO kl_user VALUES(4,'lingling','333333','333@163.com','13833333333',null,'玲玲',0);
INSERT INTO kl_user VALUES(5,'dandan','444444','444@163.com','13855555555',null,'丹丹',0);


/**收货地址信息**/
INSERT INTO kl_user VALUES(1,000001,'丹丹','河南','郑州',null,'中原区桐柏路建设路美丽源小区','15511111111','0371-66666666','450000','丹丹',1);
INSERT INTO kl_user VALUES(2,000002,'玲玲','河南','郑州',null,'金水区东风路文化路小区','13300000000','0371-88888888','450000','玲玲',1);
INSERT INTO kl_user VALUES(3,000003,'明明','江苏','苏州',null,'吴中区江山路小区','15512345678','0572-11111111','000000','明明',1);
INSERT INTO kl_user VALUES(4,000004,'小刚','江苏','南京',null,'白山区大同路小区','15544444444','0371-12345678','000000','小刚',1;
INSERT INTO kl_user VALUES(5,000005,'李白','河南','郑州',null,'中原区福牛路小区','15533333333','0371-77777777','450000','李白',1);


/**购物车条目**/
INSERT INTO kl_user VALUES(1,000001,123456,1);
INSERT INTO kl_user VALUES(2,000002,789456,2);
INSERT INTO kl_user VALUES(3,000003,234567,1);
INSERT INTO kl_user VALUES(4,000004,456852,5);
INSERT INTO kl_user VALUES(5,000005,321564,3);