CREATE DATABASE  IF NOT EXISTS `appsalon_mvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `appsalon_mvc`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: appsalon_mvc
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId_idx` (`usuarioId`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (6,'2022-06-16','13:54:00',9),(8,'2022-06-06','12:13:00',9),(10,'2022-06-21','18:41:00',25);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citasservicios`
--

DROP TABLE IF EXISTS `citasservicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citasservicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citaId_idx` (`citaId`),
  KEY `servicioId_idx` (`servicioId`),
  CONSTRAINT `citasservicios_ibfk_1` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `citasservicios_ibfk_2` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citasservicios`
--

LOCK TABLES `citasservicios` WRITE;
/*!40000 ALTER TABLE `citasservicios` DISABLE KEYS */;
INSERT INTO `citasservicios` VALUES (1,NULL,NULL),(2,NULL,2),(3,6,2),(4,6,NULL),(5,NULL,3),(6,8,5),(7,NULL,NULL),(8,NULL,NULL),(9,NULL,8),(10,NULL,7),(11,10,13);
/*!40000 ALTER TABLE `citasservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (2,'Corte de Cabello Hombre',80.00),(3,'Corte de Cabello Niño',60.00),(5,'Peinado Hombre',60.00),(6,'Peinado Niño',60.00),(7,'Corte de Barba',60.00),(8,'Tinte Mujer',300.00),(9,'Uñas',400.00),(10,'Lavado de Cabello',50.00),(11,'Tratamiento Capilar',150.00),(13,' Manicure Express',200.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Karla','Rodriguez','mail@mail.com','mailpassword',NULL,NULL,NULL,NULL),(2,' Karla','Rodriguez','mail3@mail.com','$2y$10$ju2cMXRcOrP1JjaTJW7ZI.qgspiYYLKf2mMRW19cQ2OCD3EEPkgo6','4567889',0,0,'628817c91dfcb '),(3,' Karla','Rodriguez','karla@mail.com','$2y$10$xMUqhB/9GjgaMyLah0S3nunCxmyHs4qUMLj5jAM.dnUzuCoRyY3dq','1234567890',0,0,'62881b684ff77 '),(4,' cvhvhbjkjhh','fghjkl;','a301468@alumnos.uaslp.mx','$2y$10$oDXUAA9ICYfGD1eoMTnZmuopzSPbGif80o6uHESj2XbgeytNMnEO.','4567890',0,0,'628bde87811b1 '),(6,' Ale','Alfaro','alealfaro12345@mail.com','$2y$10$yGQC7WkxVtPQwC50OiWBT.FU7.7k9hPGq8FYyl96i2H6ThSYpEwES','456789',0,1,''),(7,' Adan','Sanchez','AdanSanchez@mail.com','$2y$10$aqaCWPzPgrISpMb88tr.O.4nkOXb9GSJMpi0fWiYm7/RQj67tSyRa','123456',0,1,''),(8,' Usuario1','User','usermail@mail.com','$2y$10$5pxKH1zo9CRaN5yFG8Vb1.05U95eGuy1UzZNMUj7lJSBpbQbLcPGi','2345678987',0,1,''),(9,' Juan','Gomez','Juan@mail.com','$2y$10$d6ykrCY/gI2loNg6RaFK/OVntLN.BKNXDwSTiLSZJPBYZY2d.B9kO','123456789',0,1,'6296e3b52d786'),(11,' Admin','Rodme','admin@admin.com','$2y$10$UWdb0Zad4ujQ7mC39xRT7utuBoAQmomTavS0dHJPew4cTK8KOPNZ2','1234567890',1,1,''),(12,' Karina','Mendez','correok@correok.com','$2y$10$B.K4n/ZhW8WItnPRtWsXfeMkOYnQb.bomxyfQreKPjMj/SQuq9zdK','123456789',0,0,'6296b8b77cc55 '),(13,' fghjk','fghjk','4567y@fn.com','$2y$10$E33ap.MkCHiHU6Izy610PuECL/w8d/PhFrHc5cPxDiZNmHsrZ9YhK','3456789',0,0,'6296ba43e9a91 '),(14,' fghjm','vbhnjmk','cvgbh@vgbhnj.com','$2y$10$STCU53Uq0mKTCK9kEVlBVeNVs9aYOSOScz3F2hjQxM/OKxn83fiGC','456789',0,0,'6296bae2c1a75 '),(15,' gvfvfbeui','vvbuub','mail@mail34466.com','$2y$10$cAwn70eFsScSQsIJ1ox3Ze87WY.3hNh2LMjGVhwT/MimuBEiZrOYq','527399',0,0,'6296bb0257fcd '),(16,' prueba','prueba','prueba@prueba.com','$2y$10$2TZJxjr0rDJYTiEZjLgf/.Ys48hw7DtITbPRrSPLhc.JBI9UFGj9G','1234567890',0,1,''),(22,' njfnfne','nendjefn','nbbunuu@mail.comj','$2y$10$R262fIlrhCa6dvg1HpJA3uyncwTiLagzDXwMhHmj0L.RkCrJh5j0u','67876567',0,0,'6296edbe04312 '),(23,' VVBJBJB','VVVYV','VVYVY@MAIL.COM','$2y$10$vN.0LYWz2fhdYzzND9RAj.iSNGGSbWFiRAkgJMAxpI6husy8FfGe.','678976678',0,1,''),(24,' user44','user44','1414@mail.com','$2y$10$H.hkw.JnEys6Qe5uD2KOr.h9pvjGTXEsIJNeQcUHMnjkycy9YIqRe','141414141',0,1,''),(25,' Josue','Sanchez','Josue@mail.com','$2y$10$Sr6eqcEr4tz3IW8Qc7H0M.wftzs02cH.28DUO4P4PIRmL8WZp3Xy.','1234567890',0,1,'');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-02 18:45:01
