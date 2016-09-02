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

/*Table structure for table `University` */

DROP TABLE IF EXISTS `University`;

CREATE TABLE `University` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` char(40) COLLATE utf8_bin NOT NULL,
  `city` char(40) COLLATE utf8_bin DEFAULT NULL,
  `country` char(40) COLLATE utf8_bin DEFAULT NULL,
  `address` char(40) COLLATE utf8_bin DEFAULT NULL,
  `email` char(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `University` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cnum` char(40) COLLATE utf8_bin DEFAULT NULL,
  `cname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `cunits` int(11) DEFAULT NULL,
  `hour` time DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cnum` (`cnum`),
  KEY `fid` (`fid`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`fid`) REFERENCES `faculty` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `course` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` char(40) COLLATE utf8_bin DEFAULT NULL,
  `office` char(40) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `department` */

/*Table structure for table `enrolled` */

DROP TABLE IF EXISTS `enrolled`;

CREATE TABLE `enrolled` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `sid` (`sid`),
  KEY `cid` (`cid`),
  CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `enrolled` */

/*Table structure for table `faculty` */

DROP TABLE IF EXISTS `faculty`;

CREATE TABLE `faculty` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` char(250) COLLATE utf8_bin DEFAULT NULL,
  `fee` bigint(20) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `did` (`did`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `faculty` */

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `grade` char(10) COLLATE utf8_bin DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `grades` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `roletitle` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `role` */

/*Table structure for table `section` */

DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `secid` int(11) NOT NULL AUTO_INCREMENT,
  `semester` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `room` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  PRIMARY KEY (`secid`),
  KEY `cid` (`cid`),
  KEY `staffid` (`staffid`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `section` */

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `gender` char(10) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `ssn` bigint(50) DEFAULT NULL,
  `speciality` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`staffid`),
  UNIQUE KEY `ssn` (`ssn`),
  KEY `cid` (`cid`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `staff` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` char(10) COLLATE utf8_bin DEFAULT NULL,
  `emaiil` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `ssn` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `studentnum` bigint(20) DEFAULT NULL,
  `enrolldate` date DEFAULT NULL,
  `degree` char(40) COLLATE utf8_bin DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `did` (`did`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`did`) REFERENCES `department` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `student` */

/*Table structure for table `teach` */

DROP TABLE IF EXISTS `teach`;

CREATE TABLE `teach` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `staffid` (`staffid`),
  KEY `cid` (`cid`),
  KEY `rid` (`rid`),
  CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff` (`staffid`),
  CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `teach_ibfk_3` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `teach` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
