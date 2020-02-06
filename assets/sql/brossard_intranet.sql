-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2020 at 11:46 PM
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

CREATE TABLE `availabilities`
(
    `shift_id`          int(7)     NOT NULL,
    `user_id`           int(7)     NOT NULL,
    `user_is_available` tinyint(1) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `availability_blocks`
--

CREATE TABLE `availability_blocks`
(
    `block_id`      int(11) NOT NULL,
    `sch_id`        int(11) NOT NULL,
    `day`           varchar(30) DEFAULT NULL,
    `start_time`    time        DEFAULT NULL,
    `end_time`      time        DEFAULT NULL,
    `required_qual` int(11)     DEFAULT NULL,
    `category`      varchar(30) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `availability_blocks`
--

INSERT INTO `availability_blocks` (`block_id`, `sch_id`, `day`, `start_time`, `end_time`, `required_qual`, `category`)
VALUES (955, 1, 'Dimanche', '13:15:00', '16:30:00', 1, 'Surveillance'),
       (956, 1, 'Dimanche', '13:15:00', '16:30:00', 4, 'Enseignement'),
       (957, 1, 'Dimanche', '18:45:00', '21:00:00', 1, 'Surveillance'),
       (958, 1, 'Lundi', '05:30:00', '07:15:00', 1, 'Surveillance'),
       (959, 1, 'Lundi', '19:45:00', '21:30:00', 1, 'Surveillance'),
       (960, 1, 'Mardi', '20:45:00', '22:30:00', 1, 'Surveillance'),
       (961, 1, 'Mardi', '20:45:00', '22:30:00', 1, 'Surveillance'),
       (962, 1, 'Mercredi', '05:15:00', '07:00:00', 1, 'Surveillance'),
       (963, 1, 'Mercredi', '18:45:00', '20:30:00', 1, 'Surveillance'),
       (964, 1, 'Jeudi', '20:45:00', '22:30:00', 1, 'Surveillance'),
       (965, 1, 'Vendredi', '05:30:00', '07:15:00', 1, 'Surveillance'),
       (966, 1, 'Vendredi', '19:15:00', '21:00:00', 1, 'Surveillance'),
       (967, 1, 'Samedi', '12:45:00', '17:00:00', 1, 'Surveillance'),
       (968, 1, 'Samedi', '18:45:00', '21:00:00', 1, 'Surveillance'),
       (969, 1, 'Dimanche', '08:00:00', '11:00:00', 1, 'Enseignement'),
       (970, 1, 'Dimanche', '11:00:00', '13:30:00', 1, 'Enseignement'),
       (971, 1, 'Dimanche', '15:30:00', '18:30:00', 1, 'Enseignement'),
       (972, 1, 'Lundi', '18:00:00', '20:00:00', 1, 'Enseignement'),
       (973, 1, 'Lundi', '18:30:00', '20:30:00', 1, 'Enseignement'),
       (974, 1, 'Mardi', '16:00:00', '17:00:00', 1, 'Enseignement'),
       (975, 1, 'Mardi', '18:00:00', '20:00:00', 1, 'Enseignement'),
       (976, 1, 'Mardi', '19:00:00', '20:30:00', 1, 'Enseignement'),
       (977, 1, 'Mardi', '20:00:00', '21:00:00', 1, 'Enseignement'),
       (978, 1, 'Mercredi', '18:00:00', '21:00:00', 1, 'Enseignement'),
       (979, 1, 'Mercredi', '20:30:00', '22:30:00', 1, 'Enseignement'),
       (980, 1, 'Mercredi', '20:00:00', '21:00:00', 1, 'Enseignement'),
       (981, 1, 'Jeudi', '16:00:00', '17:00:00', 1, 'Enseignement'),
       (982, 1, 'Jeudi', '18:00:00', '20:00:00', 1, 'Enseignement'),
       (983, 1, 'Jeudi', '19:00:00', '20:30:00', 1, 'Enseignement'),
       (984, 1, 'Jeudi', '20:00:00', '21:00:00', 1, 'Enseignement'),
       (985, 1, 'Jeudi', '20:00:00', '21:00:00', 1, 'Enseignement'),
       (986, 1, 'Vendredi', '18:00:00', '19:30:00', 1, 'Enseignement'),
       (987, 1, 'Vendredi', '19:00:00', '21:00:00', 1, 'Enseignement'),
       (988, 1, 'Samedi', '08:00:00', '11:00:00', 1, 'Enseignement'),
       (989, 1, 'Samedi', '13:15:00', '17:30:00', 1, 'Enseignement'),
       (990, 1, 'Samedi', '16:00:00', '21:00:00', 1, 'Enseignement'),
       (991, 1, 'Samedi', '16:00:00', '21:00:00', 1, 'Enseignement'),
       (992, 1, 'Samedi', '13:00:00', '18:00:00', 1, 'Enseignement'),
       (993, 1, 'Samedi', '13:00:00', '18:00:00', 1, 'Enseignement'),
       (994, 1, 'Samedi', '13:00:00', '18:00:00', 1, 'Enseignement');

-- --------------------------------------------------------

--
-- Table structure for table `availability_instructions`
--

CREATE TABLE `availability_instructions`
(
    `sch_id`     int(11)     NOT NULL,
    `title`      varchar(30) NOT NULL,
    `deadline`   date        NOT NULL,
    `gen_info`   longtext DEFAULT NULL,
    `meet_info`  longtext DEFAULT NULL,
    `guidelines` longtext DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `availability_instructions`
--

INSERT INTO `availability_instructions` (`sch_id`, `title`, `deadline`, `gen_info`, `meet_info`, `guidelines`)
VALUES (1, 'Hiver 2021', '2020-02-21',
        'Les cours de natation se dérouleront du 6 janvier au 15 mars 2020 (10 sem.). Relâche à LT SEUL. le 1er-2-3 février (reprise les 16-21-22 mars)\r\n    \r\n    Les cours de mise en forme se dérouleront du 6 janvier au 19 mars (11 sem.). \r\n    \r\n    Les bains libres se dérouleront du dimanche 5 janvier au vendredi 3 avril.',
        'Réunion des chefs moniteurs\r\nJeudi 19 décembre : 18 h à 20 h --- Hôtel de Ville\r\n\r\nRéunion et entraînement des moniteurs (MS, MSN, MSA, Aquaforme)\r\nVendredi 3 janvier : 11 h à 13 h --- Piscine Antoine-Brossard - Les absences doivent être justifiées avant le 20 décembre 2019\r\n\r\nRéunion du personnel aquatique (TOUS) \r\nVendredi 3 janvier : 10 h à 11 h --- Piscine Antoine-Brossard - Les absences doivent être justifiées avant le 20 décembre 2019\r\n',
        'En cas de désistement, l\'employé doit remettre une preuve démontrant un conflit d\'horaire entre les disponibilités soumises et son horaire scolaire non connu au moment du dépôt des disponibilités OU remettre un billet médical qui ordonne un arrêt de travail balisé par une date de début et date de fin.\r\nLorsque deux compétences sont nécessaires pour le même bloc, l\'ancienneté sera établie en fonction de la compétence en rouge.\r\nVous devez sélectionner des blocs pré établis (blocs indissociables) complets. \r\nVous pouvez sélectionner plus d\'un bloc par jour.\r\nVous devez indiquer un nombre maximum d\'heures souhaitées. Le minimum est à titre indicatif.\r\nVous devez avoir vos cartes de compétences à jour et valides pour obtenir un horaire.\r\nLes préférences sont à titre indicatif. La division aquatique ne s\'engage pas à les respecter.  \r\n\r\nRAPPELS\r\nMaximum 2 remplacements par quart de travail pour l\'enseignement;\r\nLes moniteurs de natation doivent étre disponibles au cours 1 (semaine du 6 au 12 janvier) et au cours de remise des carnets (semaine du 9 au 15 mars + 21-22 mars pour LT). SVP indiquez vos indisponibilités s\'il y a lieu.\r\n'),
       (2, 'Automne 2020', '2020-02-09',
        'Les cours de natation se dérouleront du 6 janvier au 15 mars 2020 (10 sem.). Relâche à LT SEUL. le 1er-2-3 février (reprise les 16-21-22 mars)\r\n    \r\n    Les cours de mise en forme se dérouleront du 6 janvier au 19 mars (11 sem.). \r\n    \r\n    Les bains libres se dérouleront du dimanche 5 janvier au vendredi 3 avril.',
        'Réunion des chefs moniteurs\r\nJeudi 19 décembre : 18 h à 20 h --- Hôtel de Ville\r\n\r\nRéunion et entraînement des moniteurs (MS, MSN, MSA, Aquaforme)\r\nVendredi 3 janvier : 11 h à 13 h --- Piscine Antoine-Brossard - Les absences doivent être justifiées avant le 20 décembre 2019\r\n\r\nRéunion du personnel aquatique (TOUS) \r\nVendredi 3 janvier : 10 h à 11 h --- Piscine Antoine-Brossard - Les absences doivent être justifiées avant le 20 décembre 2019\r\n',
        'En cas de désistement, l\'employé doit remettre une preuve démontrant un conflit d\'horaire entre les disponibilités soumises et son horaire scolaire non connu au moment du dépôt des disponibilités OU remettre un billet médical qui ordonne un arrêt de travail balisé par une date de début et date de fin.\r\nLorsque deux compétences sont nécessaires pour le même bloc, l\'ancienneté sera établie en fonction de la compétence en rouge.\r\nVous devez sélectionner des blocs pré établis (blocs indissociables) complets. \r\nVous pouvez sélectionner plus d\'un bloc par jour.\r\nVous devez indiquer un nombre maximum d\'heures souhaitées. Le minimum est à titre indicatif.\r\nVous devez avoir vos cartes de compétences à jour et valides pour obtenir un horaire.\r\nLes préférences sont à titre indicatif. La division aquatique ne s\'engage pas à les respecter.  \r\n\r\nRAPPELS\r\nMaximum 2 remplacements par quart de travail pour l\'enseignement;\r\nLes moniteurs de natation doivent étre disponibles au cours 1 (semaine du 6 au 12 janvier) et au cours de remise des carnets (semaine du 9 au 15 mars + 21-22 mars pour LT). SVP indiquez vos indisponibilités s\'il y a lieu.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade`
(
    `grade_id` int(11) NOT NULL,
    `quiz_id`  int(11) NOT NULL,
    `user_id`  int(11) NOT NULL,
    `result`   decimal(6, 2) DEFAULT 0.00
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

CREATE TABLE `qualification`
(
    `qualification_id` int(4)                                     NOT NULL,
    `qual_name`        varchar(35) COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_520_ci;

--
-- Dumping data for table `qualification`
--

INSERT INTO `qualification` (`qualification_id`, `qual_name`)
VALUES (1, 'SN'),
       (2, 'MSA'),
       (3, 'MS'),
       (4, 'MSU'),
       (5, 'MSN'),
       (6, 'ISA'),
       (7, 'AQF'),
       (8, 'SN + MSA'),
       (9, 'SN + AQF');

-- --------------------------------------------------------

--
-- Table structure for table `qualified_user`
--

CREATE TABLE `qualified_user`
(
    `user_id`              int(7) NOT NULL,
    `qualification_id`     int(4) NOT NULL,
    `qual_emitted`         date                                        DEFAULT NULL,
    `qual_expiry`          date   NOT NULL,
    `requalification_note` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
    `notes`                varchar(60) COLLATE utf8mb4_unicode_520_ci  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_520_ci;

--
-- Dumping data for table `qualified_user`
--

INSERT INTO `qualified_user` (`user_id`, `qualification_id`, `qual_emitted`, `qual_expiry`, `requalification_note`,
                              `notes`)
VALUES (722888, 1, NULL, '2019-06-01', 'EXP DEC 2019', ''),
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

INSERT INTO `role` (`role_id`, `role_name`, `role_is_admin`) VALUES (1, 'user', 0),
                                                                    (2, 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule`
(
    `sch_id`         int(7) NOT NULL,
    `sch_start_date` date   NOT NULL,
    `sch_end_date`   date   NOT NULL,
    `title`          varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_520_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`sch_id`, `sch_start_date`, `sch_end_date`, `title`)
VALUES (1, '2020-01-01', '2020-04-03', 'Hiver 2029'),
       (2, '2020-01-31', '2020-03-27', 'Automne 2020'),
       (4, '2020-01-02', '2020-01-16', 'Relaaache');

-- --------------------------------------------------------

--
-- Table structure for table `seniority`
--

CREATE TABLE `seniority`
(
    `seniority_id`      int(11)                                    NOT NULL,
    `user_id`           int(11)                                    NOT NULL,
    `seniority_type`    varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `hours`             double(10, 2)                              NOT NULL,
    `continued_service` date                                       NOT NULL,
    `seniority_loss`    varchar(40) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_520_ci;

--
-- Dumping data for table `seniority`
--

INSERT INTO `seniority` (`seniority_id`, `user_id`, `seniority_type`, `hours`, `continued_service`, `seniority_loss`)
VALUES (1123, 800017, 'surveillance', 3033.92, '2015-03-02', NULL),
       (1124, 800029, 'surveillance', 2599.42, '2015-03-02', NULL),
       (1125, 800039, 'surveillance', 2466.09, '2015-03-02', NULL),
       (1126, 800038, 'surveillance', 2248.09, '2015-03-02', NULL),
       (1127, 800001, 'surveillance', 1989.34, '2015-03-02', NULL),
       (1128, 800057, 'surveillance', 1892.66, '2015-05-27', NULL),
       (1129, 800027, 'surveillance', 1846.08, '2015-03-02', NULL),
       (1130, 800014, 'surveillance', 1799.08, '2015-03-02', NULL),
       (1131, 800004, 'surveillance', 1680.50, '2015-03-28', NULL),
       (1132, 800079, 'surveillance', 1511.75, '2016-05-28', NULL),
       (1133, 800032, 'surveillance', 1427.25, '2015-03-28', NULL),
       (1134, 800009, 'surveillance', 1315.25, '2015-03-02', NULL),
       (1135, 800048, 'surveillance', 1264.76, '2015-05-27', NULL),
       (1136, 800003, 'surveillance', 1264.17, '2015-03-28', NULL),
       (1137, 800018, 'surveillance', 1245.42, '2015-03-28', NULL),
       (1138, 800062, 'surveillance', 1216.42, '2015-05-27', NULL),
       (1139, 800010, 'surveillance', 1171.33, '2015-03-14', NULL),
       (1140, 800023, 'surveillance', 1098.92, '2015-03-28', NULL),
       (1141, 800015, 'surveillance', 1069.38, '2015-03-28', NULL),
       (1142, 800090, 'surveillance', 1065.22, '2017-01-06', NULL),
       (1143, 800059, 'surveillance', 1059.91, '2015-05-27', NULL),
       (1144, 800081, 'surveillance', 1038.25, '2016-05-28', NULL),
       (1145, 800078, 'surveillance', 1008.50, '2016-05-28', NULL),
       (1146, 800022, 'surveillance', 930.01, '2015-03-28', NULL),
       (1147, 800040, 'surveillance', 904.17, '2015-03-14', NULL),
       (1148, 800116, 'surveillance', 899.00, '2017-05-27', NULL),
       (1149, 800100, 'surveillance', 850.83, '2017-05-27', NULL),
       (1150, 800088, 'surveillance', 846.75, '2017-01-06', NULL),
       (1151, 800108, 'surveillance', 826.58, '2017-05-27', NULL),
       (1152, 800021, 'surveillance', 782.09, '2015-03-28', NULL),
       (1153, 800089, 'surveillance', 733.50, '2017-01-06', NULL),
       (1154, 800111, 'surveillance', 699.75, '2017-05-27', NULL),
       (1155, 800104, 'surveillance', 685.67, '2017-05-27', NULL),
       (1156, 800099, 'surveillance', 640.00, '2017-05-27', NULL),
       (1157, 800073, 'surveillance', 617.17, '2015-09-14', NULL),
       (1158, 800126, 'surveillance', 605.00, '2017-09-16', NULL),
       (1159, 800127, 'surveillance', 590.13, '2017-09-16', NULL),
       (1160, 800083, 'surveillance', 570.08, '2016-07-05', NULL),
       (1161, 800093, 'surveillance', 553.83, '2017-02-27', NULL),
       (1162, 800105, 'surveillance', 501.33, '2017-05-27', NULL),
       (1163, 800114, 'surveillance', 480.17, '2017-05-27', NULL),
       (1164, 800041, 'surveillance', 473.00, '2015-03-17', NULL),
       (1165, 800109, 'surveillance', 457.25, '2017-05-27', NULL),
       (1166, 800124, 'surveillance', 438.92, '2017-09-16', NULL),
       (1167, 800097, 'surveillance', 428.00, '2017-05-27', NULL),
       (1168, 800142, 'surveillance', 408.88, '2018-05-26', NULL),
       (1169, 800091, 'surveillance', 393.75, '2017-01-06', NULL),
       (1170, 800118, 'surveillance', 337.26, '2017-05-27', NULL),
       (1171, 800107, 'surveillance', 306.59, '2017-05-27', NULL),
       (1172, 800149, 'surveillance', 299.17, '2018-05-26', NULL),
       (1173, 800077, 'surveillance', 275.17, '2016-05-28', NULL),
       (1174, 800128, 'surveillance', 250.92, '2018-01-11', NULL),
       (1175, 800139, 'surveillance', 238.67, '2018-05-26', NULL),
       (1176, 800049, 'surveillance', 235.50, '2015-05-27', NULL),
       (1177, 800148, 'surveillance', 205.60, '2018-05-26', NULL),
       (1178, 800120, 'surveillance', 200.17, '2017-08-31', NULL),
       (1179, 800130, 'surveillance', 195.67, '2018-03-26', NULL),
       (1180, 800137, 'surveillance', 186.75, '2018-05-26', NULL),
       (1181, 800101, 'surveillance', 185.00, '2017-05-27', NULL),
       (1182, 800168, 'surveillance', 168.25, '2019-05-25', NULL),
       (1183, 800153, 'surveillance', 164.00, '2019-03-28', NULL),
       (1184, 800113, 'surveillance', 129.17, '2017-05-27', NULL),
       (1185, 800131, 'surveillance', 106.42, '2018-03-26', NULL),
       (1186, 800158, 'surveillance', 104.17, '2019-05-25', NULL),
       (1187, 800167, 'surveillance', 97.00, '2019-05-25', NULL),
       (1188, 800136, 'surveillance', 90.66, '2018-05-26', NULL),
       (1189, 800042, 'surveillance', 65.50, '2015-03-24', NULL),
       (1190, 800164, 'surveillance', 61.25, '2019-05-25', NULL),
       (1191, 758300, 'surveillance', 43.25, '2019-05-25', NULL),
       (1192, 800132, 'surveillance', 37.00, '2018-05-26', NULL),
       (1193, 800135, 'surveillance', 35.00, '2018-05-26', NULL),
       (1194, 800157, 'surveillance', 33.33, '2019-05-25', NULL),
       (1195, 800160, 'surveillance', 26.50, '2019-05-25', NULL),
       (1196, 800161, 'surveillance', 25.42, '2019-05-25', NULL),
       (1197, 800165, 'surveillance', 24.50, '2019-05-25', NULL),
       (1198, 800166, 'surveillance', 23.75, '2019-05-25', NULL),
       (1199, 800092, 'surveillance', 23.50, '2017-02-27', NULL),
       (1200, 800151, 'surveillance', 14.50, '2019-03-28', NULL),
       (1201, 800156, 'surveillance', 11.25, '2019-05-25', NULL),
       (1202, 800122, 'surveillance', 10.50, '2017-08-30', NULL),
       (1203, 800155, 'surveillance', 7.25, '2019-05-25', NULL),
       (1204, 750045, 'surveillance', 5.25, '2019-05-25', NULL),
       (1205, 800152, 'surveillance', 2.00, '2019-03-28', NULL),
       (1206, 800033, 'surveillance', 0.00, '2019-01-17', NULL),
       (1207, 800037, 'surveillance', 214.25, '2015-03-14', NULL),
       (1208, 800117, 'surveillance', 698.50, '2017-05-27', NULL),
       (1209, 800145, 'surveillance', 217.67, '2018-05-26', NULL),
       (1210, 722888, 'surveillance', 922.50, '2015-01-24', NULL),
       (1211, 800133, 'surveillance', 38.42, '2018-05-26', NULL),
       (1212, 800154, 'surveillance', 7.25, '2019-03-28', NULL),
       (1213, 800169, 'surveillance', 0.00, '2019-09-05', NULL),
       (1214, 800170, 'surveillance', 0.00, '2019-09-17', NULL),
       (1215, 800171, 'surveillance', 0.00, '2019-10-18', NULL),
       (1216, 800086, 'surveillance', 0.00, '2019-10-30', NULL),
       (1309, 800018, 'enseignement', 2660.34, '2015-03-02', NULL),
       (1310, 800010, 'enseignement', 2117.15, '2015-03-02', NULL),
       (1311, 800009, 'enseignement', 2030.50, '2015-03-02', NULL),
       (1312, 800022, 'enseignement', 1577.00, '2015-03-02', NULL),
       (1313, 800014, 'enseignement', 1333.33, '2015-03-02', NULL),
       (1314, 800021, 'enseignement', 1293.50, '2015-03-28', NULL),
       (1315, 800073, 'enseignement', 1230.24, '2015-09-14', NULL),
       (1316, 800077, 'enseignement', 1035.75, '2016-05-28', NULL),
       (1317, 800015, 'enseignement', 1030.25, '2015-03-02', NULL),
       (1318, 800107, 'enseignement', 988.92, '2017-05-27', NULL),
       (1319, 800041, 'enseignement', 953.38, '2015-03-02', NULL),
       (1320, 800042, 'enseignement', 927.00, '2015-03-02', NULL),
       (1321, 800001, 'enseignement', 748.83, '2015-03-02', NULL),
       (1322, 800059, 'enseignement', 741.50, '2015-05-27', NULL),
       (1323, 800090, 'enseignement', 671.25, '2016-12-21', NULL),
       (1324, 800093, 'enseignement', 669.50, '2017-02-10', NULL),
       (1325, 800023, 'enseignement', 645.00, '2015-03-02', NULL),
       (1326, 800101, 'enseignement', 643.00, '2017-05-27', NULL),
       (1327, 800078, 'enseignement', 634.92, '2016-05-28', NULL),
       (1328, 800118, 'enseignement', 626.25, '2017-05-27', NULL),
       (1329, 800089, 'enseignement', 607.50, '2016-12-15', NULL),
       (1330, 800130, 'enseignement', 559.50, '2018-03-26', NULL),
       (1331, 800113, 'enseignement', 545.34, '2017-05-27', NULL),
       (1332, 800079, 'enseignement', 529.25, '2016-05-28', NULL),
       (1333, 800088, 'enseignement', 431.09, '2016-12-02', NULL),
       (1334, 800105, 'enseignement', 399.25, '2017-05-27', NULL),
       (1335, 800083, 'enseignement', 377.75, '2016-05-28', NULL),
       (1336, 800127, 'enseignement', 377.34, '2017-09-16', NULL),
       (1337, 800120, 'enseignement', 370.83, '2017-08-31', NULL),
       (1338, 800091, 'enseignement', 324.25, '2016-12-21', NULL),
       (1339, 800017, 'enseignement', 315.25, '2015-03-02', NULL),
       (1340, 800126, 'enseignement', 310.92, '2017-09-16', NULL),
       (1341, 800092, 'enseignement', 309.64, '2017-02-10', NULL),
       (1342, 800122, 'enseignement', 301.00, '2017-08-30', NULL),
       (1343, 800131, 'enseignement', 292.45, '2018-03-26', NULL),
       (1344, 800124, 'enseignement', 278.00, '2017-09-16', NULL),
       (1345, 800148, 'enseignement', 271.00, '2018-05-26', NULL),
       (1346, 800004, 'enseignement', 248.92, '2015-03-02', NULL),
       (1347, 800057, 'enseignement', 248.25, '2015-05-27', NULL),
       (1348, 800142, 'enseignement', 237.75, '2018-05-26', NULL),
       (1349, 800116, 'enseignement', 231.17, '2017-05-27', NULL),
       (1350, 800097, 'enseignement', 226.75, '2017-05-27', NULL),
       (1351, 800040, 'enseignement', 206.84, '2015-03-02', NULL),
       (1352, 800038, 'enseignement', 204.75, '2015-03-02', NULL),
       (1353, 800139, 'enseignement', 203.42, '2018-05-26', NULL),
       (1354, 800100, 'enseignement', 186.00, '2017-05-27', NULL),
       (1355, 800039, 'enseignement', 183.25, '2015-03-02', NULL),
       (1356, 800136, 'enseignement', 159.25, '2018-05-26', NULL),
       (1357, 800128, 'enseignement', 94.50, '2018-01-11', NULL),
       (1358, 800029, 'enseignement', 85.00, '2015-03-02', NULL),
       (1359, 800109, 'enseignement', 66.25, '2017-05-27', NULL),
       (1360, 800149, 'enseignement', 60.45, '2018-05-26', NULL),
       (1361, 800153, 'enseignement', 59.50, '2019-03-28', NULL),
       (1362, 800137, 'enseignement', 40.00, '2018-05-26', NULL),
       (1363, 800135, 'enseignement', 33.50, '2018-05-26', NULL),
       (1364, 800161, 'enseignement', 21.50, '2019-05-25', NULL),
       (1365, 800152, 'enseignement', 19.00, '2019-03-28', NULL),
       (1366, 800156, 'enseignement', 15.95, '2019-05-25', NULL),
       (1367, 800081, 'enseignement', 12.50, '2016-05-28', NULL),
       (1368, 800166, 'enseignement', 11.00, '2019-05-25', NULL),
       (1369, 800151, 'enseignement', 9.00, '2019-03-28', NULL),
       (1370, 800114, 'enseignement', 9.00, '2017-05-27', NULL),
       (1371, 800132, 'enseignement', 8.25, '2018-05-26', NULL),
       (1372, 800167, 'enseignement', 7.00, '2019-05-25', NULL),
       (1373, 800032, 'enseignement', 2.75, '2015-03-02', NULL),
       (1374, 800048, 'enseignement', 1.00, '2015-05-27', NULL),
       (1375, 800062, 'enseignement', 0.50, '2015-05-27', NULL),
       (1376, 800049, 'enseignement', 0.00, '2015-05-27', NULL),
       (1377, 800155, 'enseignement', 0.00, '2019-05-25', NULL),
       (1378, 800157, 'enseignement', 0.00, '2019-05-25', NULL),
       (1379, 800158, 'enseignement', 0.00, '2019-05-25', NULL),
       (1380, 750045, 'enseignement', 0.00, '2019-05-25', NULL),
       (1381, 800099, 'enseignement', 0.00, '2017-05-27', NULL),
       (1382, 800160, 'enseignement', 0.00, '2019-05-25', NULL),
       (1383, 800104, 'enseignement', 0.00, '2017-05-27', NULL),
       (1384, 800108, 'enseignement', 0.00, '2017-05-27', NULL),
       (1385, 758300, 'enseignement', 0.00, '2019-05-25', NULL),
       (1386, 800033, 'enseignement', 0.00, '2019-01-17', NULL),
       (1387, 800164, 'enseignement', 0.00, '2019-05-25', NULL),
       (1388, 800111, 'enseignement', 0.00, '2017-05-27', NULL),
       (1389, 800165, 'enseignement', 0.00, '2019-05-25', NULL),
       (1390, 800168, 'enseignement', 0.00, '2019-05-25', NULL),
       (1391, 800037, 'enseignement', 635.58, '2015-03-14', NULL),
       (1392, 800133, 'enseignement', 0.00, '2018-05-26', NULL),
       (1393, 800117, 'enseignement', 0.00, '2017-05-27', NULL),
       (1394, 800145, 'enseignement', 173.00, '2018-05-26', NULL),
       (1395, 722888, 'enseignement', 1394.25, '1970-01-01', NULL),
       (1396, 800154, 'enseignement', 14.50, '2019-03-28', NULL),
       (1397, 800169, 'enseignement', 0.00, '2019-09-05', NULL),
       (1398, 800170, 'enseignement', 0.00, '2019-09-17', NULL),
       (1399, 800171, 'enseignement', 0.00, '2019-10-18', NULL),
       (1400, 800086, 'enseignement', 0.00, '2019-10-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift`
(
    `shift_id`      int(11)     NOT NULL,
    `schedule_id`   int(11)              DEFAULT NULL,
    `required_qual` int(11)              DEFAULT NULL,
    `start_time`    time        NOT NULL DEFAULT curtime(),
    `end_time`      time        NOT NULL,
    `location`      varchar(30)          DEFAULT NULL,
    `day`           varchar(10) NOT NULL,
    `description`   text                 DEFAULT NULL,
    `start_date`    date        NOT NULL,
    `end_date`      date        NOT NULL,
    `assigned_user` int(11)              DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_id`, `schedule_id`, `required_qual`, `start_time`, `end_time`, `location`, `day`,
                     `description`, `start_date`, `end_date`, `assigned_user`)
VALUES (4683, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'ETOILE GR-01', '2020-01-12', '2020-03-15', NULL),
       (4684, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'ETOILE GR-02', '2020-01-12', '2020-03-15', NULL),
       (4685, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'ETOILE GR-03', '2020-01-12', '2020-03-15', NULL),
       (4686, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mercredi', 'ETOILE GR-04', '2020-01-08', '2020-03-11', NULL),
       (4687, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'ETOILE GR-05', '2020-01-11', '2020-03-14', NULL),
       (4688, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'ETOILE GR-51', '2020-01-12', '2020-03-22', NULL),
       (4689, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'CANARD GR-01', '2020-01-12', '2020-03-15', NULL),
       (4690, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'CANARD GR-02', '2020-01-12', '2020-03-15', NULL),
       (4691, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'CANARD GR-03', '2020-01-12', '2020-03-15', NULL),
       (4692, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'CANARD GR-04', '2020-01-11', '2020-03-14', NULL),
       (4693, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'CANARD GR-05', '2020-01-11', '2020-03-14', NULL),
       (4694, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'CANARD GR-51', '2020-01-12', '2020-03-22', NULL),
       (4695, 2, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'CANARD GR-52', '2020-01-12', '2020-03-22', NULL),
       (4696, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'CANARD GR-53', '2020-01-11', '2020-03-21', NULL),
       (4697, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'CANARD GR-54', '2020-01-11', '2020-03-21', NULL),
       (4698, 2, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'CANARD GR-55', '2020-01-11', '2020-03-21', NULL),
       (4699, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'TORTUE GR-01', '2020-01-12', '2020-03-15', NULL),
       (4700, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'TORTUE GR-02', '2020-01-12', '2020-03-15', NULL),
       (4701, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'TORTUE GR-03', '2020-01-12', '2020-03-15', NULL),
       (4702, 2, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'TORTUE GR-04', '2020-01-12', '2020-03-15', NULL),
       (4703, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mercredi', 'TORTUE GR-05', '2020-01-08', '2020-03-11', NULL),
       (4704, 2, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Mercredi', 'TORTUE GR-06', '2020-01-08', '2020-03-11', NULL),
       (4705, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'TORTUE GR-07', '2020-01-11', '2020-03-14', NULL),
       (4706, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'TORTUE GR-08', '2020-01-11', '2020-03-14', NULL),
       (4707, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'TORTUE GR-09', '2020-01-11', '2020-03-14', NULL),
       (4708, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'TORTUE GR-51', '2020-01-12', '2020-03-22', NULL),
       (4709, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'TORTUE GR-52', '2020-01-12', '2020-03-22', NULL),
       (4710, 2, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'TORTUE GR-53', '2020-01-12', '2020-03-22', NULL),
       (4711, 2, 2, '18:30:00', '18:55:00', 'PIS-LT', 'Lundi', 'TORTUE GR-54', '2020-01-06', '2020-03-09', NULL),
       (4712, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'TORTUE GR-55', '2020-01-11', '2020-03-21', NULL),
       (4713, 2, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'TORTUE GR-56', '2020-01-11', '2020-03-21', NULL),
       (4714, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-01', '2020-01-12', '2020-03-15', NULL),
       (4715, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-02', '2020-01-12', '2020-03-15', NULL),
       (4716, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-03', '2020-01-12', '2020-03-15', NULL),
       (4717, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-04', '2020-01-12', '2020-03-15', NULL),
       (4718, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'LOUTRE GR-05', '2020-01-12', '2020-03-15', NULL),
       (4719, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mardi', 'LOUTRE GR-06', '2020-01-07', '2020-03-10', NULL),
       (4720, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Jeudi', 'LOUTRE GR-07', '2020-01-09', '2020-03-12', NULL),
       (4721, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Jeudi', 'LOUTRE GR-08', '2020-01-09', '2020-03-12', NULL),
       (4722, 2, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Jeudi', 'LOUTRE GR-09', '2020-01-09', '2020-03-12', NULL),
       (4723, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'LOUTRE GR-10', '2020-01-11', '2020-03-14', NULL),
       (4724, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'LOUTRE GR-11', '2020-01-11', '2020-03-14', NULL),
       (4725, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Samedi', 'LOUTRE GR-12', '2020-01-11', '2020-03-14', NULL),
       (4726, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-51', '2020-01-12', '2020-03-22', NULL),
       (4727, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-52', '2020-01-12', '2020-03-22', NULL),
       (4728, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-53', '2020-01-12', '2020-03-22', NULL),
       (4729, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-54', '2020-01-12', '2020-03-22', NULL),
       (4730, 2, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-55', '2020-01-12', '2020-03-22', NULL),
       (4731, 2, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'LOUTRE GR-56', '2020-01-12', '2020-03-22', NULL),
       (4732, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Lundi', 'LOUTRE GR-57', '2020-01-06', '2020-03-09', NULL),
       (4733, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Jeudi', 'LOUTRE GR-58', '2020-01-09', '2020-03-12', NULL),
       (4734, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'LOUTRE GR-59', '2020-01-11', '2020-03-21', NULL),
       (4735, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'LOUTRE GR-60', '2020-01-11', '2020-03-21', NULL),
       (4736, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'LOUTRE GR-61', '2020-01-11', '2020-03-21', NULL),
       (4737, 2, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'LOUTRE GR-62', '2020-01-11', '2020-03-21', NULL),
       (4738, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-01', '2020-01-12', '2020-03-15', NULL),
       (4739, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-02', '2020-01-12', '2020-03-15', NULL),
       (4740, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-03', '2020-01-12', '2020-03-15', NULL),
       (4741, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-04', '2020-01-12', '2020-03-15', NULL),
       (4742, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-05', '2020-01-12', '2020-03-15', NULL),
       (4743, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-06', '2020-01-12', '2020-03-15', NULL),
       (4744, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-07', '2020-01-12', '2020-03-15', NULL),
       (4745, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-08', '2020-01-12', '2020-03-15', NULL),
       (4746, 2, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'SALAMANDRE GR-09', '2020-01-12', '2020-03-15', NULL),
       (4747, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mardi', 'SALAMANDRE GR-10', '2020-01-07', '2020-03-10', NULL),
       (4748, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mercredi', 'SALAMANDRE GR-11', '2020-01-08', '2020-03-11', NULL),
       (4749, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mercredi', 'SALAMANDRE GR-12', '2020-01-08', '2020-03-11', NULL),
       (4750, 2, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Mercredi', 'SALAMANDRE GR-13', '2020-01-08', '2020-03-11', NULL),
       (4751, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Jeudi', 'SALAMANDRE GR-14', '2020-01-09', '2020-03-12', NULL),
       (4752, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Vendredi', 'SALAMANDRE GR-15', '2020-01-10', '2020-03-13', NULL),
       (4753, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-16', '2020-01-11', '2020-03-14', NULL),
       (4754, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-17', '2020-01-11', '2020-03-14', NULL),
       (4755, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-18', '2020-01-11', '2020-03-14', NULL),
       (4756, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-19', '2020-01-11', '2020-03-14', NULL),
       (4757, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-20', '2020-01-11', '2020-03-14', NULL),
       (4758, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-21', '2020-01-11', '2020-03-14', NULL),
       (4759, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-22', '2020-01-11', '2020-03-14', NULL),
       (4760, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-23', '2020-01-11', '2020-03-14', NULL),
       (4761, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-24', '2020-01-11', '2020-03-14', NULL),
       (4762, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-25', '2020-01-11', '2020-03-14', NULL),
       (4763, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Samedi', 'SALAMANDRE GR-26', '2020-01-11', '2020-03-14', NULL),
       (4764, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-51', '2020-01-12', '2020-03-22', NULL),
       (4765, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-52', '2020-01-12', '2020-03-22', NULL),
       (4766, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-53', '2020-01-12', '2020-03-22', NULL),
       (4767, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-54', '2020-01-12', '2020-03-22', NULL),
       (4768, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-55', '2020-01-12', '2020-03-22', NULL),
       (4769, 2, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-56', '2020-01-12', '2020-03-22', NULL),
       (4770, 2, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-57', '2020-01-12', '2020-03-22', NULL),
       (4771, 2, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'SALAMANDRE GR-58', '2020-01-12', '2020-03-22', NULL),
       (4772, 2, 2, '18:30:00', '18:55:00', 'PIS-LT', 'Lundi', 'SALAMANDRE GR-59', '2020-01-06', '2020-03-09', NULL),
       (4773, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Lundi', 'SALAMANDRE GR-60', '2020-01-06', '2020-03-09', NULL),
       (4774, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'SALAMANDRE GR-61', '2020-01-10', '2020-03-13', NULL),
       (4775, 2, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Vendredi', 'SALAMANDRE GR-62', '2020-01-10', '2020-03-13', NULL),
       (4776, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-63', '2020-01-11', '2020-03-21', NULL),
       (4777, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-64', '2020-01-11', '2020-03-21', NULL),
       (4778, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-65', '2020-01-11', '2020-03-21', NULL),
       (4779, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-66', '2020-01-11', '2020-03-21', NULL),
       (4780, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-67', '2020-01-11', '2020-03-21', NULL),
       (4781, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-68', '2020-01-11', '2020-03-21', NULL),
       (4782, 2, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-69', '2020-01-11', '2020-03-21', NULL),
       (4783, 2, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'SALAMANDRE GR-70', '2020-01-11', '2020-03-21', NULL),
       (4784, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'POISSON GR-01', '2020-01-12', '2020-03-15', NULL),
       (4785, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'POISSON GR-02', '2020-01-12', '2020-03-15', NULL),
       (4786, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'POISSON GR-03', '2020-01-12', '2020-03-15', NULL),
       (4787, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'POISSON GR-04', '2020-01-12', '2020-03-15', NULL),
       (4788, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'POISSON GR-05', '2020-01-12', '2020-03-15', NULL),
       (4789, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mercredi', 'POISSON GR-06', '2020-01-08', '2020-03-11', NULL),
       (4790, 2, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Mercredi', 'POISSON GR-07', '2020-01-08', '2020-03-11', NULL),
       (4791, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Jeudi', 'POISSON GR-08', '2020-01-09', '2020-03-12', NULL),
       (4792, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'POISSON GR-09', '2020-01-11', '2020-03-14', NULL),
       (4793, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'POISSON GR-10', '2020-01-11', '2020-03-14', NULL),
       (4794, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'POISSON GR-11', '2020-01-11', '2020-03-14', NULL),
       (4795, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'POISSON GR-51', '2020-01-12', '2020-03-22', NULL),
       (4796, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'POISSON GR-52', '2020-01-12', '2020-03-22', NULL),
       (4797, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'POISSON GR-53', '2020-01-12', '2020-03-22', NULL),
       (4798, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'POISSON GR-54', '2020-01-12', '2020-03-22', NULL),
       (4799, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'POISSON GR-55', '2020-01-10', '2020-03-13', NULL),
       (4800, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'POISSON GR-56', '2020-01-10', '2020-03-13', NULL),
       (4801, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'POISSON GR-57', '2020-01-11', '2020-03-21', NULL),
       (4802, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'POISSON GR-58', '2020-01-11', '2020-03-21', NULL),
       (4803, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'POISSON GR-59', '2020-01-11', '2020-03-21', NULL),
       (4804, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'POISSON GR-60', '2020-01-11', '2020-03-21', NULL),
       (4805, 2, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'POISSON GR-61', '2020-01-11', '2020-03-21', NULL),
       (4806, 2, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'POISSON GR-62', '2020-01-11', '2020-03-21', NULL),
       (4807, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'CROCODILE GR-01', '2020-01-12', '2020-03-15', NULL),
       (4808, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'CROCODILE GR-02', '2020-01-12', '2020-03-15', NULL),
       (4809, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'CROCODILE GR-03', '2020-01-12', '2020-03-15', NULL),
       (4810, 2, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'CROCODILE GR-04', '2020-01-12', '2020-03-15', NULL),
       (4811, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mardi', 'CROCODILE GR-05', '2020-01-07', '2020-03-10', NULL),
       (4812, 2, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Mercredi', 'CROCODILE GR-06', '2020-01-08', '2020-03-11', NULL),
       (4813, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Jeudi', 'CROCODILE GR-07', '2020-01-09', '2020-03-12', NULL),
       (4814, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'CROCODILE GR-08', '2020-01-11', '2020-03-14', NULL),
       (4815, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'CROCODILE GR-09', '2020-01-11', '2020-03-14', NULL),
       (4816, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'CROCODILE GR-51', '2020-01-12', '2020-03-22', NULL),
       (4817, 2, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'CROCODILE GR-52', '2020-01-12', '2020-03-22', NULL),
       (4818, 2, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Vendredi', 'CROCODILE GR-53', '2020-01-10', '2020-03-13', NULL),
       (4819, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'CROCODILE GR-54', '2020-01-11', '2020-03-21', NULL),
       (4820, 2, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'CROCODILE GR-55', '2020-01-11', '2020-03-21', NULL),
       (4821, 2, 2, '11:30:00', '11:55:00', 'AB', 'Dimanche', 'BALEINE GR-01', '2020-01-12', '2020-03-15', NULL),
       (4822, 2, 2, '18:30:00', '18:55:00', 'AB', 'Mardi', 'BALEINE GR-02', '2020-01-07', '2020-03-10', NULL),
       (4823, 2, 2, '09:30:00', '09:55:00', 'AB', 'Samedi', 'BALEINE GR-03', '2020-01-11', '2020-03-14', NULL),
       (4824, 2, 2, '12:30:00', '12:55:00', 'AB', 'Samedi', 'BALEINE GR-04', '2020-01-11', '2020-03-14', NULL),
       (4825, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'BALEINE GR-51', '2020-01-12', '2020-03-22', NULL),
       (4826, 2, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Vendredi', 'BALEINE GR-52', '2020-01-10', '2020-03-13', NULL),
       (4827, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'J01 GR-01', '2020-01-12', '2020-03-15', NULL),
       (4828, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'J01 GR-02', '2020-01-12', '2020-03-15', NULL),
       (4829, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'J01 GR-03', '2020-01-12', '2020-03-15', NULL),
       (4830, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'J01 GR-04', '2020-01-12', '2020-03-15', NULL),
       (4831, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'J01 GR-05', '2020-01-12', '2020-03-15', NULL),
       (4832, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'J01 GR-06', '2020-01-12', '2020-03-15', NULL),
       (4833, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'J01 GR-07', '2020-01-12', '2020-03-15', NULL),
       (4834, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'J01 GR-08', '2020-01-12', '2020-03-15', NULL),
       (4835, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mardi', 'J01 GR-09', '2020-01-07', '2020-03-10', NULL),
       (4836, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mardi', 'J01 GR-10', '2020-01-07', '2020-03-10', NULL),
       (4837, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mercredi', 'J01 GR-11', '2020-01-08', '2020-03-11', NULL),
       (4838, 2, 2, '19:00:00', '19:25:00', 'PIS-AB', 'Mercredi', 'J01 GR-12', '2020-01-08', '2020-03-11', NULL),
       (4839, 2, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Mercredi', 'J01 GR-13', '2020-01-08', '2020-03-11', NULL),
       (4840, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'J01 GR-14', '2020-01-11', '2020-03-14', NULL),
       (4841, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'J01 GR-15', '2020-01-11', '2020-03-14', NULL),
       (4842, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'J01 GR-16', '2020-01-11', '2020-03-14', NULL),
       (4843, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'J01 GR-17', '2020-01-11', '2020-03-14', NULL),
       (4844, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'J01 GR-18', '2020-01-11', '2020-03-14', NULL),
       (4845, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Samedi', 'J01 GR-19', '2020-01-11', '2020-03-14', NULL),
       (4846, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Samedi', 'J01 GR-20', '2020-01-11', '2020-03-14', NULL),
       (4847, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'J01 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4848, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'J01 GR-52', '2020-01-12', '2020-03-22', NULL),
       (4849, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'J01 GR-53', '2020-01-12', '2020-03-22', NULL),
       (4850, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'J01 GR-54', '2020-01-12', '2020-03-22', NULL),
       (4851, 2, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'J01 GR-55', '2020-01-12', '2020-03-22', NULL),
       (4852, 2, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'J01 GR-56', '2020-01-12', '2020-03-22', NULL),
       (4853, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Jeudi', 'J01 GR-57', '2020-01-09', '2020-03-12', NULL),
       (4854, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'J01 GR-58', '2020-01-11', '2020-03-21', NULL),
       (4855, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'J01 GR-59', '2020-01-11', '2020-03-21', NULL),
       (4856, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'J01 GR-60', '2020-01-11', '2020-03-21', NULL),
       (4857, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'J01 GR-61', '2020-01-11', '2020-03-21', NULL),
       (4858, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'J01 GR-62', '2020-01-11', '2020-03-21', NULL),
       (4859, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'J01 GR-63', '2020-01-11', '2020-03-21', NULL),
       (4860, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'J01 GR-64', '2020-01-11', '2020-03-21', NULL),
       (4861, 2, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'J01 GR-65', '2020-01-11', '2020-03-21', NULL),
       (4862, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'J02 GR-01', '2020-01-12', '2020-03-15', NULL),
       (4863, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'J02 GR-02', '2020-01-12', '2020-03-15', NULL),
       (4864, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'J02 GR-03', '2020-01-12', '2020-03-15', NULL),
       (4865, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Dimanche', 'J02 GR-04', '2020-01-12', '2020-03-15', NULL),
       (4866, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'J02 GR-05', '2020-01-12', '2020-03-15', NULL),
       (4867, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'J02 GR-06', '2020-01-12', '2020-03-15', NULL),
       (4868, 2, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'J02 GR-07', '2020-01-12', '2020-03-15', NULL),
       (4869, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mardi', 'J02 GR-08', '2020-01-07', '2020-03-10', NULL),
       (4870, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mercredi', 'J02 GR-09', '2020-01-08', '2020-03-11', NULL),
       (4871, 2, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Mercredi', 'J02 GR-10', '2020-01-08', '2020-03-11', NULL),
       (4872, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Jeudi', 'J02 GR-11', '2020-01-09', '2020-03-12', NULL),
       (4873, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Samedi', 'J02 GR-12', '2020-01-11', '2020-03-14', NULL),
       (4874, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'J02 GR-13', '2020-01-11', '2020-03-14', NULL),
       (4875, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'J02 GR-14', '2020-01-11', '2020-03-14', NULL),
       (4876, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Samedi', 'J02 GR-15', '2020-01-11', '2020-03-14', NULL),
       (4877, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Samedi', 'J02 GR-16', '2020-01-11', '2020-03-14', NULL),
       (4878, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Dimanche', 'J02 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4879, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'J02 GR-52', '2020-01-12', '2020-03-22', NULL),
       (4880, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'J02 GR-53', '2020-01-12', '2020-03-22', NULL),
       (4881, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Dimanche', 'J02 GR-54', '2020-01-12', '2020-03-22', NULL),
       (4882, 2, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'J02 GR-55', '2020-01-12', '2020-03-22', NULL),
       (4883, 2, 2, '12:05:00', '12:30:00', 'PIS-LT', 'Dimanche', 'J02 GR-56', '2020-01-12', '2020-03-22', NULL),
       (4884, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Jeudi', 'J02 GR-57', '2020-01-09', '2020-03-12', NULL),
       (4885, 2, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Vendredi', 'J02 GR-58', '2020-01-10', '2020-03-13', NULL),
       (4886, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'J02 GR-59', '2020-01-11', '2020-03-21', NULL),
       (4887, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'J02 GR-60', '2020-01-11', '2020-03-21', NULL),
       (4888, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'J02 GR-61', '2020-01-11', '2020-03-21', NULL),
       (4889, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'J02 GR-62', '2020-01-11', '2020-03-21', NULL),
       (4890, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'J02 GR-63', '2020-01-11', '2020-03-21', NULL),
       (4891, 2, 2, '10:30:00', '10:55:00', 'PIS-LT', 'Samedi', 'J02 GR-64', '2020-01-11', '2020-03-21', NULL),
       (4892, 2, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'J02 GR-65', '2020-01-11', '2020-03-21', NULL),
       (4893, 2, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'J02 GR-66', '2020-01-11', '2020-03-21', NULL),
       (4894, 2, 2, '09:00:00', '09:25:00', 'PIS-AB', 'Dimanche', 'J03 GR-01', '2020-01-12', '2020-03-15', NULL),
       (4895, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'J03 GR-02', '2020-01-12', '2020-03-15', NULL),
       (4896, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Dimanche', 'J03 GR-03', '2020-01-12', '2020-03-15', NULL),
       (4897, 2, 2, '11:30:00', '11:55:00', 'PIS-AB', 'Dimanche', 'J03 GR-04', '2020-01-12', '2020-03-15', NULL),
       (4898, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'J03 GR-05', '2020-01-12', '2020-03-15', NULL),
       (4899, 2, 2, '13:00:00', '13:25:00', 'PIS-AB', 'Dimanche', 'J03 GR-06', '2020-01-12', '2020-03-15', NULL),
       (4900, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Lundi', 'J03 GR-07', '2020-01-06', '2020-03-09', NULL),
       (4901, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Mardi', 'J03 GR-08', '2020-01-07', '2020-03-10', NULL),
       (4902, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Mercredi', 'J03 GR-09', '2020-01-08', '2020-03-11', NULL),
       (4903, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Jeudi', 'J03 GR-10', '2020-01-09', '2020-03-12', NULL),
       (4904, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Jeudi', 'J03 GR-11', '2020-01-09', '2020-03-12', NULL),
       (4905, 2, 2, '18:00:00', '18:25:00', 'PIS-AB', 'Vendredi', 'J03 GR-12', '2020-01-10', '2020-03-13', NULL),
       (4906, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Samedi', 'J03 GR-13', '2020-01-11', '2020-03-14', NULL),
       (4907, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Samedi', 'J03 GR-14', '2020-01-11', '2020-03-14', NULL),
       (4908, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'J03 GR-15', '2020-01-11', '2020-03-14', NULL),
       (4909, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Samedi', 'J03 GR-16', '2020-01-11', '2020-03-14', NULL),
       (4910, 2, 2, '14:45:00', '15:10:00', 'PIS-AB', 'Samedi', 'J03 GR-17', '2020-01-11', '2020-03-14', NULL),
       (4911, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Dimanche', 'J03 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4912, 2, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'J03 GR-52', '2020-01-12', '2020-03-22', NULL),
       (4913, 2, 2, '13:05:00', '13:30:00', 'PIS-LT', 'Dimanche', 'J03 GR-53', '2020-01-12', '2020-03-22', NULL),
       (4914, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Mardi', 'J03 GR-54', '2020-01-07', '2020-03-10', NULL),
       (4915, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'J03 GR-55', '2020-01-10', '2020-03-13', NULL),
       (4916, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'J03 GR-56', '2020-01-11', '2020-03-21', NULL),
       (4917, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Samedi', 'J03 GR-57', '2020-01-11', '2020-03-21', NULL),
       (4918, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'J03 GR-58', '2020-01-11', '2020-03-21', NULL),
       (4919, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Samedi', 'J03 GR-59', '2020-01-11', '2020-03-21', NULL),
       (4920, 2, 2, '11:30:00', '11:55:00', 'PIS-LT', 'Samedi', 'J03 GR-60', '2020-01-11', '2020-03-21', NULL),
       (4921, 2, 2, '08:30:00', '08:55:00', 'PIS-AB', 'Dimanche', 'J04 GR-01', '2020-01-12', '2020-03-15', NULL),
       (4922, 2, 2, '09:30:00', '09:55:00', 'PIS-AB', 'Dimanche', 'J04 GR-02', '2020-01-12', '2020-03-15', NULL),
       (4923, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Dimanche', 'J04 GR-03', '2020-01-12', '2020-03-15', NULL),
       (4924, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Dimanche', 'J04 GR-04', '2020-01-12', '2020-03-15', NULL),
       (4925, 2, 2, '12:30:00', '12:55:00', 'PIS-AB', 'Dimanche', 'J04 GR-05', '2020-01-12', '2020-03-15', NULL),
       (4926, 2, 2, '18:30:00', '18:55:00', 'PIS-AB', 'Lundi', 'J04 GR-06', '2020-01-06', '2020-03-09', NULL),
       (4927, 2, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Mercredi', 'J04 GR-07', '2020-01-08', '2020-03-11', NULL),
       (4928, 2, 2, '19:30:00', '19:55:00', 'PIS-AB', 'Jeudi', 'J04 GR-08', '2020-01-09', '2020-03-12', NULL),
       (4929, 2, 2, '10:00:00', '10:25:00', 'PIS-AB', 'Samedi', 'J04 GR-09', '2020-01-11', '2020-03-14', NULL),
       (4930, 2, 2, '10:30:00', '10:55:00', 'PIS-AB', 'Samedi', 'J04 GR-10', '2020-01-11', '2020-03-14', NULL),
       (4931, 2, 2, '11:00:00', '11:25:00', 'PIS-AB', 'Samedi', 'J04 GR-11', '2020-01-11', '2020-03-14', NULL),
       (4932, 2, 2, '12:00:00', '12:25:00', 'PIS-AB', 'Samedi', 'J04 GR-12', '2020-01-11', '2020-03-14', NULL),
       (4933, 2, 2, '09:00:00', '09:25:00', 'PIS-LT', 'Dimanche', 'J04 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4934, 2, 2, '10:00:00', '10:25:00', 'PIS-LT', 'Dimanche', 'J04 GR-52', '2020-01-12', '2020-03-22', NULL),
       (4935, 2, 2, '12:35:00', '13:00:00', 'PIS-LT', 'Dimanche', 'J04 GR-53', '2020-01-12', '2020-03-22', NULL),
       (4936, 2, 2, '18:30:00', '18:55:00', 'PIS-LT', 'Lundi', 'J04 GR-54', '2020-01-06', '2020-03-09', NULL),
       (4937, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Lundi', 'J04 GR-55', '2020-01-06', '2020-03-09', NULL),
       (4938, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Mardi', 'J04 GR-56', '2020-01-07', '2020-03-10', NULL),
       (4939, 2, 2, '19:00:00', '19:25:00', 'PIS-LT', 'Vendredi', 'J04 GR-57', '2020-01-10', '2020-03-13', NULL),
       (4940, 2, 2, '08:30:00', '08:55:00', 'PIS-LT', 'Samedi', 'J04 GR-58', '2020-01-11', '2020-03-21', NULL),
       (4941, 2, 2, '09:30:00', '09:55:00', 'PIS-LT', 'Samedi', 'J04 GR-59', '2020-01-11', '2020-03-21', NULL),
       (4942, 2, 2, '11:00:00', '11:25:00', 'PIS-LT', 'Samedi', 'J04 GR-60', '2020-01-11', '2020-03-21', NULL),
       (4943, 2, 2, '11:00:00', '11:40:00', 'PIS-AB', 'Dimanche', 'J05 GR-01', '2020-01-12', '2020-03-15', NULL),
       (4944, 2, 2, '19:00:00', '19:40:00', 'PIS-AB', 'Mardi', 'J05 GR-02', '2020-01-07', '2020-03-10', NULL),
       (4945, 2, 2, '19:00:00', '19:40:00', 'PIS-AB', 'Jeudi', 'J05 GR-03', '2020-01-09', '2020-03-12', NULL),
       (4946, 2, 2, '18:00:00', '18:40:00', 'PIS-AB', 'Vendredi', 'J05 GR-04', '2020-01-10', '2020-03-13', NULL),
       (4947, 2, 2, '08:35:00', '09:15:00', 'PIS-AB', 'Samedi', 'J05 GR-05', '2020-01-11', '2020-03-14', NULL),
       (4948, 2, 2, '11:45:00', '12:25:00', 'PIS-AB', 'Samedi', 'J05 GR-06', '2020-01-11', '2020-03-14', NULL),
       (4949, 2, 2, '13:15:00', '13:55:00', 'PIS-AB', 'Samedi', 'J05 GR-07', '2020-01-11', '2020-03-14', NULL),
       (4950, 2, 2, '11:50:00', '12:30:00', 'PIS-LT', 'Dimanche', 'J05 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4951, 2, 2, '12:35:00', '13:15:00', 'PIS-LT', 'Dimanche', 'J05 GR-52', '2020-01-12', '2020-03-22', NULL),
       (4952, 2, 2, '19:30:00', '20:10:00', 'PIS-LT', 'Lundi', 'J05 GR-53', '2020-01-06', '2020-03-09', NULL),
       (4953, 2, 2, '19:00:00', '19:40:00', 'PIS-LT', 'Mardi', 'J05 GR-54', '2020-01-07', '2020-03-10', NULL),
       (4954, 2, 2, '19:30:00', '20:10:00', 'PIS-LT', 'Vendredi', 'J05 GR-55', '2020-01-10', '2020-03-13', NULL),
       (4955, 2, 2, '09:30:00', '10:10:00', 'PIS-LT', 'Samedi', 'J05 GR-56', '2020-01-11', '2020-03-21', NULL),
       (4956, 2, 2, '10:30:00', '11:10:00', 'PIS-LT', 'Samedi', 'J05 GR-57', '2020-01-11', '2020-03-21', NULL),
       (4957, 2, 2, '11:45:00', '12:25:00', 'PIS-AB', 'Dimanche', 'J06 GR-01', '2020-01-12', '2020-03-15', NULL),
       (4958, 2, 2, '19:00:00', '19:40:00', 'PIS-AB', 'Mardi', 'J06 GR-02', '2020-01-07', '2020-03-10', NULL),
       (4959, 2, 2, '19:00:00', '19:40:00', 'PIS-AB', 'Jeudi', 'J06 GR-03', '2020-01-09', '2020-03-12', NULL),
       (4960, 2, 2, '18:45:00', '19:25:00', 'PIS-AB', 'Vendredi', 'J06 GR-04', '2020-01-10', '2020-03-13', NULL),
       (4961, 2, 2, '11:00:00', '11:40:00', 'PIS-AB', 'Samedi', 'J06 GR-05', '2020-01-11', '2020-03-14', NULL),
       (4962, 2, 2, '14:00:00', '14:40:00', 'PIS-AB', 'Samedi', 'J06 GR-06', '2020-01-11', '2020-03-14', NULL),
       (4963, 2, 2, '11:05:00', '11:45:00', 'PIS-LT', 'Dimanche', 'J06 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4964, 2, 2, '19:45:00', '20:25:00', 'PIS-LT', 'Mardi', 'J06 GR-52', '2020-01-07', '2020-03-10', NULL),
       (4965, 2, 2, '20:15:00', '20:55:00', 'PIS-LT', 'Vendredi', 'J06 GR-53', '2020-01-10', '2020-03-13', NULL),
       (4966, 2, 2, '10:15:00', '10:55:00', 'PIS-LT', 'Samedi', 'J06 GR-54', '2020-01-11', '2020-03-21', NULL),
       (4967, 2, 2, '11:15:00', '11:55:00', 'PIS-LT', 'Samedi', 'J06 GR-55', '2020-01-11', '2020-03-21', NULL),
       (4968, 2, 2, '08:30:00', '09:25:00', 'PIS-AB', 'Dimanche', 'J07 GR-01', '2020-01-12', '2020-03-15', NULL),
       (4969, 2, 2, '13:15:00', '14:10:00', 'PIS-AB', 'Samedi', 'J07 GR-02', '2020-01-11', '2020-03-14', NULL),
       (4970, 2, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'J07 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4971, 2, 2, '19:30:00', '19:55:00', 'PIS-LT', 'Mardi', 'J07 GR-52', '2020-01-07', '2020-03-10', NULL),
       (4972, 2, 2, '20:00:00', '20:55:00', 'PIS-LT', 'Vendredi', 'J07 GR-53', '2020-01-10', '2020-03-13', NULL),
       (4973, 2, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'J07 GR-54', '2020-01-11', '2020-03-21', NULL),
       (4974, 2, 2, '09:30:00', '10:25:00', 'PIS-AB', 'Dimanche', 'J08 GR-01', '2020-01-12', '2020-03-15', NULL),
       (4975, 2, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Jeudi', 'J08 GR-02', '2020-01-09', '2020-03-12', NULL),
       (4976, 2, 2, '18:30:00', '19:25:00', 'PIS-AB', 'Vendredi', 'J08 GR-03', '2020-01-10', '2020-03-13', NULL),
       (4977, 2, 2, '13:15:00', '14:10:00', 'PIS-AB', 'Samedi', 'J08 GR-04', '2020-01-11', '2020-03-14', NULL),
       (4978, 2, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'J08 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4979, 2, 2, '20:00:00', '20:55:00', 'PIS-LT', 'Vendredi', 'J08 GR-52', '2020-01-10', '2020-03-13', NULL),
       (4980, 2, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'J08 GR-53', '2020-01-11', '2020-03-21', NULL),
       (4981, 2, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Mardi', 'J09 GR-01', '2020-01-07', '2020-03-10', NULL),
       (4982, 2, 2, '14:15:00', '15:10:00', 'PIS-AB', 'Samedi', 'J09 GR-02', '2020-01-11', '2020-03-14', NULL),
       (4983, 2, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'J09 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4984, 2, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'J09 GR-52', '2020-01-11', '2020-03-21', NULL),
       (4985, 2, 2, '18:30:00', '19:25:00', 'PIS-AB', 'Vendredi', 'J10 GR-01', '2020-01-10', '2020-03-13', NULL),
       (4986, 2, 2, '14:15:00', '15:10:00', 'PIS-AB', 'Samedi', 'J10 GR-02', '2020-01-11', '2020-03-14', NULL),
       (4987, 2, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'J10 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4988, 2, 2, '20:00:00', '20:55:00', 'PIS-LT', 'Vendredi', 'J10 GR-52', '2020-01-10', '2020-03-13', NULL),
       (4989, 2, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'J10 GR-53', '2020-01-11', '2020-03-21', NULL),
       (4990, 2, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Mardi', 'ADO-1 GR-01', '2020-01-07', '2020-03-10', NULL),
       (4991, 2, 2, '12:00:00', '12:55:00', 'PIS-AB', 'Samedi', 'ADO-1 GR-02', '2020-01-11', '2020-03-14', NULL),
       (4992, 2, 2, '20:00:00', '20:55:00', 'PIS-LT', 'Vendredi', 'ADO-2 GR-51', '2020-01-10', '2020-03-13', NULL),
       (4993, 2, 2, '11:05:00', '12:00:00', 'PIS-LT', 'Dimanche', 'ADO-3 GR-51', '2020-01-12', '2020-03-22', NULL),
       (4994, 2, 2, '12:00:00', '12:55:00', 'PIS-LT', 'Samedi', 'ADO-3 GR-52', '2020-01-11', '2020-03-21', NULL),
       (4995, 2, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Mardi', 'PEUR GR-01', '2020-01-07', '2020-03-10', NULL),
       (4996, 2, 2, '19:00:00', '19:55:00', 'PIS-AB', 'Jeudi', 'PEUR GR-02', '2020-01-09', '2020-03-12', NULL),
       (4997, 2, 2, '18:30:00', '19:25:00', 'PIS-LT', 'Lundi', 'PEUR GR-51', '2020-01-06', '2020-03-09', NULL),
       (4998, 2, 2, '19:30:00', '20:25:00', 'PIS-LT', 'Lundi', 'PEUR GR-52', '2020-01-06', '2020-03-09', NULL),
       (4999, 2, 2, '21:30:00', '22:25:00', 'PIS-LT', 'Mercredi', 'PEUR GR-53', '2020-01-08', '2020-03-11', NULL),
       (5000, 2, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Lundi', 'AQUA-AD1 GR-51', '2020-01-06', '2020-03-09', NULL),
       (5001, 2, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Lundi', 'AQUA-AD1 GR-52', '2020-01-06', '2020-03-09', NULL),
       (5002, 2, 7, '20:30:00', '21:25:00', 'PIS-LT', 'Mercredi', 'AQUA-AD1 GR-53', '2020-01-08', '2020-03-11', NULL),
       (5003, 2, 7, '21:30:00', '22:25:00', 'PIS-LT', 'Mercredi', 'AQUA-AD1 GR-54', '2020-01-08', '2020-03-11', NULL),
       (5004, 2, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Jeudi', 'AQUA-AD1 GR-55', '2020-01-09', '2020-03-12', NULL),
       (5005, 2, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Jeudi', 'AQUA-AD1 GR-56', '2020-01-09', '2020-03-12', NULL),
       (5006, 2, 7, '18:30:00', '19:25:00', 'PIS-LT', 'Lundi', 'AQUA-AD2 GR-51', '2020-01-06', '2020-03-09', NULL),
       (5007, 2, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Lundi', 'AQUA-AD2 GR-52', '2020-01-06', '2020-03-09', NULL),
       (5008, 2, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Mardi', 'AQUA-AD2 GR-53', '2020-01-07', '2020-03-10', NULL),
       (5009, 2, 7, '20:30:00', '21:25:00', 'PIS-LT', 'Mercredi', 'AQUA-AD2 GR-54', '2020-01-08', '2020-03-11', NULL),
       (5010, 2, 7, '19:30:00', '20:25:00', 'PIS-LT', 'Jeudi', 'AQUA-AD2 GR-55', '2020-01-09', '2020-03-12', NULL),
       (5011, 2, 7, '19:00:00', '19:55:00', 'PIS-AB', 'Lundi', 'AQUA-AD3 GR-01', '2020-01-06', '2020-03-09', NULL),
       (5012, 2, 7, '20:30:00', '21:25:00', 'LT', 'Mercredi', 'AQUA-AD3 GR-51', '2020-01-08', '2020-03-11', NULL),
       (5013, 2, 7, '21:30:00', '22:25:00', 'LT', 'Mercredi', 'AQUA-AD3 GR-52', '2020-01-08', '2020-03-11', NULL),
       (5014, 2, 7, '16:10:00', '16:55:00', 'PIS-LT', 'Mardi', 'AQUA-FO45 GR-51', '2020-01-07', '2020-03-17', NULL),
       (5015, 2, 7, '16:10:00', '16:55:00', 'PIS-LT', 'Jeudi', 'AQUA-FO45 GR-52', '2020-01-09', '2020-03-19', NULL),
       (5016, 2, 7, '18:00:00', '18:55:00', 'PIS-AB', 'Lundi', 'AQUA-FO55 GR-01', '2020-01-06', '2020-03-16', NULL),
       (5017, 2, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Mardi', 'AQUA-FO55 GR-02', '2020-01-07', '2020-03-17', NULL),
       (5018, 2, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Mercredi', 'AQUA-FO55 GR-03', '2020-01-08', '2020-03-18', NULL),
       (5019, 2, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Jeudi', 'AQUA-FO55 GR-04', '2020-01-09', '2020-03-19', NULL),
       (5020, 2, 7, '18:00:00', '18:55:00', 'PIS-AB', 'Lundi', 'AQUA-JO55 GR-01', '2020-01-06', '2020-03-16', NULL),
       (5021, 2, 7, '19:00:00', '19:55:00', 'PIS-AB', 'Lundi', 'AQUA-JO55 GR-02', '2020-01-06', '2020-03-16', NULL),
       (5022, 2, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Mardi ', 'AQUA-JO55 GR-03', '2020-01-07', '2020-03-17', NULL),
       (5023, 2, 7, '20:00:00', '20:55:00', 'PIS-AB', 'Jeudi', 'AQUA-JO55 GR-04', '2020-01-09', '2020-03-19', NULL),
       (5024, 2, 7, '19:00:00', '19:55:00', 'PIS-AB', 'Lundi', 'PRE-POST GR-01', '2020-01-06', '2020-03-16', NULL),
       (5025, 2, 3, '13:15:00', '14:15:00', 'PIS-AB', 'Samedi', 'EB GR-01', '2020-01-11', '2020-03-14', NULL),
       (5026, 2, 3, '14:30:00', '15:30:00', 'AB-SALLE', 'Samedi', 'MB GR-01', '2020-01-11', '2020-03-14', NULL),
       (5027, 2, 3, '15:30:00', '17:30:00', 'PIS-AB', 'Samedi', 'MB GR-01', '2020-01-11', '2020-03-14', NULL),
       (5028, 2, 3, '15:30:00', '16:30:00', 'AB-SALLE', 'Dimanche', 'CB GR-01', '2020-01-12', '2020-03-15', NULL),
       (5029, 2, 3, '16:30:00', '18:30:00', 'PIS-AB', 'Dimanche', 'CB GR-01', '2020-01-12', '2020-03-15', NULL),
       (5030, 2, 4, '08:00:00', '17:00:00', 'GHB', 'Samedi', 'PSG GR-51', '2020-01-04', '2020-01-05', NULL),
       (5031, 2, 4, '08:00:00', '17:00:00', 'GHB', 'Dimanche', 'PSG GR-51', '2020-01-04', '2020-01-05', NULL),
       (5032, 2, 5, '16:00:00', '19:00:00', 'PIS-AB', 'Samedi', 'SN GR-01', '2020-01-11', '2020-03-14', NULL),
       (5033, 2, 5, '19:00:00', '21:00:00', 'AB-SALLE', 'Samedi', 'SN GR-01', '2020-01-11', '2020-03-14', NULL),
       (5034, 2, 6, '13:00:00', '15:30:00', 'AB-SALLE', 'Samedi', 'MSA GR-01', '2020-01-11', '2020-03-14', NULL),
       (5035, 2, 6, '15:00:00', '18:00:00', 'PIS-AB', 'Samedi', 'MSA GR-01', '2020-01-11', '2020-03-14', NULL),
       (5036, 2, 6, '11:00:00', '12:00:00', 'PIS-LT', 'Samedi', 'ALERTE GR-SN', '2020-01-11', '2020-03-14', NULL),
       (5037, 2, 6, '11:00:00', '12:00:00', 'LT', 'Samedi', 'MCPS GR-PS', '2020-01-11', '2020-03-14', NULL),
       (5038, 2, 6, '11:00:00', '12:00:00', 'LT', 'Samedi', 'MCS GR-MB', '2020-01-11', '2020-03-14', NULL),
       (5039, 2, 6, '11:00:00', '12:00:00', 'LT', 'Samedi', 'MASQUE GR-PS', '2020-01-11', '2020-03-14', NULL),
       (5040, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-01', '2020-01-12', '2020-03-15', NULL),
       (5041, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-02', '2020-01-12', '2020-03-15', NULL),
       (5042, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-03', '2020-01-12', '2020-03-15', NULL),
       (5043, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-04', '2020-01-12', '2020-03-15', NULL),
       (5044, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-05', '2020-01-12', '2020-03-15', NULL),
       (5045, 2, 2, '12:30:00', '13:00:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-06', '2020-01-12', '2020-03-15', NULL),
       (5046, 2, 2, '13:00:00', '13:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-07', '2020-01-12', '2020-03-15', NULL),
       (5047, 2, 2, '13:00:00', '13:30:00', 'PIS-AB', 'Dimanche', 'PRIVE GR-08', '2020-01-12', '2020-03-15', NULL),
       (5048, 2, 2, '20:00:00', '20:30:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-09', '2020-01-08', '2020-03-11', NULL),
       (5049, 2, 2, '20:00:00', '20:30:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-10', '2020-01-08', '2020-03-11', NULL),
       (5050, 2, 2, '20:00:00', '20:30:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-11', '2020-01-08', '2020-03-11', NULL),
       (5051, 2, 2, '20:30:00', '21:00:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-12', '2020-01-08', '2020-03-11', NULL),
       (5052, 2, 2, '20:30:00', '21:00:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-13', '2020-01-08', '2020-03-11', NULL),
       (5053, 2, 2, '20:30:00', '21:00:00', 'PIS-AB', 'Mercredi', 'PRIVE GR-14', '2020-01-08', '2020-03-11', NULL),
       (5054, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-15', '2020-01-11', '2020-03-14', NULL),
       (5055, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-16', '2020-01-11', '2020-03-14', NULL),
       (5056, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-17', '2020-01-11', '2020-03-14', NULL),
       (5057, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-18', '2020-01-11', '2020-03-14', NULL),
       (5058, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-19', '2020-01-11', '2020-03-14', NULL),
       (5059, 2, 2, '08:00:00', '08:30:00', 'PIS-AB', 'Samedi', 'PRIVE GR-20', '2020-01-11', '2020-03-14', NULL),
       (5060, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-51', '2020-01-12', '2020-03-22', NULL),
       (5061, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-52', '2020-01-12', '2020-03-22', NULL),
       (5062, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-53', '2020-01-12', '2020-03-22', NULL),
       (5063, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-54', '2020-01-12', '2020-03-22', NULL),
       (5064, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-55', '2020-01-12', '2020-03-22', NULL),
       (5065, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Dimanche', 'PRIVE GR-56', '2020-01-12', '2020-03-22', NULL),
       (5066, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-57', '2020-01-11', '2020-03-21', NULL),
       (5067, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-58', '2020-01-11', '2020-03-21', NULL),
       (5068, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-59', '2020-01-11', '2020-03-21', NULL),
       (5069, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-60', '2020-01-11', '2020-03-21', NULL),
       (5070, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-61', '2020-01-11', '2020-03-21', NULL),
       (5071, 2, 2, '08:00:00', '08:30:00', 'PIS-LT', 'Samedi', 'PRIVE GR-62', '2020-01-11', '2020-03-21', NULL),
       (5072, 2, 2, '11:30:00', '12:00:00', 'PIS-LT', 'Samedi', 'PRIVE GR-63', '2020-01-11', '2020-03-21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spec_availability_blocks`
--

CREATE TABLE `spec_availability_blocks`
(
    `block_id`      int(11)     NOT NULL,
    `sch_id`        int(11)     NOT NULL,
    `start_date`    date        NOT NULL,
    `end_date`      date        NOT NULL,
    `start_time`    time        NOT NULL,
    `end_time`      time        NOT NULL,
    `required_qual` int(11)     NOT NULL,
    `block_cat`     varchar(30) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `spec_availability_blocks`
--

INSERT INTO `spec_availability_blocks` (`block_id`, `sch_id`, `start_date`, `end_date`, `start_time`, `end_time`,
                                        `required_qual`, `block_cat`)
VALUES (2, 1, '2020-04-04', '2020-04-05', '08:00:00', '17:00:00', 1, 'Premiers Soins General (MSU)'),
       (3, 1, '2020-04-04', '2020-04-05', '08:00:00', '17:00:00', 1, 'Premiers Soins General (MSU)'),
       (4, 1, '2020-04-04', '2020-04-05', '08:00:00', '17:00:00', 1, 'Premiers Soins General (MSU)');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user`
(
    `user_id`         int(11)     NOT NULL,
    `passphrase`      varchar(60) NOT NULL,
    `user_fname`      varchar(35) NOT NULL,
    `user_lname`      varchar(35) NOT NULL,
    `user_address`    varchar(70)          DEFAULT NULL,
    `user_dob`        date                 DEFAULT NULL,
    `role_id`         int(7)      NOT NULL DEFAULT 1,
    `user_start_date` date                 DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `passphrase`, `user_fname`, `user_lname`, `user_address`, `user_dob`, `role_id`,
                    `user_start_date`)
VALUES (722888, 'rndKf13E', 'Mathieu', 'Dorval', NULL, NULL, 1, NULL),
       (750045, 'ytvoKiPi', 'Édouard', 'Ducharme', NULL, NULL, 1, NULL),
       (758300, 'WNatcZYY', 'Nathan', 'Ng', NULL, NULL, 1, NULL),
       (800001, 'poEQzmL3', 'Rasha', 'Alhaeik', NULL, NULL, 1, NULL),
       (800003, '2TJFMBgx', 'Laetitia', 'Banh', NULL, NULL, 1, NULL),
       (800004, 'II10psjZ', 'Malika', 'Bélanger-Oudrhiri', NULL, NULL, 1, NULL),
       (800009, 'VY9J6JHD', 'Annie-France', 'Demers', NULL, NULL, 1, NULL),
       (800010, 'XlM3SmP5', 'Guillaume', 'Demers', NULL, NULL, 1, NULL),
       (800014, 'e6hMIBr0', 'Marie-Alexandre', 'Forest', NULL, NULL, 1, NULL),
       (800015, 'yyj7SgQ7', 'Jean-Michel', 'Fortier', NULL, NULL, 1, NULL),
       (800017, 'EgivOI31', 'Vincent', 'Henry', NULL, NULL, 1, NULL),
       (800018, 'yb41DEAR', 'Marc-Antoine', 'Lajoie', NULL, NULL, 1, NULL),
       (800021, 'QBlGvcBw', 'Amélie', 'Tiphane', NULL, NULL, 1, NULL),
       (800022, 'nO5A5goa', 'Josianne', 'Larrivée', NULL, NULL, 1, NULL),
       (800023, '4gfM8j7c', 'Béatrice', 'Laurin', NULL, NULL, 1, NULL),
       (800027, 'ewPPouAy', 'Jessika', 'Métivier-Bédard', NULL, NULL, 1, NULL),
       (800029, 'HbdMAMPT', 'Ariane', 'Moquin Joubert', NULL, NULL, 1, NULL),
       (800032, '4ePd9laz', 'Félix-Antoine', 'Pelletier', NULL, NULL, 1, NULL),
       (800033, 'Roq4ywWH', 'Amélie', 'Poiré', NULL, NULL, 1, NULL),
       (800036, 'VUcAZ5JP', 'Mélissa', 'Roch-Lanouette', NULL, NULL, 1, NULL),
       (800037, 's9vDxMA2', 'Galit', 'Sandaev', NULL, NULL, 1, NULL),
       (800038, 'PI1QmxZ0', 'Aaruthra', 'Thirumal', NULL, NULL, 1, NULL),
       (800039, 'lf8eNQWw', 'Maxime', 'Trottier', NULL, NULL, 1, NULL),
       (800040, 'RITaotkU', 'Caroline', 'Turgeon', NULL, NULL, 1, NULL),
       (800041, 'bLMnCX2J', 'Aude', 'Vallerand', NULL, NULL, 1, NULL),
       (800042, 'tTtei8lt', 'Margaux', 'Willame', NULL, NULL, 1, NULL),
       (800045, 'mQDHELtm', 'Jonathan', 'Miron', NULL, NULL, 1, NULL),
       (800048, 'oAnxUy0z', 'Jack', 'Allen', NULL, NULL, 1, NULL),
       (800049, 'Rf4b2U1Z', 'Maxime', 'Berger', NULL, NULL, 1, NULL),
       (800054, 'zfWAJ856', 'David', 'Do', NULL, NULL, 1, NULL),
       (800057, 'A7eWbL4o', 'Alexandre', 'Gagné', NULL, NULL, 1, NULL),
       (800059, 'AnDvCHOM', 'Hélène', 'Hoffman-Chrétien', NULL, NULL, 1, NULL),
       (800062, 'PwUOfpm8', 'Tiffany', 'Nguyen', NULL, NULL, 1, NULL),
       (800073, 'ZVjsZbSY', 'Éléanor', 'Chabot', NULL, NULL, 1, NULL),
       (800077, 'DltbrT9d', 'Salma', 'Ayari', NULL, NULL, 1, NULL),
       (800078, 'ALbBUunt', 'Érik', 'Farkas', NULL, NULL, 1, NULL),
       (800079, 'nbLOvT0P', 'Katerine', 'Landry', NULL, NULL, 1, NULL),
       (800081, 'alXIrFby', 'Charles-Olivier', 'Moreau', NULL, NULL, 1, NULL),
       (800083, 'FhFNl9S2', 'Isabelle', 'Lefebvre', NULL, NULL, 1, NULL),
       (800086, 'H5cqWi6r', 'Salomë', 'Plourde', NULL, NULL, 1, NULL),
       (800088, 'hplIIX9t', 'Florence', 'Peate', NULL, NULL, 1, NULL),
       (800089, 'eK7mXPZo', 'Roxanne', 'Landry', NULL, NULL, 1, NULL),
       (800090, 'Hwpr4nUB', 'Mario', 'Ivanov', NULL, NULL, 1, NULL),
       (800091, '6Cf4hpfS', 'Claudia', 'Burton', NULL, NULL, 1, NULL),
       (800092, 'tUjVcCf5', 'Peinda', 'Diop', NULL, NULL, 1, NULL),
       (800093, 'TWzaXiE1', 'Marc-André', 'Gosselin', NULL, NULL, 1, NULL),
       (800095, 'PPIQbf2S', 'Célia', 'Kingsbury', NULL, NULL, 1, NULL),
       (800097, 'AeyEdAPd', 'Ana Maria', 'Cotocea', NULL, NULL, 1, NULL),
       (800099, 'V3jclrRR', 'William', 'Ducharme', NULL, NULL, 1, NULL),
       (800100, 'SCRhAVIm', 'Pascale', 'Fillion', NULL, NULL, 1, NULL),
       (800101, 'zpUb6Ido', 'Ana Elise', 'Jivan', NULL, NULL, 1, NULL),
       (800104, 'sqmGgr18', 'Louis', 'Lafrance-Savard', NULL, NULL, 1, NULL),
       (800105, 'Wd9aSCDl', 'Mélanie', 'Lefebvre', NULL, NULL, 1, NULL),
       (800107, 'XP9nRTEQ', 'Paula Sofia', 'Loaiza', NULL, NULL, 1, NULL),
       (800108, 'lphjaJjB', 'Louis-Charles', 'Marquis', NULL, NULL, 1, NULL),
       (800109, '70HyRk9C', 'Chaimaa', 'Ouizzane', NULL, NULL, 1, NULL),
       (800111, 'QLi1jJTh', 'Vincent', 'Provost', NULL, NULL, 1, NULL),
       (800113, 'O6ir41wk', 'Alice', 'Stoica', NULL, NULL, 1, NULL),
       (800114, 'RrmBjkee', 'Laurence', 'Thériault-Lapointe', NULL, NULL, 1, NULL),
       (800116, 'xswTfbuc', 'Sandrine', 'Trinh', NULL, NULL, 1, NULL),
       (800117, 'qEHqrLUR', 'David', 'Van Oordt', NULL, NULL, 1, NULL),
       (800118, 'NV3aC4nL', 'Ivy', 'Zou', NULL, NULL, 1, NULL),
       (800120, '9pkg2En2', 'Rose', 'Zhang', NULL, NULL, 1, NULL),
       (800122, 'jfECSZEP', 'Audrey', 'Ng Youn Chen', NULL, NULL, 1, NULL),
       (800124, 'gRnlZU0E', 'Mia', 'Gagné-Vincent', NULL, NULL, 1, NULL),
       (800126, 'QBXQewUq', 'Karel', 'Grégoire', NULL, NULL, 1, NULL),
       (800127, '4ksYd8aM', 'Gabrielle', 'Lapointe', NULL, NULL, 1, NULL),
       (800128, 'RybKKiiX', 'Ariane', 'Lalancette', NULL, NULL, 1, NULL),
       (800130, 'Ww2DLuJu', 'William', 'Belbin', NULL, NULL, 1, NULL),
       (800131, 'J1579daW', 'Valentin', 'Cioana', NULL, NULL, 1, NULL),
       (800132, 'JBSAeISv', 'Jean-Christophe', 'Bélair', NULL, NULL, 1, NULL),
       (800133, 'TItyqS7F', 'Alexandra', 'Bélec-Sergerie', NULL, NULL, 1, NULL),
       (800134, 'EGbhrWTf', 'Anaïs', 'Berlinger-Lavoie', NULL, NULL, 1, NULL),
       (800135, 'HBi6zSNi', 'Jannick', 'Bonenfant', NULL, NULL, 1, NULL),
       (800136, 'gQW7IAad', 'Najee', 'Cadet', NULL, NULL, 1, NULL),
       (800137, 'qmcDkVoF', 'Marie-Rose', 'Chabot', NULL, NULL, 1, NULL),
       (800139, 'FOCNGmsN', 'Patrick', 'Cimpean', NULL, NULL, 1, NULL),
       (800142, 't3yYZNwm', 'Victoria', 'Derome', NULL, NULL, 1, NULL),
       (800145, 'Dmrx0TA0', 'Frédérique', 'Lafontaine', NULL, NULL, 1, NULL),
       (800148, '0LQMaqM6', 'Horia Cristian', 'Sandu', NULL, NULL, 1, NULL),
       (800149, 'OmD048lq', 'Nicolas', 'Vu', NULL, NULL, 1, NULL),
       (800151, 'e9QgkYyC', 'Rayan', 'Achouri', NULL, NULL, 1, NULL),
       (800152, 'GgqE6yXe', 'Alexis', 'Côté', NULL, NULL, 1, NULL),
       (800153, 'TgTF5vSQ', 'Marc-Antoine', 'Tremblay', NULL, NULL, 1, NULL),
       (800154, '9PlkZssV', 'Julian', 'Manotas', NULL, NULL, 1, NULL),
       (800155, 'g0X1Ky0k', 'Antoine', 'Boulanger', NULL, NULL, 1, NULL),
       (800156, 'WVI9U1K3', 'David', 'Cioana', NULL, NULL, 1, NULL),
       (800157, 'v5VpZwbv', 'Nicolas', 'Comsulea', NULL, NULL, 1, NULL),
       (800158, 'UC453Axw', 'Clara', 'Dragon', NULL, NULL, 1, NULL),
       (800160, 'xAbKRRrU', 'Nikol', 'Georgieva', NULL, NULL, 1, NULL),
       (800161, 'F3b0Xv7J', 'Éric Stefan', 'Gojan', NULL, NULL, 1, NULL),
       (800164, 'p9vVWdLI', 'Hubert', 'Provost', NULL, NULL, 1, NULL),
       (800165, 'pf0jWdq4', 'Chloé', 'Prugne', NULL, NULL, 1, NULL),
       (800166, 'lbbCJOqF', 'Nina', 'Tan', NULL, NULL, 1, NULL),
       (800167, 'wMmZRnYw', 'Alison', 'Vo', NULL, NULL, 1, NULL),
       (800168, '1iUehqEd', 'Leila', 'Zaouali', NULL, NULL, 1, NULL),
       (800169, 'JAaNloEP', 'Sabrina', 'Chan Fee', NULL, NULL, 1, NULL),
       (800170, 'tN0QdD5o', 'David', 'Larrivée', NULL, NULL, 1, NULL),
       (800171, 'fsWmQw6T', 'Yan', 'Burton', NULL, NULL, 1, NULL),
       (900001, 'mXKCvXmZ', 'Fiana', 'Chang', NULL, NULL, 1, NULL),
       (900002, '5R0YRhtZ', 'Jean-Félix', 'Desbiens', NULL, NULL, 1, NULL),
       (999999, '$2y$10$0JzSuqZnFw6rGYgpranjf.NWzB3Iys0S6XVgaNGZlgZH6Pj46LrNC', 'Secteur', 'Aquatique', NULL, NULL, 2,
        NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_semester_specs`
--

CREATE TABLE `user_semester_specs`
(
    `user_id`      int(7) NOT NULL,
    `min_hours`    int(2) NOT NULL,
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
    ADD PRIMARY KEY (`shift_id`, `user_id`),
    ADD KEY `FK_avail_user` (`user_id`);

--
-- Indexes for table `availability_blocks`
--
ALTER TABLE `availability_blocks`
    ADD PRIMARY KEY (`block_id`),
    ADD KEY `availability_blocks_qualification_qualification_id_fk` (`required_qual`),
    ADD KEY `availability_blocks_schedule_sch_id_fk` (`sch_id`);

--
-- Indexes for table `availability_instructions`
--
ALTER TABLE `availability_instructions`
    ADD PRIMARY KEY (`sch_id`);

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
-- Indexes for table `spec_availability_blocks`
--
ALTER TABLE `spec_availability_blocks`
    ADD PRIMARY KEY (`block_id`),
    ADD KEY `spec_availability_blocks_qualification_qualification_id_fk` (`required_qual`),
    ADD KEY `spec_availability_blocks_schedule_sch_id_fk` (`sch_id`);

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
-- AUTO_INCREMENT for table `availability_blocks`
--
ALTER TABLE `availability_blocks`
    MODIFY `block_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 995;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
    MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification`
--
ALTER TABLE `qualification`
    MODIFY `qualification_id` int(4) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 10;

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
    MODIFY `sch_id` int(7) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 6;

--
-- AUTO_INCREMENT for table `seniority`
--
ALTER TABLE `seniority`
    MODIFY `seniority_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1401;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
    MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5073;

--
-- AUTO_INCREMENT for table `spec_availability_blocks`
--
ALTER TABLE `spec_availability_blocks`
    MODIFY `block_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
    MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 1000000;

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
-- Constraints for table `availability_blocks`
--
ALTER TABLE `availability_blocks`
    ADD CONSTRAINT `availability_blocks_qualification_qualification_id_fk` FOREIGN KEY (`required_qual`) REFERENCES `qualification` (`qualification_id`),
    ADD CONSTRAINT `availability_blocks_schedule_sch_id_fk` FOREIGN KEY (`sch_id`) REFERENCES `schedule` (`sch_id`) ON DELETE CASCADE;

--
-- Constraints for table `availability_instructions`
--
ALTER TABLE `availability_instructions`
    ADD CONSTRAINT `availability_instructions_schedule_sch_id_fk` FOREIGN KEY (`sch_id`) REFERENCES `schedule` (`sch_id`) ON DELETE CASCADE;

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
    ADD CONSTRAINT `FK_qualfied_user_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
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
    ADD CONSTRAINT `FK_seniority_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
    ADD CONSTRAINT `FK_shift_qualification` FOREIGN KEY (`required_qual`) REFERENCES `qualification` (`qualification_id`),
    ADD CONSTRAINT `FK_shift_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`sch_id`) ON DELETE CASCADE,
    ADD CONSTRAINT `FK_shift_user` FOREIGN KEY (`assigned_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `spec_availability_blocks`
--
ALTER TABLE `spec_availability_blocks`
    ADD CONSTRAINT `spec_availability_blocks_qualification_qualification_id_fk` FOREIGN KEY (`required_qual`) REFERENCES `qualification` (`qualification_id`),
    ADD CONSTRAINT `spec_availability_blocks_schedule_sch_id_fk` FOREIGN KEY (`sch_id`) REFERENCES `schedule` (`sch_id`) ON DELETE CASCADE;

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
