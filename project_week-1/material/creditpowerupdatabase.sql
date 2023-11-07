/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 5.5.42 : Database - ecommercecreditprofile
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecommercecreditprofile` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ecommercecreditprofile`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`name`) values 
('dress'),
('electronics'),
('footware');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`password`,`role_id`) values 
('admin','admin',1),
('raju','raju',2),
('sita','sita',2),
('srinu','srinu',2);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `pid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `category` (`category`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`pid`,`name`,`mname`,`price`,`category`,`description`) values 
(2,'mobile','nokia',7000,'electronics','nokia 3444'),
(3,'mobile','samsung',5000,'electronics','asdfasdf asdasdf'),
(4,'mobile','oppo',7000,'electronics','asdfasdfas');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `username` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `points` int(5) DEFAULT '100',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`username`,`name`,`email`,`mobile`,`Address`,`points`) values 
('raju','ramesh','raju@gmail.com','9989273669','hyd',100),
('rani','abc','rani@gmail.com','9989273669','hyd',100),
('sita','sita','sita@gmail.com','9876543212','banglroe',120),
('srinu','srinu','nagasrinu482@gmail.com','8179528359','hyd',37);

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) DEFAULT NULL,
  `productid` int(5) DEFAULT NULL,
  `tstatus` varchar(20) DEFAULT NULL,
  `pstatus` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `productid` (`productid`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`pid`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `registration` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

insert  into `transactions`(`id`,`userid`,`productid`,`tstatus`,`pstatus`) values 
(1,'srinu',2,'placed','canceled'),
(2,'srinu',4,'processed','canceled'),
(3,'srinu',3,'packing','canceled'),
(4,'srinu',2,'shipping','canceled'),
(5,'srinu',2,'delivering','canceled'),
(6,'srinu',3,'delivered','ordered'),
(7,'srinu',2,'shipping','canceled'),
(8,'srinu',3,'shipping','ordered'),
(9,'srinu',2,'delivering','canceled'),
(10,'srinu',3,'shipping','ordered'),
(11,'srinu',4,'delivering','canceled'),
(12,'srinu',2,'placed','ordered'),
(13,'srinu',3,'placed','ordered'),
(14,'srinu',2,'placed','ordered'),
(15,'srinu',3,'placed','ordered'),
(16,'sita',2,'delivered','ordered'),
(17,'sita',2,'delivered','ordered');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
