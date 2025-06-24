-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: db_Flea_Market
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sh_address`
--

DROP TABLE IF EXISTS `sh_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人姓名',
  `consignee_phone` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人手机号',
  `province_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '市',
  `region_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '详细地址',
  `default_flag` tinyint NOT NULL COMMENT '是否默认地址',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_address`
--

LOCK TABLES `sh_address` WRITE;
/*!40000 ALTER TABLE `sh_address` DISABLE KEYS */;
INSERT INTO `sh_address` VALUES (30,'abc','17777777777','湖北省','武汉市','东西湖区','常青花园',1,11),(31,'gsj','18888888888','北京市','市辖区','西城区','朝阳小区',1,12),(32,'def','13111111111','山东省','济南市','长清区','山东师范大学',1,1),(33,'ghi','13101111111','山东省','济南市','长清区','山东师范大学',1,17),(34,'jkl','12011111111','山东省','济南市','长清区','齐鲁工业大学',0,17);
/*!40000 ALTER TABLE `sh_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_admin`
--

DROP TABLE IF EXISTS `sh_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '密码',
  `admin_name` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员名字',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_number` (`account_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_admin`
--

LOCK TABLES `sh_admin` WRITE;
/*!40000 ALTER TABLE `sh_admin` DISABLE KEYS */;
INSERT INTO `sh_admin` VALUES (1,'1000','yuqi20031104','喻齐');
/*!40000 ALTER TABLE `sh_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_favorite`
--

DROP TABLE IF EXISTS `sh_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `create_time` datetime NOT NULL COMMENT '加入收藏的时间',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`idle_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_favorite`
--

LOCK TABLES `sh_favorite` WRITE;
/*!40000 ALTER TABLE `sh_favorite` DISABLE KEYS */;
INSERT INTO `sh_favorite` VALUES (48,'2024-01-05 14:29:40',12,112),(49,'2024-05-14 13:18:08',1,109);
/*!40000 ALTER TABLE `sh_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_idle_item`
--

DROP TABLE IF EXISTS `sh_idle_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_idle_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `idle_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '闲置物名称',
  `idle_details` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '详情',
  `picture_list` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '图集',
  `idle_price` decimal(10,2) NOT NULL COMMENT '价格',
  `idle_place` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发货地区',
  `idle_label` int NOT NULL COMMENT '分类标签',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `idle_status` tinyint NOT NULL COMMENT '状态（发布1、下架2、删除0）',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_idle_item`
--

LOCK TABLES `sh_idle_item` WRITE;
/*!40000 ALTER TABLE `sh_idle_item` DISABLE KEYS */;
INSERT INTO `sh_idle_item` VALUES (105,'手机','书籍','[\"http://localhost:8080/image?imageName=file170446441929610041.jpg\",\"http://localhost:8080/image?imageName=file170446442439410052.jpg\"]',1900.00,'市辖区',1,'2024-01-05 14:20:26',0,11),(106,'电脑','电脑','[\"http://localhost:8080/image?imageName=file17044644744561006个人博客.jpg\"]',3000.00,'阳泉市',1,'2024-01-05 14:21:16',0,11),(107,'电视机','电视机','[\"http://localhost:8080/image?imageName=file17044645972761007电影.jpg\"]',5999.00,'长治市',2,'2024-01-05 14:23:19',0,11),(108,'空调','空调','[\"http://localhost:8080/image?imageName=file17044646299941008停车场.jpg\"]',1000.00,'景德镇市',2,'2024-01-05 14:23:51',0,11),(109,'历史书','历史书','[\"http://localhost:8080/image?imageName=file17044646674121009音乐.jpg\"]',20.00,'乌海市',4,'2024-01-05 14:24:33',0,11),(110,'帐篷','帐篷','[\"http://localhost:8080/image?imageName=file17044647092251010社团.jpg\"]',100.00,'秦皇岛市',3,'2024-01-05 14:25:22',0,11),(111,'自行车','自行车','[\"http://localhost:8080/image?imageName=file17044647567061011考试.jpg\"]',599.00,'市辖区',5,'2024-01-05 14:26:00',0,11),(112,'衣服','衣服','[\"http://localhost:8080/image?imageName=file17044647909181012图书馆.png\"]',199.00,'长治市',5,'2024-01-05 14:26:38',0,11),(113,'一个狗头','小狗小狗','[\"http://localhost:8080/image?imageName=file17156920091531003heade.jpg\"]',40.00,'济南市',5,'2024-05-14 13:06:51',0,1),(114,'测试','没啥','[]',30.00,'济南市',5,'2024-05-18 14:41:59',0,14),(115,'111','123','[]',30.00,'市辖区',1,'2024-05-18 15:19:01',0,15),(116,'纯牛奶','好喝爱喝多喝','[\"http://localhost:8080/image?imageName=file17162627394601002item03.jpeg\"]',30.00,'济南市',5,'2024-05-21 03:39:30',0,14),(117,'破烂手机','三手手机值得拥有','[\"http://localhost:8080/image?imageName=OIP-C (3).jpg\"]',999.00,'济南市',1,'2024-05-21 04:01:29',1,16),(118,'特仑苏纯牛奶','不是所有牛奶都叫特仑苏','[\"http://localhost:8080/image?imageName=OIP-C (4).jpg\"]',30.00,'济南市',5,'2024-05-21 04:02:17',1,16),(119,'Java入门基础','学Java 入门到炒粉','[\"http://localhost:8080/image?imageName=R-C.jpg\"]',30.00,'济南市',4,'2024-05-21 04:03:06',1,16),(120,'正版充电线','十分钟就满','[\"http://localhost:8080/image?imageName=13193999810_240364766.jpg\"]',10.00,'济南市',2,'2024-05-21 04:03:55',1,16),(121,'机械键盘','宿舍友好键','[\"http://localhost:8080/image?imageName=v2-0895f2647016963a509b7b2229f4cd47_r.jpg\"]',50.00,'济南市',1,'2024-05-21 05:06:34',1,17),(122,'价值书籍','看完你就能认清自己的价值','[\"http://localhost:8080/image?imageName=OIP-C (2).jpg\"]',30.00,'济南市',4,'2024-05-21 05:07:25',1,17),(123,'破旧保温杯','保温持续 23 小时','[\"http://localhost:8080/image?imageName=OIP-C (1).jpg\"]',40.00,'济南市',5,'2024-05-21 05:08:26',1,17),(124,'宠物狗粮','嘎嘎好吃 吃完不上火','[\"http://localhost:8080/image?imageName=OIP-C.jpg\"]',60.00,'济南市',5,'2024-05-21 05:10:15',2,17),(125,'户外必备乘凉椅','坐上它 嘎嘎睡','[\"http://localhost:8080/image?imageName=O1CN01pCu6Dh2I1YwfxTP2b_!!2630289226-0-cib.jpg\"]',20.00,'济南市',3,'2024-05-21 05:11:18',1,17);
/*!40000 ALTER TABLE `sh_idle_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_message`
--

DROP TABLE IF EXISTS `sh_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置主键id',
  `content` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '留言内容',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `to_user` bigint NOT NULL COMMENT '所回复的用户',
  `to_message` bigint DEFAULT NULL COMMENT '所回复的留言',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE,
  KEY `idle_id_index` (`idle_id`) USING BTREE,
  KEY `to_user_index` (`to_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_message`
--

LOCK TABLES `sh_message` WRITE;
/*!40000 ALTER TABLE `sh_message` DISABLE KEYS */;
INSERT INTO `sh_message` VALUES (48,11,112,'多少钱','2024-01-05 14:26:48',11,NULL),(49,11,111,'这个可以便宜点么？','2024-01-05 14:27:03',11,NULL),(50,11,111,'可以','2024-01-05 14:27:19',11,49),(51,11,107,'东西怎么买啊？人在哪？','2024-01-06 00:32:51',11,NULL),(52,11,105,'东西怎么买？','2024-01-06 00:33:54',11,NULL),(53,11,106,'可以 很帅','2024-05-14 12:53:56',11,NULL),(54,11,105,'少管我','2024-05-14 12:54:54',11,52),(55,1,113,'真的帅','2024-05-14 13:07:05',1,NULL),(56,1,113,'那是 也不看看是谁','2024-05-14 13:17:45',1,55),(57,14,113,'这么帅','2024-05-21 03:49:54',1,NULL),(58,14,113,'可以可以','2024-05-21 03:50:02',1,56),(59,14,116,'123123123','2024-05-21 03:55:43',14,NULL),(60,17,117,'用你这手机能变身吗','2024-05-21 04:06:36',16,NULL),(61,16,117,'那肯定啦 变身奥特曼','2024-05-21 04:07:30',17,60);
/*!40000 ALTER TABLE `sh_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_order`
--

DROP TABLE IF EXISTS `sh_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物品主键id',
  `order_price` decimal(10,2) NOT NULL COMMENT '订单总价',
  `payment_status` tinyint NOT NULL COMMENT '支付状态',
  `payment_way` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint NOT NULL COMMENT '订单状态',
  `is_deleted` tinyint DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_order`
--

LOCK TABLES `sh_order` WRITE;
/*!40000 ALTER TABLE `sh_order` DISABLE KEYS */;
INSERT INTO `sh_order` VALUES (90,'171626447762110002',17,117,999.00,1,'支付宝','2024-05-21 04:07:58','2024-05-21 04:09:03',3,NULL),(91,'175073328484110002',16,124,60.00,0,NULL,'2025-06-24 02:48:05',NULL,0,NULL);
/*!40000 ALTER TABLE `sh_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_order_address`
--

DROP TABLE IF EXISTS `sh_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_order_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `consignee_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '电话',
  `detail_address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `orderId` (`order_id`) USING BTREE,
  KEY `order_id_index` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_order_address`
--

LOCK TABLES `sh_order_address` WRITE;
/*!40000 ALTER TABLE `sh_order_address` DISABLE KEYS */;
INSERT INTO `sh_order_address` VALUES (21,86,'gsj','18888888888','北京市市辖区西城区朝阳小区'),(22,85,'gsj','18888888888','北京市市辖区西城区朝阳小区'),(23,88,'def','13111111111','山东省济南市长清区山东师范大学'),(24,89,'def','13111111111','山东省济南市长清区山东师范大学'),(25,90,'ghi','13101111111','山东省济南市长清区山东师范大学');
/*!40000 ALTER TABLE `sh_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_user`
--

DROP TABLE IF EXISTS `sh_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '账号（手机号）',
  `user_password` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '头像',
  `sign_in_time` datetime NOT NULL COMMENT '注册时间',
  `user_status` tinyint DEFAULT NULL COMMENT '状态（1代表封禁）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_number` (`account_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_user`
--

LOCK TABLES `sh_user` WRITE;
/*!40000 ALTER TABLE `sh_user` DISABLE KEYS */;
INSERT INTO `sh_user` VALUES (16,'001','123456','abc','http://localhost:8080/image?imageName=file17503340326261002OIP-C (5).jpg','2024-05-21 04:00:10',NULL),(17,'002','123456','def','https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png','2024-05-21 04:05:12',0);
/*!40000 ALTER TABLE `sh_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_Flea_Market'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24 10:57:35
