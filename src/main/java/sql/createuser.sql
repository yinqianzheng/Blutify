-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: blue
-- ------------------------------------------------------
-- Server version	5.7.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CreditCard`
--

DROP TABLE IF EXISTS `CreditCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CreditCard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HolderId` int(11) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `CreditCardNumber` varchar(45) DEFAULT NULL,
  `ExpirtationDate` varchar(45) DEFAULT NULL,
  `CVS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `HolderId` (`HolderId`),
  CONSTRAINT `creditcard_ibfk_1` FOREIGN KEY (`HolderId`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CreditCard`
--

LOCK TABLES `CreditCard` WRITE;
/*!40000 ALTER TABLE `CreditCard` DISABLE KEYS */;
INSERT INTO `CreditCard` VALUES (100,1,'qian','qian','1122334455','01/19',111);
/*!40000 ALTER TABLE `CreditCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manager`
--

DROP TABLE IF EXISTS `Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manager`
--

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;
INSERT INTO `Manager` VALUES (12,'manager1','222','222@222.com');
/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AlbumName` varchar(45) DEFAULT NULL,
  `CreatedTime` date DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `ArtistId` int(11) DEFAULT NULL,
  `NumOfLike` int(11) DEFAULT NULL,
  `CurrentSong` int(11) DEFAULT NULL,
  `LikedCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `CreatedBy` (`CreatedBy`),
  KEY `ArtistId` (`ArtistId`),
  KEY `CurrentSong` (`CurrentSong`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `album_ibfk_2` FOREIGN KEY (`ArtistId`) REFERENCES `artist` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `album_ibfk_3` FOREIGN KEY (`CurrentSong`) REFERENCES `song` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (32,'albume1',NULL,NULL,13,13,3,NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ArtistName` varchar(45) DEFAULT NULL,
  `BirthDay` date DEFAULT NULL,
  `Biography` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (13,'rebort',NULL,NULL);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistAlbum`
--

DROP TABLE IF EXISTS `artistAlbum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artistAlbum` (
  `artistId` int(11) NOT NULL,
  `albumId` int(11) NOT NULL,
  PRIMARY KEY (`artistId`,`albumId`),
  KEY `albumId_idx` (`albumId`),
  CONSTRAINT `albumId` FOREIGN KEY (`albumId`) REFERENCES `album` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `artistId` FOREIGN KEY (`artistId`) REFERENCES `artist` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistAlbum`
--

LOCK TABLES `artistAlbum` WRITE;
/*!40000 ALTER TABLE `artistAlbum` DISABLE KEYS */;
/*!40000 ALTER TABLE `artistAlbum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `commentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PlaylistName` varchar(45) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `CreatedDate` date DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `NumOfLike` int(11) DEFAULT NULL,
  `CurrentSong` int(11) DEFAULT NULL,
  `LikedCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (11,'playlist1',31,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlistSong`
--

DROP TABLE IF EXISTS `playlistSong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlistSong` (
  `plId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  PRIMARY KEY (`plId`,`songId`),
  KEY `SongId_idx` (`songId`),
  CONSTRAINT `SongId` FOREIGN KEY (`songId`) REFERENCES `song` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `plId` FOREIGN KEY (`plId`) REFERENCES `playlist` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlistSong`
--

LOCK TABLES `playlistSong` WRITE;
/*!40000 ALTER TABLE `playlistSong` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlistSong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SongName` varchar(45) DEFAULT NULL,
  `SongType` varchar(45) DEFAULT NULL,
  `ArtistId` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ArtistId` (`ArtistId`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`ArtistId`) REFERENCES `Artist` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (3,'cse308','modern',13,NULL);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songUser`
--

DROP TABLE IF EXISTS `songUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songUser` (
  `userId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`songId`),
  KEY `songId_idx` (`songId`),
  CONSTRAINT `sId` FOREIGN KEY (`songId`) REFERENCES `song` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `uId` FOREIGN KEY (`userId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songUser`
--

LOCK TABLES `songUser` WRITE;
/*!40000 ALTER TABLE `songUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `songUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nickname` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Firstname` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aaa','aaa@aaa.com','aa','aa','aa'),(31,'31','31@3131.com',NULL,NULL,NULL),(123,'111','111@111.com','111','111','111');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-16 18:16:17
