CREATE DATABASE  IF NOT EXISTS `práctica1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `práctica1`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: práctica1
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aeropuerto` (
  `codigo` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto`
--

LOCK TABLES `aeropuerto` WRITE;
/*!40000 ALTER TABLE `aeropuerto` DISABLE KEYS */;
INSERT INTO `aeropuerto` VALUES ('BRC','Teniente Luis Candelaria','San Carlos de Bariloche'),('BUE','Aeropuerto Jorge NewBery','CABA'),('MDQ','Astor Piazolla','Mar Del Plata');
/*!40000 ALTER TABLE `aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avion` (
  `matricula` varchar(45) NOT NULL,
  `codigoMarca` int(11) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `fechaEntradaServicio` date NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_marca_idx` (`codigoMarca`),
  CONSTRAINT `fk_marca` FOREIGN KEY (`codigoMarca`) REFERENCES `marca` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES ('LV-ABC',1,'Citation','2010-12-12'),('LV-CDE',2,'Baron','2011-10-01'),('LV-FGH',3,'F-27','2008-05-04'),('LV-IJK',1,'Citation','2014-06-07'),('LV-LMN',2,'King Air','2012-07-08');
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_pasajeros`
--

DROP TABLE IF EXISTS `lista_pasajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_pasajeros` (
  `codigoVuelo` varchar(45) NOT NULL,
  `dniPasajero` int(11) NOT NULL,
  PRIMARY KEY (`codigoVuelo`,`dniPasajero`),
  KEY `fk_pasajero_idx` (`dniPasajero`),
  CONSTRAINT `fk_pasajero` FOREIGN KEY (`dniPasajero`) REFERENCES `pasajero` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelo` FOREIGN KEY (`codigoVuelo`) REFERENCES `vuelo` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_pasajeros`
--

LOCK TABLES `lista_pasajeros` WRITE;
/*!40000 ALTER TABLE `lista_pasajeros` DISABLE KEYS */;
INSERT INTO `lista_pasajeros` VALUES ('TT1256',11111111),('TT1256',22222222),('TT1257',22222222),('TT1256',33333333),('TT1234',44444444),('TT1235',44444444),('TT1234',55555555),('TT1235',55555555),('TT1234',66666666),('TT3333',77777777),('TT3456',77777777),('TT3457',77777777),('TT5632',77777777),('TT5633',77777777),('TT3333',88888888),('TT3456',88888888),('TT3457',88888888),('TT5632',88888888),('TT5633',88888888),('TT3333',99999999),('TT3456',99999999),('TT3457',99999999),('TT5632',99999999),('TT5633',99999999);
/*!40000 ALTER TABLE `lista_pasajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Cessna','Estados Unidos'),(2,'Beechcraft','Estados Unidos'),(3,'Fokker','Alemania');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasajero` (
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `viajeroFrecuente` bit(1) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero`
--

LOCK TABLES `pasajero` WRITE;
/*!40000 ALTER TABLE `pasajero` DISABLE KEYS */;
INSERT INTO `pasajero` VALUES ('Feijoo','Cristian',10111213,'','San Martin',3652,'Avellaneda','Buenos Aires'),('Barragan','Alejo',11111111,'','Ituzaingo',123,'Lanus','Buenos Aires'),('casas','Andrés Alfredo',22222222,'','Roca',4561,'CABA','CABA'),('Chaves','Barbara',33333333,'\0','Campichuelo',6532,'Avellaneda','Buenos Aires'),('Chimbo','Brisa',44444444,'','Meeks',562,'Lomas de Zamora','Buenos Aires'),('Chudoba','camila',55555555,'\0','Mamberti',2356,'Lanus','Buenos Aires'),('Cires','Carlos',66666666,'','Amenabar',2345,'CABA','CABA'),('Cusato','Carlos Sebastián',77777777,'\0','Capello',1589,'Lomas de Zamora','Buenos Aires'),('Dominguez','Chistian',88888888,'','Amenabar',356,'CABA','CABA'),('Escullini','Cristian',99999999,'','Meeks',1296,'Lomas de Zamora','Buenos Aires');
/*!40000 ALTER TABLE `pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto`
--

DROP TABLE IF EXISTS `piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piloto` (
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `cuil` varchar(45) NOT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` VALUES ('Juarez','Federico Bernardo',12345678,'20-12345678-8','1994-10-01','San Martín',2235,'CABA'),('Lacoste','Franco',34567890,'20-34567890-1','2003-07-01','Azara',1254,'Lomas de Zamora'),('Lopez','Germnán Ignacio',56789123,'20-56789123-3','2013-05-01','Rivadavia',2351,'CABA'),('Martinez','Giuliano',67891234,'20-67891234-4','2010-07-01','Martinto',663,'Lanus'),('Melgarejo','Jai Alberto',90123456,'20-90123456-6','2011-03-01','Loria',333,'Lomas de Zamora'),('Laime','Mariana',45678901,'27-45678901-1','2001-04-01','Sarmiento',500,'Lanus'),('Medina','Adriana',78912345,'27-78912345-5','2015-08-01','Bolaños',1256,'Lanus');
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelo` (
  `codigo` varchar(45) NOT NULL,
  `matriculaAvion` varchar(45) NOT NULL,
  `cuilPiloto` varchar(45) NOT NULL,
  `aeropuetoOrigen` varchar(45) NOT NULL,
  `aeropuertoDestino` varchar(45) NOT NULL,
  `fechaPartida` datetime DEFAULT NULL,
  `fechaArrivo` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_avion_idx` (`matriculaAvion`),
  KEY `fk_piloto_idx` (`cuilPiloto`),
  KEY `fk_aeropuerto_origen_idx` (`aeropuetoOrigen`),
  KEY `fk_aeropuerto_destino_idx` (`aeropuertoDestino`),
  CONSTRAINT `fk_aeropuerto_destino` FOREIGN KEY (`aeropuertoDestino`) REFERENCES `aeropuerto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aeropuerto_origen` FOREIGN KEY (`aeropuetoOrigen`) REFERENCES `aeropuerto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_avion` FOREIGN KEY (`matriculaAvion`) REFERENCES `avion` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_piloto` FOREIGN KEY (`cuilPiloto`) REFERENCES `piloto` (`cuil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES ('TT1234','LV-ABC','20-12345678-8','BUE','BRC','2018-05-01 20:00:00','2018-05-01 23:45:00'),('TT1235','LV-ABC','20-12345678-8','BRC','BUE','2018-05-02 07:00:00','2018-05-02 10:50:00'),('TT1256','LV-FGH','27-45678901-1','BUE','MDQ','2018-05-02 08:00:00','2018-05-02 10:05:00'),('TT1257','LV-FGH','27-45678901-1','BUE','MDQ','2018-05-04 08:00:00','2018-05-04 10:05:00'),('TT3333','LV-LMN','20-12345678-8','BUE','BRC','2018-05-03 07:00:00','2018-05-03 10:50:00'),('TT3456','LV-CDE','27-78912345-5','BUE','MDQ','2018-05-02 10:00:00','2018-05-02 12:00:00'),('TT3457','LV-CDE','27-78912345-5','MDQ','BUE','2018-05-04 10:00:00','2018-05-04 12:00:00'),('TT5632','LV-IJK','20-56789123-3','MDQ','BUE','2018-05-03 07:00:00','2018-05-03 09:15:00'),('TT5633','LV-IJK','20-56789123-3','BUE','MDQ','2018-05-05 07:00:00','2018-05-05 09:15:00');
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'práctica1'
--

--
-- Dumping routines for database 'práctica1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-20 13:36:14
