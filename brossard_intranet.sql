-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2019 at 05:11 PM
-- Server version: 8.0.17
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brossard_intranet`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int(7) NOT NULL AUTO_INCREMENT,
  `article_date` date NOT NULL,
  `user_id` int(7) NOT NULL,
  `article_title` varchar(90) NOT NULL,
  `article_content` text NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `FK_article_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `availabilities`
--

DROP TABLE IF EXISTS `availabilities`;
CREATE TABLE IF NOT EXISTS `availabilities` (
  `shift_id` int(7) NOT NULL,
  `user_id` int(7) NOT NULL,
  `user_is_available` tinyint(1) NOT NULL,
  PRIMARY KEY (`shift_id`,`user_id`),
  KEY `FK_avail_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `result` decimal(6,2) DEFAULT '0.00',
  PRIMARY KEY (`grade_id`),
  KEY `FK_grade_quiz` (`quiz_id`),
  KEY `FK_grade_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
CREATE TABLE IF NOT EXISTS `qualification` (
  `qualification_id` int(4) NOT NULL AUTO_INCREMENT,
  `qual_name` varchar(35) NOT NULL,
  PRIMARY KEY (`qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qualified_user`
--

DROP TABLE IF EXISTS `qualified_user`;
CREATE TABLE IF NOT EXISTS `qualified_user` (
  `user_id` int(7) NOT NULL,
  `qualification_id` int(4) NOT NULL,
  `qual_renew` date NOT NULL,
  `qual_date_gotten` date NOT NULL,
  PRIMARY KEY (`user_id`,`qualification_id`),
  KEY `FK_qualified_user_qualification` (`qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_id` int(11) NOT NULL,
  `question_content` varchar(90) NOT NULL,
  `correct_answer` varchar(35) NOT NULL,
  `wrong_answer_1` varchar(35) NOT NULL,
  `wrong_answer_2` varchar(35) NOT NULL,
  `wrong_answer_3` varchar(35) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
CREATE TABLE IF NOT EXISTS `response` (
  `question_id` int(7) NOT NULL,
  `user_id` int(7) NOT NULL,
  `question_response` tinyint(1) NOT NULL,
  PRIMARY KEY (`question_id`,`user_id`),
  KEY `FK_response_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(40) NOT NULL,
  `role_is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `sch_id` int(7) NOT NULL AUTO_INCREMENT,
  `sch_start_date` date NOT NULL,
  `sch_end_date` date NOT NULL,
  `sch_day` varchar(7) NOT NULL,
  `sch_start_time` datetime NOT NULL,
  `sch_end_time` datetime NOT NULL,
  PRIMARY KEY (`sch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seniority`
--

DROP TABLE IF EXISTS `seniority`;
CREATE TABLE IF NOT EXISTS `seniority` (
  `seniority_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `seniority_type` varchar(4) NOT NULL,
  `hours` int(6) NOT NULL,
  PRIMARY KEY (`seniority_id`),
  KEY `FK_seniority_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
CREATE TABLE IF NOT EXISTS `shift` (
  `shift_id` int(11) NOT NULL AUTO_INCREMENT,
  `assigned_user` int(11) NOT NULL,
  `required_qual` int(11) NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `day` varchar(10) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`shift_id`),
  KEY `FK_shift_user` (`assigned_user`),
  KEY `FK_shift_qualification` (`required_qual`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(35) NOT NULL,
  `user_lname` varchar(35) NOT NULL,
  `user_address` varchar(35) DEFAULT NULL,
  `user_dob` date DEFAULT NULL,
  `role_id` int(7) NOT NULL,
  `user_start_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_user_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_semester_specs`
--

DROP TABLE IF EXISTS `user_semester_specs`;
CREATE TABLE IF NOT EXISTS `user_semester_specs` (
  `user_id` int(7) NOT NULL,
  `min_hours` int(2) NOT NULL,
  `max_hours` int(2) NOT NULL,
  `max_weekday` int(11) NOT NULL,
  `max_weekend` int(11) NOT NULL,
  `comments` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_submitted` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_article_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD CONSTRAINT `FK_avail_shift` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_avail_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `FK_grade_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_grade_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `qualified_user`
--
ALTER TABLE `qualified_user`
  ADD CONSTRAINT `FK_qualfied_user_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_qualified_user_qualification` FOREIGN KEY (`qualification_id`) REFERENCES `qualification` (`qualification_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `response`
--
ALTER TABLE `response`
  ADD CONSTRAINT `FK_response_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_response_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `seniority`
--
ALTER TABLE `seniority`
  ADD CONSTRAINT `FK_seniority_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `FK_shift_qualification` FOREIGN KEY (`required_qual`) REFERENCES `qualification` (`qualification_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_shift_user` FOREIGN KEY (`assigned_user`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user_semester_specs`
--
ALTER TABLE `user_semester_specs`
  ADD CONSTRAINT `FK_specs_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
