-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: myblog
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `content_post`
--

DROP TABLE IF EXISTS `content_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `desc` varchar(128) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `pv` int unsigned NOT NULL,
  `uv` int unsigned NOT NULL,
  `category_id` int NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_post_category_id_7271e3e6_fk_content_category_id` (`category_id`),
  KEY `content_post_owner_id_72662fce_fk_user_userprofile_id` (`owner_id`),
  CONSTRAINT `content_post_category_id_7271e3e6_fk_content_category_id` FOREIGN KEY (`category_id`) REFERENCES `content_category` (`id`),
  CONSTRAINT `content_post_owner_id_72662fce_fk_user_userprofile_id` FOREIGN KEY (`owner_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_post`
--

LOCK TABLES `content_post` WRITE;
/*!40000 ALTER TABLE `content_post` DISABLE KEYS */;
INSERT INTO `content_post` VALUES (1,1,'我是怎么学习python的','介绍小编学习python并找到工作的主要历程','2020-07-31 03:59:21.045743','<p><span style=\"font-size:16px;font-family:宋体\">Python略我千百遍，我待python如初恋。</span></p>',16,10,2,1),(2,1,'Django的xadmin','Django的一个第三方插件','2020-07-31 04:01:23.691149','<p><span style=\"font-size:16px;font-family:宋体\">xadmin在使用时报错: A server error occur.Please contact administration</span></p><p><span style=\"font-size:16px;font-family:宋体\">问题来源: model的__str__方法中返回了不存在字段&nbsp;</span></p><p><span style=\"font-size:16px;font-family:宋体\">另外在引用xadmin时，注意要使用url(r&#39;xadmin&#39;, xadmin.site.urls), 不要使用include进行路由的转发,如</span><span style=\"font-family: 宋体;\">url(r&#39;xadmin&#39;, include(xadmin.site.urls))</span></p><p><br/></p>',14,8,1,1),(3,1,'CSS的瀑布流布局','瀑布流布局是一种网页布局','2020-07-31 04:02:08.410338','<p><span style=\"font-size:16px;font-family:宋体\">&nbsp;&nbsp;&nbsp;&nbsp;瀑布流，又称瀑布流式布局。是比较流行的一种网站页面布局，视觉表现为参差不齐的多栏布局，随着页面滚动条向下滚动，这种布局还会不断加载数据块并附加至当前尾部。最早采用此布局的网站是Pinterest，逐渐在国内流行开来。国内大多数清新站基本为这类风格。</span></p>',12,9,3,1),(4,1,'Django的分页','为了数据更好的展示，分页机制举足轻重','2020-07-31 04:03:06.474402','<p><span style=\"font-size:16px;font-family:宋体\">Django自带分页机制</span></p><p><span style=\"font-size:16px;font-family:宋体\">swiper可以实现分页</span></p><p><span style=\"font-size:16px;font-family:宋体\">elementUI也可以实现分页</span></p>',10,7,1,1),(5,1,'Python虚拟环境的使用','讲述虚拟环境的使用以及注意事项','2020-07-31 04:03:56.617075','<p><span style=\"font-size:16px;font-family:宋体\">Python虚拟环境的使用Python虚拟环境的使用Python虚拟环境的使用讲述虚拟环境的使用以及注意事项</span></p><p><br/></p>',13,8,2,1),(6,1,'axios的使用','axios是vue的一个插件','2020-07-31 09:57:57.111160','<p><span style=\"font-size:16px;font-family:宋体\">安装npm install axios vue-axios</span></p><p><span style=\"font-size:16px;font-family:宋体\">axios是vue用来转发post,get等http请求的</span></p><p><span style=\"font-size:16px;font-family:宋体\">vue-axios是用来将axios绑定到vue实例上</span></p>',47,25,4,1);
/*!40000 ALTER TABLE `content_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-30 18:18:27
