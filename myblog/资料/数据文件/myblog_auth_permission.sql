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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add 用户信息',1,'add_userprofile'),(2,'Can change 用户信息',1,'change_userprofile'),(3,'Can delete 用户信息',1,'delete_userprofile'),(4,'Can view 用户信息',1,'view_userprofile'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 评论',7,'add_comment'),(26,'Can change 评论',7,'change_comment'),(27,'Can delete 评论',7,'delete_comment'),(28,'Can view 评论',7,'view_comment'),(29,'Can add 侧边栏类型',8,'add_displaytype'),(30,'Can change 侧边栏类型',8,'change_displaytype'),(31,'Can delete 侧边栏类型',8,'delete_displaytype'),(32,'Can view 侧边栏类型',8,'view_displaytype'),(33,'Can add 友链',9,'add_link'),(34,'Can change 友链',9,'change_link'),(35,'Can delete 友链',9,'delete_link'),(36,'Can view 友链',9,'view_link'),(37,'Can add 侧边栏',10,'add_sidebar'),(38,'Can change 侧边栏',10,'change_sidebar'),(39,'Can delete 侧边栏',10,'delete_sidebar'),(40,'Can view 侧边栏',10,'view_sidebar'),(41,'Can add 分类',11,'add_category'),(42,'Can change 分类',11,'change_category'),(43,'Can delete 分类',11,'delete_category'),(44,'Can view 分类',11,'view_category'),(45,'Can add 文章',12,'add_post'),(46,'Can change 文章',12,'change_post'),(47,'Can delete 文章',12,'delete_post'),(48,'Can view 文章',12,'view_post'),(49,'Can add 标签',13,'add_tag'),(50,'Can change 标签',13,'change_tag'),(51,'Can delete 标签',13,'delete_tag'),(52,'Can view 标签',13,'view_tag'),(53,'Can add Bookmark',14,'add_bookmark'),(54,'Can change Bookmark',14,'change_bookmark'),(55,'Can delete Bookmark',14,'delete_bookmark'),(56,'Can view Bookmark',14,'view_bookmark'),(57,'Can add User Setting',15,'add_usersettings'),(58,'Can change User Setting',15,'change_usersettings'),(59,'Can delete User Setting',15,'delete_usersettings'),(60,'Can view User Setting',15,'view_usersettings'),(61,'Can add User Widget',16,'add_userwidget'),(62,'Can change User Widget',16,'change_userwidget'),(63,'Can delete User Widget',16,'delete_userwidget'),(64,'Can view User Widget',16,'view_userwidget'),(65,'Can add log entry',17,'add_log'),(66,'Can change log entry',17,'change_log'),(67,'Can delete log entry',17,'delete_log'),(68,'Can view log entry',17,'view_log');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-30 18:18:22
