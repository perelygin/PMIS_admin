-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: Yii2pmis
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `BusinessRequests`
--

DROP TABLE IF EXISTS `BusinessRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BusinessRequests` (
  `idBR` int(11) NOT NULL AUTO_INCREMENT,
  `BRName` varchar(150) DEFAULT 'BR' COMMENT 'Наименование BR',
  `idProject` int(11) DEFAULT NULL,
  `BRLifeCycleType` int(11) DEFAULT NULL COMMENT 'Тип ЖЦ',
  `BRDeleted` int(11) DEFAULT '0',
  `BRNumber` int(11) DEFAULT NULL,
  `BRRoleModelType` int(11) DEFAULT NULL COMMENT 'тип ролевой модели',
  PRIMARY KEY (`idBR`),
  KEY `fk_BusinessRequests_1_idx` (`idProject`),
  KEY `fk_BusinessRequests_2_idx` (`BRLifeCycleType`),
  KEY `fk_BusinessRequests_6_idx` (`BRRoleModelType`),
  CONSTRAINT `fk_BusinessRequests_1` FOREIGN KEY (`idProject`) REFERENCES `Projects` (`idProject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BusinessRequests_2` FOREIGN KEY (`BRLifeCycleType`) REFERENCES `LifeCycleType` (`idLifeCycleType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BusinessRequests_6` FOREIGN KEY (`BRRoleModelType`) REFERENCES `RoleModelType` (`idRoleModelType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Список BR или  Фазы проекта — совокупность логически связанных операций\nпроекта, завершающихся достижением одного или ряда поставляемых результатов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessRequests`
--

LOCK TABLES `BusinessRequests` WRITE;
/*!40000 ALTER TABLE `BusinessRequests` DISABLE KEYS */;
INSERT INTO `BusinessRequests` VALUES (1,'test_estimate',1,1,0,4324324,1),(2,'Тестовая Br',1,1,0,54,1),(3,'Выплата по закрытым картам test',1,1,0,45,1),(4,'Тестовая Br',1,1,0,123,1),(5,'Тестовая Br 18-34',1,1,0,123,1),(6,'Тестовая Br  18-49',1,1,0,1849,1);
/*!40000 ALTER TABLE `BusinessRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnumSettings`
--

DROP TABLE IF EXISTS `EnumSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EnumSettings` (
  `idEnumSettings` int(11) NOT NULL AUTO_INCREMENT,
  `id_param` int(11) DEFAULT NULL,
  `enm_num_value` decimal(10,2) DEFAULT '0.00',
  `enm_str_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idEnumSettings`),
  KEY `fk_EnumSetings_1_idx` (`id_param`),
  CONSTRAINT `fk_EnumSetings_1` FOREIGN KEY (`id_param`) REFERENCES `settings` (`id_param`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnumSettings`
--

LOCK TABLES `EnumSettings` WRITE;
/*!40000 ALTER TABLE `EnumSettings` DISABLE KEYS */;
INSERT INTO `EnumSettings` VALUES (16,5,0.00,'http://mantis.it-spectrum.ru/vtb24-mantis/view.php?id='),(21,5,0.00,'http://192.168.20.55/mantis/');
/*!40000 ALTER TABLE `EnumSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstimateWorkPackages`
--

DROP TABLE IF EXISTS `EstimateWorkPackages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstimateWorkPackages` (
  `idEstimateWorkPackages` int(11) NOT NULL AUTO_INCREMENT,
  `dataEstimate` date DEFAULT NULL,
  `EstimateName` varchar(250) DEFAULT NULL COMMENT 'Наименование оценки',
  `idBR` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`idEstimateWorkPackages`),
  KEY `fk_EstimateWorkPackages_1_idx` (`idBR`),
  CONSTRAINT `fk_EstimateWorkPackages_1` FOREIGN KEY (`idBR`) REFERENCES `BusinessRequests` (`idBR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Оценки работ,  которые необходимо выполнить для получения результата';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstimateWorkPackages`
--

LOCK TABLES `EstimateWorkPackages` WRITE;
/*!40000 ALTER TABLE `EstimateWorkPackages` DISABLE KEYS */;
INSERT INTO `EstimateWorkPackages` VALUES (1,'2018-09-12','Предварительная оценка',1,0),(2,'2018-09-07','Оценка по экспертизе',1,0),(3,'2018-09-19','Предварительная оценка',2,0),(4,'2018-10-05','Предварительная оценка',3,0),(5,'2018-11-24','Предварительная оценка',4,0);
/*!40000 ALTER TABLE `EstimateWorkPackages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LifeCycleStages`
--

DROP TABLE IF EXISTS `LifeCycleStages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LifeCycleStages` (
  `idStage` int(11) NOT NULL AUTO_INCREMENT,
  `StageName` varchar(145) DEFAULT NULL,
  `StageOrder` int(11) DEFAULT NULL,
  `idlifeCycleType` int(11) DEFAULT NULL,
  `LCS_parent_id` int(11) NOT NULL COMMENT 'id родителя(для второго уровня wbs)',
  `LCS_comment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idStage`),
  KEY `fk_LifeCircle_1_idx` (`idlifeCycleType`),
  CONSTRAINT `fk_LifeCircle_1` FOREIGN KEY (`idlifeCycleType`) REFERENCES `LifeCycleType` (`idLifeCycleType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Шаблон WBS.\nЖизненный цикл фазы(BR) -  этапы работ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LifeCycleStages`
--

LOCK TABLES `LifeCycleStages` WRITE;
/*!40000 ALTER TABLE `LifeCycleStages` DISABLE KEYS */;
INSERT INTO `LifeCycleStages` VALUES (1,'Предварительная оценка',1,1,0,NULL),(2,'Экспертиза',2,1,0,NULL),(3,'Экспертиза разработана',3,1,2,NULL),(4,'Экспертиза согласована',4,1,2,NULL),(5,'БФТЗ',5,1,0,NULL),(6,'БФТЗ разработано',6,1,5,NULL),(7,'БФТЗ согласовано',7,1,5,NULL),(8,'Функционал',8,1,0,NULL),(9,'Версия',9,1,0,NULL);
/*!40000 ALTER TABLE `LifeCycleStages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LifeCycleType`
--

DROP TABLE IF EXISTS `LifeCycleType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LifeCycleType` (
  `idLifeCycleType` int(11) NOT NULL AUTO_INCREMENT,
  `LifeCycleTypeName` varchar(45) DEFAULT NULL,
  `LifeCycleTypeComent` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idLifeCycleType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Тип  жизненного цикла';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LifeCycleType`
--

LOCK TABLES `LifeCycleType` WRITE;
/*!40000 ALTER TABLE `LifeCycleType` DISABLE KEYS */;
INSERT INTO `LifeCycleType` VALUES (1,'ВТБ ЖЦПО',NULL),(2,'ВТБ предварительная оценка',NULL),(3,'ВТБ согласование МТ',NULL);
/*!40000 ALTER TABLE `LifeCycleType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization` (
  `idOrganization` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(120) DEFAULT NULL,
  `ShortName` varchar(45) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`idOrganization`),
  UNIQUE KEY `ShortName_UNIQUE` (`ShortName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Клиенты - Юридические лица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
INSERT INTO `Organization` VALUES (1,'ЗАО Спектр','Спектр',0),(2,'ПАО ВТБ','ВТБ',0);
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People` (
  `idHuman` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL DEFAULT '_',
  `Family` varchar(100) NOT NULL DEFAULT '_',
  `idOrganization` int(11) DEFAULT NULL COMMENT 'организация,  сотрудником которой является человек',
  `Humandeleted` int(11) DEFAULT '0',
  `patronymic` varchar(100) NOT NULL DEFAULT '_' COMMENT 'отчество',
  `phone_number` varchar(45) DEFAULT NULL,
  `internal_phone_number` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idHuman`),
  KEY `fk_People_Organization_idx` (`idOrganization`),
  CONSTRAINT `fk_People_Organization` FOREIGN KEY (`idOrganization`) REFERENCES `Organization` (`idOrganization`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Физические лица';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
INSERT INTO `People` VALUES (-1,'Nobody',' ',1,1,' ',NULL,NULL,NULL),(1,'Тимур','Перелыгин',1,0,'',NULL,NULL,NULL),(2,'Александр','Озеров',2,0,'_',NULL,NULL,NULL);
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectCommand`
--

DROP TABLE IF EXISTS `ProjectCommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectCommand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `idBR` int(11) NOT NULL,
  `idRole` int(11) NOT NULL,
  `idHuman` int(11) NOT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx` (`parent_id`,`idBR`,`idRole`,`idHuman`),
  KEY `fk_ProjectCommand_1_idx` (`idHuman`),
  KEY `fk_ProjectCommand_2_idx` (`idBR`),
  KEY `fk_ProjectCommand_3_idx` (`idRole`),
  CONSTRAINT `fk_ProjectCommand_1` FOREIGN KEY (`idHuman`) REFERENCES `People` (`idHuman`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProjectCommand_2` FOREIGN KEY (`idBR`) REFERENCES `BusinessRequests` (`idBR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProjectCommand_3` FOREIGN KEY (`idRole`) REFERENCES `RoleModel` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectCommand`
--

LOCK TABLES `ProjectCommand` WRITE;
/*!40000 ALTER TABLE `ProjectCommand` DISABLE KEYS */;
INSERT INTO `ProjectCommand` VALUES (1,0,1,1,-1,0),(2,0,1,2,-1,0),(3,0,1,3,-1,0),(4,0,1,4,-1,0),(5,0,1,5,-1,0),(6,0,1,6,-1,0),(7,0,1,7,-1,0),(8,2,1,2,1,0),(9,2,1,2,2,0),(10,6,1,6,2,0),(11,0,2,1,-1,0),(12,0,2,2,-1,0),(13,0,2,3,-1,0),(14,0,2,4,-1,0),(15,0,2,5,-1,0),(16,0,2,6,-1,0),(17,0,2,7,-1,0),(18,11,2,1,1,0),(19,0,3,1,-1,0),(20,0,3,2,-1,0),(21,0,3,3,-1,0),(22,0,3,4,-1,0),(23,0,3,5,-1,0),(24,0,3,6,-1,0),(25,0,3,7,-1,0),(26,19,3,1,1,0),(27,20,3,2,2,0),(28,12,2,2,2,0),(29,0,4,1,-1,0),(30,0,4,2,-1,0),(31,0,4,3,-1,0),(32,0,4,4,-1,0),(33,0,4,5,-1,0),(34,0,4,6,-1,0),(35,0,4,7,-1,0),(36,30,4,2,1,0),(38,32,4,4,2,0),(39,0,5,1,-1,0),(40,0,5,2,-1,0),(41,0,5,3,-1,0),(42,0,5,4,-1,0),(43,0,5,5,-1,0),(44,0,5,6,-1,0),(45,0,5,7,-1,0),(47,0,6,1,-1,0),(48,0,6,2,-1,0),(49,0,6,3,-1,0),(50,0,6,4,-1,0),(51,0,6,5,-1,0),(52,0,6,6,-1,0),(53,0,6,7,-1,0),(54,0,6,8,-1,0),(55,0,4,8,-1,0),(56,55,4,8,2,0),(57,34,4,6,2,0),(58,33,4,5,1,0),(59,31,4,3,1,0);
/*!40000 ALTER TABLE `ProjectCommand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projects`
--

DROP TABLE IF EXISTS `Projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Projects` (
  `idProject` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(100) DEFAULT NULL,
  `DataBegin` date DEFAULT NULL,
  `DataEnd` date DEFAULT NULL,
  `idOrganization` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProject`),
  KEY `fk_Projects_Organization1_idx` (`idOrganization`),
  CONSTRAINT `fk_Projects_Organization1` FOREIGN KEY (`idOrganization`) REFERENCES `Organization` (`idOrganization`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='проекты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
INSERT INTO `Projects` VALUES (1,'ВТБ-фронт',NULL,NULL,1),(2,'Ростбанк',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prv_estimate`
--

DROP TABLE IF EXISTS `Prv_estimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prv_estimate` (
  `idPrv_stm` int(11) NOT NULL AUTO_INCREMENT,
  `Prv_stm_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPrv_stm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Предварительные оценки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prv_estimate`
--

LOCK TABLES `Prv_estimate` WRITE;
/*!40000 ALTER TABLE `Prv_estimate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prv_estimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResultEvents`
--

DROP TABLE IF EXISTS `ResultEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResultEvents` (
  `idResultEvents` int(11) NOT NULL AUTO_INCREMENT,
  `idwbs` int(11) DEFAULT NULL,
  `ResultEventsDate` datetime DEFAULT NULL,
  `ResultEventsDescription` varchar(1000) DEFAULT NULL,
  `ResultEventsName` varchar(100) DEFAULT NULL,
  `ResultEventsMantis` varchar(45) DEFAULT NULL,
  `ResultEventResponsible` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`idResultEvents`),
  KEY `fk_ResultEvents_1_idx` (`idwbs`),
  KEY `fk_ResultEvents_2_idx` (`ResultEventResponsible`),
  CONSTRAINT `fk_ResultEvents_1` FOREIGN KEY (`idwbs`) REFERENCES `wbs` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResultEvents_2` FOREIGN KEY (`ResultEventResponsible`) REFERENCES `ProjectCommand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='События по результатам';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResultEvents`
--

LOCK TABLES `ResultEvents` WRITE;
/*!40000 ALTER TABLE `ResultEvents` DISABLE KEYS */;
INSERT INTO `ResultEvents` VALUES (1,71,'2018-09-28 18:33:12','','Новое событие',NULL,18,0),(2,60,'2018-10-21 08:54:40','','Новое событие',NULL,8,0);
/*!40000 ALTER TABLE `ResultEvents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResultStatus`
--

DROP TABLE IF EXISTS `ResultStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResultStatus` (
  `idResultStatus` int(11) NOT NULL,
  `ResultStatusName` varchar(45) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`idResultStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResultStatus`
--

LOCK TABLES `ResultStatus` WRITE;
/*!40000 ALTER TABLE `ResultStatus` DISABLE KEYS */;
INSERT INTO `ResultStatus` VALUES (1,'В ожидании',0),(2,'В работе',0),(3,'Выполнен',0),(4,'Приостановлен',0);
/*!40000 ALTER TABLE `ResultStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResultType`
--

DROP TABLE IF EXISTS `ResultType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResultType` (
  `idResultType` int(11) NOT NULL AUTO_INCREMENT,
  `ResultTypeName` varchar(100) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`idResultType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Тип результата';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResultType`
--

LOCK TABLES `ResultType` WRITE;
/*!40000 ALTER TABLE `ResultType` DISABLE KEYS */;
INSERT INTO `ResultType` VALUES (1,'Экспертиза',0),(2,'БФТЗ',0),(3,'Программное обеспечение',0),(4,'Прочее',0);
/*!40000 ALTER TABLE `ResultType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleModel`
--

DROP TABLE IF EXISTS `RoleModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleModel` (
  `idRole` int(11) NOT NULL AUTO_INCREMENT,
  `idRoleModelType` int(11) DEFAULT NULL,
  `RoleName` varchar(45) DEFAULT NULL,
  `RoleComment` varchar(300) DEFAULT NULL,
  `idTariff` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRole`),
  KEY `fk_RoleModel_1_idx` (`idRoleModelType`),
  KEY `fk_RoleModel_2_idx` (`idTariff`),
  CONSTRAINT `fk_RoleModel_1` FOREIGN KEY (`idRoleModelType`) REFERENCES `RoleModelType` (`idRoleModelType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RoleModel_2` FOREIGN KEY (`idTariff`) REFERENCES `Tariff` (`idTariff`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleModel`
--

LOCK TABLES `RoleModel` WRITE;
/*!40000 ALTER TABLE `RoleModel` DISABLE KEYS */;
INSERT INTO `RoleModel` VALUES (1,1,'Главный технолог','Выполняет разработку экспертизы вцелом',1),(2,1,'Технолог-участник','Выполняет разработку в части требований к конкретной системе',1),(3,1,'Аналитик','Пишет БФТЗ',1),(4,1,'Разработчик','',4),(5,1,'Архитектор',NULL,3),(6,1,'Инженер по тестированию','',6),(7,1,'Менеджер проекта',NULL,1),(8,1,'Технический писатель','Разрабатывает документацию',1);
/*!40000 ALTER TABLE `RoleModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleModelType`
--

DROP TABLE IF EXISTS `RoleModelType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleModelType` (
  `idRoleModelType` int(11) NOT NULL AUTO_INCREMENT,
  `RoleModelTypeName` varchar(45) DEFAULT NULL,
  `RoleModelTypeComment` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idRoleModelType`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleModelType`
--

LOCK TABLES `RoleModelType` WRITE;
/*!40000 ALTER TABLE `RoleModelType` DISABLE KEYS */;
INSERT INTO `RoleModelType` VALUES (1,'Ролевая модель ВТБ',NULL);
/*!40000 ALTER TABLE `RoleModelType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SystemVersions`
--

DROP TABLE IF EXISTS `SystemVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SystemVersions` (
  `idsystem_versions` int(11) NOT NULL AUTO_INCREMENT,
  `release_date` date DEFAULT NULL,
  `commit_ date` date DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `released` int(11) DEFAULT '0' COMMENT 'версия выпущена\n',
  PRIMARY KEY (`idsystem_versions`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Поставляемые в  банк версии ПО';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SystemVersions`
--

LOCK TABLES `SystemVersions` WRITE;
/*!40000 ALTER TABLE `SystemVersions` DISABLE KEYS */;
INSERT INTO `SystemVersions` VALUES (1,'2018-11-30','2018-11-26',23,0,0),(2,'2019-01-18','2019-01-14',24,0,0);
/*!40000 ALTER TABLE `SystemVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tariff`
--

DROP TABLE IF EXISTS `Tariff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tariff` (
  `idTariff` int(11) NOT NULL AUTO_INCREMENT,
  `TariffName` varchar(70) DEFAULT NULL,
  `TariffRate` decimal(10,0) DEFAULT '0',
  `idProject` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTariff`),
  KEY `fk_Tariff_1_idx` (`idProject`),
  CONSTRAINT `fk_Tariff_1` FOREIGN KEY (`idProject`) REFERENCES `Projects` (`idProject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Ставки ролей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tariff`
--

LOCK TABLES `Tariff` WRITE;
/*!40000 ALTER TABLE `Tariff` DISABLE KEYS */;
INSERT INTO `Tariff` VALUES (1,'Ведущий бизнес аналитик',20000,1),(2,'Бизнес аналитик',18800,1),(3,'Системный архитектор',20000,1),(4,'Ведущий разработчик',20000,1),(5,'Разработчик',18800,1),(6,'Инженер по тестированию ПО',15600,1),(7,'Специалист службы сопровождения и поддержки',18800,1);
/*!40000 ALTER TABLE `Tariff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkEffort`
--

DROP TABLE IF EXISTS `WorkEffort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkEffort` (
  `idLaborExpenditures` int(11) NOT NULL AUTO_INCREMENT,
  `idWorksOfEstimate` int(11) DEFAULT NULL,
  `idTeamMember` int(11) DEFAULT NULL COMMENT 'id члена команды',
  `workEffort` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idLaborExpenditures`),
  KEY `fk_LaborExpenditures_1_idx` (`idWorksOfEstimate`),
  KEY `fk_LaborExpenditures_2_idx` (`idTeamMember`),
  CONSTRAINT `fk_LaborExpenditures_1` FOREIGN KEY (`idWorksOfEstimate`) REFERENCES `WorksOfEstimate` (`idWorksOfEstimate`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_LaborExpenditures_2` FOREIGN KEY (`idTeamMember`) REFERENCES `ProjectCommand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Трудозатраты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkEffort`
--

LOCK TABLES `WorkEffort` WRITE;
/*!40000 ALTER TABLE `WorkEffort` DISABLE KEYS */;
INSERT INTO `WorkEffort` VALUES (1,1,10,5.52),(2,1,8,55.82),(3,4,9,9.00),(4,1,9,89.00),(5,4,10,98.00),(6,13,18,7.00),(7,14,18,0.00),(8,14,18,0.00),(9,12,18,6.00),(10,15,18,0.00),(11,16,18,90.00),(12,16,18,67.00),(13,16,18,8.00),(14,17,18,4.00),(15,17,18,45.00),(16,18,26,44.00),(17,18,27,55.00),(18,19,26,5.00),(19,19,27,55.00),(20,20,8,99.00),(21,20,10,0.01),(22,20,8,66.78),(23,20,8,0.01),(24,20,8,0.00),(25,21,8,0.00),(26,21,8,0.00),(27,21,8,0.00),(28,22,36,5.00),(29,22,36,7.00),(30,23,56,3.00),(31,24,38,2.00),(32,24,58,3.00),(33,25,38,1.00),(34,25,57,3.00);
/*!40000 ALTER TABLE `WorkEffort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorksOfEstimate`
--

DROP TABLE IF EXISTS `WorksOfEstimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorksOfEstimate` (
  `idWorksOfEstimate` int(11) NOT NULL AUTO_INCREMENT,
  `idEstimateWorkPackages` int(11) NOT NULL,
  `WorkName` varchar(250) NOT NULL,
  `idWbs` int(11) DEFAULT NULL,
  `WorkDescription` varchar(1000) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `mantisNumber` varchar(45) DEFAULT NULL COMMENT 'номер  инцидента в мантис',
  PRIMARY KEY (`idWorksOfEstimate`),
  KEY `fk_WorksOfEstimate_1_idx` (`idEstimateWorkPackages`),
  KEY `fk_WorksOfEstimate_2_idx` (`idWbs`),
  CONSTRAINT `fk_WorksOfEstimate_1` FOREIGN KEY (`idEstimateWorkPackages`) REFERENCES `EstimateWorkPackages` (`idEstimateWorkPackages`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_WorksOfEstimate_2` FOREIGN KEY (`idWbs`) REFERENCES `wbs` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Работы, включенные в оценку';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorksOfEstimate`
--

LOCK TABLES `WorksOfEstimate` WRITE;
/*!40000 ALTER TABLE `WorksOfEstimate` DISABLE KEYS */;
INSERT INTO `WorksOfEstimate` VALUES (1,1,'Название работы 1',65,'Описание работы',0,NULL),(2,1,'Название работы 2',65,'Описание работы',0,NULL),(3,1,'Название работы 3',65,'Описание работы',0,NULL),(4,2,'Название работы 4',65,'Описание работы',0,NULL),(5,2,'Название работы 5',65,'Описание работы',0,NULL),(6,1,'Название работы 6',65,'Описание работы',0,NULL),(7,2,'Название работы',65,'Описание работы',0,NULL),(8,2,'Название работы',65,'Описание работы',0,NULL),(9,1,'Название работы',65,'Описание работы',0,NULL),(10,1,'Название работы',65,'Описание работы',0,NULL),(11,2,'Название работы',65,'Описание работы',0,NULL),(12,3,'разработать форму',76,'<p>Описание работы</p>',0,NULL),(13,3,'Название работы',71,'Описание работы',0,NULL),(14,3,'Название работы',71,'Описание работы',0,NULL),(15,3,'Название работы',79,'Описание работы',0,NULL),(16,3,'Название работы',76,'<p>Описание работы</p>',0,NULL),(17,3,'Название работы',73,'<p>Описание работы</p>',0,NULL),(18,4,'косить косой',82,'<p>Описание работы</p>',0,NULL),(19,4,'Носить босой',82,'<p>Описание работы</p>',0,NULL),(20,1,'Название работы',60,'<p>Описание работы</p>',0,NULL),(21,1,'Название работы',60,'<p>Описание работы</p>',0,NULL),(22,5,'Новая работа',92,'<p>Описание работы</p>',0,''),(23,5,'воду носить',94,'<p>Описание работы</p>',0,''),(24,5,'Забор городить',99,'<p>Описание работы</p>',0,''),(25,5,'Землю копать',99,'<p>Описание работы</p>',0,'');
/*!40000 ALTER TABLE `WorksOfEstimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `auth_assignment_user_id_idx` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('projectmanager','2',1543073193);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('admin',1,'Администратор',NULL,NULL,1543073192,1543073192),('analyst',1,'Аналитик',NULL,NULL,1543073192,1543073192),('BRCreate',2,'Регистрация BR',NULL,NULL,1543073192,1543073192),('BRDelete',2,'Удаление BR',NULL,NULL,1543073192,1543073192),('BRJournalView',2,'Просмотр журнала BR',NULL,NULL,1543073192,1543073192),('ManageUserRole',2,'Управление ролями',NULL,NULL,1543073192,1543073192),('projectmanager',1,'Менеджер проекта',NULL,NULL,1543073192,1543073192);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('admin','analyst'),('projectmanager','analyst'),('projectmanager','BRCreate'),('projectmanager','BRDelete'),('analyst','BRJournalView'),('admin','ManageUserRole');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `code` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `population` int(11) DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m181107_150752_ResultType',1541880980),('m181107_152940_ResultStatus',1541880980),('m181112_151445_SystemVersionsAdd',1543072026),('m181113_155555_setings',1543072150),('m181113_155940_enum_setings',1543072150),('m181120_133010_tariff',1543072150),('m181120_140601_RoleModel_tariff',1543072150),('m181124_153720_newRole_documentator',1543074566);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id_param` int(11) NOT NULL AUTO_INCREMENT,
  `Prm_name` varchar(100) DEFAULT NULL,
  `Prm_description` varchar(2000) DEFAULT NULL,
  `Prm_enum_id` int(11) DEFAULT '0' COMMENT 'id  значения параметра',
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id_param`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='таблица глобальных параметров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (5,'Mantis_path','Путь к экземпляру багтрекера',16,0);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'sfforum@yandex.ru','perelygin','ezQVcsbObFeAlBdQapMGMhAFAofNYKHg','$2y$13$k/j2cpmLCw.W4pUK2VeMveyQgfa4fEcZviF4YowKSSfuGFOqLo3i.',NULL),(3,'ptv@yandex.ru','ptv','G04LFUQ-gPf6t9u0--BBzaxEBCmeuToH','$2y$13$xohGg2QcjXny/763pM2yUOYCv5pk1Gcu1ea.sySsJe6.nTDwX2DPm',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_ListOfBR`
--

DROP TABLE IF EXISTS `vw_ListOfBR`;
/*!50001 DROP VIEW IF EXISTS `vw_ListOfBR`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ListOfBR` AS SELECT 
 1 AS `idBR`,
 1 AS `BRDeleted`,
 1 AS `BRnumber`,
 1 AS `BRName`,
 1 AS `ProjectName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ListOfPeople`
--

DROP TABLE IF EXISTS `vw_ListOfPeople`;
/*!50001 DROP VIEW IF EXISTS `vw_ListOfPeople`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ListOfPeople` AS SELECT 
 1 AS `fio`,
 1 AS `idHuman`,
 1 AS `CustomerName`,
 1 AS `idOrganization`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ListOfWorkEffort`
--

DROP TABLE IF EXISTS `vw_ListOfWorkEffort`;
/*!50001 DROP VIEW IF EXISTS `vw_ListOfWorkEffort`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ListOfWorkEffort` AS SELECT 
 1 AS `idWorksOfEstimate`,
 1 AS `WorkName`,
 1 AS `mantisNumber`,
 1 AS `idEstimateWorkPackages`,
 1 AS `idWbs`,
 1 AS `idLaborExpenditures`,
 1 AS `workEffort`,
 1 AS `idTeamMember`,
 1 AS `idRole`,
 1 AS `RoleName`,
 1 AS `idHuman`,
 1 AS `team_member`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ProjectCommand`
--

DROP TABLE IF EXISTS `vw_ProjectCommand`;
/*!50001 DROP VIEW IF EXISTS `vw_ProjectCommand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ProjectCommand` AS SELECT 
 1 AS `id`,
 1 AS `idBR`,
 1 AS `idHuman`,
 1 AS `idRole`,
 1 AS `parent_id`,
 1 AS `team_member`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ResultEvents`
--

DROP TABLE IF EXISTS `vw_ResultEvents`;
/*!50001 DROP VIEW IF EXISTS `vw_ResultEvents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ResultEvents` AS SELECT 
 1 AS `idResultEvents`,
 1 AS `ResultEventsDate`,
 1 AS `ResultEventsName`,
 1 AS `ResultEventsMantis`,
 1 AS `idwbs`,
 1 AS `deleted`,
 1 AS `team_member`,
 1 AS `responsible`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_report1`
--

DROP TABLE IF EXISTS `vw_report1`;
/*!50001 DROP VIEW IF EXISTS `vw_report1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_report1` AS SELECT 
 1 AS `BRNumber`,
 1 AS `BRName`,
 1 AS `id`,
 1 AS `idBr`,
 1 AS `idOrgResponsible`,
 1 AS `name`,
 1 AS `idResultStatus`,
 1 AS `mantis`,
 1 AS `ResultStatusName`,
 1 AS `fio`,
 1 AS `idHuman`,
 1 AS `CustomerName`,
 1 AS `version_number`,
 1 AS `idsystem_versions`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_settings`
--

DROP TABLE IF EXISTS `vw_settings`;
/*!50001 DROP VIEW IF EXISTS `vw_settings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_settings` AS SELECT 
 1 AS `id_param`,
 1 AS `Prm_name`,
 1 AS `Prm_description`,
 1 AS `Prm_enum_id`,
 1 AS `enm_num_value`,
 1 AS `enm_str_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wbs`
--

DROP TABLE IF EXISTS `wbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tree` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mantis` varchar(150) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `idBr` int(11) NOT NULL,
  `idResultType` int(11) DEFAULT NULL,
  `idResultStatus` int(11) DEFAULT NULL,
  `idOrgResponsible` int(11) DEFAULT NULL,
  `idPeopleResponsible` int(11) DEFAULT NULL,
  `idsystem_versions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wbs_1_idx` (`idBr`),
  KEY `fk_wbs_2_idx` (`idResultType`),
  KEY `fk_wbs_3_idx` (`idResultStatus`),
  KEY `fk_wbs_4_idx` (`idOrgResponsible`),
  KEY `fk_wbs_5_idx` (`idsystem_versions`),
  CONSTRAINT `fk_wbs_1` FOREIGN KEY (`idBr`) REFERENCES `BusinessRequests` (`idBR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wbs_2` FOREIGN KEY (`idResultType`) REFERENCES `ResultType` (`idResultType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wbs_3` FOREIGN KEY (`idResultStatus`) REFERENCES `ResultStatus` (`idResultStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wbs_4` FOREIGN KEY (`idOrgResponsible`) REFERENCES `Organization` (`idOrganization`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wbs_5` FOREIGN KEY (`idsystem_versions`) REFERENCES `SystemVersions` (`idsystem_versions`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wbs`
--

LOCK TABLES `wbs` WRITE;
/*!40000 ALTER TABLE `wbs` DISABLE KEYS */;
INSERT INTO `wbs` VALUES (59,59,1,22,0,'BR 4324324','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(60,59,2,3,1,'Предварительная оценка','www.mantis.com','',1,1,1,1,1,NULL),(61,59,4,11,1,'Экспертиза','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(62,59,5,6,2,'Экспертиза разработана','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(63,59,7,8,2,'Экспертиза согласована','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(64,59,12,17,1,'БФТЗ','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(65,59,13,14,2,'БФТЗ разработано','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(66,59,15,16,2,'БФТЗ согласовано','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(67,59,18,19,1,'Функционал','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(68,59,20,21,1,'Версия','www.mantis.com',NULL,1,NULL,NULL,NULL,NULL,NULL),(69,59,9,10,2,'Узелок','www.mantis.com','',1,NULL,NULL,NULL,NULL,NULL),(70,70,1,20,0,'BR 54','www.mantis.com',NULL,2,NULL,NULL,NULL,NULL,NULL),(71,70,2,3,1,'Предварительная оценка','13456','<p>1. привязать существующий инцидент</p><p style=\"margin-left: 40px;\"><br></p><p>2. Генерировать новый инцидентрррр</p><p><br></p>',2,NULL,NULL,1,NULL,NULL),(72,70,4,9,1,'Экспертиза','www.mantis.com','',2,NULL,NULL,NULL,NULL,NULL),(73,70,5,6,2,'Экспертиза разработана','www.mantis.com','',2,2,2,NULL,NULL,NULL),(74,70,7,8,2,'Экспертиза согласована','www.mantis.com',NULL,2,NULL,NULL,NULL,NULL,NULL),(75,70,10,15,1,'БФТЗ','www.mantis.com',NULL,2,NULL,NULL,NULL,NULL,NULL),(76,70,11,12,2,'БФТЗ разработано','www.mantis.com','',2,1,1,NULL,NULL,NULL),(77,70,13,14,2,'БФТЗ согласовано','www.mantis.com',NULL,2,NULL,NULL,NULL,NULL,NULL),(78,70,16,17,1,'Функционал','www.mantis.com',NULL,2,NULL,NULL,NULL,NULL,NULL),(79,70,18,19,1,'Версия','www.mantis.com',NULL,2,NULL,NULL,NULL,NULL,NULL),(81,81,1,20,0,'BR 45','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(82,81,2,3,1,'Предварительная оценка','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(83,81,4,9,1,'Экспертиза','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(84,81,5,6,2,'Экспертиза разработана','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(85,81,7,8,2,'Экспертиза согласована','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(86,81,10,15,1,'БФТЗ','www.mantis.com','',3,NULL,NULL,NULL,NULL,NULL),(87,81,11,12,2,'БФТЗ разработано','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(88,81,13,14,2,'БФТЗ согласовано','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(89,81,16,17,1,'Функционал','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(90,81,18,19,1,'Версия','www.mantis.com',NULL,3,NULL,NULL,NULL,NULL,NULL),(91,91,1,20,0,'BR 123','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(92,91,2,3,1,'Предварительная оценка','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(93,91,4,9,1,'Экспертиза','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(94,91,5,6,2,'Экспертиза разработана','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(95,91,7,8,2,'Экспертиза согласована','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(96,91,10,15,1,'БФТЗ','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(97,91,11,12,2,'БФТЗ разработано','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(98,91,13,14,2,'БФТЗ согласовано','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(99,91,16,17,1,'Функционал','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(100,91,18,19,1,'Версия','www.mantis.com',NULL,4,NULL,NULL,NULL,NULL,NULL),(101,101,1,20,0,'BR 123','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(102,101,2,3,1,'Предварительная оценка','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(103,101,4,9,1,'Экспертиза','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(104,101,5,6,2,'Экспертиза разработана','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(105,101,7,8,2,'Экспертиза согласована','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(106,101,10,15,1,'БФТЗ','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(107,101,11,12,2,'БФТЗ разработано','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(108,101,13,14,2,'БФТЗ согласовано','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(109,101,16,17,1,'Функционал','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(110,101,18,19,1,'Версия','www.mantis.com',NULL,5,NULL,NULL,NULL,NULL,NULL),(111,111,1,20,0,'BR 1849','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(112,111,2,3,1,'Предварительная оценка','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(113,111,4,9,1,'Экспертиза','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(114,111,5,6,2,'Экспертиза разработана','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(115,111,7,8,2,'Экспертиза согласована','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(116,111,10,15,1,'БФТЗ','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(117,111,11,12,2,'БФТЗ разработано','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(118,111,13,14,2,'БФТЗ согласовано','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(119,111,16,17,1,'Функционал','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL),(120,111,18,19,1,'Версия','www.mantis.com',NULL,6,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `vw_ListOfBR`
--

/*!50001 DROP VIEW IF EXISTS `vw_ListOfBR`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ListOfBR` AS select `br`.`idBR` AS `idBR`,`br`.`BRDeleted` AS `BRDeleted`,`br`.`BRNumber` AS `BRnumber`,`br`.`BRName` AS `BRName`,`prj`.`ProjectName` AS `ProjectName` from (`BusinessRequests` `br` left join `Projects` `prj` on((`prj`.`idProject` = `br`.`idProject`))) where (`br`.`BRDeleted` <> 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ListOfPeople`
--

/*!50001 DROP VIEW IF EXISTS `vw_ListOfPeople`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ListOfPeople` AS select concat(`ppl`.`Family`,' ',`ppl`.`Name`,' ',`ppl`.`patronymic`) AS `fio`,`ppl`.`idHuman` AS `idHuman`,`org`.`CustomerName` AS `CustomerName`,`org`.`idOrganization` AS `idOrganization` from (`People` `ppl` left join `Organization` `org` on((`ppl`.`idOrganization` = `org`.`idOrganization`))) where (`ppl`.`Humandeleted` <> 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ListOfWorkEffort`
--

/*!50001 DROP VIEW IF EXISTS `vw_ListOfWorkEffort`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ListOfWorkEffort` AS select `wos`.`idWorksOfEstimate` AS `idWorksOfEstimate`,`wos`.`WorkName` AS `WorkName`,`wos`.`mantisNumber` AS `mantisNumber`,`wos`.`idEstimateWorkPackages` AS `idEstimateWorkPackages`,`wos`.`idWbs` AS `idWbs`,`wef`.`idLaborExpenditures` AS `idLaborExpenditures`,`wef`.`workEffort` AS `workEffort`,`wef`.`idTeamMember` AS `idTeamMember`,`pc`.`idRole` AS `idRole`,`rlm`.`RoleName` AS `RoleName`,`pc`.`idHuman` AS `idHuman`,concat(`rlm`.`RoleName`,' ',`ppl`.`Family`,' ',`ppl`.`Name`) AS `team_member` from ((((`WorksOfEstimate` `wos` left join `WorkEffort` `wef` on((`wos`.`idWorksOfEstimate` = `wef`.`idWorksOfEstimate`))) left join `ProjectCommand` `pc` on((`wef`.`idTeamMember` = `pc`.`id`))) left join `RoleModel` `rlm` on((`pc`.`idRole` = `rlm`.`idRole`))) left join `People` `ppl` on((`pc`.`idHuman` = `ppl`.`idHuman`))) order by `wos`.`idWorksOfEstimate`,`wef`.`idLaborExpenditures` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ProjectCommand`
--

/*!50001 DROP VIEW IF EXISTS `vw_ProjectCommand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ProjectCommand` AS select `pc`.`id` AS `id`,`pc`.`idBR` AS `idBR`,`pc`.`idHuman` AS `idHuman`,`pc`.`idRole` AS `idRole`,`pc`.`parent_id` AS `parent_id`,concat(`rlm`.`RoleName`,' ',`ppl`.`Family`,' ',`ppl`.`Name`) AS `team_member` from ((`ProjectCommand` `pc` left join `People` `ppl` on((`ppl`.`idHuman` = `pc`.`idHuman`))) left join `RoleModel` `rlm` on((`rlm`.`idRole` = `pc`.`idRole`))) where ((`pc`.`deleted` <> 1) and (`pc`.`parent_id` <> 0)) order by `pc`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ResultEvents`
--

/*!50001 DROP VIEW IF EXISTS `vw_ResultEvents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ResultEvents` AS select `rsl`.`idResultEvents` AS `idResultEvents`,`rsl`.`ResultEventsDate` AS `ResultEventsDate`,`rsl`.`ResultEventsName` AS `ResultEventsName`,`rsl`.`ResultEventsMantis` AS `ResultEventsMantis`,`rsl`.`idwbs` AS `idwbs`,`rsl`.`deleted` AS `deleted`,concat(`rlm`.`RoleName`,' ',`ppl`.`Family`,' ',`ppl`.`Name`) AS `team_member`,concat(`ppl`.`Family`,'-',`org`.`ShortName`) AS `responsible` from ((((`ResultEvents` `rsl` left join `ProjectCommand` `prc` on((`prc`.`id` = `rsl`.`ResultEventResponsible`))) left join `People` `ppl` on((`ppl`.`idHuman` = `prc`.`idHuman`))) left join `RoleModel` `rlm` on((`rlm`.`idRole` = `prc`.`idRole`))) left join `Organization` `org` on((`org`.`idOrganization` = `ppl`.`idOrganization`))) where (`rsl`.`deleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report1`
--

/*!50001 DROP VIEW IF EXISTS `vw_report1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report1` AS select `br`.`BRNumber` AS `BRNumber`,`br`.`BRName` AS `BRName`,`wbs`.`id` AS `id`,`wbs`.`idBr` AS `idBr`,`wbs`.`idOrgResponsible` AS `idOrgResponsible`,`wbs`.`name` AS `name`,`wbs`.`idResultStatus` AS `idResultStatus`,`wbs`.`mantis` AS `mantis`,`rst`.`ResultStatusName` AS `ResultStatusName`,concat(`ppl`.`Family`,' ',`ppl`.`Name`,' ',`ppl`.`patronymic`) AS `fio`,`ppl`.`idHuman` AS `idHuman`,`org`.`CustomerName` AS `CustomerName`,`sv`.`version_number` AS `version_number`,`sv`.`idsystem_versions` AS `idsystem_versions` from (((((`wbs` left join `ResultStatus` `rst` on((`wbs`.`idResultStatus` = `rst`.`idResultStatus`))) left join `BusinessRequests` `br` on((`wbs`.`idBr` = `br`.`idBR`))) left join `People` `ppl` on((`wbs`.`idPeopleResponsible` = `ppl`.`idHuman`))) left join `Organization` `org` on((`wbs`.`idOrgResponsible` = `org`.`idOrganization`))) left join `SystemVersions` `sv` on((`wbs`.`idsystem_versions` = `sv`.`idsystem_versions`))) where ((`wbs`.`rgt` - `wbs`.`lft`) <= 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_settings`
--

/*!50001 DROP VIEW IF EXISTS `vw_settings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_settings` AS select `stt`.`id_param` AS `id_param`,`stt`.`Prm_name` AS `Prm_name`,`stt`.`Prm_description` AS `Prm_description`,`stt`.`Prm_enum_id` AS `Prm_enum_id`,`enm`.`enm_num_value` AS `enm_num_value`,`enm`.`enm_str_value` AS `enm_str_value` from (`settings` `stt` left join `EnumSettings` `enm` on((`enm`.`id_param` = `stt`.`id_param`))) where ((`enm`.`idEnumSettings` = `stt`.`Prm_enum_id`) and (`stt`.`deleted` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-15 22:00:17
