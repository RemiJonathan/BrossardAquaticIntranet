-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2020 at 06:00 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

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

CREATE TABLE `article` (
  `article_id` int(7) NOT NULL,
  `article_date` date NOT NULL,
  `user_id` int(7) NOT NULL,
  `article_title` varchar(90) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `article_content` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `availabilities`
--

CREATE TABLE `availabilities` (
  `shift_id` int(7) NOT NULL,
  `user_id` int(7) NOT NULL,
  `user_is_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `grade_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `result` decimal(6,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_name`) VALUES
('AB'),
('AB-SALLE'),
('GHB'),
('LT'),
('LT-SALLE'),
('PIS-AB'),
('PIS-LT');

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `qualification_id` int(4) NOT NULL,
  `qual_name` varchar(35) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `qualification`
--

INSERT INTO `qualification` (`qualification_id`, `qual_name`) VALUES
(1, 'SN'),
(2, 'MSA'),
(3, 'MS'),
(4, 'MSU'),
(5, 'MSN'),
(6, 'ISA'),
(7, 'AQF');

-- --------------------------------------------------------

--
-- Table structure for table `qualified_user`
--

CREATE TABLE `qualified_user` (
  `user_id` int(7) NOT NULL,
  `qualification_id` int(4) NOT NULL,
  `qual_emitted` date DEFAULT NULL,
  `qual_expiry` date NOT NULL,
  `requalification_note` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `notes` varchar(60) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `qualified_user`
--

INSERT INTO `qualified_user` (`user_id`, `qualification_id`, `qual_emitted`, `qual_expiry`, `requalification_note`, `notes`) VALUES
(722888, 1, NULL, '2019-06-01', 'EXP DEC 2019', ''),
(722888, 2, NULL, '2020-12-01', '', ''),
(750045, 1, NULL, '2020-07-01', '', ''),
(758300, 1, NULL, '2019-12-01', '', ''),
(758300, 2, NULL, '2020-12-01', '', ''),
(800001, 1, NULL, '2019-12-01', '', ''),
(800001, 2, NULL, '2020-01-01', '', ''),
(800001, 7, '2015-03-01', '1970-01-01', '', NULL),
(800003, 1, NULL, '2021-09-01', '', ''),
(800003, 2, NULL, '2019-12-01', '', ''),
(800003, 7, '2012-08-01', '1970-01-01', '', NULL),
(800004, 1, NULL, '2021-06-01', '', ''),
(800004, 3, '2017-09-01', '2019-09-01', '', NULL),
(800004, 7, '2015-03-01', '1970-01-01', '', NULL),
(800009, 1, NULL, '2020-02-01', '', ''),
(800009, 2, NULL, '2020-12-01', '', ''),
(800010, 1, NULL, '2019-12-01', '', ''),
(800010, 2, NULL, '2020-12-01', '', ''),
(800010, 7, '2015-03-01', '1970-01-01', '', NULL),
(800014, 1, NULL, '2020-12-01', '', ''),
(800014, 2, NULL, '2019-12-01', '', ''),
(800015, 1, NULL, '2020-08-01', '', ''),
(800015, 2, NULL, '2021-03-01', '', ''),
(800015, 3, '2018-01-01', '2020-04-01', '', NULL),
(800015, 4, '2017-12-01', '2019-12-01', '', NULL),
(800015, 5, '2019-03-01', '2021-03-01', '', NULL),
(800017, 1, NULL, '2020-12-01', '', ''),
(800017, 2, NULL, '2020-01-01', '', ''),
(800018, 1, NULL, '2021-03-01', '', ''),
(800018, 2, NULL, '2019-12-01', '', ''),
(800018, 3, '2019-06-01', '2021-06-01', '', NULL),
(800018, 4, '2018-10-01', '2020-10-01', '', NULL),
(800021, 1, NULL, '2020-12-01', '', ''),
(800021, 2, NULL, '2020-12-01', '', ''),
(800021, 7, '2017-04-01', '1970-01-01', 'aquajogging oct. 2017', NULL),
(800022, 1, NULL, '2020-12-01', '', ''),
(800022, 2, NULL, '2019-12-01', '', ''),
(800023, 1, NULL, '2020-07-01', '', ''),
(800023, 2, NULL, '2021-03-01', '', ''),
(800027, 1, NULL, '2021-04-01', '', ''),
(800027, 2, NULL, '2019-09-01', '14 sept. Mtl', 'REQUAL ISA/MSA'),
(800027, 6, '2017-10-01', '2019-12-01', '14 sept. Mtl', NULL),
(800027, 7, '2020-09-17', '1970-01-01', '', NULL),
(800029, 1, NULL, '2020-06-01', '', ''),
(800029, 2, NULL, '2019-12-01', '', ''),
(800032, 1, NULL, '2020-12-01', '', ''),
(800033, 1, NULL, '2019-12-01', '', ''),
(800036, 1, NULL, '2019-12-01', '', ''),
(800036, 2, NULL, '2019-09-01', '', ''),
(800037, 1, NULL, '2021-06-01', '', ''),
(800037, 2, NULL, '2021-05-01', '', ''),
(800038, 1, NULL, '2019-12-01', '', ''),
(800039, 1, NULL, '2021-03-01', '', ''),
(800040, 1, NULL, '2020-09-01', '', ''),
(800040, 3, '2017-09-01', '2019-09-01', '', NULL),
(800040, 4, '2017-09-01', '2019-09-01', '', NULL),
(800041, 1, NULL, '2021-03-01', '', ''),
(800041, 2, NULL, '2019-12-01', '', ''),
(800041, 3, '2018-12-01', '2020-12-01', '', NULL),
(800041, 7, '2015-11-01', '1970-01-01', '', NULL),
(800042, 1, NULL, '2019-12-01', '', ''),
(800042, 2, NULL, '2020-03-01', '', ''),
(800042, 3, '2017-09-01', '2019-09-01', '', NULL),
(800042, 4, '2017-09-01', '2019-09-01', '', NULL),
(800042, 5, '2015-05-01', '2019-12-01', '', NULL),
(800045, 1, NULL, '2019-12-01', '', ''),
(800045, 2, NULL, '2020-12-01', '', ''),
(800048, 1, NULL, '2020-06-01', '', ''),
(800049, 1, NULL, '2019-12-01', '', ''),
(800054, 1, NULL, '2019-12-01', '', ''),
(800054, 2, NULL, '2020-11-01', '', ''),
(800057, 1, NULL, '2020-04-01', '', ''),
(800057, 2, NULL, '2019-12-01', '', ''),
(800059, 1, NULL, '2020-06-01', '', ''),
(800059, 2, NULL, '2021-06-01', '', ''),
(800059, 7, '2015-11-01', '1970-01-01', '', NULL),
(800062, 1, NULL, '2021-06-01', '', ''),
(800073, 1, NULL, '2021-06-01', '', ''),
(800073, 2, NULL, '2020-09-01', '', ''),
(800073, 7, '2019-09-01', '1970-01-01', '', NULL),
(800077, 1, NULL, '2021-07-01', '', ''),
(800077, 2, NULL, '2019-12-01', '', ''),
(800078, 1, NULL, '2019-12-01', '', ''),
(800078, 2, NULL, '2021-06-01', '', ''),
(800079, 1, NULL, '2019-12-01', '', ''),
(800079, 2, NULL, '2019-12-01', '', ''),
(800079, 7, '2019-02-01', '1970-01-01', '', NULL),
(800081, 1, NULL, '2021-08-01', '', ''),
(800081, 2, NULL, '2019-12-01', '', ''),
(800083, 1, NULL, '2019-12-01', '', ''),
(800083, 2, NULL, '2021-03-01', '', ''),
(800086, 1, NULL, '2020-03-01', '', ''),
(800086, 2, NULL, '2020-03-01', '', ''),
(800086, 7, '2015-03-01', '1970-01-01', '', NULL),
(800088, 1, NULL, '2020-06-01', '', ''),
(800088, 2, NULL, '2019-12-01', '', ''),
(800089, 1, NULL, '2021-06-01', '', ''),
(800089, 2, NULL, '2020-12-01', '', ''),
(800090, 1, NULL, '2020-06-01', '', ''),
(800090, 2, NULL, '2020-12-01', '', ''),
(800091, 1, NULL, '2019-12-01', '', ''),
(800091, 2, NULL, '2020-12-01', '', ''),
(800092, 1, NULL, '2019-06-01', 'EXP DEC 2019', ''),
(800092, 2, NULL, '2020-04-01', '', ''),
(800093, 1, NULL, '2020-12-01', '', ''),
(800093, 2, NULL, '2020-06-01', '', ''),
(800095, 1, NULL, '2020-06-01', '', ''),
(800097, 1, NULL, '2020-03-01', '', ''),
(800099, 1, NULL, '2019-12-01', '', ''),
(800100, 1, NULL, '2019-12-01', '', ''),
(800100, 2, NULL, '2019-12-01', '', ''),
(800101, 1, NULL, '2021-03-01', '', ''),
(800101, 2, NULL, '2020-12-01', '', ''),
(800101, 7, '2017-09-01', '1970-01-01', '', NULL),
(800104, 1, NULL, '2020-06-01', '', ''),
(800105, 1, NULL, '2019-12-01', '', ''),
(800105, 2, NULL, '2020-12-01', '', ''),
(800107, 1, NULL, '2020-03-01', '', ''),
(800107, 2, NULL, '2020-12-01', '', ''),
(800108, 1, NULL, '2021-03-01', '', ''),
(800109, 1, NULL, '2020-06-01', '', ''),
(800109, 2, NULL, '2021-02-01', '', ''),
(800111, 1, NULL, '2020-06-01', '', ''),
(800113, 1, NULL, '2019-12-01', '', ''),
(800113, 2, NULL, '2021-03-01', '', ''),
(800114, 1, NULL, '2021-06-01', '', ''),
(800114, 7, '2017-06-01', '1970-01-01', '', NULL),
(800116, 1, NULL, '2021-03-01', '', ''),
(800116, 2, NULL, '2021-06-01', '', ''),
(800117, 1, NULL, '2020-12-01', '', ''),
(800118, 1, NULL, '2019-12-01', '', ''),
(800118, 2, NULL, '2020-12-01', '', ''),
(800120, 1, NULL, '2020-03-01', '', ''),
(800120, 2, NULL, '2020-12-01', '', ''),
(800122, 1, NULL, '2020-06-01', '', ''),
(800122, 2, NULL, '2029-08-01', '', ''),
(800122, 7, '2018-09-01', '1970-01-01', '', NULL),
(800124, 1, NULL, '2019-12-01', '', ''),
(800124, 2, NULL, '2020-06-01', '', ''),
(800126, 1, NULL, '2021-06-01', '', ''),
(800126, 2, NULL, '2021-05-01', '', ''),
(800127, 1, NULL, '2019-11-01', '', ''),
(800127, 2, NULL, '2020-12-01', '', ''),
(800128, 1, NULL, '2021-07-01', '', ''),
(800128, 2, NULL, '2021-06-01', '', ''),
(800128, 7, '2017-12-01', '1970-01-01', '', NULL),
(800130, 1, NULL, '2020-03-01', '', ''),
(800130, 2, NULL, '2021-06-01', '', ''),
(800130, 7, '2018-08-01', '1970-01-01', '', NULL),
(800131, 1, NULL, '2021-06-01', '', ''),
(800131, 2, NULL, '2019-12-01', '', ''),
(800132, 1, NULL, '2021-03-01', '', ''),
(800132, 2, NULL, '2020-03-01', '', ''),
(800133, 1, NULL, '2021-06-01', '', ''),
(800133, 2, NULL, '2021-02-01', '', ''),
(800134, 1, NULL, '2021-08-01', '', ''),
(800135, 1, NULL, '2019-12-01', '', ''),
(800135, 2, NULL, '2020-08-01', '', ''),
(800136, 1, NULL, '2021-03-01', '', ''),
(800136, 2, NULL, '2020-03-01', '', ''),
(800137, 1, NULL, '2020-06-01', '', ''),
(800137, 2, NULL, '2019-12-01', '', ''),
(800139, 1, NULL, '2021-03-01', '', ''),
(800139, 2, NULL, '2019-12-01', '', ''),
(800142, 1, NULL, '2021-03-01', '', ''),
(800142, 2, NULL, '2020-03-01', '', ''),
(800142, 7, '2019-02-01', '1970-01-01', '', NULL),
(800145, 1, NULL, '2019-12-01', '', ''),
(800145, 2, NULL, '2020-03-01', '', ''),
(800148, 1, NULL, '2020-03-01', '', ''),
(800148, 2, NULL, '2020-03-01', '', ''),
(800148, 3, '2019-03-01', '2021-03-01', '', NULL),
(800148, 5, '2019-06-01', '2021-06-01', 'SEULEMENT POUR STAGES', NULL),
(800149, 1, NULL, '2021-06-01', '', ''),
(800149, 2, NULL, '2020-06-01', '', ''),
(800151, 1, NULL, '2021-06-01', '', ''),
(800151, 2, NULL, '2020-11-01', '', ''),
(800152, 1, NULL, '2020-11-01', 'CB', ''),
(800152, 2, NULL, '2020-03-01', 'attente de carte', ''),
(800153, 1, NULL, '2019-12-01', '', ''),
(800153, 2, NULL, '2020-11-01', '', ''),
(800154, 1, NULL, '2020-01-01', '', ''),
(800154, 2, NULL, '2020-06-01', '', ''),
(800155, 1, NULL, '2020-09-01', '', ''),
(800156, 1, NULL, '2020-11-01', 'CB', ''),
(800156, 2, NULL, '2021-06-01', '', ''),
(800157, 1, NULL, '2020-11-01', '', ''),
(800157, 2, NULL, '2021-06-01', '', ''),
(800158, 1, NULL, '2020-07-01', '', ''),
(800160, 1, NULL, '2021-03-01', '', ''),
(800161, 1, NULL, '2021-03-01', '', ''),
(800161, 2, NULL, '2020-11-01', '', ''),
(800164, 1, NULL, '2020-06-01', '', ''),
(800165, 1, NULL, '2020-06-01', '', ''),
(800165, 2, NULL, '2020-11-01', '', ''),
(800166, 1, NULL, '2020-03-01', '', ''),
(800166, 2, NULL, '2020-06-01', '', ''),
(800167, 1, NULL, '2021-03-01', '', ''),
(800167, 2, NULL, '2020-11-01', '', ''),
(800168, 1, NULL, '2021-03-01', '', ''),
(800169, 1, NULL, '2020-11-01', '', ''),
(800169, 2, NULL, '2021-03-01', '', ''),
(800170, 1, NULL, '2021-03-01', 'CB', 'SN A19'),
(800170, 2, NULL, '2021-06-01', '', ''),
(800171, 1, NULL, '2019-11-01', 'CB', ''),
(800171, 2, NULL, '2020-11-01', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_content` varchar(90) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `correct_answer` varchar(35) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `wrong_answer_1` varchar(35) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `wrong_answer_2` varchar(35) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `wrong_answer_3` varchar(35) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `response`
--

CREATE TABLE `response` (
  `question_id` int(7) NOT NULL,
  `user_id` int(7) NOT NULL,
  `question_response` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `role_is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `role_is_admin`) VALUES
(1, 'user', 0),
(2, 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `sch_id` int(7) NOT NULL,
  `sch_start_date` date NOT NULL,
  `sch_end_date` date NOT NULL,
  `avail_deadline` date NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`sch_id`, `sch_start_date`, `sch_end_date`, `avail_deadline`, `title`) VALUES
(1, '2020-01-02', '2020-01-03', '2020-01-01', 'Hiver 2021'),
(2, '2020-01-31', '2020-03-27', '2020-01-01', 'Automne 2020');

-- --------------------------------------------------------

--
-- Table structure for table `seniority`
--

CREATE TABLE `seniority` (
  `seniority_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seniority_type` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hours` double(10,2) NOT NULL,
  `continued_service` date NOT NULL,
  `seniority_loss` varchar(40) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `seniority`
--

INSERT INTO `seniority` (`seniority_id`, `user_id`, `seniority_type`, `hours`, `continued_service`, `seniority_loss`) VALUES
(1, 800017, 'enseignement', 3033.92, '2015-03-02', NULL),
(2, 800029, 'enseignement', 2599.42, '2015-03-02', NULL),
(3, 800039, 'enseignement', 2466.09, '2015-03-02', NULL),
(4, 800038, 'enseignement', 2248.09, '2015-03-02', NULL),
(5, 800001, 'enseignement', 1989.34, '2015-03-02', NULL),
(6, 800057, 'enseignement', 1892.66, '2015-05-27', NULL),
(7, 800027, 'enseignement', 1846.08, '2015-03-02', NULL),
(8, 800014, 'enseignement', 1799.08, '2015-03-02', NULL),
(9, 800004, 'enseignement', 1680.50, '2015-03-28', NULL),
(10, 800079, 'enseignement', 1511.75, '2016-05-28', NULL),
(11, 800032, 'enseignement', 1427.25, '2015-03-28', NULL),
(12, 800009, 'enseignement', 1315.25, '2015-03-02', NULL),
(13, 800048, 'enseignement', 1264.76, '2015-05-27', NULL),
(14, 800003, 'enseignement', 1264.17, '2015-03-28', NULL),
(15, 800018, 'enseignement', 1245.42, '2015-03-28', NULL),
(16, 800062, 'enseignement', 1216.42, '2015-05-27', NULL),
(17, 800010, 'enseignement', 1171.33, '2015-03-14', NULL),
(18, 800023, 'enseignement', 1098.92, '2015-03-28', NULL),
(19, 800015, 'enseignement', 1069.38, '2015-03-28', NULL),
(20, 800090, 'enseignement', 1065.22, '2017-01-06', NULL),
(21, 800059, 'enseignement', 1059.91, '2015-05-27', NULL),
(22, 800081, 'enseignement', 1038.25, '2016-05-28', NULL),
(23, 800078, 'enseignement', 1008.50, '2016-05-28', NULL),
(24, 800022, 'enseignement', 930.01, '2015-03-28', NULL),
(25, 800040, 'enseignement', 904.17, '2015-03-14', NULL),
(26, 800116, 'enseignement', 899.00, '2017-05-27', NULL),
(27, 800100, 'enseignement', 850.83, '2017-05-27', NULL),
(28, 800088, 'enseignement', 846.75, '2017-01-06', NULL),
(29, 800108, 'enseignement', 826.58, '2017-05-27', NULL),
(30, 800021, 'enseignement', 782.09, '2015-03-28', NULL),
(31, 800089, 'enseignement', 733.50, '2017-01-06', NULL),
(32, 800111, 'enseignement', 699.75, '2017-05-27', NULL),
(33, 800104, 'enseignement', 685.67, '2017-05-27', NULL),
(34, 800099, 'enseignement', 640.00, '2017-05-27', NULL),
(35, 800073, 'enseignement', 617.17, '2015-09-14', NULL),
(36, 800126, 'enseignement', 605.00, '2017-09-16', NULL),
(37, 800127, 'enseignement', 590.13, '2017-09-16', NULL),
(38, 800083, 'enseignement', 570.08, '2016-07-05', NULL),
(39, 800093, 'enseignement', 553.83, '2017-02-27', NULL),
(40, 800105, 'enseignement', 501.33, '2017-05-27', NULL),
(41, 800114, 'enseignement', 480.17, '2017-05-27', NULL),
(42, 800041, 'enseignement', 473.00, '2015-03-17', NULL),
(43, 800109, 'enseignement', 457.25, '2017-05-27', NULL),
(44, 800124, 'enseignement', 438.92, '2017-09-16', NULL),
(45, 800097, 'enseignement', 428.00, '2017-05-27', NULL),
(46, 800142, 'enseignement', 408.88, '2018-05-26', NULL),
(47, 800091, 'enseignement', 393.75, '2017-01-06', NULL),
(48, 800118, 'enseignement', 337.26, '2017-05-27', NULL),
(49, 800107, 'enseignement', 306.59, '2017-05-27', NULL),
(50, 800149, 'enseignement', 299.17, '2018-05-26', NULL),
(51, 800077, 'enseignement', 275.17, '2016-05-28', NULL),
(52, 800128, 'enseignement', 250.92, '2018-01-11', NULL),
(53, 800139, 'enseignement', 238.67, '2018-05-26', NULL),
(54, 800049, 'enseignement', 235.50, '2015-05-27', NULL),
(55, 800148, 'enseignement', 205.60, '2018-05-26', NULL),
(56, 800120, 'enseignement', 200.17, '2017-08-31', NULL),
(57, 800130, 'enseignement', 195.67, '2018-03-26', NULL),
(58, 800137, 'enseignement', 186.75, '2018-05-26', NULL),
(59, 800101, 'enseignement', 185.00, '2017-05-27', NULL),
(60, 800168, 'enseignement', 168.25, '2019-05-25', NULL),
(61, 800153, 'enseignement', 164.00, '2019-03-28', NULL),
(62, 800113, 'enseignement', 129.17, '2017-05-27', NULL),
(63, 800131, 'enseignement', 106.42, '2018-03-26', NULL),
(64, 800158, 'enseignement', 104.17, '2019-05-25', NULL),
(65, 800167, 'enseignement', 97.00, '2019-05-25', NULL),
(66, 800136, 'enseignement', 90.66, '2018-05-26', NULL),
(67, 800042, 'enseignement', 65.50, '2015-03-24', NULL),
(68, 800164, 'enseignement', 61.25, '2019-05-25', NULL),
(69, 758300, 'enseignement', 43.25, '2019-05-25', NULL),
(70, 800132, 'enseignement', 37.00, '2018-05-26', NULL),
(71, 800135, 'enseignement', 35.00, '2018-05-26', NULL),
(72, 800157, 'enseignement', 33.33, '2019-05-25', NULL),
(73, 800160, 'enseignement', 26.50, '2019-05-25', NULL),
(74, 800161, 'enseignement', 25.42, '2019-05-25', NULL),
(75, 800165, 'enseignement', 24.50, '2019-05-25', NULL),
(76, 800166, 'enseignement', 23.75, '2019-05-25', NULL),
(77, 800092, 'enseignement', 23.50, '2017-02-27', NULL),
(78, 800151, 'enseignement', 14.50, '2019-03-28', NULL),
(79, 800156, 'enseignement', 11.25, '2019-05-25', NULL),
(80, 800122, 'enseignement', 10.50, '2017-08-30', NULL),
(81, 800155, 'enseignement', 7.25, '2019-05-25', NULL),
(82, 750045, 'enseignement', 5.25, '2019-05-25', NULL),
(83, 800152, 'enseignement', 2.00, '2019-03-28', NULL),
(84, 800033, 'enseignement', 0.00, '2019-01-17', NULL),
(85, 800037, 'enseignement', 214.25, '2015-03-14', NULL),
(86, 800117, 'enseignement', 698.50, '2017-05-27', NULL),
(87, 800145, 'enseignement', 217.67, '2018-05-26', NULL),
(88, 722888, 'enseignement', 922.50, '2015-01-24', NULL),
(89, 800133, 'enseignement', 38.42, '2018-05-26', NULL),
(90, 800154, 'enseignement', 7.25, '2019-03-28', NULL),
(91, 800169, 'enseignement', 0.00, '2019-09-05', NULL),
(92, 800170, 'enseignement', 0.00, '2019-09-17', NULL),
(93, 800171, 'enseignement', 0.00, '2019-10-18', NULL),
(94, 800086, 'enseignement', 0.00, '2019-10-30', NULL),
(95, 800017, 'surveillance', 3033.92, '2015-03-02', NULL),
(96, 800029, 'surveillance', 2599.42, '2015-03-02', NULL),
(97, 800039, 'surveillance', 2466.09, '2015-03-02', NULL),
(98, 800038, 'surveillance', 2248.09, '2015-03-02', NULL),
(99, 800001, 'surveillance', 1989.34, '2015-03-02', NULL),
(100, 800057, 'surveillance', 1892.66, '2015-05-27', NULL),
(101, 800027, 'surveillance', 1846.08, '2015-03-02', NULL),
(102, 800014, 'surveillance', 1799.08, '2015-03-02', NULL),
(103, 800004, 'surveillance', 1680.50, '2015-03-28', NULL),
(104, 800079, 'surveillance', 1511.75, '2016-05-28', NULL),
(105, 800032, 'surveillance', 1427.25, '2015-03-28', NULL),
(106, 800009, 'surveillance', 1315.25, '2015-03-02', NULL),
(107, 800048, 'surveillance', 1264.76, '2015-05-27', NULL),
(108, 800003, 'surveillance', 1264.17, '2015-03-28', NULL),
(109, 800018, 'surveillance', 1245.42, '2015-03-28', NULL),
(110, 800062, 'surveillance', 1216.42, '2015-05-27', NULL),
(111, 800010, 'surveillance', 1171.33, '2015-03-14', NULL),
(112, 800023, 'surveillance', 1098.92, '2015-03-28', NULL),
(113, 800015, 'surveillance', 1069.38, '2015-03-28', NULL),
(114, 800090, 'surveillance', 1065.22, '2017-01-06', NULL),
(115, 800059, 'surveillance', 1059.91, '2015-05-27', NULL),
(116, 800081, 'surveillance', 1038.25, '2016-05-28', NULL),
(117, 800078, 'surveillance', 1008.50, '2016-05-28', NULL),
(118, 800022, 'surveillance', 930.01, '2015-03-28', NULL),
(119, 800040, 'surveillance', 904.17, '2015-03-14', NULL),
(120, 800116, 'surveillance', 899.00, '2017-05-27', NULL),
(121, 800100, 'surveillance', 850.83, '2017-05-27', NULL),
(122, 800088, 'surveillance', 846.75, '2017-01-06', NULL),
(123, 800108, 'surveillance', 826.58, '2017-05-27', NULL),
(124, 800021, 'surveillance', 782.09, '2015-03-28', NULL),
(125, 800089, 'surveillance', 733.50, '2017-01-06', NULL),
(126, 800111, 'surveillance', 699.75, '2017-05-27', NULL),
(127, 800104, 'surveillance', 685.67, '2017-05-27', NULL),
(128, 800099, 'surveillance', 640.00, '2017-05-27', NULL),
(129, 800073, 'surveillance', 617.17, '2015-09-14', NULL),
(130, 800126, 'surveillance', 605.00, '2017-09-16', NULL),
(131, 800127, 'surveillance', 590.13, '2017-09-16', NULL),
(132, 800083, 'surveillance', 570.08, '2016-07-05', NULL),
(133, 800093, 'surveillance', 553.83, '2017-02-27', NULL),
(134, 800105, 'surveillance', 501.33, '2017-05-27', NULL),
(135, 800114, 'surveillance', 480.17, '2017-05-27', NULL),
(136, 800041, 'surveillance', 473.00, '2015-03-17', NULL),
(137, 800109, 'surveillance', 457.25, '2017-05-27', NULL),
(138, 800124, 'surveillance', 438.92, '2017-09-16', NULL),
(139, 800097, 'surveillance', 428.00, '2017-05-27', NULL),
(140, 800142, 'surveillance', 408.88, '2018-05-26', NULL),
(141, 800091, 'surveillance', 393.75, '2017-01-06', NULL),
(142, 800118, 'surveillance', 337.26, '2017-05-27', NULL),
(143, 800107, 'surveillance', 306.59, '2017-05-27', NULL),
(144, 800149, 'surveillance', 299.17, '2018-05-26', NULL),
(145, 800077, 'surveillance', 275.17, '2016-05-28', NULL),
(146, 800128, 'surveillance', 250.92, '2018-01-11', NULL),
(147, 800139, 'surveillance', 238.67, '2018-05-26', NULL),
(148, 800049, 'surveillance', 235.50, '2015-05-27', NULL),
(149, 800148, 'surveillance', 205.60, '2018-05-26', NULL),
(150, 800120, 'surveillance', 200.17, '2017-08-31', NULL),
(151, 800130, 'surveillance', 195.67, '2018-03-26', NULL),
(152, 800137, 'surveillance', 186.75, '2018-05-26', NULL),
(153, 800101, 'surveillance', 185.00, '2017-05-27', NULL),
(154, 800168, 'surveillance', 168.25, '2019-05-25', NULL),
(155, 800153, 'surveillance', 164.00, '2019-03-28', NULL),
(156, 800113, 'surveillance', 129.17, '2017-05-27', NULL),
(157, 800131, 'surveillance', 106.42, '2018-03-26', NULL),
(158, 800158, 'surveillance', 104.17, '2019-05-25', NULL),
(159, 800167, 'surveillance', 97.00, '2019-05-25', NULL),
(160, 800136, 'surveillance', 90.66, '2018-05-26', NULL),
(161, 800042, 'surveillance', 65.50, '2015-03-24', NULL),
(162, 800164, 'surveillance', 61.25, '2019-05-25', NULL),
(163, 758300, 'surveillance', 43.25, '2019-05-25', NULL),
(164, 800132, 'surveillance', 37.00, '2018-05-26', NULL),
(165, 800135, 'surveillance', 35.00, '2018-05-26', NULL),
(166, 800157, 'surveillance', 33.33, '2019-05-25', NULL),
(167, 800160, 'surveillance', 26.50, '2019-05-25', NULL),
(168, 800161, 'surveillance', 25.42, '2019-05-25', NULL),
(169, 800165, 'surveillance', 24.50, '2019-05-25', NULL),
(170, 800166, 'surveillance', 23.75, '2019-05-25', NULL),
(171, 800092, 'surveillance', 23.50, '2017-02-27', NULL),
(172, 800151, 'surveillance', 14.50, '2019-03-28', NULL),
(173, 800156, 'surveillance', 11.25, '2019-05-25', NULL),
(174, 800122, 'surveillance', 10.50, '2017-08-30', NULL),
(175, 800155, 'surveillance', 7.25, '2019-05-25', NULL),
(176, 750045, 'surveillance', 5.25, '2019-05-25', NULL),
(177, 800152, 'surveillance', 2.00, '2019-03-28', NULL),
(178, 800033, 'surveillance', 0.00, '2019-01-17', NULL),
(179, 800037, 'surveillance', 214.25, '2015-03-14', NULL),
(180, 800117, 'surveillance', 698.50, '2017-05-27', NULL),
(181, 800145, 'surveillance', 217.67, '2018-05-26', NULL),
(182, 722888, 'surveillance', 922.50, '2015-01-24', NULL),
(183, 800133, 'surveillance', 38.42, '2018-05-26', NULL),
(184, 800154, 'surveillance', 7.25, '2019-03-28', NULL),
(185, 800169, 'surveillance', 0.00, '2019-09-05', NULL),
(186, 800170, 'surveillance', 0.00, '2019-09-17', NULL),
(187, 800171, 'surveillance', 0.00, '2019-10-18', NULL),
(188, 800086, 'surveillance', 0.00, '2019-10-30', NULL),
(189, 800018, 'enseignement', 2660.34, '2015-03-02', NULL),
(190, 800010, 'enseignement', 2117.15, '2015-03-02', NULL),
(191, 800009, 'enseignement', 2030.50, '2015-03-02', NULL),
(192, 800022, 'enseignement', 1577.00, '2015-03-02', NULL),
(193, 800014, 'enseignement', 1333.33, '2015-03-02', NULL),
(194, 800021, 'enseignement', 1293.50, '2015-03-28', NULL),
(195, 800073, 'enseignement', 1230.24, '2015-09-14', NULL),
(196, 800077, 'enseignement', 1035.75, '2016-05-28', NULL),
(197, 800015, 'enseignement', 1030.25, '2015-03-02', NULL),
(198, 800107, 'enseignement', 988.92, '2017-05-27', NULL),
(199, 800041, 'enseignement', 953.38, '2015-03-02', NULL),
(200, 800042, 'enseignement', 927.00, '2015-03-02', NULL),
(201, 800001, 'enseignement', 748.83, '2015-03-02', NULL),
(202, 800059, 'enseignement', 741.50, '2015-05-27', NULL),
(203, 800090, 'enseignement', 671.25, '2016-12-21', NULL),
(204, 800093, 'enseignement', 669.50, '2017-02-10', NULL),
(205, 800023, 'enseignement', 645.00, '2015-03-02', NULL),
(206, 800101, 'enseignement', 643.00, '2017-05-27', NULL),
(207, 800078, 'enseignement', 634.92, '2016-05-28', NULL),
(208, 800118, 'enseignement', 626.25, '2017-05-27', NULL),
(209, 800089, 'enseignement', 607.50, '2016-12-15', NULL),
(210, 800130, 'enseignement', 559.50, '2018-03-26', NULL),
(211, 800113, 'enseignement', 545.34, '2017-05-27', NULL),
(212, 800079, 'enseignement', 529.25, '2016-05-28', NULL),
(213, 800088, 'enseignement', 431.09, '2016-12-02', NULL),
(214, 800105, 'enseignement', 399.25, '2017-05-27', NULL),
(215, 800083, 'enseignement', 377.75, '2016-05-28', NULL),
(216, 800127, 'enseignement', 377.34, '2017-09-16', NULL),
(217, 800120, 'enseignement', 370.83, '2017-08-31', NULL),
(218, 800091, 'enseignement', 324.25, '2016-12-21', NULL),
(219, 800017, 'enseignement', 315.25, '2015-03-02', NULL),
(220, 800126, 'enseignement', 310.92, '2017-09-16', NULL),
(221, 800092, 'enseignement', 309.64, '2017-02-10', NULL),
(222, 800122, 'enseignement', 301.00, '2017-08-30', NULL),
(223, 800131, 'enseignement', 292.45, '2018-03-26', NULL),
(224, 800124, 'enseignement', 278.00, '2017-09-16', NULL),
(225, 800148, 'enseignement', 271.00, '2018-05-26', NULL),
(226, 800004, 'enseignement', 248.92, '2015-03-02', NULL),
(227, 800057, 'enseignement', 248.25, '2015-05-27', NULL),
(228, 800142, 'enseignement', 237.75, '2018-05-26', NULL),
(229, 800116, 'enseignement', 231.17, '2017-05-27', NULL),
(230, 800097, 'enseignement', 226.75, '2017-05-27', NULL),
(231, 800040, 'enseignement', 206.84, '2015-03-02', NULL),
(232, 800038, 'enseignement', 204.75, '2015-03-02', NULL),
(233, 800139, 'enseignement', 203.42, '2018-05-26', NULL),
(234, 800100, 'enseignement', 186.00, '2017-05-27', NULL),
(235, 800039, 'enseignement', 183.25, '2015-03-02', NULL),
(236, 800136, 'enseignement', 159.25, '2018-05-26', NULL),
(237, 800128, 'enseignement', 94.50, '2018-01-11', NULL),
(238, 800029, 'enseignement', 85.00, '2015-03-02', NULL),
(239, 800109, 'enseignement', 66.25, '2017-05-27', NULL),
(240, 800149, 'enseignement', 60.45, '2018-05-26', NULL),
(241, 800153, 'enseignement', 59.50, '2019-03-28', NULL),
(242, 800137, 'enseignement', 40.00, '2018-05-26', NULL),
(243, 800135, 'enseignement', 33.50, '2018-05-26', NULL),
(244, 800161, 'enseignement', 21.50, '2019-05-25', NULL),
(245, 800152, 'enseignement', 19.00, '2019-03-28', NULL),
(246, 800156, 'enseignement', 15.95, '2019-05-25', NULL),
(247, 800081, 'enseignement', 12.50, '2016-05-28', NULL),
(248, 800166, 'enseignement', 11.00, '2019-05-25', NULL),
(249, 800151, 'enseignement', 9.00, '2019-03-28', NULL),
(250, 800114, 'enseignement', 9.00, '2017-05-27', NULL),
(251, 800132, 'enseignement', 8.25, '2018-05-26', NULL),
(252, 800167, 'enseignement', 7.00, '2019-05-25', NULL),
(253, 800032, 'enseignement', 2.75, '2015-03-02', NULL),
(254, 800048, 'enseignement', 1.00, '2015-05-27', NULL),
(255, 800062, 'enseignement', 0.50, '2015-05-27', NULL),
(256, 800049, 'enseignement', 0.00, '2015-05-27', NULL),
(257, 800155, 'enseignement', 0.00, '2019-05-25', NULL),
(258, 800157, 'enseignement', 0.00, '2019-05-25', NULL),
(259, 800158, 'enseignement', 0.00, '2019-05-25', NULL),
(260, 750045, 'enseignement', 0.00, '2019-05-25', NULL),
(261, 800099, 'enseignement', 0.00, '2017-05-27', NULL),
(262, 800160, 'enseignement', 0.00, '2019-05-25', NULL),
(263, 800104, 'enseignement', 0.00, '2017-05-27', NULL),
(264, 800108, 'enseignement', 0.00, '2017-05-27', NULL),
(265, 758300, 'enseignement', 0.00, '2019-05-25', NULL),
(266, 800033, 'enseignement', 0.00, '2019-01-17', NULL),
(267, 800164, 'enseignement', 0.00, '2019-05-25', NULL),
(268, 800111, 'enseignement', 0.00, '2017-05-27', NULL),
(269, 800165, 'enseignement', 0.00, '2019-05-25', NULL),
(270, 800168, 'enseignement', 0.00, '2019-05-25', NULL),
(271, 800037, 'enseignement', 635.58, '2015-03-14', NULL),
(272, 800133, 'enseignement', 0.00, '2018-05-26', NULL),
(273, 800117, 'enseignement', 0.00, '2017-05-27', NULL),
(274, 800145, 'enseignement', 173.00, '2018-05-26', NULL),
(275, 722888, 'enseignement', 1394.25, '1970-01-01', NULL),
(276, 800154, 'enseignement', 14.50, '2019-03-28', NULL),
(277, 800169, 'enseignement', 0.00, '2019-09-05', NULL),
(278, 800170, 'enseignement', 0.00, '2019-09-17', NULL),
(279, 800171, 'enseignement', 0.00, '2019-10-18', NULL),
(280, 800086, 'enseignement', 0.00, '2019-10-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `required_qual` int(11) DEFAULT NULL,
  `start_time` time NOT NULL DEFAULT curtime(),
  `end_time` time NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `day` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `assigned_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_id`, `schedule_id`, `required_qual`, `start_time`, `end_time`, `location`, `day`, `description`, `start_date`, `end_date`, `assigned_user`) VALUES
(1171, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'ETOILE GR-01', '2020-01-12', '2020-03-15', NULL),
(1172, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'ETOILE GR-02', '2020-01-12', '2020-03-15', NULL),
(1173, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'ETOILE GR-03', '2020-01-12', '2020-03-15', NULL),
(1174, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mercredi', 'ETOILE GR-04', '2020-01-08', '2020-03-11', NULL),
(1175, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'ETOILE GR-05', '2020-01-11', '2020-03-14', NULL),
(1176, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'ETOILE GR-51', '2020-01-12', '2020-03-22', NULL),
(1177, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'CANARD GR-01', '2020-01-12', '2020-03-15', NULL),
(1178, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'CANARD GR-02', '2020-01-12', '2020-03-15', NULL),
(1179, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'CANARD GR-03', '2020-01-12', '2020-03-15', NULL),
(1180, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'CANARD GR-04', '2020-01-11', '2020-03-14', NULL),
(1181, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'CANARD GR-05', '2020-01-11', '2020-03-14', NULL),
(1182, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'CANARD GR-51', '2020-01-12', '2020-03-22', NULL),
(1183, 1, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'CANARD GR-52', '2020-01-12', '2020-03-22', NULL),
(1184, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'CANARD GR-53', '2020-01-11', '2020-03-21', NULL),
(1185, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'CANARD GR-54', '2020-01-11', '2020-03-21', NULL),
(1186, 1, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'CANARD GR-55', '2020-01-11', '2020-03-21', NULL),
(1187, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'TORTUE GR-01', '2020-01-12', '2020-03-15', NULL),
(1188, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'TORTUE GR-02', '2020-01-12', '2020-03-15', NULL),
(1189, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'TORTUE GR-03', '2020-01-12', '2020-03-15', NULL),
(1190, 1, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'TORTUE GR-04', '2020-01-12', '2020-03-15', NULL),
(1191, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mercredi', 'TORTUE GR-05', '2020-01-08', '2020-03-11', NULL),
(1192, 1, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Mercredi', 'TORTUE GR-06', '2020-01-08', '2020-03-11', NULL),
(1193, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'TORTUE GR-07', '2020-01-11', '2020-03-14', NULL),
(1194, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'TORTUE GR-08', '2020-01-11', '2020-03-14', NULL),
(1195, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'TORTUE GR-09', '2020-01-11', '2020-03-14', NULL),
(1196, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'TORTUE GR-51', '2020-01-12', '2020-03-22', NULL),
(1197, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'TORTUE GR-52', '2020-01-12', '2020-03-22', NULL),
(1198, 1, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'TORTUE GR-53', '2020-01-12', '2020-03-22', NULL),
(1199, 1, 2, '18:30:00', '18:55:00', 'PIS-LT', 'Lundi', 'TORTUE GR-54', '2020-01-06', '2020-03-09', NULL),
(1200, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'TORTUE GR-55', '2020-01-11', '2020-03-21', NULL),
(1201, 1, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'TORTUE GR-56', '2020-01-11', '2020-03-21', NULL),
(1202, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-01', '2020-01-12', '2020-03-15', NULL),
(1203, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-02', '2020-01-12', '2020-03-15', NULL),
(1204, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-03', '2020-01-12', '2020-03-15', NULL),
(1205, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-04', '2020-01-12', '2020-03-15', NULL),
(1206, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-05', '2020-01-12', '2020-03-15', NULL),
(1207, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mardi', 'LOUTRE GR-06', '2020-01-07', '2020-03-10', NULL),
(1208, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Jeudi', 'LOUTRE GR-07', '2020-01-09', '2020-03-12', NULL),
(1209, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Jeudi', 'LOUTRE GR-08', '2020-01-09', '2020-03-12', NULL),
(1210, 1, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Jeudi', 'LOUTRE GR-09', '2020-01-09', '2020-03-12', NULL),
(1211, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'LOUTRE GR-10', '2020-01-11', '2020-03-14', NULL),
(1212, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'LOUTRE GR-11', '2020-01-11', '2020-03-14', NULL),
(1213, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Samedi', 'LOUTRE GR-12', '2020-01-11', '2020-03-14', NULL),
(1214, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-51', '2020-01-12', '2020-03-22', NULL),
(1215, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-52', '2020-01-12', '2020-03-22', NULL),
(1216, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-53', '2020-01-12', '2020-03-22', NULL),
(1217, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-54', '2020-01-12', '2020-03-22', NULL),
(1218, 1, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-55', '2020-01-12', '2020-03-22', NULL),
(1219, 1, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-56', '2020-01-12', '2020-03-22', NULL),
(1220, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Lundi', 'LOUTRE GR-57', '2020-01-06', '2020-03-09', NULL),
(1221, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Jeudi', 'LOUTRE GR-58', '2020-01-09', '2020-03-12', NULL),
(1222, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'LOUTRE GR-59', '2020-01-11', '2020-03-21', NULL),
(1223, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'LOUTRE GR-60', '2020-01-11', '2020-03-21', NULL),
(1224, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'LOUTRE GR-61', '2020-01-11', '2020-03-21', NULL),
(1225, 1, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'LOUTRE GR-62', '2020-01-11', '2020-03-21', NULL),
(1226, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-01', '2020-01-12', '2020-03-15', NULL),
(1227, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-02', '2020-01-12', '2020-03-15', NULL),
(1228, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-03', '2020-01-12', '2020-03-15', NULL),
(1229, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-04', '2020-01-12', '2020-03-15', NULL),
(1230, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-05', '2020-01-12', '2020-03-15', NULL),
(1231, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-06', '2020-01-12', '2020-03-15', NULL),
(1232, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-07', '2020-01-12', '2020-03-15', NULL),
(1233, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-08', '2020-01-12', '2020-03-15', NULL),
(1234, 1, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-09', '2020-01-12', '2020-03-15', NULL),
(1235, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mardi', 'SALAMANDRE GR-10', '2020-01-07', '2020-03-10', NULL),
(1236, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mercredi', 'SALAMANDRE GR-11', '2020-01-08', '2020-03-11', NULL),
(1237, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mercredi', 'SALAMANDRE GR-12', '2020-01-08', '2020-03-11', NULL),
(1238, 1, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Mercredi', 'SALAMANDRE GR-13', '2020-01-08', '2020-03-11', NULL),
(1239, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Jeudi', 'SALAMANDRE GR-14', '2020-01-09', '2020-03-12', NULL),
(1240, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Vendredi', 'SALAMANDRE GR-15', '2020-01-10', '2020-03-13', NULL),
(1241, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-16', '2020-01-11', '2020-03-14', NULL),
(1242, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-17', '2020-01-11', '2020-03-14', NULL),
(1243, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-18', '2020-01-11', '2020-03-14', NULL),
(1244, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-19', '2020-01-11', '2020-03-14', NULL),
(1245, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-20', '2020-01-11', '2020-03-14', NULL),
(1246, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-21', '2020-01-11', '2020-03-14', NULL),
(1247, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-22', '2020-01-11', '2020-03-14', NULL),
(1248, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-23', '2020-01-11', '2020-03-14', NULL),
(1249, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-24', '2020-01-11', '2020-03-14', NULL),
(1250, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-25', '2020-01-11', '2020-03-14', NULL),
(1251, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-26', '2020-01-11', '2020-03-14', NULL),
(1252, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-51', '2020-01-12', '2020-03-22', NULL),
(1253, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-52', '2020-01-12', '2020-03-22', NULL),
(1254, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-53', '2020-01-12', '2020-03-22', NULL),
(1255, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-54', '2020-01-12', '2020-03-22', NULL),
(1256, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-55', '2020-01-12', '2020-03-22', NULL),
(1257, 1, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-56', '2020-01-12', '2020-03-22', NULL),
(1258, 1, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-57', '2020-01-12', '2020-03-22', NULL),
(1259, 1, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-58', '2020-01-12', '2020-03-22', NULL),
(1260, 1, 2, '18:30:00', '18:55:00', 'PIS-LT', 'Lundi', 'SALAMANDRE GR-59', '2020-01-06', '2020-03-09', NULL),
(1261, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Lundi', 'SALAMANDRE GR-60', '2020-01-06', '2020-03-09', NULL),
(1262, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'SALAMANDRE GR-61', '2020-01-10', '2020-03-13', NULL),
(1263, 1, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Vendredi', 'SALAMANDRE GR-62', '2020-01-10', '2020-03-13', NULL),
(1264, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-63', '2020-01-11', '2020-03-21', NULL),
(1265, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-64', '2020-01-11', '2020-03-21', NULL),
(1266, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-65', '2020-01-11', '2020-03-21', NULL),
(1267, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-66', '2020-01-11', '2020-03-21', NULL),
(1268, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-67', '2020-01-11', '2020-03-21', NULL),
(1269, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-68', '2020-01-11', '2020-03-21', NULL),
(1270, 1, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-69', '2020-01-11', '2020-03-21', NULL),
(1271, 1, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-70', '2020-01-11', '2020-03-21', NULL),
(1272, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'POISSON GR-01', '2020-01-12', '2020-03-15', NULL),
(1273, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'POISSON GR-02', '2020-01-12', '2020-03-15', NULL),
(1274, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'POISSON GR-03', '2020-01-12', '2020-03-15', NULL),
(1275, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'POISSON GR-04', '2020-01-12', '2020-03-15', NULL),
(1276, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'POISSON GR-05', '2020-01-12', '2020-03-15', NULL),
(1277, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mercredi', 'POISSON GR-06', '2020-01-08', '2020-03-11', NULL),
(1278, 1, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Mercredi', 'POISSON GR-07', '2020-01-08', '2020-03-11', NULL),
(1279, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Jeudi', 'POISSON GR-08', '2020-01-09', '2020-03-12', NULL),
(1280, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'POISSON GR-09', '2020-01-11', '2020-03-14', NULL),
(1281, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'POISSON GR-10', '2020-01-11', '2020-03-14', NULL),
(1282, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'POISSON GR-11', '2020-01-11', '2020-03-14', NULL),
(1283, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'POISSON GR-51', '2020-01-12', '2020-03-22', NULL),
(1284, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'POISSON GR-52', '2020-01-12', '2020-03-22', NULL),
(1285, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'POISSON GR-53', '2020-01-12', '2020-03-22', NULL),
(1286, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'POISSON GR-54', '2020-01-12', '2020-03-22', NULL),
(1287, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'POISSON GR-55', '2020-01-10', '2020-03-13', NULL),
(1288, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'POISSON GR-56', '2020-01-10', '2020-03-13', NULL),
(1289, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'POISSON GR-57', '2020-01-11', '2020-03-21', NULL),
(1290, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'POISSON GR-58', '2020-01-11', '2020-03-21', NULL),
(1291, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'POISSON GR-59', '2020-01-11', '2020-03-21', NULL),
(1292, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'POISSON GR-60', '2020-01-11', '2020-03-21', NULL),
(1293, 1, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'POISSON GR-61', '2020-01-11', '2020-03-21', NULL),
(1294, 1, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'POISSON GR-62', '2020-01-11', '2020-03-21', NULL),
(1295, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'CROCODILE GR-01', '2020-01-12', '2020-03-15', NULL),
(1296, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'CROCODILE GR-02', '2020-01-12', '2020-03-15', NULL),
(1297, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'CROCODILE GR-03', '2020-01-12', '2020-03-15', NULL),
(1298, 1, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'CROCODILE GR-04', '2020-01-12', '2020-03-15', NULL),
(1299, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mardi', 'CROCODILE GR-05', '2020-01-07', '2020-03-10', NULL),
(1300, 1, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Mercredi', 'CROCODILE GR-06', '2020-01-08', '2020-03-11', NULL),
(1301, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Jeudi', 'CROCODILE GR-07', '2020-01-09', '2020-03-12', NULL),
(1302, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'CROCODILE GR-08', '2020-01-11', '2020-03-14', NULL),
(1303, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'CROCODILE GR-09', '2020-01-11', '2020-03-14', NULL),
(1304, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'CROCODILE GR-51', '2020-01-12', '2020-03-22', NULL),
(1305, 1, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'CROCODILE GR-52', '2020-01-12', '2020-03-22', NULL),
(1306, 1, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Vendredi', 'CROCODILE GR-53', '2020-01-10', '2020-03-13', NULL),
(1307, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'CROCODILE GR-54', '2020-01-11', '2020-03-21', NULL),
(1308, 1, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'CROCODILE GR-55', '2020-01-11', '2020-03-21', NULL),
(1309, 1, 2, '11:30:00', '11:55:00', 'AB', 'Dimanche', 'BALEINE GR-01', '2020-01-12', '2020-03-15', NULL),
(1310, 1, 2, '18:30:00', '18:55:00', 'AB', 'Mardi', 'BALEINE GR-02', '2020-01-07', '2020-03-10', NULL),
(1311, 1, 2, '09:30:00', '09:55:00', 'AB', 'Samedi', 'BALEINE GR-03', '2020-01-11', '2020-03-14', NULL),
(1312, 1, 2, '12:30:00', '12:55:00', 'AB', 'Samedi', 'BALEINE GR-04', '2020-01-11', '2020-03-14', NULL),
(1313, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'BALEINE GR-51', '2020-01-12', '2020-03-22', NULL),
(1314, 1, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Vendredi', 'BALEINE GR-52', '2020-01-10', '2020-03-13', NULL),
(1315, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'J01 GR-01', '2020-01-12', '2020-03-15', NULL),
(1316, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'J01 GR-02', '2020-01-12', '2020-03-15', NULL),
(1317, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'J01 GR-03', '2020-01-12', '2020-03-15', NULL),
(1318, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'J01 GR-04', '2020-01-12', '2020-03-15', NULL),
(1319, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'J01 GR-05', '2020-01-12', '2020-03-15', NULL),
(1320, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'J01 GR-06', '2020-01-12', '2020-03-15', NULL),
(1321, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'J01 GR-07', '2020-01-12', '2020-03-15', NULL),
(1322, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'J01 GR-08', '2020-01-12', '2020-03-15', NULL),
(1323, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mardi', 'J01 GR-09', '2020-01-07', '2020-03-10', NULL),
(1324, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mardi', 'J01 GR-10', '2020-01-07', '2020-03-10', NULL),
(1325, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mercredi', 'J01 GR-11', '2020-01-08', '2020-03-11', NULL),
(1326, 1, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Mercredi', 'J01 GR-12', '2020-01-08', '2020-03-11', NULL),
(1327, 1, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Mercredi', 'J01 GR-13', '2020-01-08', '2020-03-11', NULL),
(1328, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'J01 GR-14', '2020-01-11', '2020-03-14', NULL),
(1329, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'J01 GR-15', '2020-01-11', '2020-03-14', NULL),
(1330, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'J01 GR-16', '2020-01-11', '2020-03-14', NULL),
(1331, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'J01 GR-17', '2020-01-11', '2020-03-14', NULL),
(1332, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'J01 GR-18', '2020-01-11', '2020-03-14', NULL),
(1333, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Samedi', 'J01 GR-19', '2020-01-11', '2020-03-14', NULL),
(1334, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Samedi', 'J01 GR-20', '2020-01-11', '2020-03-14', NULL),
(1335, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'J01 GR-51', '2020-01-12', '2020-03-22', NULL),
(1336, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'J01 GR-52', '2020-01-12', '2020-03-22', NULL),
(1337, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'J01 GR-53', '2020-01-12', '2020-03-22', NULL),
(1338, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'J01 GR-54', '2020-01-12', '2020-03-22', NULL),
(1339, 1, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'J01 GR-55', '2020-01-12', '2020-03-22', NULL),
(1340, 1, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'J01 GR-56', '2020-01-12', '2020-03-22', NULL),
(1341, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Jeudi', 'J01 GR-57', '2020-01-09', '2020-03-12', NULL),
(1342, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'J01 GR-58', '2020-01-11', '2020-03-21', NULL),
(1343, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'J01 GR-59', '2020-01-11', '2020-03-21', NULL),
(1344, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'J01 GR-60', '2020-01-11', '2020-03-21', NULL),
(1345, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'J01 GR-61', '2020-01-11', '2020-03-21', NULL),
(1346, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'J01 GR-62', '2020-01-11', '2020-03-21', NULL),
(1347, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'J01 GR-63', '2020-01-11', '2020-03-21', NULL),
(1348, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'J01 GR-64', '2020-01-11', '2020-03-21', NULL),
(1349, 1, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'J01 GR-65', '2020-01-11', '2020-03-21', NULL),
(1350, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'J02 GR-01', '2020-01-12', '2020-03-15', NULL),
(1351, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'J02 GR-02', '2020-01-12', '2020-03-15', NULL),
(1352, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'J02 GR-03', '2020-01-12', '2020-03-15', NULL),
(1353, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'J02 GR-04', '2020-01-12', '2020-03-15', NULL),
(1354, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'J02 GR-05', '2020-01-12', '2020-03-15', NULL),
(1355, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'J02 GR-06', '2020-01-12', '2020-03-15', NULL),
(1356, 1, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'J02 GR-07', '2020-01-12', '2020-03-15', NULL),
(1357, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mardi', 'J02 GR-08', '2020-01-07', '2020-03-10', NULL),
(1358, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mercredi', 'J02 GR-09', '2020-01-08', '2020-03-11', NULL),
(1359, 1, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Mercredi', 'J02 GR-10', '2020-01-08', '2020-03-11', NULL),
(1360, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Jeudi', 'J02 GR-11', '2020-01-09', '2020-03-12', NULL),
(1361, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'J02 GR-12', '2020-01-11', '2020-03-14', NULL),
(1362, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'J02 GR-13', '2020-01-11', '2020-03-14', NULL),
(1363, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'J02 GR-14', '2020-01-11', '2020-03-14', NULL),
(1364, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'J02 GR-15', '2020-01-11', '2020-03-14', NULL),
(1365, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Samedi', 'J02 GR-16', '2020-01-11', '2020-03-14', NULL),
(1366, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'J02 GR-51', '2020-01-12', '2020-03-22', NULL),
(1367, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'J02 GR-52', '2020-01-12', '2020-03-22', NULL),
(1368, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'J02 GR-53', '2020-01-12', '2020-03-22', NULL),
(1369, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'J02 GR-54', '2020-01-12', '2020-03-22', NULL),
(1370, 1, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'J02 GR-55', '2020-01-12', '2020-03-22', NULL),
(1371, 1, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'J02 GR-56', '2020-01-12', '2020-03-22', NULL),
(1372, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Jeudi', 'J02 GR-57', '2020-01-09', '2020-03-12', NULL),
(1373, 1, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Vendredi', 'J02 GR-58', '2020-01-10', '2020-03-13', NULL),
(1374, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'J02 GR-59', '2020-01-11', '2020-03-21', NULL),
(1375, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'J02 GR-60', '2020-01-11', '2020-03-21', NULL),
(1376, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'J02 GR-61', '2020-01-11', '2020-03-21', NULL),
(1377, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'J02 GR-62', '2020-01-11', '2020-03-21', NULL),
(1378, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'J02 GR-63', '2020-01-11', '2020-03-21', NULL),
(1379, 1, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'J02 GR-64', '2020-01-11', '2020-03-21', NULL),
(1380, 1, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'J02 GR-65', '2020-01-11', '2020-03-21', NULL),
(1381, 1, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'J02 GR-66', '2020-01-11', '2020-03-21', NULL),
(1382, 1, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'J03 GR-01', '2020-01-12', '2020-03-15', NULL),
(1383, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'J03 GR-02', '2020-01-12', '2020-03-15', NULL),
(1384, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'J03 GR-03', '2020-01-12', '2020-03-15', NULL),
(1385, 1, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'J03 GR-04', '2020-01-12', '2020-03-15', NULL),
(1386, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'J03 GR-05', '2020-01-12', '2020-03-15', NULL),
(1387, 1, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'J03 GR-06', '2020-01-12', '2020-03-15', NULL),
(1388, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Lundi', 'J03 GR-07', '2020-01-06', '2020-03-09', NULL),
(1389, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mardi', 'J03 GR-08', '2020-01-07', '2020-03-10', NULL),
(1390, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mercredi', 'J03 GR-09', '2020-01-08', '2020-03-11', NULL),
(1391, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Jeudi', 'J03 GR-10', '2020-01-09', '2020-03-12', NULL),
(1392, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Jeudi', 'J03 GR-11', '2020-01-09', '2020-03-12', NULL),
(1393, 1, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Vendredi', 'J03 GR-12', '2020-01-10', '2020-03-13', NULL),
(1394, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'J03 GR-13', '2020-01-11', '2020-03-14', NULL),
(1395, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'J03 GR-14', '2020-01-11', '2020-03-14', NULL),
(1396, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'J03 GR-15', '2020-01-11', '2020-03-14', NULL),
(1397, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Samedi', 'J03 GR-16', '2020-01-11', '2020-03-14', NULL),
(1398, 1, 2, '14:45:00', '15:10:00', 'PIS-AB', 'Samedi', 'J03 GR-17', '2020-01-11', '2020-03-14', NULL),
(1399, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'J03 GR-51', '2020-01-12', '2020-03-22', NULL),
(1400, 1, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'J03 GR-52', '2020-01-12', '2020-03-22', NULL),
(1401, 1, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'J03 GR-53', '2020-01-12', '2020-03-22', NULL),
(1402, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Mardi', 'J03 GR-54', '2020-01-07', '2020-03-10', NULL),
(1403, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'J03 GR-55', '2020-01-10', '2020-03-13', NULL),
(1404, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'J03 GR-56', '2020-01-11', '2020-03-21', NULL),
(1405, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'J03 GR-57', '2020-01-11', '2020-03-21', NULL),
(1406, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'J03 GR-58', '2020-01-11', '2020-03-21', NULL),
(1407, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'J03 GR-59', '2020-01-11', '2020-03-21', NULL),
(1408, 1, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'J03 GR-60', '2020-01-11', '2020-03-21', NULL),
(1409, 1, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'J04 GR-01', '2020-01-12', '2020-03-15', NULL),
(1410, 1, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'J04 GR-02', '2020-01-12', '2020-03-15', NULL),
(1411, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'J04 GR-03', '2020-01-12', '2020-03-15', NULL),
(1412, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'J04 GR-04', '2020-01-12', '2020-03-15', NULL),
(1413, 1, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'J04 GR-05', '2020-01-12', '2020-03-15', NULL),
(1414, 1, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Lundi', 'J04 GR-06', '2020-01-06', '2020-03-09', NULL),
(1415, 1, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Mercredi', 'J04 GR-07', '2020-01-08', '2020-03-11', NULL),
(1416, 1, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Jeudi', 'J04 GR-08', '2020-01-09', '2020-03-12', NULL),
(1417, 1, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'J04 GR-09', '2020-01-11', '2020-03-14', NULL),
(1418, 1, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'J04 GR-10', '2020-01-11', '2020-03-14', NULL),
(1419, 1, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'J04 GR-11', '2020-01-11', '2020-03-14', NULL),
(1420, 1, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Samedi', 'J04 GR-12', '2020-01-11', '2020-03-14', NULL),
(1421, 1, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'J04 GR-51', '2020-01-12', '2020-03-22', NULL),
(1422, 1, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'J04 GR-52', '2020-01-12', '2020-03-22', NULL),
(1423, 1, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'J04 GR-53', '2020-01-12', '2020-03-22', NULL),
(1424, 1, 2, '18:30:00', '18:55:00', 'PIS-LT', 'Lundi', 'J04 GR-54', '2020-01-06', '2020-03-09', NULL),
(1425, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Lundi', 'J04 GR-55', '2020-01-06', '2020-03-09', NULL),
(1426, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Mardi', 'J04 GR-56', '2020-01-07', '2020-03-10', NULL),
(1427, 1, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'J04 GR-57', '2020-01-10', '2020-03-13', NULL),
(1428, 1, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'J04 GR-58', '2020-01-11', '2020-03-21', NULL),
(1429, 1, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'J04 GR-59', '2020-01-11', '2020-03-21', NULL),
(1430, 1, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'J04 GR-60', '2020-01-11', '2020-03-21', NULL),
(1431, 1, 2, '11:00:00', '11:40:00', 'PIS-AB', 'Dimanche', 'J05 GR-01', '2020-01-12', '2020-03-15', NULL),
(1432, 1, 2, '19:00:00', '19:40:00', 'PIS-AB', 'Mardi', 'J05 GR-02', '2020-01-07', '2020-03-10', NULL),
(1433, 1, 2, '19:00:00', '19:40:00', 'PIS-AB', 'Jeudi', 'J05 GR-03', '2020-01-09', '2020-03-12', NULL),
(1434, 1, 2, '18:00:00', '18:40:00', 'PIS-AB', 'Vendredi', 'J05 GR-04', '2020-01-10', '2020-03-13', NULL),
(1435, 1, 2, '08:35:00', '09:15:00', 'PIS-AB', 'Samedi', 'J05 GR-05', '2020-01-11', '2020-03-14', NULL),
(1436, 1, 2, '11:45:00', '12:25:00', 'PIS-AB', 'Samedi', 'J05 GR-06', '2020-01-11', '2020-03-14', NULL),
(1437, 1, 2, '13:15:00', '13:55:00', 'PIS-AB', 'Samedi', 'J05 GR-07', '2020-01-11', '2020-03-14', NULL),
(1438, 1, 2, '11:50:00', '12:30:00', 'PIS-LT', 'Dimanche', 'J05 GR-51', '2020-01-12', '2020-03-22', NULL),
(1439, 1, 2, '12:35:00', '13:15:00', 'PIS-LT', 'Dimanche', 'J05 GR-52', '2020-01-12', '2020-03-22', NULL),
(1440, 1, 2, '19:30:00', '20:10:00', 'PIS-LT', 'Lundi', 'J05 GR-53', '2020-01-06', '2020-03-09', NULL),
(1441, 1, 2, '19:00:00', '19:40:00', 'PIS-LT', 'Mardi', 'J05 GR-54', '2020-01-07', '2020-03-10', NULL),
(1442, 1, 2, '19:30:00', '20:10:00', 'PIS-LT', 'Vendredi', 'J05 GR-55', '2020-01-10', '2020-03-13', NULL),
(1443, 1, 2, '09:30:00', '10:10:00', 'PIS-LT', 'Samedi', 'J05 GR-56', '2020-01-11', '2020-03-21', NULL),
(1444, 1, 2, '10:30:00', '11:10:00', 'PIS-LT', 'Samedi', 'J05 GR-57', '2020-01-11', '2020-03-21', NULL),
(1445, 1, 2, '11:45:00', '12:25:00', 'PIS-AB', 'Dimanche', 'J06 GR-01', '2020-01-12', '2020-03-15', NULL),
(1446, 1, 2, '19:00:00', '19:40:00', 'PIS-AB', 'Mardi', 'J06 GR-02', '2020-01-07', '2020-03-10', NULL),
(1447, 1, 2, '19:00:00', '19:40:00', 'PIS-AB', 'Jeudi', 'J06 GR-03', '2020-01-09', '2020-03-12', NULL),
(1448, 1, 2, '18:45:00', '19:25:00', 'PIS-AB', 'Vendredi', 'J06 GR-04', '2020-01-10', '2020-03-13', NULL),
(1449, 1, 2, '11:00:00', '11:40:00', 'PIS-AB', 'Samedi', 'J06 GR-05', '2020-01-11', '2020-03-14', NULL),
(1450, 1, 2, '14:00:00', '14:40:00', 'PIS-AB', 'Samedi', 'J06 GR-06', '2020-01-11', '2020-03-14', NULL),
(1451, 1, 2, '11:05:00', '11:45:00', 'PIS-LT', 'Dimanche', 'J06 GR-51', '2020-01-12', '2020-03-22', NULL),
(1452, 1, 2, '19:45:00', '20:25:00', 'PIS-LT', 'Mardi', 'J06 GR-52', '2020-01-07', '2020-03-10', NULL),
(1453, 1, 2, '20:15:00', '20:55:00', 'PIS-LT', 'Vendredi', 'J06 GR-53', '2020-01-10', '2020-03-13', NULL),
(1454, 1, 2, '10:15:00', '10:55:00', 'PIS-LT', 'Samedi', 'J06 GR-54', '2020-01-11', '2020-03-21', NULL),
(1455, 1, 2, '11:15:00', '11:55:00', 'PIS-LT', 'Samedi', 'J06 GR-55', '2020-01-11', '2020-03-21', NULL),
(1456, 1, 2, '08:30:00', '09:25:00', 'PIS-AB', 'Dimanche', 'J07 GR-01', '2020-01-12', '2020-03-15', NULL),
(1457, 1, 2, '13:15:00', '14:10:00', 'PIS-AB', 'Samedi', 'J07 GR-02', '2020-01-11', '2020-03-14', NULL),
(1458, 1, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'J07 GR-51', '2020-01-12', '2020-03-22', NULL),
(1459, 1, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Mardi', 'J07 GR-52', '2020-01-07', '2020-03-10', NULL),
(1460, 1, 2, '20:00:00', '20:55:00', 'PIS-LT', 'Vendredi', 'J07 GR-53', '2020-01-10', '2020-03-13', NULL),
(1461, 1, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'J07 GR-54', '2020-01-11', '2020-03-21', NULL),
(1462, 1, 2, '09:30:00', '10:25:00', 'PIS-AB', 'Dimanche', 'J08 GR-01', '2020-01-12', '2020-03-15', NULL),
(1463, 1, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Jeudi', 'J08 GR-02', '2020-01-09', '2020-03-12', NULL),
(1464, 1, 2, '18:30:00', '19:25:00', 'PIS-AB', 'Vendredi', 'J08 GR-03', '2020-01-10', '2020-03-13', NULL),
(1465, 1, 2, '13:15:00', '14:10:00', 'PIS-AB', 'Samedi', 'J08 GR-04', '2020-01-11', '2020-03-14', NULL),
(1466, 1, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'J08 GR-51', '2020-01-12', '2020-03-22', NULL),
(1467, 1, 2, '20:00:00', '20:55:00', 'PIS-LT', 'Vendredi', 'J08 GR-52', '2020-01-10', '2020-03-13', NULL),
(1468, 1, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'J08 GR-53', '2020-01-11', '2020-03-21', NULL),
(1469, 1, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Mardi', 'J09 GR-01', '2020-01-07', '2020-03-10', NULL),
(1470, 1, 2, '14:15:00', '15:10:00', 'PIS-AB', 'Samedi', 'J09 GR-02', '2020-01-11', '2020-03-14', NULL),
(1471, 1, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'J09 GR-51', '2020-01-12', '2020-03-22', NULL),
(1472, 1, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'J09 GR-52', '2020-01-11', '2020-03-21', NULL),
(1473, 1, 2, '18:30:00', '19:25:00', 'PIS-AB', 'Vendredi', 'J10 GR-01', '2020-01-10', '2020-03-13', NULL),
(1474, 1, 2, '14:15:00', '15:10:00', 'PIS-AB', 'Samedi', 'J10 GR-02', '2020-01-11', '2020-03-14', NULL),
(1475, 1, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'J10 GR-51', '2020-01-12', '2020-03-22', NULL),
(1476, 1, 2, '20:00:00', '20:55:00', 'PIS-LT', 'Vendredi', 'J10 GR-52', '2020-01-10', '2020-03-13', NULL),
(1477, 1, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'J10 GR-53', '2020-01-11', '2020-03-21', NULL),
(1478, 1, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Mardi', 'ADO-1 GR-01', '2020-01-07', '2020-03-10', NULL),
(1479, 1, 2, '12:00:00', '12:55:00', 'PIS-AB', 'Samedi', 'ADO-1 GR-02', '2020-01-11', '2020-03-14', NULL),
(1480, 1, 2, '20:00:00', '20:55:00', 'PIS-LT', 'Vendredi', 'ADO-2 GR-51', '2020-01-10', '2020-03-13', NULL),
(1481, 1, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'ADO-3 GR-51', '2020-01-12', '2020-03-22', NULL),
(1482, 1, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'ADO-3 GR-52', '2020-01-11', '2020-03-21', NULL),
(1483, 1, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Mardi', 'PEUR GR-01', '2020-01-07', '2020-03-10', NULL),
(1484, 1, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Jeudi', 'PEUR GR-02', '2020-01-09', '2020-03-12', NULL),
(1485, 1, 2, '18:30:00', '19:25:00', 'PIS-LT', 'Lundi', 'PEUR GR-51', '2020-01-06', '2020-03-09', NULL),
(1486, 1, 2, '19:30:00', '20:25:00', 'PIS-LT', 'Lundi', 'PEUR GR-52', '2020-01-06', '2020-03-09', NULL),
(1487, 1, 2, '21:30:00', '22:25:00', 'PIS-LT', 'Mercredi', 'PEUR GR-53', '2020-01-08', '2020-03-11', NULL),
(1488, 1, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Lundi', 'AQUA-AD1 GR-51', '2020-01-06', '2020-03-09', NULL),
(1489, 1, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Lundi', 'AQUA-AD1 GR-52', '2020-01-06', '2020-03-09', NULL),
(1490, 1, 7, '20:30:00', '21:25:00', 'PIS-LT', 'Mercredi', 'AQUA-AD1 GR-53', '2020-01-08', '2020-03-11', NULL),
(1491, 1, 7, '21:30:00', '22:25:00', 'PIS-LT', 'Mercredi', 'AQUA-AD1 GR-54', '2020-01-08', '2020-03-11', NULL),
(1492, 1, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Jeudi', 'AQUA-AD1 GR-55', '2020-01-09', '2020-03-12', NULL),
(1493, 1, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Jeudi', 'AQUA-AD1 GR-56', '2020-01-09', '2020-03-12', NULL),
(1494, 1, 7, '18:30:00', '19:25:00', 'PIS-LT', 'Lundi', 'AQUA-AD2 GR-51', '2020-01-06', '2020-03-09', NULL),
(1495, 1, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Lundi', 'AQUA-AD2 GR-52', '2020-01-06', '2020-03-09', NULL),
(1496, 1, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Mardi', 'AQUA-AD2 GR-53', '2020-01-07', '2020-03-10', NULL),
(1497, 1, 7, '20:30:00', '21:25:00', 'PIS-LT', 'Mercredi', 'AQUA-AD2 GR-54', '2020-01-08', '2020-03-11', NULL),
(1498, 1, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Jeudi', 'AQUA-AD2 GR-55', '2020-01-09', '2020-03-12', NULL),
(1499, 1, 7, '19:00:00', '19:55:00', 'PIS-AB', 'Lundi', 'AQUA-AD3 GR-01', '2020-01-06', '2020-03-09', NULL),
(1500, 1, 7, '20:30:00', '21:25:00', 'LT', 'Mercredi', 'AQUA-AD3 GR-51', '2020-01-08', '2020-03-11', NULL),
(1501, 1, 7, '21:30:00', '22:25:00', 'LT', 'Mercredi', 'AQUA-AD3 GR-52', '2020-01-08', '2020-03-11', NULL),
(1502, 1, 7, '16:10:00', '16:55:00', 'PIS-LT', 'Mardi', 'AQUA-FO45 GR-51', '2020-01-07', '2020-03-17', NULL),
(1503, 1, 7, '16:10:00', '16:55:00', 'PIS-LT', 'Jeudi', 'AQUA-FO45 GR-52', '2020-01-09', '2020-03-19', NULL),
(1504, 1, 7, '18:00:00', '18:55:00', 'PIS-AB', 'Lundi', 'AQUA-FO55 GR-01', '2020-01-06', '2020-03-16', NULL),
(1505, 1, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Mardi', 'AQUA-FO55 GR-02', '2020-01-07', '2020-03-17', NULL),
(1506, 1, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Mercredi', 'AQUA-FO55 GR-03', '2020-01-08', '2020-03-18', NULL),
(1507, 1, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Jeudi', 'AQUA-FO55 GR-04', '2020-01-09', '2020-03-19', NULL),
(1508, 1, 7, '18:00:00', '18:55:00', 'PIS-AB', 'Lundi', 'AQUA-JO55 GR-01', '2020-01-06', '2020-03-16', NULL),
(1509, 1, 7, '19:00:00', '19:55:00', 'PIS-AB', 'Lundi', 'AQUA-JO55 GR-02', '2020-01-06', '2020-03-16', NULL),
(1510, 1, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Mardi ', 'AQUA-JO55 GR-03', '2020-01-07', '2020-03-17', NULL),
(1511, 1, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Jeudi', 'AQUA-JO55 GR-04', '2020-01-09', '2020-03-19', NULL),
(1512, 1, 7, '19:00:00', '19:55:00', 'PIS-AB', 'Lundi', 'PRE-POST GR-01', '2020-01-06', '2020-03-16', NULL),
(1513, 1, 3, '13:15:00', '14:15:00', 'PIS-AB', 'Samedi', 'EB GR-01', '2020-01-11', '2020-03-14', NULL),
(1514, 1, 3, '14:30:00', '15:30:00', 'AB-SALLE', 'Samedi', 'MB GR-01', '2020-01-11', '2020-03-14', NULL),
(1515, 1, 3, '15:30:00', '17:30:00', 'PIS-AB', 'Samedi', 'MB GR-01', '2020-01-11', '2020-03-14', NULL),
(1516, 1, 3, '15:30:00', '16:30:00', 'AB-SALLE', 'Dimanche', 'CB GR-01', '2020-01-12', '2020-03-15', NULL),
(1517, 1, 3, '16:30:00', '18:30:00', 'PIS-AB', 'Dimanche', 'CB GR-01', '2020-01-12', '2020-03-15', NULL),
(1518, 1, 4, '08:00:00', '17:00:00', 'GHB', 'Samedi', 'PSG GR-51', '2020-01-04', '2020-01-05', NULL),
(1519, 1, 4, '08:00:00', '17:00:00', 'GHB', 'Dimanche', 'PSG GR-51', '2020-01-04', '2020-01-05', NULL),
(1520, 1, 5, '16:00:00', '19:00:00', 'PIS-AB', 'Samedi', 'SN GR-01', '2020-01-11', '2020-03-14', NULL),
(1521, 1, 5, '19:00:00', '21:00:00', 'AB-SALLE', 'Samedi', 'SN GR-01', '2020-01-11', '2020-03-14', NULL),
(1522, 1, 6, '13:00:00', '15:30:00', 'AB-SALLE', 'Samedi', 'MSA GR-01', '2020-01-11', '2020-03-14', NULL),
(1523, 1, 6, '15:00:00', '18:00:00', 'PIS-AB', 'Samedi', 'MSA GR-01', '2020-01-11', '2020-03-14', NULL),
(1524, 1, 6, '11:00:00', '12:00:00', 'PIS-LT', 'Samedi', 'ALERTE GR-SN', '2020-01-11', '2020-03-14', NULL),
(1525, 1, 6, '11:00:00', '12:00:00', 'LT', 'Samedi', 'MCPS GR-PS', '2020-01-11', '2020-03-14', NULL),
(1526, 1, 6, '11:00:00', '12:00:00', 'LT', 'Samedi', 'MCS GR-MB', '2020-01-11', '2020-03-14', NULL),
(1527, 1, 6, '11:00:00', '12:00:00', 'LT', 'Samedi', 'MASQUE GR-PS', '2020-01-11', '2020-03-14', NULL),
(1528, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-01', '2020-01-12', '2020-03-15', NULL),
(1529, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-02', '2020-01-12', '2020-03-15', NULL),
(1530, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-03', '2020-01-12', '2020-03-15', NULL),
(1531, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-04', '2020-01-12', '2020-03-15', NULL),
(1532, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-05', '2020-01-12', '2020-03-15', NULL),
(1533, 1, 2, '12:30:00', '13:00:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-06', '2020-01-12', '2020-03-15', NULL),
(1534, 1, 2, '13:00:00', '13:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-07', '2020-01-12', '2020-03-15', NULL),
(1535, 1, 2, '13:00:00', '13:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-08', '2020-01-12', '2020-03-15', NULL),
(1536, 1, 2, '20:00:00', '20:30:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-09', '2020-01-08', '2020-03-11', NULL),
(1537, 1, 2, '20:00:00', '20:30:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-10', '2020-01-08', '2020-03-11', NULL),
(1538, 1, 2, '20:00:00', '20:30:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-11', '2020-01-08', '2020-03-11', NULL),
(1539, 1, 2, '20:30:00', '21:00:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-12', '2020-01-08', '2020-03-11', NULL),
(1540, 1, 2, '20:30:00', '21:00:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-13', '2020-01-08', '2020-03-11', NULL),
(1541, 1, 2, '20:30:00', '21:00:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-14', '2020-01-08', '2020-03-11', NULL),
(1542, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-15', '2020-01-11', '2020-03-14', NULL),
(1543, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-16', '2020-01-11', '2020-03-14', NULL),
(1544, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-17', '2020-01-11', '2020-03-14', NULL),
(1545, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-18', '2020-01-11', '2020-03-14', NULL),
(1546, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-19', '2020-01-11', '2020-03-14', NULL),
(1547, 1, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-20', '2020-01-11', '2020-03-14', NULL),
(1548, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-51', '2020-01-12', '2020-03-22', NULL),
(1549, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-52', '2020-01-12', '2020-03-22', NULL),
(1550, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-53', '2020-01-12', '2020-03-22', NULL),
(1551, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-54', '2020-01-12', '2020-03-22', NULL),
(1552, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-55', '2020-01-12', '2020-03-22', NULL),
(1553, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-56', '2020-01-12', '2020-03-22', NULL),
(1554, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-57', '2020-01-11', '2020-03-21', NULL),
(1555, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-58', '2020-01-11', '2020-03-21', NULL),
(1556, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-59', '2020-01-11', '2020-03-21', NULL),
(1557, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-60', '2020-01-11', '2020-03-21', NULL),
(1558, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-61', '2020-01-11', '2020-03-21', NULL),
(1559, 1, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-62', '2020-01-11', '2020-03-21', NULL),
(1560, 1, 2, '11:30:00', '12:00:00', 'PIS-LT', 'Samedi', 'PRIVE GR-63', '2020-01-11', '2020-03-21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `passphrase` varchar(60) NOT NULL,
  `user_fname` varchar(35) NOT NULL,
  `user_lname` varchar(35) NOT NULL,
  `user_address` varchar(70) DEFAULT NULL,
  `user_dob` date DEFAULT NULL,
  `role_id` int(7) NOT NULL DEFAULT 1,
  `user_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `passphrase`, `user_fname`, `user_lname`, `user_address`, `user_dob`, `role_id`, `user_start_date`) VALUES
(722888, 'C5ER0Iz4', 'Mathieu', 'Dorval', NULL, NULL, 1, NULL),
(750045, 'OBdY7tLl', 'Édouard', 'Ducharme', NULL, NULL, 1, NULL),
(758300, 'I4GZ62O4', 'Nathan', 'Ng', NULL, NULL, 1, NULL),
(800001, 'duOz1j4h', 'Rasha', 'Alhaeik', NULL, NULL, 1, NULL),
(800003, '4gXpm3pw', 'Laetitia', 'Banh', NULL, NULL, 1, NULL),
(800004, 'dfvSvIvn', 'Malika', 'Bélanger-Oudrhiri', NULL, NULL, 1, NULL),
(800009, 'knxkGlCy', 'Annie-France', 'Demers', NULL, NULL, 1, NULL),
(800010, 'AkMEWnnE', 'Guillaume', 'Demers', NULL, NULL, 1, NULL),
(800014, 'O54pCOJz', 'Marie-Alexandre', 'Forest', NULL, NULL, 1, NULL),
(800015, 'B3zbz74S', 'Jean-Michel', 'Fortier', NULL, NULL, 1, NULL),
(800017, 'IoSLBGCj', 'Vincent', 'Henry', NULL, NULL, 1, NULL),
(800018, '4ryhWYxw', 'Marc-Antoine', 'Lajoie', NULL, NULL, 1, NULL),
(800021, '9x6IeyLG', 'Amélie', 'Tiphane', NULL, NULL, 1, NULL),
(800022, 'DfMWBJip', 'Josianne', 'Larrivée', NULL, NULL, 1, NULL),
(800023, 'L6sIMF3N', 'Béatrice', 'Laurin', NULL, NULL, 1, NULL),
(800027, 'HDYNDtIP', 'Jessika', 'Métivier-Bédard', NULL, NULL, 1, NULL),
(800029, 'Qd8BiICK', 'Ariane', 'Moquin Joubert', NULL, NULL, 1, NULL),
(800032, 'ZSNs9CNG', 'Félix-Antoine', 'Pelletier', NULL, NULL, 1, NULL),
(800033, 'IdrfRAet', 'Amélie', 'Poiré', NULL, NULL, 1, NULL),
(800036, 'zZlWsj1i', 'Mélissa', 'Roch-Lanouette', NULL, NULL, 1, NULL),
(800037, 'LB3X6l0U', 'Galit', 'Sandaev', NULL, NULL, 1, NULL),
(800038, 'K99TxVEW', 'Aaruthra', 'Thirumal', NULL, NULL, 1, NULL),
(800039, 'FIsqKOQp', 'Maxime', 'Trottier', NULL, NULL, 1, NULL),
(800040, 'XGAz2E6X', 'Caroline', 'Turgeon', NULL, NULL, 1, NULL),
(800041, 'r5Yy8iVx', 'Aude', 'Vallerand', NULL, NULL, 1, NULL),
(800042, 'ptDXb6aw', 'Margaux', 'Willame', NULL, NULL, 1, NULL),
(800045, 'lKcLyHfr', 'Jonathan', 'Miron', NULL, NULL, 1, NULL),
(800048, 'KwM2pxJi', 'Jack', 'Allen', NULL, NULL, 1, NULL),
(800049, 'xbGj68Dd', 'Maxime', 'Berger', NULL, NULL, 1, NULL),
(800054, 'HUFFCerL', 'David', 'Do', NULL, NULL, 1, NULL),
(800057, '2L5Vd7zB', 'Alexandre', 'Gagné', NULL, NULL, 1, NULL),
(800059, 'yap6N0Qo', 'Hélène', 'Hoffman-Chrétien', NULL, NULL, 1, NULL),
(800062, 'fbGcA0ss', 'Tiffany', 'Nguyen', NULL, NULL, 1, NULL),
(800073, 'eEKyI4bo', 'Éléanor', 'Chabot', NULL, NULL, 1, NULL),
(800077, 'bqr5DBSl', 'Salma', 'Ayari', NULL, NULL, 1, NULL),
(800078, 'exvKXfg1', 'Érik', 'Farkas', NULL, NULL, 1, NULL),
(800079, 'Her255kN', 'Katerine', 'Landry', NULL, NULL, 1, NULL),
(800081, 'ZfcnYu8Z', 'Charles-Olivier', 'Moreau', NULL, NULL, 1, NULL),
(800083, 'sHyoaPkQ', 'Isabelle', 'Lefebvre', NULL, NULL, 1, NULL),
(800086, 'Xqzpvto3', 'Salomë', 'Plourde', NULL, NULL, 1, NULL),
(800088, 'Duw475yT', 'Florence', 'Peate', NULL, NULL, 1, NULL),
(800089, 'GAyrMv1L', 'Roxanne', 'Landry', NULL, NULL, 1, NULL),
(800090, 'eoqWHxYG', 'Mario', 'Ivanov', NULL, NULL, 1, NULL),
(800091, 'sP1kMlKq', 'Claudia', 'Burton', NULL, NULL, 1, NULL),
(800092, 'NSh3KH6z', 'Peinda', 'Diop', NULL, NULL, 1, NULL),
(800093, 'SxOdaFXH', 'Marc-André', 'Gosselin', NULL, NULL, 1, NULL),
(800095, 'YDT0mQvD', 'Célia', 'Kingsbury', NULL, NULL, 1, NULL),
(800097, 'xWJ9yCbA', 'Ana Maria', 'Cotocea', NULL, NULL, 1, NULL),
(800099, '38Lcyr5E', 'William', 'Ducharme', NULL, NULL, 1, NULL),
(800100, '54hRIj71', 'Pascale', 'Fillion', NULL, NULL, 1, NULL),
(800101, 'DE5JyNyv', 'Ana Elise', 'Jivan', NULL, NULL, 1, NULL),
(800104, '1dXB8u2e', 'Louis', 'Lafrance-Savard', NULL, NULL, 1, NULL),
(800105, 'sBYUSwsc', 'Mélanie', 'Lefebvre', NULL, NULL, 1, NULL),
(800107, 'Zj2QGy1E', 'Paula Sofia', 'Loaiza', NULL, NULL, 1, NULL),
(800108, 'CeXCDjZ0', 'Louis-Charles', 'Marquis', NULL, NULL, 1, NULL),
(800109, 'wnRDLanJ', 'Chaimaa', 'Ouizzane', NULL, NULL, 1, NULL),
(800111, 'odhVblue', 'Vincent', 'Provost', NULL, NULL, 1, NULL),
(800113, 'buHUHQG8', 'Alice', 'Stoica', NULL, NULL, 1, NULL),
(800114, 'RI6BYag7', 'Laurence', 'Thériault-Lapointe', NULL, NULL, 1, NULL),
(800116, 'FXI22sT5', 'Sandrine', 'Trinh', NULL, NULL, 1, NULL),
(800117, 'tnLWgt2j', 'David', 'Van Oordt', NULL, NULL, 1, NULL),
(800118, '9qdDDNDH', 'Ivy', 'Zou', NULL, NULL, 1, NULL),
(800120, 'wL2rFMcV', 'Rose', 'Zhang', NULL, NULL, 1, NULL),
(800122, 'IA1JVTPN', 'Audrey', 'Ng Youn Chen', NULL, NULL, 1, NULL),
(800124, 'CGZMhL7e', 'Mia', 'Gagné-Vincent', NULL, NULL, 1, NULL),
(800126, 'lJ9C2Y6w', 'Karel', 'Grégoire', NULL, NULL, 1, NULL),
(800127, 'RHHK9vAw', 'Gabrielle', 'Lapointe', NULL, NULL, 1, NULL),
(800128, 'P6Gq2Cmo', 'Ariane', 'Lalancette', NULL, NULL, 1, NULL),
(800130, 'ZSn8k6Fs', 'William', 'Belbin', NULL, NULL, 1, NULL),
(800131, 'Bcgj04Nq', 'Valentin', 'Cioana', NULL, NULL, 1, NULL),
(800132, 'ggNeojMQ', 'Jean-Christophe', 'Bélair', NULL, NULL, 1, NULL),
(800133, 'C9m0IVl3', 'Alexandra', 'Bélec-Sergerie', NULL, NULL, 1, NULL),
(800134, 'bTvdLR3K', 'Anaïs', 'Berlinger-Lavoie', NULL, NULL, 1, NULL),
(800135, '81IJWTI6', 'Jannick', 'Bonenfant', NULL, NULL, 1, NULL),
(800136, '0b2jeZFQ', 'Najee', 'Cadet', NULL, NULL, 1, NULL),
(800137, 'YzVnq7kQ', 'Marie-Rose', 'Chabot', NULL, NULL, 1, NULL),
(800139, 'CBcu29LG', 'Patrick', 'Cimpean', NULL, NULL, 1, NULL),
(800142, 'wWTL54GW', 'Victoria', 'Derome', NULL, NULL, 1, NULL),
(800145, 'm7lDW9jf', 'Frédérique', 'Lafontaine', NULL, NULL, 1, NULL),
(800148, 'X43ByRok', 'Horia Cristian', 'Sandu', NULL, NULL, 1, NULL),
(800149, 'FjekHuc8', 'Nicolas', 'Vu', NULL, NULL, 1, NULL),
(800151, 'hpxr57r3', 'Rayan', 'Achouri', NULL, NULL, 1, NULL),
(800152, 'tPqqyWes', 'Alexis', 'Côté', NULL, NULL, 1, NULL),
(800153, 'nAiWszkv', 'Marc-Antoine', 'Tremblay', NULL, NULL, 1, NULL),
(800154, 'WfIrTVo8', 'Julian', 'Manotas', NULL, NULL, 1, NULL),
(800155, 'qBkwsCa9', 'Antoine', 'Boulanger', NULL, NULL, 1, NULL),
(800156, '4p1zMIzq', 'David', 'Cioana', NULL, NULL, 1, NULL),
(800157, 'gi1L92Uo', 'Nicolas', 'Comsulea', NULL, NULL, 1, NULL),
(800158, 'Bd4YufXm', 'Clara', 'Dragon', NULL, NULL, 1, NULL),
(800160, 'JknFzI9R', 'Nikol', 'Georgieva', NULL, NULL, 1, NULL),
(800161, 'Xhmh8s5o', 'Éric Stefan', 'Gojan', NULL, NULL, 1, NULL),
(800164, 'lHxfIpyr', 'Hubert', 'Provost', NULL, NULL, 1, NULL),
(800165, 'zAFdI4na', 'Chloé', 'Prugne', NULL, NULL, 1, NULL),
(800166, 'dBHK7nNa', 'Nina', 'Tan', NULL, NULL, 1, NULL),
(800167, 'XudhkZVW', 'Alison', 'Vo', NULL, NULL, 1, NULL),
(800168, 'oNtsIbjp', 'Leila', 'Zaouali', NULL, NULL, 1, NULL),
(800169, 'r5agb0m6', 'Sabrina', 'Chan Fee', NULL, NULL, 1, NULL),
(800170, '5CwgLDhQ', 'David', 'Larrivée', NULL, NULL, 1, NULL),
(800171, 'ye1Iw2aN', 'Yan', 'Burton', NULL, NULL, 1, NULL),
(900001, 'ukJqq94J', 'Fiana', 'Chang', NULL, NULL, 1, NULL),
(900002, 'Izej4O4k', 'Jean-Félix', 'Desbiens', NULL, NULL, 1, NULL),
(999999, '$2y$10$.7f.clAEtOlAzWyL14BWq.x5HaPzAJ3M0HIMq.6V4NkhvGetUMJly', 'Secteur', 'Aquatique', NULL, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_semester_specs`
--

CREATE TABLE `user_semester_specs` (
  `user_id` int(7) NOT NULL,
  `min_hours` int(2) NOT NULL,
  `max_hours` int(2) NOT NULL,
  `max_weekday` int(11) NOT NULL,
  `max_weekend` int(11) NOT NULL,
  `comments` varchar(300) DEFAULT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `FK_article_user` (`user_id`);

--
-- Indexes for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD PRIMARY KEY (`shift_id`,`user_id`),
  ADD KEY `FK_avail_user` (`user_id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `FK_grade_quiz` (`quiz_id`),
  ADD KEY `FK_grade_user` (`user_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_name`);

--
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`qualification_id`);

--
-- Indexes for table `qualified_user`
--
ALTER TABLE `qualified_user`
  ADD PRIMARY KEY (`user_id`,`qualification_id`),
  ADD KEY `FK_qualified_user_qualification` (`qualification_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`question_id`,`user_id`),
  ADD KEY `FK_response_user` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_id` (`role_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`sch_id`);

--
-- Indexes for table `seniority`
--
ALTER TABLE `seniority`
  ADD PRIMARY KEY (`seniority_id`),
  ADD KEY `FK_seniority_user` (`user_id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`),
  ADD KEY `FK_shift_user` (`assigned_user`),
  ADD KEY `FK_shift_qualification` (`required_qual`),
  ADD KEY `FK_shift_schedule` (`schedule_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_user_id_uindex` (`user_id`),
  ADD KEY `FK_user_role` (`role_id`);

--
-- Indexes for table `user_semester_specs`
--
ALTER TABLE `user_semester_specs`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
  MODIFY `qualification_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `sch_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seniority`
--
ALTER TABLE `seniority`
  MODIFY `seniority_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1562;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_article_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD CONSTRAINT `FK_avail_shift` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`),
  ADD CONSTRAINT `FK_avail_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `FK_grade_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`quiz_id`),
  ADD CONSTRAINT `FK_grade_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `qualified_user`
--
ALTER TABLE `qualified_user`
  ADD CONSTRAINT `FK_qualfied_user_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FK_qualified_user_qualification` FOREIGN KEY (`qualification_id`) REFERENCES `qualification` (`qualification_id`);

--
-- Constraints for table `response`
--
ALTER TABLE `response`
  ADD CONSTRAINT `FK_response_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  ADD CONSTRAINT `FK_response_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `seniority`
--
ALTER TABLE `seniority`
  ADD CONSTRAINT `FK_seniority_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `FK_shift_qualification` FOREIGN KEY (`required_qual`) REFERENCES `qualification` (`qualification_id`),
  ADD CONSTRAINT `FK_shift_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`sch_id`),
  ADD CONSTRAINT `FK_shift_user` FOREIGN KEY (`assigned_user`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `user_semester_specs`
--
ALTER TABLE `user_semester_specs`
  ADD CONSTRAINT `FK_specs_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
