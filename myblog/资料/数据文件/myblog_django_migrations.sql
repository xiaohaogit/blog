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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-07-31 03:51:27.662677'),(2,'contenttypes','0002_remove_content_type_name','2020-07-31 03:51:27.851822'),(3,'auth','0001_initial','2020-07-31 03:51:28.054271'),(4,'auth','0002_alter_permission_name_max_length','2020-07-31 03:51:28.815838'),(5,'auth','0003_alter_user_email_max_length','2020-07-31 03:51:28.841214'),(6,'auth','0004_alter_user_username_opts','2020-07-31 03:51:28.868261'),(7,'auth','0005_alter_user_last_login_null','2020-07-31 03:51:28.883551'),(8,'auth','0006_require_contenttypes_0002','2020-07-31 03:51:28.906592'),(9,'auth','0007_alter_validators_add_error_messages','2020-07-31 03:51:28.924649'),(10,'auth','0008_alter_user_username_max_length','2020-07-31 03:51:28.942115'),(11,'auth','0009_alter_user_last_name_max_length','2020-07-31 03:51:28.950961'),(12,'auth','0010_alter_group_name_max_length','2020-07-31 03:51:29.117259'),(13,'auth','0011_update_proxy_permissions','2020-07-31 03:51:29.138008'),(14,'user','0001_initial','2020-07-31 03:51:29.276865'),(15,'admin','0001_initial','2020-07-31 03:51:29.903428'),(16,'admin','0002_logentry_remove_auto_add','2020-07-31 03:51:30.132038'),(17,'admin','0003_logentry_add_action_flag_choices','2020-07-31 03:51:30.169749'),(18,'content','0001_initial','2020-07-31 03:51:30.378876'),(19,'comment','0001_initial','2020-07-31 03:51:30.474095'),(20,'comment','0002_auto_20200731_1151','2020-07-31 03:51:30.596465'),(21,'config','0001_initial','2020-07-31 03:51:31.246308'),(22,'config','0002_auto_20200731_1151','2020-07-31 03:51:31.612362'),(23,'content','0002_auto_20200731_1151','2020-07-31 03:51:32.433345'),(24,'sessions','0001_initial','2020-07-31 03:51:33.490391'),(25,'xadmin','0001_initial','2020-07-31 03:51:33.773842'),(26,'xadmin','0002_log','2020-07-31 03:51:34.652192'),(27,'xadmin','0003_auto_20160715_0100','2020-07-31 03:51:35.194935'),(28,'config','0003_auto_20200731_1240','2020-07-31 04:40:36.151086'),(29,'content','0003_auto_20200731_1240','2020-07-31 04:40:36.166479'),(30,'config','0004_displaytype_created_time','2020-07-31 05:38:26.204627'),(31,'content','0004_auto_20200731_1337','2020-07-31 05:38:26.264911'),(32,'comment','0003_auto_20200731_1755','2020-07-31 09:55:31.217203'),(33,'content','0005_auto_20200731_1755','2020-07-31 09:55:31.250117'),(34,'comment','0004_remove_comment_post','2020-07-31 10:55:30.893681'),(35,'content','0006_auto_20200731_1855','2020-07-31 10:55:30.916621');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-30 18:18:23
