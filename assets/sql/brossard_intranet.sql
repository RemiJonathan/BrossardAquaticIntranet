-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2020 at 08:24 AM
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
(800027, 7, '2019-09-17', '1970-01-01', '', NULL),
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
(800155, 6, '0000-00-00', '0000-00-00', NULL, NULL),
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
  `sch_day` varchar(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sch_start_time` datetime NOT NULL,
  `sch_end_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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
(1, 800017, 'surveillance', 3033.92, '2015-03-02', NULL),
(2, 800029, 'surveillance', 2599.42, '2015-03-02', NULL),
(3, 800039, 'surveillance', 2466.09, '2015-03-02', NULL),
(4, 800038, 'surveillance', 2248.09, '2015-03-02', NULL),
(5, 800001, 'surveillance', 1989.34, '2015-03-02', NULL),
(6, 800057, 'surveillance', 1892.66, '2015-05-27', NULL),
(7, 800027, 'surveillance', 1846.08, '2015-03-02', NULL),
(8, 800014, 'surveillance', 1799.08, '2015-03-02', NULL),
(9, 800004, 'surveillance', 1680.50, '2015-03-28', NULL),
(10, 800079, 'surveillance', 1511.75, '2016-05-28', NULL),
(11, 800032, 'surveillance', 1427.25, '2015-03-28', NULL),
(12, 800009, 'surveillance', 1315.25, '2015-03-02', NULL),
(13, 800048, 'surveillance', 1264.76, '2015-05-27', NULL),
(14, 800003, 'surveillance', 1264.17, '2015-03-28', NULL),
(15, 800018, 'surveillance', 1245.42, '2015-03-28', NULL),
(16, 800062, 'surveillance', 1216.42, '2015-05-27', NULL),
(17, 800010, 'surveillance', 1171.33, '2015-03-14', NULL),
(18, 800023, 'surveillance', 1098.92, '2015-03-28', NULL),
(19, 800015, 'surveillance', 1069.38, '2015-03-28', NULL),
(20, 800090, 'surveillance', 1065.22, '2017-01-06', NULL),
(21, 800059, 'surveillance', 1059.91, '2015-05-27', NULL),
(22, 800081, 'surveillance', 1038.25, '2016-05-28', NULL),
(23, 800022, 'surveillance', 930.01, '2015-03-28', NULL),
(24, 800040, 'surveillance', 904.17, '2015-03-14', NULL),
(25, 800116, 'surveillance', 899.00, '2017-05-27', NULL),
(26, 800100, 'surveillance', 850.83, '2017-05-27', NULL),
(27, 800088, 'surveillance', 846.75, '2017-01-06', NULL),
(28, 800108, 'surveillance', 826.58, '2017-05-27', NULL),
(29, 800021, 'surveillance', 782.09, '2015-03-28', NULL),
(30, 800089, 'surveillance', 733.50, '2017-01-06', NULL),
(31, 800111, 'surveillance', 699.75, '2017-05-27', NULL),
(32, 800104, 'surveillance', 685.67, '2017-05-27', NULL),
(33, 800099, 'surveillance', 640.00, '2017-05-27', NULL),
(34, 800073, 'surveillance', 617.17, '2015-09-14', NULL),
(35, 800126, 'surveillance', 605.00, '2017-09-16', NULL),
(36, 800127, 'surveillance', 590.13, '2017-09-16', NULL),
(37, 800083, 'surveillance', 570.08, '2016-07-05', NULL),
(38, 800093, 'surveillance', 553.83, '2017-02-27', NULL),
(39, 800105, 'surveillance', 501.33, '2017-05-27', NULL),
(40, 800114, 'surveillance', 480.17, '2017-05-27', NULL),
(41, 800041, 'surveillance', 473.00, '2015-03-17', NULL),
(42, 800109, 'surveillance', 457.25, '2017-05-27', NULL),
(43, 800124, 'surveillance', 438.92, '2017-09-16', NULL),
(44, 800097, 'surveillance', 428.00, '2017-05-27', NULL),
(45, 800142, 'surveillance', 408.88, '2018-05-26', NULL),
(46, 800091, 'surveillance', 393.75, '2017-01-06', NULL),
(47, 800118, 'surveillance', 337.26, '2017-05-27', NULL),
(48, 800107, 'surveillance', 306.59, '2017-05-27', NULL),
(49, 800149, 'surveillance', 299.17, '2018-05-26', NULL),
(50, 800077, 'surveillance', 275.17, '2016-05-28', NULL),
(51, 800128, 'surveillance', 250.92, '2018-01-11', NULL),
(52, 800139, 'surveillance', 238.67, '2018-05-26', NULL),
(53, 800049, 'surveillance', 235.50, '2015-05-27', NULL),
(54, 800148, 'surveillance', 205.60, '2018-05-26', NULL),
(55, 800120, 'surveillance', 200.17, '2017-08-31', NULL),
(56, 800130, 'surveillance', 195.67, '2018-03-26', NULL),
(57, 800137, 'surveillance', 186.75, '2018-05-26', NULL),
(58, 800101, 'surveillance', 185.00, '2017-05-27', NULL),
(59, 800168, 'surveillance', 168.25, '2019-05-25', NULL),
(60, 800153, 'surveillance', 164.00, '2019-03-28', NULL),
(61, 800113, 'surveillance', 129.17, '2017-05-27', NULL),
(62, 800131, 'surveillance', 106.42, '2018-03-26', NULL),
(63, 800158, 'surveillance', 104.17, '2019-05-25', NULL),
(64, 800167, 'surveillance', 97.00, '2019-05-25', NULL),
(65, 800136, 'surveillance', 90.66, '2018-05-26', NULL),
(66, 800042, 'surveillance', 65.50, '2015-03-24', NULL),
(67, 800164, 'surveillance', 61.25, '2019-05-25', NULL),
(68, 758300, 'surveillance', 43.25, '2019-05-25', NULL),
(69, 800132, 'surveillance', 37.00, '2018-05-26', NULL),
(70, 800135, 'surveillance', 35.00, '2018-05-26', NULL),
(71, 800157, 'surveillance', 33.33, '2019-05-25', NULL),
(72, 800160, 'surveillance', 26.50, '2019-05-25', NULL),
(73, 800161, 'surveillance', 25.42, '2019-05-25', NULL),
(74, 800165, 'surveillance', 24.50, '2019-05-25', NULL),
(75, 800166, 'surveillance', 23.75, '2019-05-25', NULL),
(76, 800092, 'surveillance', 23.50, '2017-02-27', NULL),
(77, 800151, 'surveillance', 14.50, '2019-03-28', NULL),
(78, 800156, 'surveillance', 11.25, '2019-05-25', NULL),
(79, 800122, 'surveillance', 10.50, '2017-08-30', NULL),
(80, 800155, 'surveillance', 7.25, '2019-05-25', NULL),
(81, 750045, 'surveillance', 5.25, '2019-05-25', NULL),
(82, 800152, 'surveillance', 2.00, '2019-03-28', NULL),
(83, 800033, 'surveillance', 0.00, '2019-01-17', NULL),
(84, 800037, 'surveillance', 214.25, '2015-03-14', NULL),
(85, 800117, 'surveillance', 698.50, '2017-05-27', NULL),
(86, 800145, 'surveillance', 217.67, '2018-05-26', NULL),
(87, 722888, 'surveillance', 922.50, '2015-01-24', NULL),
(88, 800133, 'surveillance', 38.42, '2018-05-26', NULL),
(89, 800154, 'surveillance', 7.25, '2019-03-28', NULL),
(90, 800169, 'surveillance', 0.00, '2019-09-05', NULL),
(91, 800170, 'surveillance', 0.00, '2019-09-17', NULL),
(92, 800171, 'surveillance', 0.00, '2019-10-18', NULL),
(93, 800086, 'surveillance', 0.00, '2019-10-30', NULL),
(94, 800018, 'enseignement', 2660.34, '2015-03-02', NULL),
(95, 800010, 'enseignement', 2117.15, '2015-03-02', NULL),
(96, 800009, 'enseignement', 2030.50, '2015-03-02', NULL),
(97, 800022, 'enseignement', 1577.00, '2015-03-02', NULL),
(98, 800014, 'enseignement', 1333.33, '2015-03-02', NULL),
(99, 800021, 'enseignement', 1293.50, '2015-03-28', NULL),
(100, 800073, 'enseignement', 1230.24, '2015-09-14', NULL),
(101, 800077, 'enseignement', 1035.75, '2016-05-28', NULL),
(102, 800015, 'enseignement', 1030.25, '2015-03-02', NULL),
(103, 800107, 'enseignement', 988.92, '2017-05-27', NULL),
(104, 800041, 'enseignement', 953.38, '2015-03-02', NULL),
(105, 800042, 'enseignement', 927.00, '2015-03-02', NULL),
(106, 800001, 'enseignement', 748.83, '2015-03-02', NULL),
(107, 800059, 'enseignement', 741.50, '2015-05-27', NULL),
(108, 800090, 'enseignement', 671.25, '2016-12-21', NULL),
(109, 800093, 'enseignement', 669.50, '2017-02-10', NULL),
(110, 800023, 'enseignement', 645.00, '2015-03-02', NULL),
(111, 800101, 'enseignement', 643.00, '2017-05-27', NULL),
(112, 800118, 'enseignement', 626.25, '2017-05-27', NULL),
(113, 800089, 'enseignement', 607.50, '2016-12-15', NULL),
(114, 800130, 'enseignement', 559.50, '2018-03-26', NULL),
(115, 800113, 'enseignement', 545.34, '2017-05-27', NULL),
(116, 800079, 'enseignement', 529.25, '2016-05-28', NULL),
(117, 800088, 'enseignement', 431.09, '2016-12-02', NULL),
(118, 800105, 'enseignement', 399.25, '2017-05-27', NULL),
(119, 800083, 'enseignement', 377.75, '2016-05-28', NULL),
(120, 800127, 'enseignement', 377.34, '2017-09-16', NULL),
(121, 800120, 'enseignement', 370.83, '2017-08-31', NULL),
(122, 800091, 'enseignement', 324.25, '2016-12-21', NULL),
(123, 800017, 'enseignement', 315.25, '2015-03-02', NULL),
(124, 800126, 'enseignement', 310.92, '2017-09-16', NULL),
(125, 800092, 'enseignement', 309.64, '2017-02-10', NULL),
(126, 800122, 'enseignement', 301.00, '2017-08-30', NULL),
(127, 800131, 'enseignement', 292.45, '2018-03-26', NULL),
(128, 800124, 'enseignement', 278.00, '2017-09-16', NULL),
(129, 800148, 'enseignement', 271.00, '2018-05-26', NULL),
(130, 800004, 'enseignement', 248.92, '2015-03-02', NULL),
(131, 800057, 'enseignement', 248.25, '2015-05-27', NULL),
(132, 800142, 'enseignement', 237.75, '2018-05-26', NULL),
(133, 800116, 'enseignement', 231.17, '2017-05-27', NULL),
(134, 800097, 'enseignement', 226.75, '2017-05-27', NULL),
(135, 800040, 'enseignement', 206.84, '2015-03-02', NULL),
(136, 800038, 'enseignement', 204.75, '2015-03-02', NULL),
(137, 800139, 'enseignement', 203.42, '2018-05-26', NULL),
(138, 800100, 'enseignement', 186.00, '2017-05-27', NULL),
(139, 800039, 'enseignement', 183.25, '2015-03-02', NULL),
(140, 800136, 'enseignement', 159.25, '2018-05-26', NULL),
(141, 800128, 'enseignement', 94.50, '2018-01-11', NULL),
(142, 800029, 'enseignement', 85.00, '2015-03-02', NULL),
(143, 800109, 'enseignement', 66.25, '2017-05-27', NULL),
(144, 800149, 'enseignement', 60.45, '2018-05-26', NULL),
(145, 800153, 'enseignement', 59.50, '2019-03-28', NULL),
(146, 800137, 'enseignement', 40.00, '2018-05-26', NULL),
(147, 800135, 'enseignement', 33.50, '2018-05-26', NULL),
(148, 800161, 'enseignement', 21.50, '2019-05-25', NULL),
(149, 800152, 'enseignement', 19.00, '2019-03-28', NULL),
(150, 800156, 'enseignement', 15.95, '2019-05-25', NULL),
(151, 800081, 'enseignement', 12.50, '2016-05-28', NULL),
(152, 800166, 'enseignement', 11.00, '2019-05-25', NULL),
(153, 800151, 'enseignement', 9.00, '2019-03-28', NULL),
(154, 800114, 'enseignement', 9.00, '2017-05-27', NULL),
(155, 800132, 'enseignement', 8.25, '2018-05-26', NULL),
(156, 800167, 'enseignement', 7.00, '2019-05-25', NULL),
(157, 800032, 'enseignement', 2.75, '2015-03-02', NULL),
(158, 800048, 'enseignement', 1.00, '2015-05-27', NULL),
(159, 800062, 'enseignement', 0.50, '2015-05-27', NULL),
(160, 800049, 'enseignement', 0.00, '2015-05-27', NULL),
(161, 800155, 'enseignement', 0.00, '2019-05-25', NULL),
(162, 800157, 'enseignement', 0.00, '2019-05-25', NULL),
(163, 800158, 'enseignement', 0.00, '2019-05-25', NULL),
(164, 750045, 'enseignement', 0.00, '2019-05-25', NULL),
(165, 800099, 'enseignement', 0.00, '2017-05-27', NULL),
(166, 800160, 'enseignement', 0.00, '2019-05-25', NULL),
(167, 800104, 'enseignement', 0.00, '2017-05-27', NULL),
(168, 800108, 'enseignement', 0.00, '2017-05-27', NULL),
(169, 758300, 'enseignement', 0.00, '2019-05-25', NULL),
(170, 800033, 'enseignement', 0.00, '2019-01-17', NULL),
(171, 800164, 'enseignement', 0.00, '2019-05-25', NULL),
(172, 800111, 'enseignement', 0.00, '2017-05-27', NULL),
(173, 800165, 'enseignement', 0.00, '2019-05-25', NULL),
(174, 800168, 'enseignement', 0.00, '2019-05-25', NULL),
(175, 800037, 'enseignement', 635.58, '2015-03-14', NULL),
(176, 800133, 'enseignement', 0.00, '2018-05-26', NULL),
(177, 800117, 'enseignement', 0.00, '2017-05-27', NULL),
(178, 800145, 'enseignement', 173.00, '2018-05-26', NULL),
(179, 722888, 'enseignement', 1394.25, '1970-01-01', NULL),
(180, 800154, 'enseignement', 14.50, '2019-03-28', NULL),
(181, 800169, 'enseignement', 0.00, '2019-09-05', NULL),
(182, 800170, 'enseignement', 0.00, '2019-09-17', NULL),
(183, 800171, 'enseignement', 0.00, '2019-10-18', NULL),
(184, 800086, 'enseignement', 0.00, '2019-10-30', NULL),
(185, 800018, 'enseignement', 2660.34, '2015-03-02', NULL),
(186, 800010, 'enseignement', 2117.15, '2015-03-02', NULL),
(187, 800009, 'enseignement', 2030.50, '2015-03-02', NULL),
(188, 800022, 'enseignement', 1577.00, '2015-03-02', NULL),
(189, 800014, 'enseignement', 1333.33, '2015-03-02', NULL),
(190, 800021, 'enseignement', 1293.50, '2015-03-28', NULL),
(191, 800073, 'enseignement', 1230.24, '2015-09-14', NULL),
(192, 800077, 'enseignement', 1035.75, '2016-05-28', NULL),
(193, 800015, 'enseignement', 1030.25, '2015-03-02', NULL),
(194, 800107, 'enseignement', 988.92, '2017-05-27', NULL),
(195, 800041, 'enseignement', 953.38, '2015-03-02', NULL),
(196, 800042, 'enseignement', 927.00, '2015-03-02', NULL),
(197, 800001, 'enseignement', 748.83, '2015-03-02', NULL),
(198, 800059, 'enseignement', 741.50, '2015-05-27', NULL),
(199, 800090, 'enseignement', 671.25, '2016-12-21', NULL),
(200, 800093, 'enseignement', 669.50, '2017-02-10', NULL),
(201, 800023, 'enseignement', 645.00, '2015-03-02', NULL),
(202, 800101, 'enseignement', 643.00, '2017-05-27', NULL),
(203, 800118, 'enseignement', 626.25, '2017-05-27', NULL),
(204, 800089, 'enseignement', 607.50, '2016-12-15', NULL),
(205, 800130, 'enseignement', 559.50, '2018-03-26', NULL),
(206, 800113, 'enseignement', 545.34, '2017-05-27', NULL),
(207, 800079, 'enseignement', 529.25, '2016-05-28', NULL),
(208, 800088, 'enseignement', 431.09, '2016-12-02', NULL),
(209, 800105, 'enseignement', 399.25, '2017-05-27', NULL),
(210, 800083, 'enseignement', 377.75, '2016-05-28', NULL),
(211, 800127, 'enseignement', 377.34, '2017-09-16', NULL),
(212, 800120, 'enseignement', 370.83, '2017-08-31', NULL),
(213, 800091, 'enseignement', 324.25, '2016-12-21', NULL),
(214, 800017, 'enseignement', 315.25, '2015-03-02', NULL),
(215, 800126, 'enseignement', 310.92, '2017-09-16', NULL),
(216, 800092, 'enseignement', 309.64, '2017-02-10', NULL),
(217, 800122, 'enseignement', 301.00, '2017-08-30', NULL),
(218, 800131, 'enseignement', 292.45, '2018-03-26', NULL),
(219, 800124, 'enseignement', 278.00, '2017-09-16', NULL),
(220, 800148, 'enseignement', 271.00, '2018-05-26', NULL),
(221, 800004, 'enseignement', 248.92, '2015-03-02', NULL),
(222, 800057, 'enseignement', 248.25, '2015-05-27', NULL),
(223, 800142, 'enseignement', 237.75, '2018-05-26', NULL),
(224, 800116, 'enseignement', 231.17, '2017-05-27', NULL),
(225, 800097, 'enseignement', 226.75, '2017-05-27', NULL),
(226, 800040, 'enseignement', 206.84, '2015-03-02', NULL),
(227, 800038, 'enseignement', 204.75, '2015-03-02', NULL),
(228, 800139, 'enseignement', 203.42, '2018-05-26', NULL),
(229, 800100, 'enseignement', 186.00, '2017-05-27', NULL),
(230, 800039, 'enseignement', 183.25, '2015-03-02', NULL),
(231, 800136, 'enseignement', 159.25, '2018-05-26', NULL),
(232, 800128, 'enseignement', 94.50, '2018-01-11', NULL),
(233, 800029, 'enseignement', 85.00, '2015-03-02', NULL),
(234, 800109, 'enseignement', 66.25, '2017-05-27', NULL),
(235, 800149, 'enseignement', 60.45, '2018-05-26', NULL),
(236, 800153, 'enseignement', 59.50, '2019-03-28', NULL),
(237, 800137, 'enseignement', 40.00, '2018-05-26', NULL),
(238, 800135, 'enseignement', 33.50, '2018-05-26', NULL),
(239, 800161, 'enseignement', 21.50, '2019-05-25', NULL),
(240, 800152, 'enseignement', 19.00, '2019-03-28', NULL),
(241, 800156, 'enseignement', 15.95, '2019-05-25', NULL),
(242, 800081, 'enseignement', 12.50, '2016-05-28', NULL),
(243, 800166, 'enseignement', 11.00, '2019-05-25', NULL),
(244, 800151, 'enseignement', 9.00, '2019-03-28', NULL),
(245, 800114, 'enseignement', 9.00, '2017-05-27', NULL),
(246, 800132, 'enseignement', 8.25, '2018-05-26', NULL),
(247, 800167, 'enseignement', 7.00, '2019-05-25', NULL),
(248, 800032, 'enseignement', 2.75, '2015-03-02', NULL),
(249, 800048, 'enseignement', 1.00, '2015-05-27', NULL),
(250, 800062, 'enseignement', 0.50, '2015-05-27', NULL),
(251, 800049, 'enseignement', 0.00, '2015-05-27', NULL),
(252, 800155, 'enseignement', 0.00, '2019-05-25', NULL),
(253, 800157, 'enseignement', 0.00, '2019-05-25', NULL),
(254, 800158, 'enseignement', 0.00, '2019-05-25', NULL),
(255, 750045, 'enseignement', 0.00, '2019-05-25', NULL),
(256, 800099, 'enseignement', 0.00, '2017-05-27', NULL),
(257, 800160, 'enseignement', 0.00, '2019-05-25', NULL),
(258, 800104, 'enseignement', 0.00, '2017-05-27', NULL),
(259, 800108, 'enseignement', 0.00, '2017-05-27', NULL),
(260, 758300, 'enseignement', 0.00, '2019-05-25', NULL),
(261, 800033, 'enseignement', 0.00, '2019-01-17', NULL),
(262, 800164, 'enseignement', 0.00, '2019-05-25', NULL),
(263, 800111, 'enseignement', 0.00, '2017-05-27', NULL),
(264, 800165, 'enseignement', 0.00, '2019-05-25', NULL),
(265, 800168, 'enseignement', 0.00, '2019-05-25', NULL),
(266, 800037, 'enseignement', 635.58, '2015-03-14', NULL),
(267, 800133, 'enseignement', 0.00, '2018-05-26', NULL),
(268, 800117, 'enseignement', 0.00, '2017-05-27', NULL),
(269, 800145, 'enseignement', 173.00, '2018-05-26', NULL),
(270, 722888, 'enseignement', 1394.25, '1970-01-01', NULL),
(271, 800154, 'enseignement', 14.50, '2019-03-28', NULL),
(272, 800169, 'enseignement', 0.00, '2019-09-05', NULL),
(273, 800170, 'enseignement', 0.00, '2019-09-17', NULL),
(274, 800171, 'enseignement', 0.00, '2019-10-18', NULL),
(275, 800086, 'enseignement', 0.00, '2019-10-30', NULL),
(276, 800018, 'enseignement', 2660.34, '2015-03-02', NULL),
(277, 800010, 'enseignement', 2117.15, '2015-03-02', NULL),
(278, 800009, 'enseignement', 2030.50, '2015-03-02', NULL),
(279, 800022, 'enseignement', 1577.00, '2015-03-02', NULL),
(280, 800014, 'enseignement', 1333.33, '2015-03-02', NULL),
(281, 800021, 'enseignement', 1293.50, '2015-03-28', NULL),
(282, 800073, 'enseignement', 1230.24, '2015-09-14', NULL),
(283, 800077, 'enseignement', 1035.75, '2016-05-28', NULL),
(284, 800015, 'enseignement', 1030.25, '2015-03-02', NULL),
(285, 800107, 'enseignement', 988.92, '2017-05-27', NULL),
(286, 800041, 'enseignement', 953.38, '2015-03-02', NULL),
(287, 800042, 'enseignement', 927.00, '2015-03-02', NULL),
(288, 800001, 'enseignement', 748.83, '2015-03-02', NULL),
(289, 800059, 'enseignement', 741.50, '2015-05-27', NULL),
(290, 800090, 'enseignement', 671.25, '2016-12-21', NULL),
(291, 800093, 'enseignement', 669.50, '2017-02-10', NULL),
(292, 800023, 'enseignement', 645.00, '2015-03-02', NULL),
(293, 800101, 'enseignement', 643.00, '2017-05-27', NULL),
(294, 800118, 'enseignement', 626.25, '2017-05-27', NULL),
(295, 800089, 'enseignement', 607.50, '2016-12-15', NULL),
(296, 800130, 'enseignement', 559.50, '2018-03-26', NULL),
(297, 800113, 'enseignement', 545.34, '2017-05-27', NULL),
(298, 800079, 'enseignement', 529.25, '2016-05-28', NULL),
(299, 800088, 'enseignement', 431.09, '2016-12-02', NULL),
(300, 800105, 'enseignement', 399.25, '2017-05-27', NULL),
(301, 800083, 'enseignement', 377.75, '2016-05-28', NULL),
(302, 800127, 'enseignement', 377.34, '2017-09-16', NULL),
(303, 800120, 'enseignement', 370.83, '2017-08-31', NULL),
(304, 800091, 'enseignement', 324.25, '2016-12-21', NULL),
(305, 800017, 'enseignement', 315.25, '2015-03-02', NULL),
(306, 800126, 'enseignement', 310.92, '2017-09-16', NULL),
(307, 800092, 'enseignement', 309.64, '2017-02-10', NULL),
(308, 800122, 'enseignement', 301.00, '2017-08-30', NULL),
(309, 800131, 'enseignement', 292.45, '2018-03-26', NULL),
(310, 800124, 'enseignement', 278.00, '2017-09-16', NULL),
(311, 800148, 'enseignement', 271.00, '2018-05-26', NULL),
(312, 800004, 'enseignement', 248.92, '2015-03-02', NULL),
(313, 800057, 'enseignement', 248.25, '2015-05-27', NULL),
(314, 800142, 'enseignement', 237.75, '2018-05-26', NULL),
(315, 800116, 'enseignement', 231.17, '2017-05-27', NULL),
(316, 800097, 'enseignement', 226.75, '2017-05-27', NULL),
(317, 800040, 'enseignement', 206.84, '2015-03-02', NULL),
(318, 800038, 'enseignement', 204.75, '2015-03-02', NULL),
(319, 800139, 'enseignement', 203.42, '2018-05-26', NULL),
(320, 800100, 'enseignement', 186.00, '2017-05-27', NULL),
(321, 800039, 'enseignement', 183.25, '2015-03-02', NULL),
(322, 800136, 'enseignement', 159.25, '2018-05-26', NULL),
(323, 800128, 'enseignement', 94.50, '2018-01-11', NULL),
(324, 800029, 'enseignement', 85.00, '2015-03-02', NULL),
(325, 800109, 'enseignement', 66.25, '2017-05-27', NULL),
(326, 800149, 'enseignement', 60.45, '2018-05-26', NULL),
(327, 800153, 'enseignement', 59.50, '2019-03-28', NULL),
(328, 800137, 'enseignement', 40.00, '2018-05-26', NULL),
(329, 800135, 'enseignement', 33.50, '2018-05-26', NULL),
(330, 800161, 'enseignement', 21.50, '2019-05-25', NULL),
(331, 800152, 'enseignement', 19.00, '2019-03-28', NULL),
(332, 800156, 'enseignement', 15.95, '2019-05-25', NULL),
(333, 800081, 'enseignement', 12.50, '2016-05-28', NULL),
(334, 800166, 'enseignement', 11.00, '2019-05-25', NULL),
(335, 800151, 'enseignement', 9.00, '2019-03-28', NULL),
(336, 800114, 'enseignement', 9.00, '2017-05-27', NULL),
(337, 800132, 'enseignement', 8.25, '2018-05-26', NULL),
(338, 800167, 'enseignement', 7.00, '2019-05-25', NULL),
(339, 800032, 'enseignement', 2.75, '2015-03-02', NULL),
(340, 800048, 'enseignement', 1.00, '2015-05-27', NULL),
(341, 800062, 'enseignement', 0.50, '2015-05-27', NULL),
(342, 800049, 'enseignement', 0.00, '2015-05-27', NULL),
(343, 800155, 'enseignement', 0.00, '2019-05-25', NULL),
(344, 800157, 'enseignement', 0.00, '2019-05-25', NULL),
(345, 800158, 'enseignement', 0.00, '2019-05-25', NULL),
(346, 750045, 'enseignement', 0.00, '2019-05-25', NULL),
(347, 800099, 'enseignement', 0.00, '2017-05-27', NULL),
(348, 800160, 'enseignement', 0.00, '2019-05-25', NULL),
(349, 800104, 'enseignement', 0.00, '2017-05-27', NULL),
(350, 800108, 'enseignement', 0.00, '2017-05-27', NULL),
(351, 758300, 'enseignement', 0.00, '2019-05-25', NULL),
(352, 800033, 'enseignement', 0.00, '2019-01-17', NULL),
(353, 800164, 'enseignement', 0.00, '2019-05-25', NULL),
(354, 800111, 'enseignement', 0.00, '2017-05-27', NULL),
(355, 800165, 'enseignement', 0.00, '2019-05-25', NULL),
(356, 800168, 'enseignement', 0.00, '2019-05-25', NULL),
(357, 800037, 'enseignement', 635.58, '2015-03-14', NULL),
(358, 800133, 'enseignement', 0.00, '2018-05-26', NULL),
(359, 800117, 'enseignement', 0.00, '2017-05-27', NULL),
(360, 800145, 'enseignement', 173.00, '2018-05-26', NULL),
(361, 722888, 'enseignement', 1394.25, '1970-01-01', NULL),
(362, 800154, 'enseignement', 14.50, '2019-03-28', NULL),
(363, 800169, 'enseignement', 0.00, '2019-09-05', NULL),
(364, 800170, 'enseignement', 0.00, '2019-09-17', NULL),
(365, 800171, 'enseignement', 0.00, '2019-10-18', NULL),
(366, 800086, 'enseignement', 0.00, '2019-10-30', NULL),
(367, 800017, 'surveillance', 3033.92, '2015-03-02', NULL),
(368, 800029, 'surveillance', 2599.42, '2015-03-02', NULL),
(369, 800039, 'surveillance', 2466.09, '2015-03-02', NULL),
(370, 800038, 'surveillance', 2248.09, '2015-03-02', NULL),
(371, 800001, 'surveillance', 1989.34, '2015-03-02', NULL),
(372, 800057, 'surveillance', 1892.66, '2015-05-27', NULL),
(373, 800027, 'surveillance', 1846.08, '2015-03-02', NULL),
(374, 800014, 'surveillance', 1799.08, '2015-03-02', NULL),
(375, 800004, 'surveillance', 1680.50, '2015-03-28', NULL),
(376, 800079, 'surveillance', 1511.75, '2016-05-28', NULL),
(377, 800032, 'surveillance', 1427.25, '2015-03-28', NULL),
(378, 800009, 'surveillance', 1315.25, '2015-03-02', NULL),
(379, 800048, 'surveillance', 1264.76, '2015-05-27', NULL),
(380, 800003, 'surveillance', 1264.17, '2015-03-28', NULL),
(381, 800018, 'surveillance', 1245.42, '2015-03-28', NULL),
(382, 800062, 'surveillance', 1216.42, '2015-05-27', NULL),
(383, 800010, 'surveillance', 1171.33, '2015-03-14', NULL),
(384, 800023, 'surveillance', 1098.92, '2015-03-28', NULL),
(385, 800015, 'surveillance', 1069.38, '2015-03-28', NULL),
(386, 800090, 'surveillance', 1065.22, '2017-01-06', NULL),
(387, 800059, 'surveillance', 1059.91, '2015-05-27', NULL),
(388, 800081, 'surveillance', 1038.25, '2016-05-28', NULL),
(389, 800022, 'surveillance', 930.01, '2015-03-28', NULL),
(390, 800040, 'surveillance', 904.17, '2015-03-14', NULL),
(391, 800116, 'surveillance', 899.00, '2017-05-27', NULL),
(392, 800100, 'surveillance', 850.83, '2017-05-27', NULL),
(393, 800088, 'surveillance', 846.75, '2017-01-06', NULL),
(394, 800108, 'surveillance', 826.58, '2017-05-27', NULL),
(395, 800021, 'surveillance', 782.09, '2015-03-28', NULL),
(396, 800089, 'surveillance', 733.50, '2017-01-06', NULL),
(397, 800111, 'surveillance', 699.75, '2017-05-27', NULL),
(398, 800104, 'surveillance', 685.67, '2017-05-27', NULL),
(399, 800099, 'surveillance', 640.00, '2017-05-27', NULL),
(400, 800073, 'surveillance', 617.17, '2015-09-14', NULL),
(401, 800126, 'surveillance', 605.00, '2017-09-16', NULL),
(402, 800127, 'surveillance', 590.13, '2017-09-16', NULL),
(403, 800083, 'surveillance', 570.08, '2016-07-05', NULL),
(404, 800093, 'surveillance', 553.83, '2017-02-27', NULL),
(405, 800105, 'surveillance', 501.33, '2017-05-27', NULL),
(406, 800114, 'surveillance', 480.17, '2017-05-27', NULL),
(407, 800041, 'surveillance', 473.00, '2015-03-17', NULL),
(408, 800109, 'surveillance', 457.25, '2017-05-27', NULL),
(409, 800124, 'surveillance', 438.92, '2017-09-16', NULL),
(410, 800097, 'surveillance', 428.00, '2017-05-27', NULL),
(411, 800142, 'surveillance', 408.88, '2018-05-26', NULL),
(412, 800091, 'surveillance', 393.75, '2017-01-06', NULL),
(413, 800118, 'surveillance', 337.26, '2017-05-27', NULL),
(414, 800107, 'surveillance', 306.59, '2017-05-27', NULL),
(415, 800149, 'surveillance', 299.17, '2018-05-26', NULL),
(416, 800077, 'surveillance', 275.17, '2016-05-28', NULL),
(417, 800128, 'surveillance', 250.92, '2018-01-11', NULL),
(418, 800139, 'surveillance', 238.67, '2018-05-26', NULL),
(419, 800049, 'surveillance', 235.50, '2015-05-27', NULL),
(420, 800148, 'surveillance', 205.60, '2018-05-26', NULL),
(421, 800120, 'surveillance', 200.17, '2017-08-31', NULL),
(422, 800130, 'surveillance', 195.67, '2018-03-26', NULL),
(423, 800137, 'surveillance', 186.75, '2018-05-26', NULL),
(424, 800101, 'surveillance', 185.00, '2017-05-27', NULL),
(425, 800168, 'surveillance', 168.25, '2019-05-25', NULL),
(426, 800153, 'surveillance', 164.00, '2019-03-28', NULL),
(427, 800113, 'surveillance', 129.17, '2017-05-27', NULL),
(428, 800131, 'surveillance', 106.42, '2018-03-26', NULL),
(429, 800158, 'surveillance', 104.17, '2019-05-25', NULL),
(430, 800167, 'surveillance', 97.00, '2019-05-25', NULL),
(431, 800136, 'surveillance', 90.66, '2018-05-26', NULL),
(432, 800042, 'surveillance', 65.50, '2015-03-24', NULL),
(433, 800164, 'surveillance', 61.25, '2019-05-25', NULL),
(434, 758300, 'surveillance', 43.25, '2019-05-25', NULL),
(435, 800132, 'surveillance', 37.00, '2018-05-26', NULL),
(436, 800135, 'surveillance', 35.00, '2018-05-26', NULL),
(437, 800157, 'surveillance', 33.33, '2019-05-25', NULL),
(438, 800160, 'surveillance', 26.50, '2019-05-25', NULL),
(439, 800161, 'surveillance', 25.42, '2019-05-25', NULL),
(440, 800165, 'surveillance', 24.50, '2019-05-25', NULL),
(441, 800166, 'surveillance', 23.75, '2019-05-25', NULL),
(442, 800092, 'surveillance', 23.50, '2017-02-27', NULL),
(443, 800151, 'surveillance', 14.50, '2019-03-28', NULL),
(444, 800156, 'surveillance', 11.25, '2019-05-25', NULL),
(445, 800122, 'surveillance', 10.50, '2017-08-30', NULL),
(446, 800155, 'surveillance', 7.25, '2019-05-25', NULL),
(447, 750045, 'surveillance', 5.25, '2019-05-25', NULL),
(448, 800152, 'surveillance', 2.00, '2019-03-28', NULL),
(449, 800033, 'surveillance', 0.00, '2019-01-17', NULL),
(450, 800037, 'surveillance', 214.25, '2015-03-14', NULL),
(451, 800117, 'surveillance', 698.50, '2017-05-27', NULL),
(452, 800145, 'surveillance', 217.67, '2018-05-26', NULL),
(453, 722888, 'surveillance', 922.50, '2015-01-24', NULL),
(454, 800133, 'surveillance', 38.42, '2018-05-26', NULL),
(455, 800154, 'surveillance', 7.25, '2019-03-28', NULL),
(456, 800169, 'surveillance', 0.00, '2019-09-05', NULL),
(457, 800170, 'surveillance', 0.00, '2019-09-17', NULL),
(458, 800171, 'surveillance', 0.00, '2019-10-18', NULL),
(459, 800086, 'surveillance', 0.00, '2019-10-30', NULL),
(460, 800017, 'surveillance', 3033.92, '2015-03-02', NULL),
(461, 800029, 'surveillance', 2599.42, '2015-03-02', NULL),
(462, 800039, 'surveillance', 2466.09, '2015-03-02', NULL),
(463, 800038, 'surveillance', 2248.09, '2015-03-02', NULL),
(464, 800001, 'surveillance', 1989.34, '2015-03-02', NULL),
(465, 800057, 'surveillance', 1892.66, '2015-05-27', NULL),
(466, 800027, 'surveillance', 1846.08, '2015-03-02', NULL),
(467, 800014, 'surveillance', 1799.08, '2015-03-02', NULL),
(468, 800004, 'surveillance', 1680.50, '2015-03-28', NULL),
(469, 800079, 'surveillance', 1511.75, '2016-05-28', NULL),
(470, 800032, 'surveillance', 1427.25, '2015-03-28', NULL),
(471, 800009, 'surveillance', 1315.25, '2015-03-02', NULL),
(472, 800048, 'surveillance', 1264.76, '2015-05-27', NULL),
(473, 800003, 'surveillance', 1264.17, '2015-03-28', NULL),
(474, 800018, 'surveillance', 1245.42, '2015-03-28', NULL),
(475, 800062, 'surveillance', 1216.42, '2015-05-27', NULL),
(476, 800010, 'surveillance', 1171.33, '2015-03-14', NULL),
(477, 800023, 'surveillance', 1098.92, '2015-03-28', NULL),
(478, 800015, 'surveillance', 1069.38, '2015-03-28', NULL),
(479, 800090, 'surveillance', 1065.22, '2017-01-06', NULL),
(480, 800059, 'surveillance', 1059.91, '2015-05-27', NULL),
(481, 800081, 'surveillance', 1038.25, '2016-05-28', NULL),
(482, 800022, 'surveillance', 930.01, '2015-03-28', NULL),
(483, 800040, 'surveillance', 904.17, '2015-03-14', NULL),
(484, 800116, 'surveillance', 899.00, '2017-05-27', NULL),
(485, 800100, 'surveillance', 850.83, '2017-05-27', NULL),
(486, 800088, 'surveillance', 846.75, '2017-01-06', NULL),
(487, 800108, 'surveillance', 826.58, '2017-05-27', NULL),
(488, 800021, 'surveillance', 782.09, '2015-03-28', NULL),
(489, 800089, 'surveillance', 733.50, '2017-01-06', NULL),
(490, 800111, 'surveillance', 699.75, '2017-05-27', NULL),
(491, 800104, 'surveillance', 685.67, '2017-05-27', NULL),
(492, 800099, 'surveillance', 640.00, '2017-05-27', NULL),
(493, 800073, 'surveillance', 617.17, '2015-09-14', NULL),
(494, 800126, 'surveillance', 605.00, '2017-09-16', NULL),
(495, 800127, 'surveillance', 590.13, '2017-09-16', NULL),
(496, 800083, 'surveillance', 570.08, '2016-07-05', NULL),
(497, 800093, 'surveillance', 553.83, '2017-02-27', NULL),
(498, 800105, 'surveillance', 501.33, '2017-05-27', NULL),
(499, 800114, 'surveillance', 480.17, '2017-05-27', NULL),
(500, 800041, 'surveillance', 473.00, '2015-03-17', NULL),
(501, 800109, 'surveillance', 457.25, '2017-05-27', NULL),
(502, 800124, 'surveillance', 438.92, '2017-09-16', NULL),
(503, 800097, 'surveillance', 428.00, '2017-05-27', NULL),
(504, 800142, 'surveillance', 408.88, '2018-05-26', NULL),
(505, 800091, 'surveillance', 393.75, '2017-01-06', NULL),
(506, 800118, 'surveillance', 337.26, '2017-05-27', NULL),
(507, 800107, 'surveillance', 306.59, '2017-05-27', NULL),
(508, 800149, 'surveillance', 299.17, '2018-05-26', NULL),
(509, 800077, 'surveillance', 275.17, '2016-05-28', NULL),
(510, 800128, 'surveillance', 250.92, '2018-01-11', NULL),
(511, 800139, 'surveillance', 238.67, '2018-05-26', NULL),
(512, 800049, 'surveillance', 235.50, '2015-05-27', NULL),
(513, 800148, 'surveillance', 205.60, '2018-05-26', NULL),
(514, 800120, 'surveillance', 200.17, '2017-08-31', NULL),
(515, 800130, 'surveillance', 195.67, '2018-03-26', NULL),
(516, 800137, 'surveillance', 186.75, '2018-05-26', NULL),
(517, 800101, 'surveillance', 185.00, '2017-05-27', NULL),
(518, 800168, 'surveillance', 168.25, '2019-05-25', NULL),
(519, 800153, 'surveillance', 164.00, '2019-03-28', NULL),
(520, 800113, 'surveillance', 129.17, '2017-05-27', NULL),
(521, 800131, 'surveillance', 106.42, '2018-03-26', NULL),
(522, 800158, 'surveillance', 104.17, '2019-05-25', NULL),
(523, 800167, 'surveillance', 97.00, '2019-05-25', NULL),
(524, 800136, 'surveillance', 90.66, '2018-05-26', NULL),
(525, 800042, 'surveillance', 65.50, '2015-03-24', NULL),
(526, 800164, 'surveillance', 61.25, '2019-05-25', NULL),
(527, 758300, 'surveillance', 43.25, '2019-05-25', NULL),
(528, 800132, 'surveillance', 37.00, '2018-05-26', NULL),
(529, 800135, 'surveillance', 35.00, '2018-05-26', NULL),
(530, 800157, 'surveillance', 33.33, '2019-05-25', NULL),
(531, 800160, 'surveillance', 26.50, '2019-05-25', NULL),
(532, 800161, 'surveillance', 25.42, '2019-05-25', NULL),
(533, 800165, 'surveillance', 24.50, '2019-05-25', NULL),
(534, 800166, 'surveillance', 23.75, '2019-05-25', NULL),
(535, 800092, 'surveillance', 23.50, '2017-02-27', NULL),
(536, 800151, 'surveillance', 14.50, '2019-03-28', NULL),
(537, 800156, 'surveillance', 11.25, '2019-05-25', NULL),
(538, 800122, 'surveillance', 10.50, '2017-08-30', NULL),
(539, 800155, 'surveillance', 7.25, '2019-05-25', NULL),
(540, 750045, 'surveillance', 5.25, '2019-05-25', NULL),
(541, 800152, 'surveillance', 2.00, '2019-03-28', NULL),
(542, 800033, 'surveillance', 0.00, '2019-01-17', NULL),
(543, 800037, 'surveillance', 214.25, '2015-03-14', NULL),
(544, 800117, 'surveillance', 698.50, '2017-05-27', NULL),
(545, 800145, 'surveillance', 217.67, '2018-05-26', NULL),
(546, 722888, 'surveillance', 922.50, '2015-01-24', NULL),
(547, 800133, 'surveillance', 38.42, '2018-05-26', NULL),
(548, 800154, 'surveillance', 7.25, '2019-03-28', NULL),
(549, 800169, 'surveillance', 0.00, '2019-09-05', NULL),
(550, 800170, 'surveillance', 0.00, '2019-09-17', NULL),
(551, 800171, 'surveillance', 0.00, '2019-10-18', NULL),
(552, 800086, 'surveillance', 0.00, '2019-10-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL,
  `assigned_user` int(11) DEFAULT NULL,
  `required_qual` int(11) DEFAULT NULL,
  `start_time` time NOT NULL DEFAULT curtime(),
  `end_time` time NOT NULL,
  `day` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_id`, `assigned_user`, `required_qual`, `start_time`, `end_time`, `day`, `description`, `start_date`, `end_date`) VALUES
(1, NULL, 1, '08:00:00', '13:00:00', 'Lundi', 'Bain Libre - Test', '2019-05-05', '2020-05-01');

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
(722888, 'UThSpQdD', 'Mathieu', 'Dorval', NULL, NULL, 1, NULL),
(750045, 'dadHMZ6X', 'Édouard', 'Ducharme', NULL, NULL, 1, NULL),
(758300, 'GhXseYOa', 'Nathan', 'Ng', NULL, NULL, 1, NULL),
(800001, '22EF3Iml', 'Rasha', 'Alhaeik', NULL, NULL, 1, NULL),
(800003, 'QL2WxvNw', 'Laetitia', 'Banh', NULL, NULL, 1, NULL),
(800004, '09qlEhy2', 'Malika', 'Bélanger-Oudrhiri', NULL, NULL, 1, NULL),
(800009, 'ySRnxxpv', 'Annie-France', 'Demers', NULL, NULL, 1, NULL),
(800010, 'xjT2oj2Y', 'Guillaume', 'Demers', NULL, NULL, 1, NULL),
(800014, 'LUvS9MRO', 'Marie-Alexandre', 'Forest', NULL, NULL, 1, NULL),
(800015, 'J10955aO', 'Jean-Michel', 'Fortier', NULL, NULL, 1, NULL),
(800017, 'pnUfYaCy', 'Vincent', 'Henry', NULL, NULL, 1, NULL),
(800018, 'X0FWwQ2r', 'Marc-Antoine', 'Lajoie', NULL, NULL, 1, NULL),
(800021, 'RRzNYwuf', 'Amélie', 'Tiphane', NULL, NULL, 1, NULL),
(800022, '4Li5H6Je', 'Josianne', 'Larrivée', NULL, NULL, 1, NULL),
(800023, 'IuNazhXV', 'Béatrice', 'Laurin', NULL, NULL, 1, NULL),
(800027, 'FJtUDatX', 'Jessika', 'Métivier-Bédard', NULL, NULL, 1, NULL),
(800029, 'e9L2e48l', 'Ariane', 'Moquin Joubert', NULL, NULL, 1, NULL),
(800032, 'O1U5dKJO', 'Félix-Antoine', 'Pelletier', NULL, NULL, 1, NULL),
(800033, 'Yx8Fm3dK', 'Amélie', 'Poiré', NULL, NULL, 1, NULL),
(800036, 'B9rAPoSO', 'Mélissa', 'Roch-Lanouette', NULL, NULL, 1, NULL),
(800037, 'ebROSQCb', 'Galit', 'Sandaev', NULL, NULL, 1, NULL),
(800038, '9rmWlNY2', 'Aaruthra', 'Thirumal', NULL, NULL, 1, NULL),
(800039, 'nzDabEab', 'Maxime', 'Trottier', NULL, NULL, 1, NULL),
(800040, 'ZsSMteo5', 'Caroline', 'Turgeon', NULL, NULL, 1, NULL),
(800041, 'drjNbZX9', 'Aude', 'Vallerand', NULL, NULL, 1, NULL),
(800042, 'bZoynmyb', 'Margaux', 'Willame', NULL, NULL, 1, NULL),
(800045, '6MHwCpm5', 'Jonathan', 'Miron', NULL, NULL, 1, NULL),
(800048, 'ItNTEszk', 'Jack', 'Allen', NULL, NULL, 1, NULL),
(800049, 'L6XWRzDD', 'Maxime', 'Berger', NULL, NULL, 1, NULL),
(800054, '9kTa0DCO', 'David', 'Do', NULL, NULL, 1, NULL),
(800057, 'sKHnIq5b', 'Alexandre', 'Gagné', NULL, NULL, 1, NULL),
(800059, 'TfKGqZDF', 'Hélène', 'Hoffman-Chrétien', NULL, NULL, 1, NULL),
(800062, 'oGZBxdJG', 'Tiffany', 'Nguyen', NULL, NULL, 1, NULL),
(800073, 'XKAfSge5', 'Éléanor', 'Chabot', NULL, NULL, 1, NULL),
(800077, 'wn7YrBGt', 'Salma', 'Ayari', NULL, NULL, 1, NULL),
(800078, 'aPwCtDCb', 'Érik ', 'Farkas', NULL, NULL, 1, NULL),
(800079, 'kgMLfpzP', 'Katerine', 'Landry', NULL, NULL, 1, NULL),
(800081, 'vztsuSby', 'Charles-Olivier', 'Moreau', NULL, NULL, 1, NULL),
(800083, 'h67dgZ6A', 'Isabelle', 'Lefebvre', NULL, NULL, 1, NULL),
(800086, 'dSLcxWvr', 'Salomë', 'Plourde', NULL, NULL, 1, NULL),
(800088, '27lUTd3i', 'Florence', 'Peate', NULL, NULL, 1, NULL),
(800089, '2oqmMTcQ', 'Roxanne', 'Landry', NULL, NULL, 1, NULL),
(800090, 'TTOTC1OR', 'Mario', 'Ivanov', NULL, NULL, 1, NULL),
(800091, 'Gt0U7gk5', 'Claudia', 'Burton', NULL, NULL, 1, NULL),
(800092, 'l2qFib6S', 'Peinda', 'Diop', NULL, NULL, 1, NULL),
(800093, 'JAmWhCPX', 'Marc-André', 'Gosselin', NULL, NULL, 1, NULL),
(800095, 'HFtXcUJw', 'Célia', 'Kingsbury', NULL, NULL, 1, NULL),
(800097, 'Ju8HPRIi', 'Ana Maria', 'Cotocea', NULL, NULL, 1, NULL),
(800099, 'GPKP4KeG', 'William', 'Ducharme', NULL, NULL, 1, NULL),
(800100, 'dAyxB5uE', 'Pascale', 'Fillion', NULL, NULL, 1, NULL),
(800101, 'P5mk22zk', 'Ana Elise', 'Jivan', NULL, NULL, 1, NULL),
(800104, 'll3JygWW', 'Louis', 'Lafrance-Savard', NULL, NULL, 1, NULL),
(800105, 'CKHbl7we', 'Mélanie', 'Lefebvre', NULL, NULL, 1, NULL),
(800107, '1jNnDRxe', 'Paula Sofia', 'Loaiza', NULL, NULL, 1, NULL),
(800108, 'usEC0XRW', 'Louis-Charles', 'Marquis', NULL, NULL, 1, NULL),
(800109, 'pzYL9d6r', 'Chaimaa', 'Ouizzane', NULL, NULL, 1, NULL),
(800111, 'fFyMbQpi', 'Vincent', 'Provost', NULL, NULL, 1, NULL),
(800113, 'oyPFRN4Z', 'Alice', 'Stoica', NULL, NULL, 1, NULL),
(800114, 'i7KSlGkd', 'Laurence', 'Thériault-Lapointe', NULL, NULL, 1, NULL),
(800116, '1wiok43T', 'Sandrine', 'Trinh', NULL, NULL, 1, NULL),
(800117, 'JHWdseaV', 'David', 'Van Oordt', NULL, NULL, 1, NULL),
(800118, 'eUVuN70x', 'Ivy', 'Zou', NULL, NULL, 1, NULL),
(800120, 'CHZ8R1vD', 'Rose', 'Zhang', NULL, NULL, 1, NULL),
(800122, '3pfaYToE', 'Audrey', 'Ng Youn Chen', NULL, NULL, 1, NULL),
(800124, 'JmeXWfMs', 'Mia', 'Gagné-Vincent', NULL, NULL, 1, NULL),
(800126, 'T0oOGThs', 'Karel', 'Grégoire', NULL, NULL, 1, NULL),
(800127, 'EHvsTUDX', 'Gabrielle', 'Lapointe', NULL, NULL, 1, NULL),
(800128, 'uvLZdkU8', 'Ariane', 'Lalancette', NULL, NULL, 1, NULL),
(800130, 'cu9oHn3q', 'William', 'Belbin', NULL, NULL, 1, NULL),
(800131, 'whQROthI', 'Valentin', 'Cioana', NULL, NULL, 1, NULL),
(800132, 'oSv8WYma', 'Jean-Christophe', 'Bélair', NULL, NULL, 1, NULL),
(800133, 'ZBMkN66e', 'Alexandra', 'Bélec-Sergerie', NULL, NULL, 1, NULL),
(800134, '3PmSr6yi', 'Anaïs', 'Berlinger-Lavoie', NULL, NULL, 1, NULL),
(800135, 'A3aK5tfT', 'Jannick', 'Bonenfant', NULL, NULL, 1, NULL),
(800136, 'oEHCKUSK', 'Najee', 'Cadet', NULL, NULL, 1, NULL),
(800137, 'zwVtww2L', 'Marie-Rose', 'Chabot', NULL, NULL, 1, NULL),
(800139, 'eCvpTl1H', 'Patrick', 'Cimpean', NULL, NULL, 1, NULL),
(800142, 'cwsty5NU', 'Victoria', 'Derome', NULL, NULL, 1, NULL),
(800145, 'PeZsDLLb', 'Frédérique', 'Lafontaine', NULL, NULL, 1, NULL),
(800148, '48k5RnCl', 'Horia Cristian', 'Sandu', NULL, NULL, 1, NULL),
(800149, '97X5ru57', 'Nicolas', 'Vu', NULL, NULL, 1, NULL),
(800151, 'bQeKwGuc', 'Rayan', 'Achouri', NULL, NULL, 1, NULL),
(800152, 'MmZmLdFk', 'Alexis', 'Côté', NULL, NULL, 1, NULL),
(800153, 'NGRlMXEt', 'Marc-Antoine', 'Tremblay', NULL, NULL, 1, NULL),
(800154, 'Wolw3zzd', 'Julian', 'Manotas', NULL, NULL, 1, NULL),
(800155, 'bSVyX4Dq', 'Antoine', 'Boulanger', NULL, NULL, 1, NULL),
(800156, 'ANghA0F3', 'David', 'Cioana', NULL, NULL, 1, NULL),
(800157, 'lIEgWPVd', 'Nicolas', 'Comsulea', NULL, NULL, 1, NULL),
(800158, 'pQplrcu3', 'Clara', 'Dragon', NULL, NULL, 1, NULL),
(800160, 'j6BG6AAG', 'Nikol', 'Georgieva', NULL, NULL, 1, NULL),
(800161, 'JfPcXTsm', 'Éric Stefan', 'Gojan', NULL, NULL, 1, NULL),
(800164, 'Pc4xUPud', 'Hubert', 'Provost', NULL, NULL, 1, NULL),
(800165, 'bxv59aBT', 'Chloé', 'Prugne', NULL, NULL, 1, NULL),
(800166, 'vgRgq6Lm', 'Nina', 'Tan', NULL, NULL, 1, NULL),
(800167, 'KoQqKXFF', 'Alison', 'Vo', NULL, NULL, 1, NULL),
(800168, 'Lz4Cxd1T', 'Leila', 'Zaouali', NULL, NULL, 1, NULL),
(800169, 'Xx6vZxeD', 'Sabrina', 'Chan Fee', NULL, NULL, 1, NULL),
(800170, 'lhVZTiZJ', 'David', 'Larrivée', NULL, NULL, 1, NULL),
(800171, 'pcoi0vmb', 'Yan', 'Burton', NULL, NULL, 1, NULL),
(999999, '$2y$10$T4MuFeyXt3I2lUsl9ruNb.yxjxGlnh2khRGVCeG1OyAnIrY4IHWKW', 'Secteur', 'Aquatique', NULL, NULL, 2, NULL);

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
  ADD KEY `FK_shift_qualification` (`required_qual`);

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
  MODIFY `sch_id` int(7) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seniority`
--
ALTER TABLE `seniority`
  MODIFY `seniority_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
