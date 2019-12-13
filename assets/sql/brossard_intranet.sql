-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2019 at 06:44 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL,
  `assigned_user` int(11) NOT NULL,
  `required_qual` int(11) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `day` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(800083, 'h67dgZ6A', 'Isabelle ', 'Lefebvre', NULL, NULL, 1, NULL),
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
(800171, 'pcoi0vmb', 'Yan', 'Burton ', NULL, NULL, 1, NULL),
(999999, 'rC0Q7gB3', 'Secteur', 'Aquatique', NULL, NULL, 1, NULL);

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
  MODIFY `seniority_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT;

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
