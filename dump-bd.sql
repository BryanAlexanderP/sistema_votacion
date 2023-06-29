-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: formulario_de_votacion
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `datos`
--

DROP TABLE IF EXISTS `datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `rut` int(9) NOT NULL,
  `email` varchar(30) NOT NULL,
  `id_region` int(20) DEFAULT NULL,
  `id_comuna` int(20) DEFAULT NULL,
  `id_candidato` int(20) DEFAULT NULL,
  `id_medio1` int(20) DEFAULT NULL,
  `id_medio2` int(20) DEFAULT NULL,
  `fecha` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos`
--

LOCK TABLES `datos` WRITE;
/*!40000 ALTER TABLE `datos` DISABLE KEYS */;
INSERT INTO `datos` VALUES (1,'Bryan Pacheco','Bryan10',17726287,'bryan.pachecor@correoaiep.cl',NULL,NULL,NULL,NULL,NULL,'26/06/23'),(2,'Bryan Pacheco','Bryan10',17726287,'bryan.pachecor@correoaiep.cl',NULL,NULL,NULL,NULL,NULL,'26/06/23'),(3,'Bryan Pacheco','Bryan10',17726287,'bryan.pachecor@correoaiep.cl',NULL,NULL,NULL,NULL,NULL,'26/06/23'),(4,'Dylan Pacheco','dylan1',223201201,'dylan@gmail.com',NULL,NULL,NULL,NULL,NULL,'26/06/23'),(5,'Bryan Pacheco','Bryan20',17726287,'bryan.pachecor@correoaiep.cl',6,14,2,0,0,'2023-06-29'),(6,'Bryan Pacheco','Bryan10',1,'ddas@ds.cl',3,5,1,1,2,'2023-06-29'),(7,'Bryan Pacheco','Bryan10',1,'ddas@ds.cl',3,5,1,1,2,'2023-06-29'),(8,'Bryan Pacheco','Bryan10',1,'ddas@ds.cl',3,5,1,1,2,'2023-06-29'),(9,'Bryan Pacheco','Bryan10',6,'bryanalexanderpr.1990@gmail.co',6,14,2,2,3,'2023-06-29');
/*!40000 ALTER TABLE `datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medio_contacto`
--

DROP TABLE IF EXISTS `medio_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medio_contacto` (
  `id_medio` int(30) NOT NULL,
  `medio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medio_contacto`
--

LOCK TABLES `medio_contacto` WRITE;
/*!40000 ALTER TABLE `medio_contacto` DISABLE KEYS */;
INSERT INTO `medio_contacto` VALUES (1,'Web'),(2,'Tv'),(3,'Redes Sociales'),(4,'Amigo');
/*!40000 ALTER TABLE `medio_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidatos` (
  `id_candidato` int(100) NOT NULL AUTO_INCREMENT,
  `nombre_candidato` varchar(50) NOT NULL,
  PRIMARY KEY (`id_candidato`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatos`
--

LOCK TABLES `candidatos` WRITE;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
INSERT INTO `candidatos` VALUES (1,'Elon Musk'),(2,'Nikola Tesla'),(3,'Mark Zuckerberg'),(4,'Bill Gates');
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunas`
--

DROP TABLE IF EXISTS `comunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunas` (
  `id_comuna` int(11) NOT NULL,
  `nombre_comuna` varchar(255) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comuna`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunas`
--

LOCK TABLES `comunas` WRITE;
/*!40000 ALTER TABLE `comunas` DISABLE KEYS */;
INSERT INTO `comunas` VALUES (1,'Arica',1),(2,'Putre',1),(3,'Alto Hospicio',2),(4,'Iquique',2),(5,'Chañaral',3),(6,'Copiapó',3),(7,'Vallenar',3),(8,'Illapel',4),(9,'Coquimbo',4),(10,'La Serena',4),(11,'Valparaíso',5),(12,'Viña del Mar',5),(13,'San Antonio',5),(14,'El Bosque',6),(15,'Independencia',6),(16,'La Cisterna',6),(17,'Las Condes',6),(18,'Providencia',6),(19,'Puente Alto',6),(20,'Graneros',7),(21,'Rancagua',7),(22,'Curicó',8),(23,'Linares',8),(24,'Chillán',9),(25,'Cobquecura',9),(26,'Talcahuano',10),(27,'Concepción',10),(28,'Hualpén',10),(29,'Pucón',11),(30,'Temuco',11),(31,'Villarrica',11),(32,'Panguipulli',12),(33,'Valdivia',12),(34,'Ancud',13),(35,'Puerto Montt',13),(36,'Puerto Varas',13),(37,'Osorno',13),(38,'Aysen',14),(39,'Coyhaique',14),(40,'Puerto Natales ',15),(41,'Punta Arenas',15),(42,'Antártica',15);
/*!40000 ALTER TABLE `comunas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiones`
--

DROP TABLE IF EXISTS `regiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiones` (
  `id_region` int(11) NOT NULL,
  `nombre_region` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiones`
--

LOCK TABLES `regiones` WRITE;
/*!40000 ALTER TABLE `regiones` DISABLE KEYS */;
INSERT INTO `regiones` VALUES (1,'Arica y Parinacota'),(2,'Tarapaca Antofagasta'),(3,'Atacama'),(4,'Coquimbo'),(5,'Valparaiso'),(6,'Region Metropolitana'),(7,'O Higgins'),(8,'Maule'),(9,'Ñuble'),(10,'BioBio'),(11,'Araucania'),(12,'Los Rios'),(13,'Los Lagos'),(14,'Aisen'),(15,'Magallanes y Antartica');
/*!40000 ALTER TABLE `regiones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-29  3:26:54
