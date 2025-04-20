/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.4.32-MariaDB : Database - pam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `assets` */

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `price` decimal(10,2) NOT NULL,
  `condition_status` enum('New','Good','Needs Repair','Damaged') DEFAULT 'New',
  `status` enum('Available','Assigned','Under Maintenance','Disposed') DEFAULT 'Available',
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `variety` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `size` varchar(128) DEFAULT NULL,
  `brand` varchar(128) DEFAULT NULL,
  `unit` varchar(128) DEFAULT NULL,
  `paper_type` varchar(128) DEFAULT NULL,
  `thickness` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_code` (`asset_code`),
  KEY `category_id` (`category_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `assets_ibfk_3` (`office_id`),
  CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_ibfk_3` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `assets` */

insert  into `assets`(`id`,`asset_code`,`name`,`category_id`,`subcategory_id`,`office_id`,`purchase_date`,`price`,`condition_status`,`status`,`image`,`description`,`variety`,`size`,`brand`,`unit`,`paper_type`,`thickness`) values (126,'000001','pencil',3,37,12,'2025-04-02 11:29:52','12.00','New','Available','Assets_67ecaf21806be.webp','cfnfcfch','{\"name\":\"brand\",\"values\":[\"mongol 1\"]}',NULL,NULL,NULL,NULL,NULL),(127,'000002','scissor',3,37,12,'2025-04-02 11:33:31','30.00','New','Available','Assets_67ecb00b3b26a.jpg','aawd','{\"name\":\"color\",\"values\":[\"red\",\"green\",\"blue\"]}',NULL,NULL,NULL,NULL,NULL),(128,'000003','eraser',3,37,12,'2025-04-03 19:46:15','30.00','New','Available','Assets_67ecb25354a75.jpg','pambura','{\"name\":\"shape\",\"values\":[\"triangle\",\"square\",\"circle\"]}',NULL,NULL,NULL,NULL,NULL),(129,'000004','laptop',2,31,15,'2025-04-06 11:36:56','500.00','Good','Available','Assets_67ed4fbbd3c45.webp','','{\"name\":\"brand\",\"values\":[\"hp\",\"lenovo\",\"samsung\"]}',NULL,NULL,NULL,NULL,NULL),(130,'000005','printer',2,33,15,'2025-04-06 11:37:06','150.00','New','Disposed','Assets_67ee710235f19.jpg','','{\"name\":\"brand\",\"values\":[\"epson\",\"cannon\",\"hp\",\"brother\"]}',NULL,NULL,NULL,NULL,NULL),(143,'000006','Lenovo',1,26,12,'2025-04-19 13:44:09','20000.00','Good','Available','Assets_680338290e3c6.png','Sample','{\"name\":\"Sample\",\"values\":[\"value\"]}',NULL,NULL,NULL,NULL,NULL),(144,'000007','Sample',1,27,18,'2025-04-19 13:44:44','900.00','Needs Repair','Under Maintenance','Assets_6803384cccf6b.png','Hehe','{\"name\":\"Sample\",\"values\":[\"Sample Value\"]}',NULL,NULL,NULL,NULL,NULL),(145,'000008','Stapler',2,32,15,'2025-04-19 13:45:53','900.00','New','Available','Assets_68033891cde41.png','Sample Desc','{\"name\":\"Sample Variety\",\"values\":[\"Sample\"]}',NULL,NULL,NULL,NULL,NULL),(146,'232324','asf',1,26,13,'2025-04-19 15:37:26','2000.00','Good','Assigned','Assets_680352b677763.png','adf','{\"name\":\"123123\",\"values\":[\"123\"]}',NULL,NULL,NULL,NULL,NULL),(147,'123123123','asdfa',3,36,20,'2025-04-19 15:46:04','234234.00','New','Available','Assets_680354bca4588.png','sdfasfdasf','{\"name\":\"333\",\"values\":[\"3333\"]}','Short',NULL,NULL,NULL,NULL),(148,'324234','asdfas',3,36,15,'2025-04-19 15:48:23','34333.00','Good','Available','Assets_680355478f2d2.png','dfasdf','{\"name\":\"asdfa\",\"values\":[\"fasdfasdf\"]}','Long','Hardcopy','Ream','Multipurpose','70gsm'),(149,'00123123','Ballpen',3,37,15,'2025-04-19 20:52:55','2000.00','New','Available','Assets_68039ca79b582.jpg','Sample','{\"name\":\"variety\",\"values\":[\"variety\"]}','','','','','');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`category_name`) values (1,'Furniture'),(2,'IT Equipment'),(3,'Office Supplies'),(4,'Appliances'),(5,'Others');

/*Table structure for table `offices` */

DROP TABLE IF EXISTS `offices`;

CREATE TABLE `offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `offices` */

insert  into `offices`(`id`,`office_name`) values (12,'Administration Office'),(13,'Finance Department'),(14,'Human Resources'),(15,'IT Department'),(16,'Procurement Office'),(17,'Logistics and Supply'),(18,'Facilities Management'),(19,'Legal Affairs'),(20,'Marketing and Communications'),(21,'Research and Development'),(22,'Customer Service');

/*Table structure for table `recieved_logs` */

DROP TABLE IF EXISTS `recieved_logs`;

CREATE TABLE `recieved_logs` (
  `recieved_id` int(11) NOT NULL AUTO_INCREMENT,
  `recieved_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `recieved_supplier_name` varchar(60) NOT NULL,
  `recieved_supplier_company` varchar(60) NOT NULL,
  `recieved_assets_name` varchar(60) NOT NULL,
  `recieved_description` text NOT NULL,
  `recieved_assets_qty` int(11) NOT NULL,
  `recieved_user_id` int(11) NOT NULL,
  PRIMARY KEY (`recieved_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `recieved_logs` */

insert  into `recieved_logs`(`recieved_id`,`recieved_date`,`recieved_supplier_name`,`recieved_supplier_company`,`recieved_assets_name`,`recieved_description`,`recieved_assets_qty`,`recieved_user_id`) values (1,'2025-04-03 16:32:42','j supplies','j company','Scissors','pang gupit',30,1);

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_invoice` varchar(60) NOT NULL,
  `request_user_id` int(11) NOT NULL,
  `request_supplier_name` varchar(60) NOT NULL,
  `request_supplier_company` varchar(60) NOT NULL,
  `request_designation` varchar(60) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `request_status` varchar(60) NOT NULL DEFAULT 'pending',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0=archive,1=exist',
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `request` */

insert  into `request`(`request_id`,`request_invoice`,`request_user_id`,`request_supplier_name`,`request_supplier_company`,`request_designation`,`request_date`,`request_status`,`status`) values (16,'REQ-17435944699126',1,'j supply','j company','Library','2025-04-06 12:22:00','Approve',0),(17,'REQ-17436060249325',80141,'j supply','jcom','Computer Lab','2025-04-06 12:22:22','Delivered',0),(18,'REQ-17436721805447',80141,'j supply','j com','HRDO','2025-04-06 12:23:09','Approve',0),(19,'REQ-17436722272526',80141,'j supply','j com','VPAA','2025-04-06 11:03:23','Approve',1),(20,'REQ-17436723338441',80141,'j supply','j com','VPAA','2025-04-06 11:03:19','Approve',1),(21,'REQ-17436724223866',80141,'j supply','j com','VPAA','2025-04-05 23:58:37','Approve',1),(22,'REQ-17438732504587',80139,'j supply','j company','Library','2025-04-06 11:03:16','Approve',1),(23,'REQ-17438733178276',80139,'j supply','j company','VPAA','2025-04-06 11:03:04','Approve',1),(24,'REQ-17439087663656',1,'j supply','j company','Library','2025-04-06 12:23:47','Delivered',0),(25,'REQ-17450411667295',1,'Supplier','Sample Compnay','HRDO','2025-04-20 11:54:58','pending',0),(26,'REQ-17450562522435',80140,'Supplier Name','Company','HRDO','2025-04-19 17:52:29','Approve',1),(27,'REQ-17450564992705',80148,'Sample','Sample Company','Library','2025-04-20 12:23:18','pending',1),(28,'REQ-17450679788388',80148,'asfkj','asdfasdf','WASTFI','2025-04-20 12:31:15','Approve',1),(29,'REQ-17451174896760',1,'ad','dfs','HRDO','2025-04-20 10:51:29','pending',1),(30,'REQ-17451188354118',1,'','','','2025-04-20 11:13:55','pending',1),(31,'REQ-17451205843600',80149,'','','','2025-04-20 12:21:31','pending',1);

/*Table structure for table `request_cart` */

DROP TABLE IF EXISTS `request_cart`;

CREATE TABLE `request_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_user_id` int(11) NOT NULL,
  `cart_asset_id` int(11) NOT NULL,
  `cart_qty` int(11) NOT NULL,
  `cart_variety` varchar(60) NOT NULL,
  `specification` varchar(256) DEFAULT '',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `request_cart` */

/*Table structure for table `request_item` */

DROP TABLE IF EXISTS `request_item`;

CREATE TABLE `request_item` (
  `r_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_request_id` int(11) NOT NULL,
  `r_item_asset_id` int(11) NOT NULL,
  `r_item_qty` int(11) NOT NULL,
  `r_item_variety` varchar(60) NOT NULL,
  `r_item_price` decimal(10,2) NOT NULL,
  `r_finance_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`r_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `request_item` */

insert  into `request_item`(`r_item_id`,`r_request_id`,`r_item_asset_id`,`r_item_qty`,`r_item_variety`,`r_item_price`,`r_finance_price`) values (3,16,126,13,'Mongol 1','12.00',NULL),(4,16,127,1,'Green','30.00',NULL),(5,17,127,2,'Green','30.00',NULL),(6,17,129,1,'Samsung','500.00',NULL),(7,18,126,10,'Mongol 1','12.00',NULL),(8,18,128,3,'Circle','30.00',NULL),(9,18,128,6,'Square','30.00',NULL),(10,18,128,1,'Triangle','30.00',NULL),(11,19,127,1,'Green','30.00',NULL),(12,20,128,1,'Square','30.00',NULL),(13,20,127,3,'Green','30.00',NULL),(14,20,129,1,'Lenovo','500.00',NULL),(15,21,127,5,'Green','30.00',NULL),(16,21,128,1,'Square','30.00',NULL),(17,22,126,1,'Mongol 1','12.00',NULL),(18,23,130,3,'Cannon','150.00',NULL),(19,24,128,3,'Square','30.00',NULL),(20,24,128,2,'Circle','30.00',NULL),(21,25,126,3,'Mongol 1','12.00',NULL),(22,25,127,22,'Green','30.00',NULL),(23,25,128,4,'Square','30.00',NULL),(24,25,129,4,'Lenovo','500.00',NULL),(25,25,130,2,'Hp','150.00',NULL),(26,25,130,22,'Cannon','150.00',NULL),(27,25,128,2,'Triangle','30.00',NULL),(28,26,126,2,'Mongol 1','12.00',NULL),(29,27,126,100,'Mongol 1','12.00','500.00'),(30,28,126,2,'Mongol 1','12.00',NULL),(31,29,126,2,'Mongol 1','12.00',NULL),(32,30,126,2,'Mongol 1','12.00','200.00'),(33,31,126,3,'Mongol 1','12.00',NULL);

/*Table structure for table `subcategories` */

DROP TABLE IF EXISTS `subcategories`;

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `subcategories` */

insert  into `subcategories`(`id`,`category_id`,`subcategory_name`) values (26,1,'Office Chairs'),(27,1,'Desks'),(28,1,'Conference Tables'),(29,1,'Sofas'),(30,1,'Cabinets'),(31,2,'Laptops'),(32,2,'Desktop Computers'),(33,2,'Printers'),(34,2,'Monitors'),(35,2,'Networking Equipment'),(36,3,'Paper'),(37,3,'Pens and Markers'),(38,3,'Notebooks'),(39,3,'Envelopes'),(40,3,'Folders'),(41,4,'Refrigerators'),(42,4,'Microwave Ovens'),(43,4,'Air Conditioners'),(44,4,'Water Dispensers'),(45,4,'Electric Fans'),(46,5,'Miscellaneous Items'),(47,5,'Promotional Materials'),(48,5,'Event Supplies'),(49,5,'Tools and Equipment'),(50,5,'Uncategorized');

/*Table structure for table `system_maintenance` */

DROP TABLE IF EXISTS `system_maintenance`;

CREATE TABLE `system_maintenance` (
  `system_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_name` varchar(60) NOT NULL,
  `system_image` varchar(255) NOT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `system_maintenance` */

insert  into `system_maintenance`(`system_id`,`system_name`,`system_image`) values (1,'PAM','Assets_67de5e3f36f55.jpg');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(60) NOT NULL,
  `nickname` varchar(60) DEFAULT NULL,
  `role` varchar(60) NOT NULL,
  `designation` varchar(60) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=exist',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`user_id`,`email`,`password`,`fullname`,`nickname`,`role`,`designation`,`profile_picture`,`created_at`,`status`) values (1,'85623','admin','admin','admin ako ','nicknameadmin','Administrator','Computer Lab','Profile_67dd240ef2143.jpeg','2025-04-19 13:27:19',1),(80138,'000001','xxxxx','darren','joshua padilla','andy','Finance','Registrar\'s Office','Profile_67ebdf948c3c2.webp','2025-04-19 13:22:39',1),(80139,'8888888','juan@gmail.com','admin','juan','juan','Finance','VPAA','Profile_67ebe1e2b2142.jpeg','2025-04-19 13:10:55',1),(80140,'99999','alucard@gmail.com','admin','alucard','calu','Office Heads','Registrar\'s Office',NULL,'2025-04-19 13:10:56',1),(80141,'56454564','layla@gmail.com','admin','layla','layla','Finance','Registrar\'s Office',NULL,'2025-04-19 13:10:56',1),(80145,'13123','Head Finance','Head Finance','Head Finance','Head Finance','Head Finance','Registrar\'s Office',NULL,'2025-04-20 12:27:35',1),(80146,'234234','kelly','darren','daadfskjfln','kjlasdkf','Administrator','Registrar\'s Office',NULL,'2025-04-19 13:10:06',1),(80147,'00004','Finance','Finance','Finance','Finance','Finance','VPAA','Profile_680339bcaed69.png','2025-04-19 13:50:52',1),(80148,'232123','angelo','admin','angelo','angelo','Library','VPAA','Profile_680372a70bcb6.jpg','2025-04-19 17:53:43',1),(80149,'3223423432','Normal Library','Normal Library','Normal Library','Normal Library','Library','Library',NULL,'2025-04-20 11:19:42',1),(80150,'23423423','Head Library','Head Library','Head Library','Head Library','Head Library','Library',NULL,'2025-04-20 12:16:00',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
