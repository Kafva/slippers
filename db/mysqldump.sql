-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: slippers
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `slippers`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `slippers` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `slippers`;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `userId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`itemId`) USING BTREE,
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,243),(4,101),(4,214),(4,261);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `loginKey` text NOT NULL,
  `rank` int(1) NOT NULL,
  `banned` int(1) NOT NULL,
  `coins` int(11) NOT NULL,
  `buddies` text NOT NULL,
  `head` int(11) NOT NULL,
  `face` int(11) NOT NULL,
  `neck` int(11) NOT NULL,
  `body` int(11) NOT NULL,
  `hand` int(11) NOT NULL,
  `feet` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `photo` int(11) NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Zzz','$2b$14$FefGa9CH.AuaUsxGtNHYaO1ByTdOZ2Cx/OMAwXNhs6yCT9UjEHv22','EQa2pMHAYSFHbSV',2,0,9500,'[]',0,0,0,243,0,0,4,0,0),(2,'Blue','$2b$14$FefGa9CH.AuaUsxGtNHYaO1ByTdOZ2Cx/OMAwXNhs6yCT9UjEHv22','SeMBxfklcAQ3MTX',2,0,10000,'[]',0,0,0,0,0,0,1,0,0),(3,'Cyan','$2b$14$FefGa9CH.AuaUsxGtNHYaO1ByTdOZ2Cx/OMAwXNhs6yCT9UjEHv22','SeMBxfklcAQ3MTX',2,0,10000,'[]',0,0,0,0,0,0,12,0,0),(4,'Red','$2b$14$FefGa9CH.AuaUsxGtNHYaO1ByTdOZ2Cx/OMAwXNhs6yCT9UjEHv22','wGFXYqOgFrHZEqx',2,0,9100,'[]',0,101,214,261,0,0,5,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-13 19:29:12
