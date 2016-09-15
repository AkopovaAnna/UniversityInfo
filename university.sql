/*
SQLyog Community v11.52 (64 bit)
MySQL - 5.6.28-0ubuntu0.14.04.1 : Database - UniversityInfo
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`UniversityInfo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `UniversityInfo`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` char(40) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  `hour` time DEFAULT NULL,
  `f_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnum` (`num`),
  KEY `fid` (`f_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `faculty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(40) COLLATE utf8_bin DEFAULT NULL,
  `office` char(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `enrolled` */

DROP TABLE IF EXISTS `enrolled`;

CREATE TABLE `enrolled` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`s_id`),
  KEY `cid` (`c_id`),
  CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`),
  CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `faculty` */

DROP TABLE IF EXISTS `faculty`;

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(250) COLLATE utf8_bin DEFAULT NULL,
  `fee` bigint(20) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `did` (`d_id`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` char(10) COLLATE utf8_bin DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `section` */

DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semester` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `room` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`c_id`),
  KEY `staffid` (`staff_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `gender` char(10) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `ssn` bigint(50) DEFAULT NULL,
  `speciality` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ssn` (`ssn`),
  KEY `d_id` (`d_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `department` (`id`),
  CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`r_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` char(10) COLLATE utf8_bin DEFAULT NULL,
  `emaiil` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `ssn` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `num` bigint(20) DEFAULT NULL,
  `enrolldate` date DEFAULT NULL,
  `degree` char(40) COLLATE utf8_bin DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `did` (`d_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `teach` */

DROP TABLE IF EXISTS `teach`;

CREATE TABLE `teach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staff_id`),
  KEY `cid` (`c_id`),
  CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`),
  CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `university` */

DROP TABLE IF EXISTS `university`;

CREATE TABLE `university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_bin NOT NULL,
  `city` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
