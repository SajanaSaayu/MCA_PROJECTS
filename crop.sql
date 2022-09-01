/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.9 : Database - crop_suggestion
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crop_suggestion` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `crop_suggestion`;

/*Table structure for table `characteristics` */

DROP TABLE IF EXISTS `characteristics`;

CREATE TABLE `characteristics` (
  `characteristic_id` int(11) NOT NULL AUTO_INCREMENT,
  `characteristic_name` varchar(55) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`characteristic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `characteristics` */

insert  into `characteristics`(`characteristic_id`,`characteristic_name`,`description`) values (1,'Moisture','-'),(2,'pH','-\r\n'),(3,'Nitrogen','-'),(4,'Phosphorus','-'),(5,'Potassium','-'),(6,'Temperature','-');

/*Table structure for table `chemicals` */

DROP TABLE IF EXISTS `chemicals`;

CREATE TABLE `chemicals` (
  `chemical_id` int(11) NOT NULL AUTO_INCREMENT,
  `chemical_name` varchar(55) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`chemical_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `chemicals` */

insert  into `chemicals`(`chemical_id`,`chemical_name`,`description`) values (18,'lime','highly useful'),(15,'iron','high yield producing');

/*Table structure for table `crop` */

DROP TABLE IF EXISTS `crop`;

CREATE TABLE `crop` (
  `crop_id` int(11) DEFAULT NULL,
  `crop` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `crop` */

insert  into `crop`(`crop_id`,`crop`) values (1,'Arecanut'),(2,'Other'),(3,'Rice'),(4,'Banana'),(5,'Cashewnut'),(6,'Coconut'),(7,'Dry Ginger'),(8,'Sugercane'),(9,'Sweet Potato'),(10,'Topioca'),(11,'Black Pepper'),(12,'Dry Chillies'),(13,'Other Oilseeds'),(14,'Turmeric'),(15,'Maize'),(16,'Moong(Green Gram)'),(17,'Urad'),(18,'Arhar/Tur'),(19,'Groundnut'),(20,'Sunflower'),(21,'Bajra'),(22,'Caster Seed'),(23,'Cotton(lint)'),(24,'Horse-gram'),(25,'Jowar'),(26,'Korra'),(27,'Ragi'),(28,'Tobacco'),(29,'Gram'),(30,'Wheat'),(31,'Masoor'),(32,'Sesamun'),(33,'Linseed'),(34,'Safflower'),(35,'Onion'),(36,'othermisc'),(37,'Samai'),(38,'Small millets'),(39,'Coriander'),(40,'Potato'),(41,'Other4pluses'),(42,'Soyabean'),(43,'Beans and matter'),(44,'Bhindi'),(45,'Brinjal'),(46,'Citrus Fruit'),(47,'Cucumber'),(48,'Grapes'),(49,'Mango'),(50,'Orange'),(51,'Other Fiber'),(52,'other Fresh Fruits'),(53,'Other Vegitables'),(54,'Papaya'),(55,'Pome Fruit'),(56,'Tomoto'),(57,'Rapeseed and Mustard'),(58,'Mesta'),(59,'Cowpeal(lobia)'),(60,'Lemon'),(61,'Pome Granet'),(62,'Sapota'),(63,'Cabage'),(64,'Niger Seed'),(65,'Bottle Gourd'),(66,'Sannhamp'),(67,'Varagu'),(68,'Garlic'),(69,'Peas'),(70,'Ginger'),(71,'Oilseed'),(72,'Pulses total'),(73,'pease and beans'),(74,'Jute'),(75,'Black 29'),(76,'Paddy'),(77,'Pineapple'),(78,'Barley'),(79,'Khesari'),(80,'Guarseed'),(81,'Moth'),(82,'Cereals and millets'),(83,'Cond-spcs'),(84,'Arcanut(processed)'),(85,'Atcanut'),(86,'5 processed'),(87,'5 raw'),(88,'Cardamon'),(89,'Bitter Gaurd'),(90,'Drum stick'),(91,'Jack Fruit'),(92,'Rubber'),(93,'Snak Guard'),(94,'Tea'),(95,'Pumpkin'),(96,'Coffee'),(97,'Cauliflower'),(98,'other 46'),(99,'Watermelon'),(100,'total foodgrain'),(101,'Carrot'),(102,'Redish'),(103,'Kapas'),(104,'Colocosia'),(105,'Lentil'),(106,'Bean'),(107,'Jobster'),(108,'Perilla'),(109,'Rajmash Kholar'),(110,'Nagada'),(111,'Lab-Lab'),(112,'Ribed Guard'),(113,'Xam'),(114,'Ash Gourd'),(115,'Ber'),(116,'Litchi'),(117,'Apple'),(118,'Beet Root'),(119,'Plums'),(120,'Pear'),(121,'peach'),(122,'Turnip'),(123,'Other Dry Fruit');

/*Table structure for table `crops` */

DROP TABLE IF EXISTS `crops`;

CREATE TABLE `crops` (
  `crop_id` int(11) NOT NULL AUTO_INCREMENT,
  `crop_name` varchar(55) DEFAULT NULL,
  `crop_image` varchar(500) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`crop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `crops` */

insert  into `crops`(`crop_id`,`crop_name`,`crop_image`,`description`) values (10,'sugarcane','static/uploads/5f880323-55d0-4124-865e-37a8a1a65ff8sugarcane.jpg','very juicy'),(7,'rice','static/uploads/1720ff80-b277-4a83-af49-c496f8f13a48rice-1jpg.jpg','highly rich in carbohydrates'),(8,'coffee','static/uploads/dcc4dab9-0ba1-41e7-9663-8ca239ab5535coffee.jpg','refreshing taste');

/*Table structure for table `cropsoils` */

DROP TABLE IF EXISTS `cropsoils`;

CREATE TABLE `cropsoils` (
  `crop_soil_id` int(11) NOT NULL AUTO_INCREMENT,
  `crop_id` int(11) DEFAULT NULL,
  `soil_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`crop_soil_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `cropsoils` */

/*Table structure for table `cropyield` */

DROP TABLE IF EXISTS `cropyield`;

CREATE TABLE `cropyield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `YEAR` int(11) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `crop` varchar(255) DEFAULT NULL,
  `acre` float DEFAULT NULL,
  `output` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=latin1;

/*Data for the table `cropyield` */

insert  into `cropyield`(`id`,`state`,`place`,`YEAR`,`TYPE`,`crop`,`acre`,`output`) values (4,'Andaman and Nicobar Islands','NICOBARS',2000,'Kharif     ','Rice',102,321),(3,'Andaman and Nicobar Islands','NICOBARS',2000,'Kharif     ','Other Kharif pulses',2,1),(5,'Andaman and Nicobar Islands','NICOBARS',2000,'Whole Year ','Banana',176,641),(6,'Andaman and Nicobar Islands','NICOBARS',2000,'Whole Year ','Cashewnut',720,165),(7,'Andaman and Nicobar Islands','NICOBARS',2000,'Whole Year ','Coconut ',18168,65100000),(8,'Andaman and Nicobar Islands','NICOBARS',2000,'Whole Year ','Dry ginger',36,100),(9,'Andaman and Nicobar Islands','NICOBARS',2000,'Whole Year ','Sugarcane',1,2),(10,'Andaman and Nicobar Islands','NICOBARS',2000,'Whole Year ','Sweet potato',5,15),(11,'Andaman and Nicobar Islands','NICOBARS',2000,'Whole Year ','Tapioca',40,169),(12,'Andaman and Nicobar Islands','NICOBARS',2001,'Kharif     ','Arecanut',1254,2061),(13,'Andaman and Nicobar Islands','NICOBARS',2001,'Kharif     ','Other Kharif pulses',2,1),(14,'Andaman and Nicobar Islands','NICOBARS',2001,'Kharif     ','Rice',83,300),(15,'Andaman and Nicobar Islands','NICOBARS',2001,'Whole Year ','Cashewnut',719,192),(16,'Andaman and Nicobar Islands','NICOBARS',2001,'Whole Year ','Coconut ',18190,64430000),(17,'Andaman and Nicobar Islands','NICOBARS',2001,'Whole Year ','Dry ginger',46,100),(18,'Andaman and Nicobar Islands','NICOBARS',2001,'Whole Year ','Sugarcane',1,1),(19,'Andaman and Nicobar Islands','NICOBARS',2001,'Whole Year ','Sweet potato',11,33),(20,'Andaman and Nicobar Islands','NICOBARS',2002,'Kharif     ','Rice',189.2,510.84),(21,'Andaman and Nicobar Islands','NICOBARS',2002,'Whole Year ','Arecanut',1258,2083),(22,'Andaman and Nicobar Islands','NICOBARS',2002,'Whole Year ','Banana',213,1278),(23,'Andaman and Nicobar Islands','NICOBARS',2002,'Whole Year ','Black pepper',63,13.5),(24,'Andaman and Nicobar Islands','NICOBARS',2002,'Whole Year ','Cashewnut',719,208),(25,'Andaman and Nicobar Islands','NICOBARS',2002,'Whole Year ','Coconut ',18240,67490000),(26,'Andaman and Nicobar Islands','NICOBARS',2002,'Whole Year ','Dry chillies',413,28.8),(27,'Andaman and Nicobar Islands','NICOBARS',2002,'Whole Year ','Dry ginger',47.3,133),(28,'Andaman and Nicobar Islands','NICOBARS',2002,'Whole Year ','Sugarcane',5,40),(29,'Andaman and Nicobar Islands','NICOBARS',2003,'Kharif     ','Rice',52,90.17),(30,'Andaman and Nicobar Islands','NICOBARS',2003,'Whole Year ','Arecanut',1261,1525),(31,'Andaman and Nicobar Islands','NICOBARS',2003,'Whole Year ','Banana',266,1763),(32,'Andaman and Nicobar Islands','NICOBARS',2003,'Whole Year ','Black pepper',75.5,15.86),(33,'Andaman and Nicobar Islands','NICOBARS',2003,'Whole Year ','Cashewnut',717,208.5),(34,'Andaman and Nicobar Islands','NICOBARS',2003,'Whole Year ','Coconut ',18284.7,68580000),(35,'Andaman and Nicobar Islands','NICOBARS',2003,'Whole Year ','Dry chillies',60,102),(36,'Andaman and Nicobar Islands','NICOBARS',2003,'Whole Year ','Dry ginger',102,326.4),(37,'Andaman and Nicobar Islands','NICOBARS',2003,'Whole Year ','other oilseeds',4.2,0.3),(38,'Andaman and Nicobar Islands','NICOBARS',2004,'Kharif     ','Rice',52.94,72.57),(39,'Andaman and Nicobar Islands','NICOBARS',2004,'Whole Year ','Arecanut',1264.7,805.85),(40,'Andaman and Nicobar Islands','NICOBARS',2004,'Whole Year ','Banana',66.42,404.12),(41,'Andaman and Nicobar Islands','NICOBARS',2004,'Whole Year ','Black pepper',85,15.86),(42,'Andaman and Nicobar Islands','NICOBARS',2004,'Whole Year ','Cashewnut',683.5,197.9),(43,'Andaman and Nicobar Islands','NICOBARS',2004,'Whole Year ','Coconut ',18394.7,52380000),(44,'Andaman and Nicobar Islands','NICOBARS',2004,'Whole Year ','Dry chillies',60,145.2),(45,'Andaman and Nicobar Islands','NICOBARS',2004,'Whole Year ','Dry ginger',118,366),(46,'Andaman and Nicobar Islands','NICOBARS',2004,'Whole Year ','other oilseeds',1,0.11),(47,'Andaman and Nicobar Islands','NICOBARS',2005,'Kharif     ','Rice',2.09,12.06),(48,'Andaman and Nicobar Islands','NICOBARS',2005,'Whole Year ','Arecanut',795.67,NULL),(49,'Andaman and Nicobar Islands','NICOBARS',2005,'Whole Year ','Banana',22,582),(50,'Andaman and Nicobar Islands','NICOBARS',2005,'Whole Year ','Black pepper',41,0.1),(51,'Andaman and Nicobar Islands','NICOBARS',2005,'Whole Year ','Cashewnut',450,55.8),(52,'Andaman and Nicobar Islands','NICOBARS',2005,'Whole Year ','Coconut ',13876.6,52030000),(53,'Andaman and Nicobar Islands','NICOBARS',2005,'Whole Year ','Dry chillies',17,NULL),(54,'Andaman and Nicobar Islands','NICOBARS',2005,'Whole Year ','Turmeric',10,70),(55,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Arecanut',896,477.6),(56,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Banana',198,976),(57,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Black pepper',22.16,0.68),(58,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Cashewnut',450,85.13),(59,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Coconut ',14358,59370000),(60,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Dry chillies',3,9),(61,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Dry ginger',6,21),(62,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Sugarcane',0.2,0.5),(63,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Sweet potato',18,86),(64,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Tapioca',52.03,450),(65,'Andaman and Nicobar Islands','NICOBARS',2006,'Whole Year ','Turmeric',2.5,1.03),(66,'Andaman and Nicobar Islands','NICOBARS',2010,'Autumn     ','Rice',3.5,10),(67,'Andaman and Nicobar Islands','NICOBARS',2010,'Autumn     ','Sugarcane',13.4,41.75),(68,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Arecanut',944,1610),(69,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Black pepper',23,8.5),(70,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Cashewnut',1000.5,260.5),(71,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Dry chillies',12,25),(72,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Dry ginger',7,9.64),(73,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Maize',3.84,18.22),(74,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Moong(Green Gram)',1.5,1.1),(75,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Sweet potato',22,208),(76,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Turmeric',2,0.5),(77,'Andaman and Nicobar Islands','NICOBARS',2010,'Rabi       ','Urad',1.5,1.16),(78,'Andaman and Nicobar Islands','NICOBARS',2010,'Whole Year ','Banana',593,3425),(79,'Andaman and Nicobar Islands','NICOBARS',2010,'Whole Year ','Coconut ',14560,71300000),(80,'Andaman and Nicobar Islands','NICOBARS',2010,'Whole Year ','Tapioca',69,575),(81,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Kharif     ','Arecanut',3100,5200),(82,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Kharif     ','Other Kharif pulses',668,448),(83,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Kharif     ','Rice',10779,31863),(84,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Whole Year ','Banana',1531,12073),(85,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Whole Year ','Cashewnut',80,54),(86,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Whole Year ','Coconut ',6992,23900000),(87,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Whole Year ','Dry ginger',352,1120),(88,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Whole Year ','other oilseeds',133,55),(89,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Whole Year ','Sugarcane',141,3736),(90,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Whole Year ','Sweet potato',78,843),(91,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2000,'Whole Year ','Tapioca',160,2108),(92,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2001,'Kharif     ','Arecanut',3100,5239),(93,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2001,'Kharif     ','Other Kharif pulses',418,199),(94,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2001,'Kharif     ','Rice',9718,27033),(95,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2001,'Whole Year ','Cashewnut',81,33),(96,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2001,'Whole Year ','Coconut ',7015,25250000),(97,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2001,'Whole Year ','Dry ginger',344,1124),(98,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2001,'Whole Year ','Sugarcane',81,2379),(99,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2001,'Whole Year ','Sweet potato',100,5),(100,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Kharif     ','Rice',6854.3,18995.6),(101,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Arecanut',1160,3011.7),(102,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Banana',957.57,8582),(103,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Black pepper',175,191.14),(104,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Cashewnut',40.5,44),(105,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Coconut ',3575,15400000),(106,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Dry chillies',235.72,824.3),(107,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Dry ginger',98.66,929),(108,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','other oilseeds',35.62,21.4),(109,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Sugarcane',71.3,1500),(110,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Sweet potato',30,240),(111,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Tapioca',255,1420),(112,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2006,'Whole Year ','Turmeric',68,408),(113,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Autumn     ','Rice',6791,20118),(114,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Autumn     ','Sugarcane',73.33,889.2),(115,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Arecanut',1296,2290),(116,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Arhar/Tur',294.5,90.8),(117,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Black pepper',168,13.5),(118,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Cashewnut',84.5,39),(119,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Dry chillies',254,402),(120,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Dry ginger',110,1011.84),(121,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Groundnut',4.75,6.8),(122,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Maize',86.7,96.4),(123,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Moong(Green Gram)',1168.6,556.55),(124,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Sunflower',2.9,1.9),(125,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Sweet potato',109,480),(126,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Turmeric',68,376.5),(127,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Rabi       ','Urad',1059.5,458.79),(128,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Whole Year ','Banana',657,7968),(129,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Whole Year ','Coconut ',3668,12700000),(130,'Andaman and Nicobar Islands','NORTH AND MIDDLE ANDAMAN',2010,'Whole Year ','Tapioca',186.5,1355),(131,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Kharif     ','Rice',10695.8,31600.8),(132,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','Arecanut',3105,5267),(133,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','Banana',1524,10882),(134,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','Black pepper',487,102.5),(135,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','Cashewnut',81,24),(136,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','Coconut ',7060,26830000),(137,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','Dry chillies',239,20.9),(138,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','Dry ginger',352,1145),(139,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','other oilseeds',85.1,40.31),(140,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2002,'Whole Year ','Sugarcane',455,13760),(141,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Kharif     ','Rice',10509.4,30760.7),(142,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','Arecanut',3118,5182),(143,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','Banana',1530,11558),(144,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','Black pepper',497,104.37),(145,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','Cashewnut',116.5,26.14),(146,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','Coconut ',7110,26660000),(147,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','Dry chillies',340,578),(148,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','Dry ginger',406,1299.2),(149,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','other oilseeds',82.09,35.51),(150,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2003,'Whole Year ','Sugarcane',268,2879.52),(151,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Kharif     ','Rice',10682,29119.7),(152,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','Arecanut',3160.67,3975.2),(153,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','Banana',1912.1,17374.4),(154,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','Black pepper',570,104.36),(155,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','Cashewnut',116.5,25.1),(156,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','Coconut ',7156.7,34750000),(157,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','Dry chillies',340,822.8),(158,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','Dry ginger',410,1462),(159,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','other oilseeds',89.3,46.5),(160,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2004,'Whole Year ','Sugarcane',145.26,1560),(161,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Kharif     ','Rice',8683.38,25871),(162,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Arecanut',3250.78,3058.46),(163,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Banana',1656.8,10251.1),(164,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Black pepper',656.45,35.95),(165,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Cashewnut',118.5,30.22),(166,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Coconut ',7050.45,26430000),(167,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Dry chillies',370.7,877.6),(168,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Dry ginger',200,1800),(169,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','other oilseeds',53.55,34.2),(170,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Sugarcane',128.02,2448.2),(171,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Sweet potato',131.9,700.35),(172,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Tapioca',254.5,1480),(173,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2005,'Whole Year ','Turmeric',81.7,572),(174,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Kharif     ','Rice',921.87,2539.64),(175,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Arecanut',2000,2350),(176,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Banana',483,4150),(177,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Black pepper',413.1,20.18),(178,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Cashewnut',79.5,26),(179,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Coconut ',3483.09,14190000),(180,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Dry chillies',124.6,34.7),(181,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Dry ginger',100.9,900),(182,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','other oilseeds',24,14.98),(183,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Sugarcane',53.5,999.5),(184,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Sweet potato',30.4,220),(185,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Tapioca',40,160),(186,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2006,'Whole Year ','Turmeric',10,60),(187,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Autumn     ','Rice',1595.5,3788),(188,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Autumn     ','Sugarcane',67.5,402),(189,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Arecanut',1912,1900),(190,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Arhar/Tur',20.5,13.2),(191,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Black pepper',409,98),(192,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Cashewnut',15,10.5),(193,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Dry chillies',128,148),(194,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Dry ginger',94,828.52),(195,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Groundnut',15.5,7.6),(196,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Maize',73,253),(197,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Moong(Green Gram)',29.9,17.85),(198,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Sunflower',1,0.5),(199,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Sweet potato',32,235),(200,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Turmeric',10,105),(201,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Rabi       ','Urad',34,15.05),(202,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Whole Year ','Banana',360,5517),(203,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Whole Year ','Coconut ',3540,11000000),(204,'Andaman and Nicobar Islands','SOUTH ANDAMANS',2010,'Whole Year ','Tapioca',22.5,220);

/*Table structure for table `enquiry` */

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `enquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `farmer_id` int(11) DEFAULT NULL,
  `enquiry` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`enquiry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `enquiry` */

insert  into `enquiry`(`enquiry_id`,`farmer_id`,`enquiry`,`reply`,`date`) values (1,NULL,'hhad','pending','2022-03-24 22:09:40'),(2,6,'l.j','dvfdf','2022-03-24 22:10:26'),(3,1,'what is hfigkhjfk','erg kju hytg','2022-03-25 09:41:05'),(4,1,'rgnhg hkjhj','tgh gjgjg','2022-03-25 14:47:28');

/*Table structure for table `experts` */

DROP TABLE IF EXISTS `experts`;

CREATE TABLE `experts` (
  `expert_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `quali` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`expert_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `experts` */

insert  into `experts`(`expert_id`,`login_id`,`fname`,`lname`,`phone`,`email`,`quali`) values (1,9,'dfh','vb','9876778888','kjfhv@cd.cd',NULL),(2,10,'Ragav','Raj','8798456754','ragavraj@gmail.com',NULL),(3,11,'athira','subhash','964545','',NULL),(4,12,'Athira','Subash','9867564598','athira@gmail.com','static/46995f73-43fa-4c35-9f53-b13fd5f20f8eScreenshot (6).png'),(5,13,'Rajiv ','Rao','9867345623','rajivrao@gmail.com','static/6a0fd413-6aca-4428-93cf-0a1fc88234cbScreenshot (3).png');

/*Table structure for table `farmers` */

DROP TABLE IF EXISTS `farmers`;

CREATE TABLE `farmers` (
  `farmer_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`farmer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `farmers` */

insert  into `farmers`(`farmer_id`,`login_id`,`first_name`,`last_name`,`gender`,`dob`,`phone`,`email`) values (1,2,'anju','paul','female','2016-11-16','812330','abc@gmail.com'),(2,3,'riya','mathew','female','1997-06-11','8547312330','riya.mathew95@gmail.com'),(3,4,'teenu','baiju','female','2018-01-17','45763874252','abc@gmail.com'),(4,5,'uiweghiuse','eshgiuse','female','2018-11-29','576347562','fgh@gmail.com'),(5,6,'jhdgiusehgw','giuerhgoiw3hg','male','2017-10-29','13741452369834','abc@gmail.com'),(6,7,'raj','singh','male','1992-10-28','812330','raj123@gmail.com');

/*Table structure for table `fertilizer_chemicals` */

DROP TABLE IF EXISTS `fertilizer_chemicals`;

CREATE TABLE `fertilizer_chemicals` (
  `fertilizer_chemical_id` int(11) NOT NULL AUTO_INCREMENT,
  `fertilizer_id` int(11) DEFAULT NULL,
  `chemical_id` int(11) DEFAULT NULL,
  `content_quantity` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fertilizer_chemical_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `fertilizer_chemicals` */

insert  into `fertilizer_chemicals`(`fertilizer_chemical_id`,`fertilizer_id`,`chemical_id`,`content_quantity`) values (5,25,18,'6'),(4,25,15,'200'),(3,25,15,'656'),(6,18,15,'5');

/*Table structure for table `fertilizer_dataset` */

DROP TABLE IF EXISTS `fertilizer_dataset`;

CREATE TABLE `fertilizer_dataset` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `temperature` varchar(10) NOT NULL,
  `humidity` varchar(10) NOT NULL,
  `moisture` varchar(10) NOT NULL,
  `soil_type` varchar(25) NOT NULL,
  `crop_type` varchar(25) NOT NULL,
  `nitrogen` varchar(10) NOT NULL,
  `potassium` varchar(10) NOT NULL,
  `phosphorous` varchar(10) NOT NULL,
  `fertilizer` varchar(25) NOT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=MyISAM AUTO_INCREMENT=185 DEFAULT CHARSET=latin1;

/*Data for the table `fertilizer_dataset` */

insert  into `fertilizer_dataset`(`set_id`,`temperature`,`humidity`,`moisture`,`soil_type`,`crop_type`,`nitrogen`,`potassium`,`phosphorous`,`fertilizer`) values (1,'26','52','38','Sandy','Maize','37','0','0','Urea'),(2,'29','52','45','Loamy','Sugarcane','12','0','36','DAP'),(3,'34','65','62','Black','Cotton','7','9','30','14-35-14'),(4,'32','62','34','Red','Tobacco','22','0','20','28-28'),(5,'28','54','46','Clayey','Paddy','35','0','0','Urea'),(6,'26','52','35','Sandy','Barley','12','10','13','17-17-17'),(7,'25','50','64','Red','Cotton','9','0','10','20-20'),(8,'33','64','50','Loamy','Wheat','41','0','0','Urea'),(9,'30','60','42','Sandy','Millets','21','0','18','28-28'),(10,'27','54','28','Clayey','Pulses','13','0','40','DAP'),(11,'31','62','48','Sandy','Maize','14','15','12','17-17-17'),(12,'25','50','65','Loamy','Cotton','36','0','0','Urea'),(13,'32','62','41','Clayey','Paddy','24','0','22','28-28'),(14,'31','62','49','Black','Sugarcane','10','13','14','17-17-17'),(15,'33','64','34','Clayey','Pulses','38','0','0','Urea'),(16,'25','50','39','Sandy','Barley','21','0','19','28-28'),(17,'28','54','65','Black','Cotton','39','0','0','Urea'),(18,'29','58','52','Loamy','Wheat','13','0','36','DAP'),(19,'30','60','44','Sandy','Millets','10','0','9','20-20'),(20,'34','65','53','Loamy','Sugarcane','12','14','12','17-17-17'),(21,'35','68','33','Red','Tobacco','11','0','37','DAP'),(22,'28','54','37','Black','Millets','36','0','0','Urea'),(23,'33','64','39','Clayey','Paddy','13','0','10','20-20'),(24,'26','52','44','Sandy','Maize','23','0','20','28-28'),(25,'30','60','63','Red','Cotton','9','9','29','14-35-14'),(26,'32','62','30','Loamy','Sugarcane','38','0','0','Urea'),(27,'26','52','36','Clayey','Pulses','14','0','13','20-20'),(28,'30','60','27','Loamy','Sugarcane','12','0','40','DAP'),(29,'34','65','38','Clayey','Paddy','39','0','0','Urea'),(30,'36','68','38','Sandy','Barley','7','9','30','14-35-14'),(31,'26','52','48','Loamy','Wheat','23','0','19','28-28'),(32,'28','54','35','Black','Millets','41','0','0','Urea'),(33,'30','60','61','Loamy','Cotton','8','10','31','14-35-14'),(34,'37','70','37','Clayey','Paddy','12','0','41','DAP'),(35,'29','58','34','Sandy','Millets','15','0','37','DAP'),(36,'27','54','30','Clayey','Pulses','13','0','13','20-20'),(37,'30','60','58','Loamy','Sugarcane','10','7','32','14-35-14'),(38,'32','62','34','Red','Tobacco','22','0','24','28-28'),(39,'34','65','60','Black','Sugarcane','35','0','0','Urea'),(40,'35','67','42','Sandy','Barley','10','0','35','DAP'),(41,'38','70','48','Loamy','Wheat','8','8','28','14-35-14'),(42,'29','58','43','Clayey','Paddy','24','0','18','28-28'),(43,'33','64','51','Sandy','Maize','5','9','29','14-35-14'),(44,'34','65','31','Red','Tobacco','23','0','21','28-28'),(45,'28','54','38','Clayey','Pulses','40','0','0','Urea'),(46,'30','60','47','Sandy','Barley','12','0','42','DAP'),(47,'31','62','63','Red','Cotton','11','12','15','17-17-17'),(48,'27','53','43','Black','Millets','23','0','24','28-28'),(49,'34','65','54','Loamy','Wheat','38','0','0','Urea'),(50,'29','58','37','Sandy','Millets','8','0','15','20-20'),(51,'25','50','56','Loamy','Sugarcane','11','13','15','17-17-17'),(52,'28','54','41','Clayey','Paddy','36','0','0','Urea'),(53,'30','60','49','Loamy','Wheat','13','0','9','20-20'),(54,'34','65','64','Black','Cotton','24','0','20','28-28'),(55,'28','54','47','Sandy','Barley','5','18','15','10-26-26'),(56,'36','68','62','Red','Cotton','15','0','40','DAP'),(57,'34','65','57','Black','Sugarcane','9','0','13','20-20'),(58,'29','58','55','Loamy','Sugarcane','8','8','33','14-35-14'),(59,'25','50','40','Clayey','Pulses','6','19','16','10-26-26'),(60,'30','60','38','Sandy','Millets','10','0','14','20-20'),(61,'26','52','39','Clayey','Pulses','21','0','23','28-28'),(62,'31','62','32','Red','Tobacco','39','0','0','Urea'),(63,'34','65','48','Loamy','Wheat','23','0','19','28-28'),(64,'29','58','42','Clayey','Paddy','9','10','22','14-35-14'),(65,'30','60','47','Sandy','Maize','22','0','21','28-28'),(66,'27','53','59','Loamy','Sugarcane','10','0','15','20-20'),(67,'26','52','36','Clayey','Pulses','7','16','20','10-26-26'),(68,'34','65','63','Red','Cotton','14','0','38','DAP'),(69,'28','54','43','Clayey','Paddy','10','8','29','14-35-14'),(70,'30','60','40','Sandy','Millets','41','0','0','Urea'),(71,'29','58','65','Black','Cotton','14','0','35','DAP'),(72,'26','52','59','Loamy','Sugarcane','11','0','9','20-20'),(73,'31','62','44','Sandy','Barley','21','0','28','28-28'),(74,'35','67','28','Clayey','Pulses','8','7','31','14-35-14'),(75,'29','58','30','Red','Tobacco','13','17','16','10-26-26'),(76,'27','53','30','Black','Millets','35','0','0','Urea'),(77,'36','68','50','Loamy','Wheat','12','18','19','10-26-26'),(78,'29','58','61','Loamy','Cotton','11','0','38','DAP'),(79,'34','65','45','Clayey','Paddy','6','19','21','10-26-26'),(80,'28','54','25','Sandy','Maize','9','10','30','14-35-14'),(81,'25','50','32','Clayey','Pulses','24','0','19','28-28'),(82,'30','60','27','Red','Tobacco','4','17','17','10-26-26'),(83,'38','72','51','Loamy','Wheat','39','0','0','Urea'),(84,'36','60','43','Sandy','Millets','15','0','41','DAP'),(85,'29','58','57','Black','Sugarcane','12','0','10','20-20'),(86,'29','58','33','Black','Oil seeds','9','7','30','14-35-14'),(87,'26','52','31','Red','Ground Nuts','14','0','41','DAP'),(88,'37','70','32','Black','Oil seeds','12','0','39','DAP'),(89,'29','58','40','Red','Ground Nuts','24','0','23','28-28'),(90,'25','50','26','Red','Ground Nuts','15','14','11','17-17-17'),(91,'26','52','32','Black','Oil seeds','12','0','8','20-20'),(92,'30','60','29','Red','Ground Nuts','41','0','0','Urea'),(93,'36','68','33','Black','Oil seeds','13','0','14','20-20'),(94,'32','62','34','Red','Ground Nuts','15','0','37','DAP'),(95,'27','53','35','Black','Oil seeds','37','0','0','Urea'),(96,'27','53','34','Black','Oil seeds','42','0','0','Urea'),(97,'33','64','31','Red','Ground Nuts','13','0','39','DAP'),(98,'30','60','26','Black','Oil seeds','8','9','30','14-35-14'),(99,'36','68','41','Red','Ground','41','0','0','Urea'),(100,'26','52','38','Sandy','Maize','37','0','0','Urea'),(101,'29','52','45','Loamy','Sugarcane','12','0','36','DAP'),(102,'34','65','62','Black','Cotton','7','9','30','14-35-14'),(103,'32','62','34','Red','Tobacco','22','0','20','28-28'),(104,'28','54','46','Clayey','Paddy','35','0','0','Urea'),(105,'26','52','35','Sandy','Barley','12','10','13','17-17-17'),(106,'25','50','64','Red','Cotton','9','0','10','20-20'),(107,'33','64','50','Loamy','Wheat','41','0','0','Urea'),(108,'30','60','42','Sandy','Millets','21','0','18','28-28'),(109,'27','54','28','Clayey','Pulses','13','0','40','DAP'),(110,'31','62','48','Sandy','Maize','14','15','12','17-17-17'),(111,'25','50','65','Loamy','Cotton','36','0','0','Urea'),(112,'32','62','41','Clayey','Paddy','24','0','22','28-28'),(113,'31','62','49','Black','Sugarcane','10','13','14','17-17-17'),(114,'33','64','34','Clayey','Pulses','38','0','0','Urea'),(115,'25','50','39','Sandy','Barley','21','0','19','28-28'),(116,'28','54','65','Black','Cotton','39','0','0','Urea'),(117,'29','58','52','Loamy','Wheat','13','0','36','DAP'),(118,'30','60','44','Sandy','Millets','10','0','9','20-20'),(119,'34','65','53','Loamy','Sugarcane','12','14','12','17-17-17'),(120,'35','68','33','Red','Tobacco','11','0','37','DAP'),(121,'28','54','37','Black','Millets','36','0','0','Urea'),(122,'33','64','39','Clayey','Paddy','13','0','10','20-20'),(123,'26','52','44','Sandy','Maize','23','0','20','28-28'),(124,'30','60','63','Red','Cotton','9','9','29','14-35-14'),(125,'32','62','30','Loamy','Sugarcane','38','0','0','Urea'),(126,'26','52','36','Clayey','Pulses','14','0','13','20-20'),(127,'30','60','27','Loamy','Sugarcane','12','0','40','DAP'),(128,'34','65','38','Clayey','Paddy','39','0','0','Urea'),(129,'36','68','38','Sandy','Barley','7','9','30','14-35-14'),(130,'26','52','48','Loamy','Wheat','23','0','19','28-28'),(131,'28','54','35','Black','Millets','41','0','0','Urea'),(132,'30','60','61','Loamy','Cotton','8','10','31','14-35-14'),(133,'37','70','37','Clayey','Paddy','12','0','41','DAP'),(134,'29','58','34','Sandy','Millets','15','0','37','DAP'),(135,'27','54','30','Clayey','Pulses','13','0','13','20-20'),(136,'30','60','58','Loamy','Sugarcane','10','7','32','14-35-14'),(137,'32','62','34','Red','Tobacco','22','0','24','28-28'),(138,'34','65','60','Black','Sugarcane','35','0','0','Urea'),(139,'35','67','42','Sandy','Barley','10','0','35','DAP'),(140,'38','70','48','Loamy','Wheat','8','8','28','14-35-14'),(141,'29','58','43','Clayey','Paddy','24','0','18','28-28'),(142,'33','64','51','Sandy','Maize','5','9','29','14-35-14'),(143,'34','65','31','Red','Tobacco','23','0','21','28-28'),(144,'28','54','38','Clayey','Pulses','40','0','0','Urea'),(145,'30','60','47','Sandy','Barley','12','0','42','DAP'),(146,'31','62','63','Red','Cotton','11','12','15','17-17-17'),(147,'27','53','43','Black','Millets','23','0','24','28-28'),(148,'34','65','54','Loamy','Wheat','38','0','0','Urea'),(149,'29','58','37','Sandy','Millets','8','0','15','20-20'),(150,'25','50','56','Loamy','Sugarcane','11','13','15','17-17-17'),(151,'28','54','41','Clayey','Paddy','36','0','0','Urea'),(152,'30','60','49','Loamy','Wheat','13','0','9','20-20'),(153,'34','65','64','Black','Cotton','24','0','20','28-28'),(154,'28','54','47','Sandy','Barley','5','18','15','10-26-26'),(155,'36','68','62','Red','Cotton','15','0','40','DAP'),(156,'34','65','57','Black','Sugarcane','9','0','13','20-20'),(157,'29','58','55','Loamy','Sugarcane','8','8','33','14-35-14'),(158,'25','50','40','Clayey','Pulses','6','19','16','10-26-26'),(159,'30','60','38','Sandy','Millets','10','0','14','20-20'),(160,'26','52','39','Clayey','Pulses','21','0','23','28-28'),(161,'31','62','32','Red','Tobacco','39','0','0','Urea'),(162,'34','65','48','Loamy','Wheat','23','0','19','28-28'),(163,'29','58','42','Clayey','Paddy','9','10','22','14-35-14'),(164,'30','60','47','Sandy','Maize','22','0','21','28-28'),(165,'27','53','59','Loamy','Sugarcane','10','0','15','20-20'),(166,'26','52','36','Clayey','Pulses','7','16','20','10-26-26'),(167,'34','65','63','Red','Cotton','14','0','38','DAP'),(168,'28','54','43','Clayey','Paddy','10','8','29','14-35-14'),(169,'30','60','40','Sandy','Millets','41','0','0','Urea'),(170,'29','58','65','Black','Cotton','14','0','35','DAP'),(171,'26','52','59','Loamy','Sugarcane','11','0','9','20-20'),(172,'31','62','44','Sandy','Barley','21','0','28','28-28'),(173,'35','67','28','Clayey','Pulses','8','7','31','14-35-14'),(174,'29','58','30','Red','Tobacco','13','17','16','10-26-26'),(175,'27','53','30','Black','Millets','35','0','0','Urea'),(176,'36','68','50','Loamy','Wheat','12','18','19','10-26-26'),(177,'29','58','61','Loamy','Cotton','11','0','38','DAP'),(178,'34','65','45','Clayey','Paddy','6','19','21','10-26-26'),(179,'28','54','25','Sandy','Maize','9','10','30','14-35-14'),(180,'25','50','32','Clayey','Pulses','24','0','19','28-28'),(181,'30','60','27','Red','Tobacco','4','17','17','10-26-26'),(182,'38','72','51','Loamy','Wheat','39','0','0','Urea'),(183,'36','60','43','Sandy','Millets','15','0','41','DAP'),(184,'29','58','57','Black','Sugarcane','12','0','10','20-20');

/*Table structure for table `fertilizers` */

DROP TABLE IF EXISTS `fertilizers`;

CREATE TABLE `fertilizers` (
  `fertilizer_id` int(11) NOT NULL AUTO_INCREMENT,
  `fertilizer_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`fertilizer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `fertilizers` */

insert  into `fertilizers`(`fertilizer_id`,`fertilizer_name`,`description`) values (25,'miracle20','very good mineral'),(24,'npk','useful for rose plant'),(18,'urea','good for flowering plant');

/*Table structure for table `geographical_features` */

DROP TABLE IF EXISTS `geographical_features`;

CREATE TABLE `geographical_features` (
  `geo_id` int(11) NOT NULL AUTO_INCREMENT,
  `soil_type_id` int(11) DEFAULT NULL,
  `feature` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`geo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `geographical_features` */

insert  into `geographical_features`(`geo_id`,`soil_type_id`,`feature`) values (18,16,'high water and moisture content'),(19,13,'clayey,deep and impermeable.retain moisture');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values (1,'admin','admin','admin'),(2,'anju','anju','farmer'),(3,'riya','riya','farmer'),(4,'teenu','teenu','farmer'),(5,'rytieu','hgidrgh','farmer'),(6,'star','star','farmer'),(7,'raj','rajsingh','farmer'),(8,'yy','yy','farmer'),(9,'ju','ju','expert'),(10,'ragav','ragav','expert'),(11,'','','expert'),(12,'athira','athira','expert'),(13,'rajiv','rajiv','expert');

/*Table structure for table `place` */

DROP TABLE IF EXISTS `place`;

CREATE TABLE `place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`place_id`)
) ENGINE=MyISAM AUTO_INCREMENT=653 DEFAULT CHARSET=latin1;

/*Data for the table `place` */

insert  into `place`(`place_id`,`state_id`,`place`) values (1,1,'Nicobar'),(2,1,'North and middle andaman'),(3,1,'South Andamans '),(4,2,'Anantapur'),(5,2,'Chittoor'),(6,2,'East Godavari'),(7,2,'Guntur'),(8,2,'Kadapa'),(9,2,'Krishna'),(10,2,'Kurnool'),(11,2,'Prakasam'),(12,2,'Nellore'),(13,2,'Srikakalam'),(14,2,'Visakhapatanam'),(15,2,'Vizianagaram'),(16,2,'West Godavari'),(17,3,'Anjaw'),(18,3,'Changlang'),(19,3,'Dibang Valley'),(20,3,'East Kameng'),(21,3,'East Siang'),(22,3,'Kurung Kameng'),(23,3,'Lohit'),(24,3,'Longding'),(25,3,'Lower Siang'),(26,3,'Lower Subansiri'),(27,3,'Namasal'),(28,3,'Papumpare'),(29,3,'Tawang'),(30,3,'Tirap'),(31,3,'Upper Siang'),(32,3,'upper Subansiri'),(33,3,'West Kameng'),(34,3,'West Siang'),(35,4,'Baksa'),(36,4,'Barpeta'),(37,4,'Bongaigaon'),(38,4,'Cachar'),(39,4,'Chirang'),(40,4,'Darrang'),(41,4,'Dhemaji'),(42,4,'Dhubri'),(43,4,'Dibrugarh'),(44,4,'Dimahasao'),(45,4,'9lpara'),(46,4,'Golakaandi'),(47,4,'Hailakandi'),(48,4,'Jorhat'),(49,4,'Kamrup'),(50,4,'49metro'),(51,4,'Karbi Anglong'),(52,4,'Karimganj'),(53,4,'Kokrajhar'),(54,4,'Lakhimpur'),(55,4,'Marigaon'),(56,4,'Nagaon'),(57,4,'Nalbari'),(58,4,'Sivasagar'),(59,4,'Sonitpur'),(60,4,'Tinsukia'),(61,4,'Udalguri'),(62,5,'Araria'),(63,5,'Arwal'),(64,5,'Aurangabad'),(65,5,'Banka'),(66,5,'Begusarai'),(67,5,'Bhagalpur'),(68,5,'Bhojpur'),(69,5,'Buxar'),(70,5,'Darbhanga'),(71,5,'Gaya'),(72,5,'Gopalganj'),(73,5,'Jamui'),(74,5,'Jehanbad'),(75,5,'Kaimur'),(76,5,'Katihar'),(77,5,'Khagaria'),(78,5,'Kishanganj'),(79,5,'Lakhisarai'),(80,5,'Madhepura'),(81,5,'Madhubani'),(82,5,'Munger'),(83,5,'Muzaffarpud'),(84,5,'Nalanda'),(85,5,'Nawada'),(86,5,'Pushchim Champaran'),(87,5,'Patna'),(88,5,'Purbi Champaran'),(89,5,'Purnia'),(90,5,'Rohtas'),(91,5,'Saharasa'),(92,5,'Samastipur'),(93,5,'Saran'),(94,5,'Sheikhapur'),(95,5,'Sheohar'),(96,5,'Sitamarhi'),(97,5,'Siwan'),(98,5,'Supaul'),(99,5,'Vaishali'),(100,6,'Chandigarh'),(101,7,'Balod'),(102,7,'Bazar'),(103,7,'Balrampur'),(104,7,'Bastar'),(105,7,'Bemetara'),(106,7,'Bijapur'),(107,7,'Bilaspur'),(108,7,'Dantewada'),(109,7,'Dhamtari'),(110,7,'Darg'),(111,7,'Gariyaband'),(112,7,'Janjgir'),(113,7,'Jasnpur'),(114,7,'Kabirdham'),(115,7,'Kanker'),(116,7,'Kondagaon'),(117,7,'Korba'),(118,7,'Korea'),(119,7,'Mahasamund'),(120,7,'Mugaeli'),(121,7,'Narayanpur'),(122,7,'Raigarh'),(123,7,'Raipur'),(124,7,'Rajnandgaon'),(125,7,'Sukma'),(126,7,'Surajpur'),(127,7,'Surguja'),(128,8,'Dadra and Nagar Haveli'),(129,9,'north'),(130,9,'South'),(131,10,'Ahamadabad'),(132,10,'Amreli'),(133,10,'Anand'),(134,10,'Banaskantha'),(135,10,'Bharuch'),(136,10,'Bhavnagar'),(137,10,'Dang'),(138,10,'Dohad'),(139,10,'Gandhinagar'),(140,10,'Jamnagar'),(141,10,'Junagadh'),(142,10,'kachchh'),(143,10,'kheda'),(144,10,'Mahesana'),(145,10,'Narmada'),(146,10,'Navsari'),(147,10,'Panch Mahals'),(148,10,'Patan'),(149,10,'Porbandar'),(150,10,'Rajkot'),(151,10,'Sabar Kantha'),(152,10,'Surat'),(153,10,'Surendranagar'),(154,10,'Tapi'),(155,10,'Vadodara'),(156,10,'Valsad'),(157,11,'Ambala'),(158,11,'Bhiwani'),(159,11,'Faidabad'),(160,11,'Fatehabad'),(161,11,'Gurgaon'),(162,11,'Hisar'),(163,11,'Jhajjar'),(164,11,'Jind'),(165,11,'Kaithal'),(166,11,'karnal'),(167,11,'Kurukshetra'),(168,11,'Mahendragarh'),(169,11,'Mewat'),(170,11,'Palwal'),(171,11,'Panchkula'),(172,11,'Panipat'),(173,11,'Rewari'),(174,11,'Rohtak'),(175,11,'Srsa'),(176,11,'Sonipat'),(177,11,'Unangar'),(178,12,'Bilaspur'),(179,12,'Chamba'),(180,12,'Hamirpur'),(181,12,'Kangra'),(182,12,'Knnapur'),(183,12,'Kullu'),(184,12,'Lahul and Spiti'),(185,12,'Mandi'),(186,12,'Shimla'),(187,12,'Sirmaur'),(188,12,'Solan'),(189,12,'Una'),(190,13,'Anantnag'),(191,13,'Badgam'),(192,13,'Bandipora'),(193,13,'Baramulla'),(194,13,'Doda'),(195,13,'Ganderbal'),(196,13,'Jammu'),(197,13,'Kargil'),(198,13,'Kathua'),(199,13,'Kishtwar'),(200,13,'Kulgam'),(201,13,'Kapwara'),(202,13,'Leh Ladakh'),(203,13,'Poonch'),(204,13,'Pulwama'),(205,13,'Rajauri'),(206,13,'Ramban'),(207,13,'Reasi'),(208,13,'Samba'),(209,13,'Shopian'),(210,13,'Srinagar'),(211,13,'Udhampur'),(212,14,'Bokaro'),(213,14,'Chatra'),(214,14,'Deoghar'),(215,14,'Dhanbad'),(216,14,'Dumka'),(217,14,'East Singhbum'),(218,14,'Garhwa'),(219,14,'Giridih'),(220,14,'Godda'),(221,14,'Gumla'),(222,14,'Hazaribagh'),(223,14,'Jamtara'),(224,14,'Khunti'),(225,14,'Koderma'),(226,14,'Latehar'),(227,14,'Lohardagada'),(228,14,'Pakur'),(229,14,'Palamu'),(230,14,'Ramgarh'),(231,14,'Ranchi'),(232,14,'Sahebganju'),(233,14,'Saraikela Kharsawan'),(234,14,'Simdega'),(235,14,'West Singhbhum'),(236,15,'Bagalkot'),(237,15,'Bangalore Rural'),(238,15,'Belgaum'),(239,15,'Bellary'),(240,15,'Bengalure Urban'),(241,15,'Bidar'),(242,15,'Bijapur'),(243,15,'Chamarajanagar'),(244,15,'Chikballapur'),(245,15,'Chikmagalure'),(246,15,'Chitrallon'),(247,15,'Dakshin Kannada'),(248,15,'Davangere'),(249,15,'Dharwad'),(250,15,'Gadag'),(251,15,'Gulbarga'),(252,15,'Hassan'),(253,15,'Haveri'),(254,15,'Kodagu'),(255,15,'Kolar'),(256,15,'Koppal'),(257,15,'Manghya'),(258,15,'Mysore'),(259,15,'Raichur'),(260,15,'Ramanagara'),(261,15,'Shimoga'),(262,15,'Tumkur'),(263,15,'Udupi'),(264,15,'Uttar Kannada'),(265,15,'Yadgir'),(266,16,'Alappuzha'),(267,16,'Ernakulam'),(268,16,'Idukki'),(269,16,'Kannur'),(270,16,'Kasargod'),(271,16,'Kollam'),(272,16,'Kottayam'),(273,16,'Kozhikodu'),(274,16,'Malappuram'),(275,16,'Palakkad'),(276,16,'Pathanamthitta'),(277,16,'Thiruvandhapuram'),(278,16,'Thrissur'),(279,16,'Wayanadu'),(280,17,'Agar Malwa'),(281,17,'Alirajpur'),(282,17,'Anuppur'),(283,17,'Ashoknagar'),(284,17,'Balaghat'),(285,17,'Barwani'),(286,17,'Betul'),(287,17,'Bhind'),(288,17,'Bhopal'),(289,17,'Burhanpur'),(290,17,'Chhatarpur'),(291,17,'Chhindwara'),(292,17,'Damoh'),(293,17,'Datia'),(294,17,'Dewas'),(295,17,'Dhar'),(296,17,'Dindori'),(297,17,'G189'),(298,17,'Gwalior'),(299,17,'Harda'),(300,17,'Hoshangabad'),(301,17,'Indore'),(302,17,'Jabalpur'),(303,17,'Jhabua'),(304,17,'Kathi'),(305,17,'Khandwa'),(306,17,'Khargone'),(307,17,'Mandla'),(308,17,'Mandsaur'),(309,17,'Morena'),(310,17,'Narsinghpur'),(311,17,'Neemuch'),(312,17,'Panna'),(313,17,'Raisen'),(314,17,'Rajgarh'),(315,17,'Ratlam'),(316,17,'Rewa'),(317,17,'Sagar'),(318,17,'Satna'),(319,17,'Sehore'),(320,17,'Seoni'),(321,17,'Shahdol'),(322,17,'Shajapur'),(323,17,'Sheopur'),(324,17,'Shivpur'),(325,17,'Sidhi'),(326,17,'Singrauli'),(327,17,'Tikamgrah'),(328,17,'Ujjain'),(329,17,'Umaria'),(330,17,'Vidisha'),(331,18,'Ahmednagar'),(332,18,'Akola'),(333,18,'Amravati'),(334,18,'Aurangabad'),(335,18,'Beed'),(336,18,'Bhandara'),(337,18,'Buldhana'),(338,18,'Chandrapur'),(339,18,'Dhule'),(340,18,'Gadchiroli'),(341,18,'Gondia'),(342,18,'Hingoli'),(343,18,'Jaigaon'),(344,18,'Jalna'),(345,18,'Kolhapur'),(346,18,'Latur'),(347,18,'Mumbai'),(348,18,'Nagpur'),(349,18,'Nanded'),(350,18,'Nandurbad'),(351,18,'Nashik'),(352,18,'Osmanabad'),(353,18,'Palghar'),(354,18,'Parbhani'),(355,18,'Pune'),(356,18,'Raigad'),(357,18,'Ratnagiri'),(358,18,'Sangli'),(359,18,'Satara'),(360,18,'Sindhullo'),(361,18,'Solapur'),(362,18,'Thane'),(363,18,'Wardha'),(364,18,'Washim'),(365,18,'Yavatmal'),(366,19,'Bishnupur'),(367,19,'chandel'),(368,19,'Churachandpur'),(369,19,'Imphal East'),(370,19,'Imphal West'),(371,19,'Senapati'),(372,19,'Tamenglong'),(373,19,'Thoubal'),(374,19,'Ukhrul'),(375,20,'East Garo Hills'),(376,20,'East Jaintia Hills'),(377,20,'East Khasi Hills'),(378,20,'North Garo Hills'),(379,20,'Ribhoi'),(380,20,'South Garo Hills'),(381,20,'South West Garo Hills'),(382,20,'South West Khasi Hills'),(383,20,'West Garo Hills'),(384,20,'West Jaintia Hills'),(385,20,'West Khasi Hills'),(386,21,'Alzawl'),(387,21,'Champhai'),(388,21,'Kolasib'),(389,21,'Lawngtilai'),(390,21,'Lungle'),(391,21,'Mamit'),(392,21,'Saiha'),(393,21,'Serchhip'),(394,22,'Dimapur'),(395,22,'Kiphire'),(396,22,'Kohima'),(397,22,'Longleng'),(398,22,'Mokokchung'),(399,22,'Mon'),(400,22,'Peren'),(401,22,'Phek'),(402,22,'Tuensang'),(403,22,'Wokha'),(404,22,'Zunheboto'),(405,23,'Anugul'),(406,23,'Balangir'),(407,23,'Baleshwar'),(408,23,'Bargarh'),(409,23,'Bhadrak'),(410,23,'Boudha'),(411,23,'Cuttack'),(412,23,'Deogarh'),(413,23,'Dhenkanal'),(414,23,'Gajapti'),(415,23,'Ganjam'),(416,23,'Jagatsinghapur'),(417,23,'Jajapur'),(418,23,'Jharsuguda'),(419,23,'Kalahandi'),(420,23,'Kanahamal'),(421,23,'Kendrapara'),(422,23,'Kendujhar'),(423,23,'Khordha'),(424,23,'Koraput'),(425,23,'Malkangiri'),(426,23,'Mayurbhanj'),(427,23,'Nabarangpur'),(428,23,'Nayagarh'),(429,23,'Nuapada'),(430,23,'Puri'),(431,23,'Rayagada'),(432,23,'208Lpur'),(433,23,'Sonepur'),(434,23,'Sundargarh'),(435,24,'Karaikal'),(436,24,'Mahe'),(437,24,'Pondicherry'),(438,24,'Yanam'),(439,25,'Amirtsar'),(440,25,'Barnala'),(441,25,'Bathinda'),(442,25,'Faridkot'),(443,25,'Fatehgarhsahib'),(444,25,'Fazilka'),(445,25,'Firozepur'),(446,25,'Gurdaspur'),(447,25,'Hoshiarpur'),(448,25,'Jalan'),(449,25,'Kapurthala'),(450,25,'Ludhiana'),(451,25,'Mansa'),(452,25,'Moga'),(453,25,'Muktsar'),(454,25,'Nawanshr'),(455,25,'Pathankot'),(456,25,'Patiala'),(457,25,'Rupnakot'),(458,25,'S.A.S Nagar'),(459,25,'Sangrur'),(460,25,'Tarn Tarn'),(461,26,'Ajmer'),(462,26,'Alwar'),(463,26,'Banswara'),(464,26,'Baran'),(465,26,'Barmer'),(466,26,'Bharatpur'),(467,26,'Bhilwara'),(468,26,'Bikaner'),(469,26,'Bundi'),(470,26,'Chittargarh'),(471,26,'Churu'),(472,26,'Dacisa'),(473,26,'Dholpur'),(474,26,'Dungarpur'),(475,26,'Ganganagar'),(476,26,'Hanumangarh'),(477,26,'Jaipur'),(478,26,'Jaisalmer'),(479,26,'Jalore'),(480,26,'Jhalawar'),(481,26,'Jhunjhunu'),(482,26,'Jodhpur'),(483,26,'Karauli'),(484,26,'Kota'),(485,26,'Nagaur'),(486,26,'Pali'),(487,26,'Pratapgarh'),(488,26,'Rajsamand'),(489,26,'Sawai Mandhopur'),(490,26,'Sikar'),(491,26,'Sirohi'),(492,26,'Tonk'),(493,26,'Udaipur'),(494,27,'East District'),(495,27,'North District'),(496,27,'South District'),(497,27,'West District'),(498,28,'Ariyalur'),(499,28,'Coimbator'),(500,28,'Cuddalore'),(501,28,'295MA430'),(502,28,'Dindigal'),(503,28,'Erode'),(504,28,'Kanchipuram'),(505,28,'Kannyakumari'),(506,28,'Karar'),(507,28,'Giri'),(508,28,'Madurai'),(509,28,'Nagapattanam'),(510,28,'Namakkal'),(511,28,'Perambalure'),(512,28,'Pudukkottai'),(513,28,'Ramanathapuram'),(514,28,'Salem'),(515,28,'Sivaganga'),(516,28,'Thanjavur'),(517,28,'The Nilagiri'),(518,28,'Theni'),(519,28,'Thiruvallur'),(520,28,'Thiruvarur'),(521,28,'Thiruchirappalli'),(522,28,'Thirunelveli'),(523,28,'Thiruppur'),(524,28,'Thiruvannamalai'),(525,28,'Tuticorin'),(526,28,'Vellore'),(527,28,'Villupuram'),(528,28,'Virudhanagar'),(529,29,'Adilabad'),(530,29,'Hyderabad'),(531,29,'Karimanagar'),(532,29,'Khammam'),(533,29,'Mahbubangar'),(534,29,'Medak'),(535,29,'Nalgonda'),(536,29,'Nizamabad'),(537,30,'Rangareddi'),(538,30,'Warangal'),(539,30,'Dhalia'),(540,30,'Gomati'),(541,30,'Khowai'),(542,30,'North 40'),(543,30,'Sepahijala'),(544,30,'South 40'),(545,30,'Koti'),(546,30,'West 30'),(547,31,'Agra'),(548,31,'Aligarh'),(549,31,'Ambedkar Nagar'),(550,31,'Amethi'),(551,31,'Amroha'),(552,31,'Auraiya'),(553,31,'Auraiha'),(554,31,'Aizamgarh'),(555,31,'Baghpat'),(556,31,'Bahraich'),(557,31,'Ballia'),(558,31,'Balrampur'),(559,31,'Banda'),(560,31,'Barabanki'),(561,31,'Bareilly'),(562,31,'Basti'),(563,31,'Bijnor'),(564,31,'Budaun'),(565,31,'Bulandshahr'),(566,31,'Chandauli'),(567,31,'Chitrakoot'),(568,31,'Deoria'),(569,31,'Etah'),(570,31,'Etawah'),(571,31,'Faizabad'),(572,31,'Farrukhabad'),(573,31,'Fatehpur'),(574,31,'Firozabad'),(575,31,'Gautham Buddha Nagar'),(576,31,'Ghaziabad'),(577,31,'Ghasiapur'),(578,31,'Gonda'),(579,31,'Gorakhapur'),(580,31,'Hamirpur'),(581,31,'Hapur'),(582,31,'Hardoi'),(583,31,'Hathras'),(584,31,'Jalaun'),(585,31,'Jaunpur'),(586,31,'Jhansi'),(587,31,'Kannauj'),(588,31,'Kanpur Dehat'),(589,31,'Kanpur Nagarhat'),(590,31,'Kasganj'),(591,31,'Kaushambi'),(592,31,'Kheri'),(593,31,'Kushi Nagar'),(594,31,'Lalitpur'),(595,31,'Lucknow'),(596,31,'Maharajganj'),(597,31,'Mahoba'),(598,31,'Main 430'),(599,31,'Mathura'),(600,31,'May'),(601,31,'Meerut'),(602,31,'Mirzapur'),(603,31,'Moradabad'),(604,31,'Muzaffarnagar'),(605,31,'Pilibhit'),(606,31,'Pratapgarh'),(607,31,'Raebareli'),(608,31,'Rampur'),(609,31,'Saharanpur'),(610,31,'Sambhal'),(611,31,'Sant Kubeer Nagar'),(612,31,'Sant Ravidas Nagar'),(613,31,'Shahjahanpur'),(614,31,'Shamli'),(615,31,'Shravasti'),(616,31,'Sidathnagar'),(617,31,'Sitapur'),(618,31,'Sonbhadra'),(619,31,'Sulthanpur'),(620,31,'Unnao'),(621,31,'Varanasi'),(622,32,'Almora'),(623,32,'Bageshwar'),(624,32,'Chamoli'),(625,32,'Champawat'),(626,32,'Dehrudun'),(627,32,'Haridwar'),(628,32,'Naintal'),(629,32,'Puri'),(630,32,'Pitharagarh'),(631,32,'Rudra Pratag'),(632,32,'Tehri'),(633,32,'Udam Singh Nagar'),(634,32,'Uttar Khasi'),(635,33,'Paraganas North'),(636,33,'Paraganas South'),(637,33,'Bankura'),(638,33,'Bardhaman'),(639,33,'Birbhum'),(640,33,'Coochbehar'),(641,33,'Darjeeling'),(642,33,'Dnajpur Dakshin'),(643,33,'Dnajpur Uttar'),(644,33,'Hooghly'),(645,33,'Howarh'),(646,33,'Jalpaigur'),(647,33,'Maldah'),(648,33,'Medinipur East'),(649,33,'Medinipur West'),(650,33,'Murshidabad'),(651,33,'Nadia'),(652,33,'Purulia');

/*Table structure for table `soil_characteristics` */

DROP TABLE IF EXISTS `soil_characteristics`;

CREATE TABLE `soil_characteristics` (
  `characteristic_feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `soil_type_id` int(11) DEFAULT NULL,
  `characteristic_id` int(11) DEFAULT NULL,
  `content_quantity` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`characteristic_feature_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `soil_characteristics` */

insert  into `soil_characteristics`(`characteristic_feature_id`,`soil_type_id`,`characteristic_id`,`content_quantity`) values (2,16,1,'53-28'),(3,16,2,'12.46-5.48'),(5,16,3,'2.04-0.61'),(6,16,4,'1.3-0.02'),(7,16,5,'1.1-0.84'),(8,16,6,'29-12'),(9,13,1,'49-14'),(10,13,2,'8.65-5.89'),(11,13,3,'1.4-0.9'),(12,13,4,'1.12-0.4'),(13,13,5,'1.18-0.43'),(14,13,6,'28-18'),(15,17,1,'45-15'),(16,17,2,'5-12'),(17,17,3,'5-10'),(18,17,4,'12-15'),(19,17,5,'12-20'),(20,17,6,'12-15');

/*Table structure for table `soil_types` */

DROP TABLE IF EXISTS `soil_types`;

CREATE TABLE `soil_types` (
  `soil_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `soil_name` varchar(55) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`soil_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `soil_types` */

insert  into `soil_types`(`soil_type_id`,`soil_name`,`image`,`description`) values (16,'red soil','static/uploads/8e3e24c4-cb80-449c-b5d9-1d6c84e85881redsoil.jpg','useful for cereal crops and pulses'),(13,'clay soil','static/uploads/8750f662-7624-4d97-a48a-7713d258f4f6claysoil.jpg','clayey'),(17,'black soil','static/uploads/12c95c41-53f3-4b02-826a-4841d7e2de77blacksoil.jpg','adfsdg');

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `state` */

insert  into `state`(`state_id`,`state`) values (1,'Andaman and nicobar islands'),(2,'Andra Pradesh'),(3,'Arunachal pradesh'),(4,'Assam'),(5,'Bihar'),(6,'Chandigarh'),(7,'Chhattisgarh'),(8,'Dadra and Nagar Haveli'),(9,'Goa'),(10,'Gujarat'),(11,'Haryana'),(12,'Himachal Pradesh'),(13,'Jammu and Kasmir'),(14,'Jharkand'),(15,'Karnataka'),(16,'Kerala'),(17,'Madhya Pradesh'),(18,'Maharastra'),(19,'Manipur'),(20,'Meghalaya'),(21,'Mizoram'),(22,'Nagaland'),(23,'Odisha'),(24,'Puducherry'),(25,'Punjab'),(26,'Rajasthan'),(27,'Sikkim'),(28,'Tamilnadu'),(29,'Telangana'),(30,'Tripura'),(31,'Uttar Pradesh'),(32,'Uttarakhand'),(33,'West Bengal');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
