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
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xadmin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_user_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `user_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2020-07-31 03:52:47.447232','127.0.0.1','1','Django','create','已添加。',11,1),(2,'2020-07-31 03:52:53.115800','127.0.0.1','2','Python','create','已添加。',11,1),(3,'2020-07-31 03:52:58.761719','127.0.0.1','3','CSS','create','已添加。',11,1),(4,'2020-07-31 03:53:06.025435','127.0.0.1','4','VUE','create','已添加。',11,1),(5,'2020-07-31 03:53:13.416930','127.0.0.1','1','前端','create','已添加。',13,1),(6,'2020-07-31 03:53:17.581486','127.0.0.1','2','后端','create','已添加。',13,1),(7,'2020-07-31 03:59:21.047743','127.0.0.1','1','我是怎么学习python的','create','已添加。',12,1),(8,'2020-07-31 04:01:23.700112','127.0.0.1','2','Django的xadmin','create','已添加。',12,1),(9,'2020-07-31 04:02:08.422434','127.0.0.1','3','CSS的瀑布流布局','create','已添加。',12,1),(10,'2020-07-31 04:03:06.476372','127.0.0.1','4','Django的分页','create','已添加。',12,1),(11,'2020-07-31 04:03:56.627736','127.0.0.1','5','Python虚拟环境的使用','create','已添加。',12,1),(12,'2020-07-31 04:04:43.759022','127.0.0.1','6','axios的使用','create','已添加。',12,1),(13,'2020-07-31 04:27:40.314280','127.0.0.1','1','最新文章','create','已添加。',8,1),(14,'2020-07-31 05:34:39.403263','127.0.0.1','2','最火文章','create','已添加。',8,1),(15,'2020-07-31 05:34:49.269910','127.0.0.1','3','最新评论','create','已添加。',8,1),(16,'2020-07-31 05:34:55.480906','127.0.0.1','1','最新文章','create','已添加。',10,1),(17,'2020-07-31 05:35:00.596824','127.0.0.1','2','最火文章','create','已添加。',10,1),(18,'2020-07-31 05:35:04.308721','127.0.0.1','3','最新评论','create','已添加。',10,1),(19,'2020-07-31 08:01:04.208020','127.0.0.1','2','热门排行','change','修改 type',8,1),(20,'2020-07-31 09:57:57.112143','127.0.0.1','6','axios的使用','change','修改 content',12,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-30 18:18:25
