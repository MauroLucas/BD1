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
  `ciudad` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_ciudad_idx` (`ciudad`),
  CONSTRAINT `fk_ciudad` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto`
--

LOCK TABLES `aeropuerto` WRITE;
/*!40000 ALTER TABLE `aeropuerto` DISABLE KEYS */;
INSERT INTO `aeropuerto` VALUES ('BRC','Teniente Luis Candelaria',1),('BUE','Aeropuerto Jorge NewBery',2),('MDQ','Astor Piazolla',3);
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
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `ciudadcol` varchar(45) NOT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'CABA'),(2,'Mar Del Plata'),(3,'San Carlos de Bariloche');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domicilio` (
  `idDomicilio` int(11) NOT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `idLocalidad` int(11) DEFAULT NULL,
  `idProvincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDomicilio`),
  KEY `fk_provincia_idx` (`idProvincia`),
  KEY `fk_localidad_idx` (`idLocalidad`),
  CONSTRAINT `fk_localidad` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`idLocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincia` (`idProvincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
INSERT INTO `domicilio` VALUES (1,'Ituzaingo','123',1,1),(2,'Roca','4561',2,2),(3,'Campichuelo','6532',3,1),(4,'Meeks','562',4,1),(5,'Mamberti','2356',1,1),(6,'Amenabar','1589',2,2),(7,'Capello','356',4,1),(8,'Amenabar','1296',2,2),(9,'Meeks','3652',4,1),(10,'San Martin','1234',3,1),(11,'San Martin','111',2,2),(12,'Azara','222',4,1),(13,'Sarmiento','333',1,1),(14,'Rivadavia','444',2,2),(15,'Martinto','555',1,1),(16,'Bolaños','666',1,1),(17,'Loria','777',4,1);
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidad` (
  `idLocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `localidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idLocalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Lanus'),(2,'CABA'),(3,'Avellaneda'),(4,'Lomas de Zamora'),(6,'Adrogue');
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
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
  `dni` int(11) NOT NULL,
  `viajeroFrecuente` bit(1) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  CONSTRAINT `fk_persona_pasajero` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero`
--

LOCK TABLES `pasajero` WRITE;
/*!40000 ALTER TABLE `pasajero` DISABLE KEYS */;
INSERT INTO `pasajero` VALUES (10111213,''),(11111111,''),(22222222,''),(33333333,'\0'),(44444444,''),(55555555,'\0'),(66666666,''),(77777777,'\0'),(88888888,''),(99999999,'');
/*!40000 ALTER TABLE `pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `idDomicilio` int(11) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_domicilio_idx` (`idDomicilio`),
  CONSTRAINT `fk_domicilio` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilio` (`idDomicilio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (10111213,'Carlitos10','Pereyra10',10),(11111111,'Carlitos1','Pereyra1',1),(12345678,'Maurito1','Garcia1',11),(22222222,'Carlitos2','Pereyra2',2),(33333333,'Carlitos3','Pereyra3',3),(34567890,'Maurito2','Garcia2',12),(44444444,'Carlitos4','Pereyra4',4),(45678901,'Maurito6','Garcia6',16),(55555555,'Carlitos5','Pereyra5',5),(56789123,'Maurito3','Garcia3',13),(66666666,'Carlitos6','Pereyra6',6),(67891234,'Maurito4','Garcia4',14),(77777777,'Carlitos7','Pereyra7',7),(78912345,'Maurito7','Garcia7',17),(88888888,'Carlitos8','Pereyra8',8),(90123456,'Maurito5','Garcia5',15),(99999999,'Carlitos9','Pereyra9',9);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto`
--

DROP TABLE IF EXISTS `piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piloto` (
  `cuil` varchar(45) NOT NULL,
  `dni` int(11) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  PRIMARY KEY (`cuil`),
  KEY `fk_persona_piloto_idx` (`dni`),
  CONSTRAINT `fk_persona_piloto` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` VALUES ('20-12345678-8',12345678,'1994-10-01'),('20-34567890-1',34567890,'2003-07-01'),('20-56789123-3',56789123,'2013-05-01'),('20-67891234-4',67891234,'2010-07-01'),('20-90123456-6',90123456,'2011-03-01'),('27-45678901-1',45678901,'2001-04-01'),('27-78912345-5',78912345,'2015-08-01');
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `idProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Buenos Aires'),(2,'CABA');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
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
-- Table structure for table `vuelo_x_pasajero`
--

DROP TABLE IF EXISTS `vuelo_x_pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelo_x_pasajero` (
  `codigoVuelo` varchar(45) NOT NULL,
  `dniPasajero` int(11) NOT NULL,
  PRIMARY KEY (`codigoVuelo`,`dniPasajero`),
  KEY `fk_pasajero_idx` (`dniPasajero`),
  CONSTRAINT `fk_pasajero` FOREIGN KEY (`dniPasajero`) REFERENCES `pasajero` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelo` FOREIGN KEY (`codigoVuelo`) REFERENCES `vuelo` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_x_pasajero`
--

LOCK TABLES `vuelo_x_pasajero` WRITE;
/*!40000 ALTER TABLE `vuelo_x_pasajero` DISABLE KEYS */;
INSERT INTO `vuelo_x_pasajero` VALUES ('TT1256',11111111),('TT1256',22222222),('TT1257',22222222),('TT1256',33333333),('TT1234',44444444),('TT1235',44444444),('TT1234',55555555),('TT1235',55555555),('TT1234',66666666),('TT3333',77777777),('TT3456',77777777),('TT3457',77777777),('TT5632',77777777),('TT5633',77777777),('TT3333',88888888),('TT3456',88888888),('TT3457',88888888),('TT5632',88888888),('TT5633',88888888),('TT3333',99999999),('TT3456',99999999),('TT3457',99999999),('TT5632',99999999),('TT5633',99999999);
/*!40000 ALTER TABLE `vuelo_x_pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'práctica1'
--

--
-- Dumping routines for database 'práctica1'
--
/*!50003 DROP PROCEDURE IF EXISTS `agregarLocalidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarLocalidad`(IN nombre VARCHAR(45))
BEGIN
insert into localidad(localidad) values (nombre);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarLocalidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarLocalidad`(IN nombre VARCHAR(45))
BEGIN
delete from localidad where localidad=nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificarLocalidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarLocalidad`(IN nombre VARCHAR(45),IN nuevaLocalidad VARCHAR(45))
BEGIN
update localidad set localidad.localidad=nuevaLocalidad
where localidad=nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `traerVuelos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `traerVuelos`()
BEGIN
select * from vuelo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-27 22:52:26
