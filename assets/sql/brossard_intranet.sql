-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 07:07 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `qualified_user`
--

CREATE TABLE `qualified_user` (
  `user_id` int(7) NOT NULL,
  `qualification_id` int(4) NOT NULL,
  `qual_renew` date NOT NULL,
  `qual_date_gotten` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

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
  `seniority_type` varchar(4) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hours` int(6) NOT NULL
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
(722888, 'cJvMRl6I', 'Mathieu', 'Dorval', NULL, NULL, 1, NULL),
(750045, 'tA5WUuhq', 'Édouard', 'Ducharme', NULL, NULL, 1, NULL),
(758300, 'n0ygh7ZN', 'Nathan', 'Ng', NULL, NULL, 1, NULL),
(800001, 'I3crs3yr', 'Rasha', 'Alhaeik', NULL, NULL, 1, NULL),
(800003, 'd9tZVhs2', 'Laetitia', 'Banh', NULL, NULL, 1, NULL),
(800004, 'mGjXweUB', 'Malika', 'Bélanger-Oudrhiri', NULL, NULL, 1, NULL),
(800009, 'ZAlqm1h1', 'Annie-France', 'Demers', NULL, NULL, 1, NULL),
(800010, 'qmdpRnRN', 'Guillaume', 'Demers', NULL, NULL, 1, NULL),
(800014, 'IWcznnYT', 'Marie-Alexandre', 'Forest', NULL, NULL, 1, NULL),
(800015, 'bDyLQE9U', 'Jean-Michel', 'Fortier', NULL, NULL, 1, NULL),
(800017, 'NPyOdTa4', 'Vincent', 'Henry', NULL, NULL, 1, NULL),
(800018, 'PPsOdxa5', 'Marc-Antoine', 'Lajoie', NULL, NULL, 1, NULL),
(800021, '6irFsgHO', 'Amélie', 'Tiphane', NULL, NULL, 1, NULL),
(800022, 'sHOP7TS5', 'Josianne', 'Larrivée', NULL, NULL, 1, NULL),
(800023, 'gBxMwr5E', 'Béatrice', 'Laurin', NULL, NULL, 1, NULL),
(800027, '0h8tDjo1', 'Jessika', 'Métivier-Bédard', NULL, NULL, 1, NULL),
(800029, 'Z1WXxu7i', 'Ariane', 'Moquin Joubert', NULL, NULL, 1, NULL),
(800032, 'L0rgulBK', 'Félix-Antoine', 'Pelletier', NULL, NULL, 1, NULL),
(800033, '3GRp8N4S', 'Amélie', 'Poiré', NULL, NULL, 1, NULL),
(800036, 'BRzRt3I9', 'Mélissa', 'Roch-Lanouette', NULL, NULL, 1, NULL),
(800037, 'LoboxAYT', 'Galit', 'Sandaev', NULL, NULL, 1, NULL),
(800038, 'hA5tVQCk', 'Aaruthra', 'Thirumal', NULL, NULL, 1, NULL),
(800039, 'Wn4KpmSK', 'Maxime', 'Trottier', NULL, NULL, 1, NULL),
(800040, '2V7Z0GWu', 'Caroline', 'Turgeon', NULL, NULL, 1, NULL),
(800041, 'DelAoyS2', 'Aude', 'Vallerand', NULL, NULL, 1, NULL),
(800042, 'hSj2kWY6', 'Margaux', 'Willame', NULL, NULL, 1, NULL),
(800045, 'iaNHPiga', 'Jonathan', 'Miron', NULL, NULL, 1, NULL),
(800048, 'EtCFDvoM', 'Jack', 'Allen', NULL, NULL, 1, NULL),
(800049, 'lurzNxXq', 'Maxime', 'Berger', NULL, NULL, 1, NULL),
(800054, '3k4e0pWR', 'David', 'Do', NULL, NULL, 1, NULL),
(800057, 'k73eIHtJ', 'Alexandre', 'Gagné', NULL, NULL, 1, NULL),
(800059, 'UiBdFeZ4', 'Hélène', 'Hoffman-Chrétien', NULL, NULL, 1, NULL),
(800062, 'Sz0SfoaK', 'Tiffany', 'Nguyen', NULL, NULL, 1, NULL),
(800073, 'nR7Ch0dk', 'Éléanor', 'Chabot', NULL, NULL, 1, NULL),
(800077, 'VWsBFFLs', 'Salma', 'Ayari', NULL, NULL, 1, NULL),
(800078, 'zsQ1rr3h', 'Érik ', 'Farkas', NULL, NULL, 1, NULL),
(800079, 'hjSFkap0', 'Katerine', 'Landry', NULL, NULL, 1, NULL),
(800081, 'YTzdvw0X', 'Charles-Olivier', 'Moreau', NULL, NULL, 1, NULL),
(800083, 'RU9rEyHW', 'Isabelle ', 'Lefebvre', NULL, NULL, 1, NULL),
(800086, 'kPPurcSW', 'Salomë', 'Plourde', NULL, NULL, 1, NULL),
(800088, 'jbMerpur', 'Florence', 'Peate', NULL, NULL, 1, NULL),
(800089, 'PIT8dZnX', 'Roxanne', 'Landry', NULL, NULL, 1, NULL),
(800090, 'bjnruRku', 'Mario', 'Ivanov', NULL, NULL, 1, NULL),
(800091, '0kcA7s1T', 'Claudia', 'Burton', NULL, NULL, 1, NULL),
(800092, 'QzVNMTh8', 'Peinda', 'Diop', NULL, NULL, 1, NULL),
(800093, 'LfdJmt7w', 'Marc-André', 'Gosselin', NULL, NULL, 1, NULL),
(800095, 'K2D0PBSj', 'Célia', 'Kingsbury', NULL, NULL, 1, NULL),
(800097, 'YT0W85XW', 'Ana Maria', 'Cotocea', NULL, NULL, 1, NULL),
(800099, 'IiszFJJa', 'William', 'Ducharme', NULL, NULL, 1, NULL),
(800100, 'PQm2kV0c', 'Pascale', 'Fillion', NULL, NULL, 1, NULL),
(800101, 'IL7Q05D4', 'Ana Elise', 'Jivan', NULL, NULL, 1, NULL),
(800104, 'IGvgZBES', 'Louis', 'Lafrance-Savard', NULL, NULL, 1, NULL),
(800105, '5h4FLllk', 'Mélanie', 'Lefebvre', NULL, NULL, 1, NULL),
(800107, 'bbbuAo5r', 'Paula Sofia', 'Loaiza', NULL, NULL, 1, NULL),
(800108, 'KpEZ2Mxb', 'Louis-Charles', 'Marquis', NULL, NULL, 1, NULL),
(800109, 'Td7wp7Ml', 'Chaimaa', 'Ouizzane', NULL, NULL, 1, NULL),
(800111, 'hI7z71kZ', 'Vincent', 'Provost', NULL, NULL, 1, NULL),
(800113, 'wFdlY2RI', 'Alice', 'Stoica', NULL, NULL, 1, NULL),
(800114, 'bQV135Vb', 'Laurence', 'Thériault-Lapointe', NULL, NULL, 1, NULL),
(800116, 'frjTfFzD', 'Sandrine', 'Trinh', NULL, NULL, 1, NULL),
(800117, 'FkrmRW8H', 'David', 'Van Oordt', NULL, NULL, 1, NULL),
(800118, '8XqKdIDs', 'Ivy', 'Zou', NULL, NULL, 1, NULL),
(800120, 'OZNQFhyI', 'Rose', 'Zhang', NULL, NULL, 1, NULL),
(800122, 'emVuIsxO', 'Audrey', 'Ng Youn Chen', NULL, NULL, 1, NULL),
(800124, 'grNl9h8S', 'Mia', 'Gagné-Vincent', NULL, NULL, 1, NULL),
(800126, 'Ic009K4R', 'Karel', 'Grégoire', NULL, NULL, 1, NULL),
(800127, 'gmdwnVoO', 'Gabrielle', 'Lapointe', NULL, NULL, 1, NULL),
(800128, 'FTZwgpTv', 'Ariane', 'Lalancette', NULL, NULL, 1, NULL),
(800130, '0elngacz', 'William', 'Belbin', NULL, NULL, 1, NULL),
(800131, 'uE1hVqXy', 'Valentin', 'Cioana', NULL, NULL, 1, NULL),
(800132, 'SHrzl86q', 'Jean-Christophe', 'Bélair', NULL, NULL, 1, NULL),
(800133, 'qd91uMv2', 'Alexandra', 'Bélec-Sergerie', NULL, NULL, 1, NULL),
(800134, 'X0aksLwQ', 'Anaïs', 'Berlinger-Lavoie', NULL, NULL, 1, NULL),
(800135, 'Q6iuOcig', 'Jannick', 'Bonenfant', NULL, NULL, 1, NULL),
(800136, 'NxxzclBK', 'Najee', 'Cadet', NULL, NULL, 1, NULL),
(800137, 'R6CQQpTf', 'Marie-Rose', 'Chabot', NULL, NULL, 1, NULL),
(800139, 'LvJ44Qtp', 'Patrick', 'Cimpean', NULL, NULL, 1, NULL),
(800142, 'y5JjuIHg', 'Victoria', 'Derome', NULL, NULL, 1, NULL),
(800145, 'RbyaevMM', 'Frédérique', 'Lafontaine', NULL, NULL, 1, NULL),
(800148, 'paFKwBqD', 'Horia Cristian', 'Sandu', NULL, NULL, 1, NULL),
(800149, 'd7gbfqIb', 'Nicolas', 'Vu', NULL, NULL, 1, NULL),
(800151, 'tw5TR1YR', 'Rayan', 'Achouri', NULL, NULL, 1, NULL),
(800152, 'Y06J0ZP3', 'Alexis', 'Côté', NULL, NULL, 1, NULL),
(800153, 'puZ8icrK', 'Marc-Antoine', 'Tremblay', NULL, NULL, 1, NULL),
(800154, '04x4Uk8Q', 'Julian', 'Manotas', NULL, NULL, 1, NULL),
(800155, 'FPs8hSi4', 'Antoine', 'Boulanger', NULL, NULL, 1, NULL),
(800156, '8mcUCDQE', 'David', 'Cioana', NULL, NULL, 1, NULL),
(800157, 'HYD7AnpX', 'Nicolas', 'Comsulea', NULL, NULL, 1, NULL),
(800158, 'sdq5bDyN', 'Clara', 'Dragon', NULL, NULL, 1, NULL),
(800160, 'momYAP4O', 'Nikol', 'Georgieva', NULL, NULL, 1, NULL),
(800161, 'oQo9CGwy', 'Éric Stefan', 'Gojan', NULL, NULL, 1, NULL),
(800164, '1QLxVdwD', 'Hubert', 'Provost', NULL, NULL, 1, NULL),
(800165, '9bB94Kol', 'Chloé', 'Prugne', NULL, NULL, 1, NULL),
(800166, '9bLcKr6G', 'Nina', 'Tan', NULL, NULL, 1, NULL),
(800167, 'C9N3e8Gw', 'Alison', 'Vo', NULL, NULL, 1, NULL),
(800168, 'LthkImiI', 'Leila', 'Zaouali', NULL, NULL, 1, NULL),
(800169, 'O0lNvSEH', 'Sabrina', 'Chan Fee', NULL, NULL, 1, NULL),
(800170, 'AgGTZpTe', 'David', 'Larrivée', NULL, NULL, 1, NULL),
(800171, 'sFwBIxIq', 'Yan', 'Burton ', NULL, NULL, 1, NULL);

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
  MODIFY `qualification_id` int(4) NOT NULL AUTO_INCREMENT;

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
