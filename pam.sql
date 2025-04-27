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
  `status` enum('Available','Assigned','Under Maintenance','Disposed','Fixed') DEFAULT 'Available',
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `variety` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `size` varchar(128) DEFAULT NULL,
  `brand` varchar(128) DEFAULT NULL,
  `unit` varchar(128) DEFAULT NULL,
  `paper_type` varchar(128) DEFAULT NULL,
  `thickness` varchar(128) DEFAULT NULL,
  `specification` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_code` (`asset_code`),
  KEY `category_id` (`category_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `assets_ibfk_3` (`office_id`),
  CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_ibfk_3` FOREIGN KEY (`office_id`) REFERENCES `offices` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `assets` */

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `type` varchar(128) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`category_name`,`type`) values (1,'Furniture','Assets'),(2,'IT Equipment','Office Supplies'),(3,'Office Supplies','Office Supplies'),(4,'Appliances','Assets'),(5,'Others','Office Supplies');

/*Table structure for table `maintenance_table` */

DROP TABLE IF EXISTS `maintenance_table`;

CREATE TABLE `maintenance_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT '',
  `is_closed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `maintenance_table` */

insert  into `maintenance_table`(`id`,`name`,`is_closed`) values (1,'Procurements',0),(2,'Purchase Order',0),(4,'Report Generation',0),(5,'Account Settings',0),(6,'Assets',0),(8,'Inventory',0),(9,'Receive Logs',0),(10,'Requisition',0);

/*Table structure for table `maintenance_table_user` */

DROP TABLE IF EXISTS `maintenance_table_user`;

CREATE TABLE `maintenance_table_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT 0,
  `name` varchar(128) DEFAULT '',
  `is_closed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `maintenance_table_user` */

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
  `request_role` varchar(128) DEFAULT '',
  `request_invoice` varchar(60) NOT NULL,
  `request_user_id` int(11) NOT NULL,
  `request_supplier_name` varchar(60) NOT NULL,
  `request_supplier_company` varchar(60) NOT NULL,
  `request_designation` varchar(60) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `request_status` varchar(60) NOT NULL DEFAULT 'pending',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0=archive,1=exist',
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `request` */

/*Table structure for table `request_cart` */

DROP TABLE IF EXISTS `request_cart`;

CREATE TABLE `request_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_user_id` int(11) NOT NULL,
  `cart_asset_id` int(11) NOT NULL,
  `cart_qty` int(11) NOT NULL,
  `cart_variety` varchar(60) NOT NULL,
  `specification` varchar(256) DEFAULT '',
  `specification_array` longtext DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `r_specification` varchar(256) DEFAULT NULL,
  `r_specification_array` longtext DEFAULT NULL,
  PRIMARY KEY (`r_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `request_item` */

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

/*Table structure for table `tblforgot_otp` */

DROP TABLE IF EXISTS `tblforgot_otp`;

CREATE TABLE `tblforgot_otp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expiry` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblforgot_otp` */

insert  into `tblforgot_otp`(`id`,`accountid`,`email`,`token`,`expiry`) values (6,80150,'dacuna@qmdsi.com','3aac162cb616b3085e8d596df9a6585bf1693b72b84aef0cc2ea051a48a9d2cc','2025-04-26 19:29:43'),(10,1,'darrencelzo77@gmail.com','6a417900eed77939ced268a8a0f6520d5190f6da6655ea52fb36095581278422','2025-04-26 19:36:42');

/*Table structure for table `type_table` */

DROP TABLE IF EXISTS `type_table`;

CREATE TABLE `type_table` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) DEFAULT '',
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `type_table` */

insert  into `type_table`(`typeid`,`type`) values (1,'Assets'),(2,'Office Supplies');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `email_official` varchar(128) DEFAULT '',
  `password` varchar(255) NOT NULL,
  `fullname` varchar(60) NOT NULL,
  `nickname` varchar(60) DEFAULT NULL,
  `role` varchar(60) NOT NULL,
  `designation` varchar(60) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=exist',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`user_id`,`email`,`email_official`,`password`,`fullname`,`nickname`,`role`,`designation`,`profile_picture`,`created_at`,`status`) values (1,'85623','admin','admin@gmail.com','admin','admin','admin','Administrator','Computer Lab','Profile_680dbc6aa80f0.jpg','2025-04-27 13:26:17',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
