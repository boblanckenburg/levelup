-- phpMyAdmin SQL Dump
-- version 4.2.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2015 at 01:36 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `levelup`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_meta`
--

DROP TABLE IF EXISTS `admin_meta`;
CREATE TABLE IF NOT EXISTS `admin_meta` (
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_meta`
--

INSERT INTO `admin_meta` (`name`, `password`) VALUES
('blackknight', 'eggbaconspam');

-- --------------------------------------------------------

--
-- Table structure for table `codecademy`
--

DROP TABLE IF EXISTS `codecademy`;
CREATE TABLE IF NOT EXISTS `codecademy` (
  `student_name` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codecademy`
--

INSERT INTO `codecademy` (`student_name`, `grade`) VALUES
('blackknight', 25),
('Jan', 100),
('Jos', 20),
('s004', 0),
('s005', 100);

-- --------------------------------------------------------

--
-- Table structure for table `codecademy_meta`
--

DROP TABLE IF EXISTS `codecademy_meta`;
CREATE TABLE IF NOT EXISTS `codecademy_meta` (
  `title` varchar(50) NOT NULL,
  `text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codecademy_meta`
--

INSERT INTO `codecademy_meta` (`title`, `text`) VALUES
('To Camelot!', 'On second thought, let''s not go to Camelot. It is a silly place. ');

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
CREATE TABLE IF NOT EXISTS `homework` (
  `student_name` varchar(50) NOT NULL,
  `weeknumber` int(11) NOT NULL,
  `grade` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`student_name`, `weeknumber`, `grade`) VALUES
('Bas', 1, 50.000),
('blackknight', 1, 25.000),
('blackknight', 2, 60.000),
('blackknight', 3, 45.000),
('blackknight', 4, 120.000),
('blackknight', 7, 0.000),
('Bo', 1, 25.000),
('Bo', 2, 0.000),
('Bo', 3, 0.000),
('Bo', 4, 0.000),
('Bo', 7, 0.000),
('Geert', 1, 50.000),
('Geert', 2, 0.000),
('Geert', 3, 0.000),
('Geert', 4, 0.000),
('Geert', 7, 0.000),
('Jan', 1, 0.000),
('Jan', 2, 50.000),
('Jan', 3, 50.000),
('Jan', 4, 0.000),
('Jan', 7, 0.000),
('Jos', 1, 0.000),
('Laura', 1, 600.000),
('Maurits', 1, 5.000),
('Pepijn', 1, 500.000),
('s002', 4, 7.000),
('Timon', 1, 100.000);

-- --------------------------------------------------------

--
-- Table structure for table `homework_meta`
--

DROP TABLE IF EXISTS `homework_meta`;
CREATE TABLE IF NOT EXISTS `homework_meta` (
  `title` varchar(100) NOT NULL,
  `text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homework_meta`
--

INSERT INTO `homework_meta` (`title`, `text`) VALUES
('Project "Thou shalt find the holy grail"', 'Arthur, King of the Britons, your Knights of the Round Table shall have a task to make them an example in these dark times.');

-- --------------------------------------------------------

--
-- Table structure for table `level_meta`
--

DROP TABLE IF EXISTS `level_meta`;
CREATE TABLE IF NOT EXISTS `level_meta` (
  `level` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `points` int(11) NOT NULL,
  `videourl` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level_meta`
--

INSERT INTO `level_meta` (`level`, `title`, `description`, `points`, `videourl`) VALUES
(0, 'Movie public', 'Gefeliciteerd met het bereiken van level 0 "Een filmbezoeker" in python programmeren. Een goed begin is het halve werk!\r\n\r\nHierbij vast een teaser van de avonturen die je gaat beleven. \r\n\r\nAl enthousiast geworden? Bij op de codecademy pagina kun je alvast oefenen voor de lessen!', 40, '4FhL2-KatRE'),
(1, 'Coconut', 'Van harte gefeliciteerd, je hebt al meer dan 50 BinPunten gescoord en level 1 van python programmeren, ''A coconut?'' bereikt!\r\n\r\nPython is vernoemd naar Monty Python, dus hierbij wat nerd-cultuur. Waar kokosnoten al niet goed voor zijn.', 76, 'rzcLQRXW6B0'),
(2, 'Message from god', 'Een belangrijke mededeling in dit filmpje!\r\n\r\nElke programmeur heeft twee mogelijke stadia:  "I''m a god"  en "ik heb geen idee wat ik aan het doen ben". \r\nMaar je bent hard op weg richting de eerste van de twee. \r\nVan harte gefeliciteerd met het behalen van meer dan 75 BinPunten.  ', 114, 'jHsbwY4EPyA'),
(3, 'Repressed peasant', 'Broeders! Verenigt u tegen de educatieve dictatuur en werpt uw ketenen af! Al 100 BinPunten in de pocket, je klimt al aardig op. \r\nTot de volgende les, we rekenen op opstand!', 164, 'JvKIWjnEPNY'),
(4, 'Taunting Frenchman', 'Gefeliciteerd met het bereiken van level 4 "A Taunting Frenchman" in python programmeren.\r\n\r\nOefen je fantasievolle beledigingen maar vast voor de klas die lager staat.', 228, 'A8yjNbcKkNY'),
(5, 'Knight of the round table', 'Een liedje om te vieren dat je al meer dan 220 BinPunten hebt behaald! ', 304, 'lfGpVcdqeS0');

-- --------------------------------------------------------

--
-- Table structure for table `points_meta`
--

DROP TABLE IF EXISTS `points_meta`;
CREATE TABLE IF NOT EXISTS `points_meta` (
  `presence` int(11) NOT NULL DEFAULT '10',
  `codecademy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `points_meta`
--

INSERT INTO `points_meta` (`presence`, `codecademy`) VALUES
(10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `presences`
--

DROP TABLE IF EXISTS `presences`;
CREATE TABLE IF NOT EXISTS `presences` (
  `date` datetime NOT NULL,
  `present` tinyint(1) NOT NULL,
  `student_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presences`
--

INSERT INTO `presences` (`date`, `present`, `student_name`) VALUES
('2014-11-06 00:00:00', 1, 'blackknight'),
('2014-11-06 00:00:00', 0, 's001'),
('2014-11-06 00:00:00', 1, 's002'),
('2014-11-06 00:00:00', 0, 's003'),
('2014-11-06 00:00:00', 1, 's004'),
('2014-11-06 00:00:00', 0, 's005'),
('2014-11-06 00:00:00', 0, 's006'),
('2014-11-06 00:00:00', 0, 's007'),
('2014-11-06 00:00:00', 0, 's008'),
('2014-11-06 00:00:00', 1, 's009'),
('2014-11-06 00:00:00', 1, 's011'),
('2014-11-06 00:00:00', 0, 's012'),
('2014-11-06 00:00:00', 0, 's013'),
('2014-11-06 00:00:00', 1, 's014'),
('2014-11-06 00:00:00', 0, 's015'),
('2014-11-06 00:00:00', 0, 's016'),
('2014-11-11 09:30:00', 1, 'blackknight'),
('2014-11-11 09:30:00', 1, 's002'),
('2014-11-11 09:30:00', 0, 's003'),
('2014-11-11 09:30:00', 1, 's004'),
('2014-11-11 09:30:00', 0, 's005'),
('2014-11-11 09:30:00', 0, 's006'),
('2014-11-11 09:30:00', 0, 's007'),
('2014-11-11 09:30:00', 0, 's008'),
('2014-11-11 09:30:00', 1, 's009'),
('2014-11-11 09:30:00', 1, 's011'),
('2014-11-11 09:30:00', 1, 's014'),
('2014-11-11 09:30:00', 0, 's015'),
('2014-11-16 00:00:00', 1, 'blackknight'),
('2014-11-16 00:00:00', 0, 's001'),
('2014-11-16 00:00:00', 1, 's002'),
('2014-11-16 00:00:00', 0, 's003'),
('2014-11-16 00:00:00', 1, 's004'),
('2014-11-16 00:00:00', 0, 's005'),
('2014-11-16 00:00:00', 0, 's006'),
('2014-11-16 00:00:00', 0, 's007'),
('2014-11-16 00:00:00', 0, 's008'),
('2014-11-16 00:00:00', 1, 's009'),
('2014-11-16 00:00:00', 0, 's011'),
('2014-11-16 00:00:00', 0, 's012'),
('2014-11-16 00:00:00', 0, 's013'),
('2014-11-16 00:00:00', 0, 's014'),
('2014-11-16 00:00:00', 0, 's015'),
('2014-11-16 00:00:00', 0, 's016'),
('2014-11-24 00:00:00', 1, 'blackknight'),
('2014-11-24 00:00:00', 0, 's001'),
('2014-11-24 00:00:00', 0, 's002'),
('2014-11-24 00:00:00', 0, 's003'),
('2014-11-24 00:00:00', 1, 's004'),
('2014-11-24 00:00:00', 0, 's005'),
('2014-11-24 00:00:00', 0, 's006'),
('2014-11-24 00:00:00', 0, 's007'),
('2014-11-24 00:00:00', 0, 's008'),
('2014-11-24 00:00:00', 0, 's009'),
('2014-11-24 00:00:00', 0, 's011'),
('2014-11-24 00:00:00', 0, 's012'),
('2014-11-24 00:00:00', 0, 's013'),
('2014-11-24 00:00:00', 0, 's014'),
('2014-11-24 00:00:00', 0, 's015'),
('2014-11-24 00:00:00', 0, 's016'),
('2014-11-26 00:00:00', 0, 'blackknight'),
('2014-11-26 00:00:00', 0, 's001'),
('2014-11-26 00:00:00', 0, 's002'),
('2014-11-26 00:00:00', 0, 's003'),
('2014-11-26 00:00:00', 1, 's004'),
('2014-11-26 00:00:00', 0, 's005'),
('2014-11-26 00:00:00', 0, 's006'),
('2014-11-26 00:00:00', 0, 's008'),
('2014-11-26 00:00:00', 0, 's009'),
('2014-11-26 00:00:00', 0, 's011'),
('2014-11-26 00:00:00', 0, 's012'),
('2014-11-26 00:00:00', 0, 's013'),
('2014-11-26 00:00:00', 0, 's014'),
('2014-11-26 00:00:00', 0, 's015'),
('2014-11-26 00:00:00', 0, 's016'),
('2015-01-01 12:00:00', 0, 'blackknight'),
('2015-01-01 12:00:00', 0, 's002'),
('2015-01-01 12:00:00', 0, 's003'),
('2015-01-01 12:00:00', 1, 's004'),
('2015-01-01 12:00:00', 0, 's005'),
('2015-01-01 12:00:00', 0, 's007'),
('2015-01-01 12:00:00', 0, 's009'),
('2015-01-01 12:00:00', 0, 's012'),
('2015-02-01 12:00:00', 0, 's001'),
('2015-02-01 12:00:00', 0, 's002'),
('2015-02-01 12:00:00', 0, 's003'),
('2015-02-01 12:00:00', 1, 's004'),
('2015-02-01 12:00:00', 0, 's005'),
('2015-02-01 12:00:00', 0, 's006'),
('2015-02-01 12:00:00', 0, 's007'),
('2015-02-01 12:00:00', 0, 's008'),
('2015-02-01 12:00:00', 0, 's009'),
('2015-02-01 12:00:00', 0, 's011'),
('2015-02-01 12:00:00', 0, 's012'),
('2015-02-01 12:00:00', 0, 's013'),
('2015-02-01 12:00:00', 0, 's014'),
('2015-02-01 12:00:00', 0, 's015'),
('2015-02-01 12:00:00', 0, 's016'),
('2015-06-17 00:00:00', 0, 'blackknight'),
('2015-06-17 00:00:00', 1, 's004'),
('2015-06-17 00:00:00', 0, 's005'),
('2015-06-17 00:00:00', 0, 's010');

-- --------------------------------------------------------

--
-- Table structure for table `presences_meta`
--

DROP TABLE IF EXISTS `presences_meta`;
CREATE TABLE IF NOT EXISTS `presences_meta` (
  `date` datetime NOT NULL,
  `weeknumber` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presences_meta`
--

INSERT INTO `presences_meta` (`date`, `weeknumber`) VALUES
('2014-11-06 00:00:00', 1),
('2014-11-11 09:30:00', 1),
('2014-11-16 00:00:00', 2),
('2014-11-24 00:00:00', 2),
('2014-11-26 00:00:00', 3),
('2015-01-01 12:00:00', 3),
('2015-02-01 12:00:00', 4),
('2015-06-17 00:00:00', 7);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `student_name` varchar(50) NOT NULL,
  `weeknumber` int(11) NOT NULL,
  `grade` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`student_name`, `weeknumber`, `grade`) VALUES
('Bas', 1, 0.000),
('blackknight', 1, 3.000),
('blackknight', 2, 10.000),
('blackknight', 3, 0.000),
('blackknight', 4, 0.000),
('blackknight', 7, 0.000),
('Bo', 1, 3.000),
('Bo', 2, 0.000),
('Bo', 3, 0.000),
('Bo', 4, 0.000),
('Bo', 7, 0.000),
('Geert', 1, 0.000),
('Geert', 2, 0.000),
('Geert', 3, 0.000),
('Geert', 4, 0.000),
('Geert', 7, 0.000),
('Jan', 1, 0.000),
('Jan', 2, 50.000),
('Jan', 3, 0.000),
('Jan', 4, 0.000),
('Jan', 7, 0.000),
('Jos', 1, 0.000),
('Laura', 1, 0.000),
('Maurits', 1, 0.000),
('Pepijn', 1, 200.000),
('s002', 3, 5.000),
('s002', 4, 0.000),
('Timon', 1, 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `project_meta`
--

DROP TABLE IF EXISTS `project_meta`;
CREATE TABLE IF NOT EXISTS `project_meta` (
  `title` varchar(100) NOT NULL,
  `text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_meta`
--

INSERT INTO `project_meta` (`title`, `text`) VALUES
('Who would cross the Bridge of Death must answer me these questions three, ere the other side he see.', 'What... is your name?<br>\r\nWhat... is your quest?<br>\r\nWhat... is the air-speed velocity of an unladen swallow?<br>\r\n<br>\r\nAnswers to: <a href="mailto:blanckenburg.b@hsleiden.nl">Bo Blanckenburg</a>\r\n<a href="./file.zip">Download</a>');

-- --------------------------------------------------------

--
-- Table structure for table `streak`
--

DROP TABLE IF EXISTS `streak`;
CREATE TABLE IF NOT EXISTS `streak` (
  `student_name` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `name` varchar(50) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `points` int(4) NOT NULL,
  `class` varchar(6) NOT NULL,
  `lastlogin` timestamp NULL DEFAULT NULL,
  `highest_streak` int(11) NOT NULL,
  `password` varchar(40) NOT NULL DEFAULT 'killerbunny',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`name`, `nickname`, `points`, `class`, `lastlogin`, `highest_streak`, `password`, `inactive`) VALUES
('blackknight', 'blackknight', 393, 'D', '2015-07-10 11:16:55', 15, 'eggbaconspam', 0),
('s001', 'Bas', 2, 'B', '2015-07-10 10:37:32', 0, 'killerbunny', 0),
('s002', 'Bo', 42, 'A', '0000-00-00 00:00:00', 0, 'killerbunny', 0),
('s003', 'Geert', 1, 'A', '2015-07-09 09:13:14', 0, 'killerbunny', 0),
('s004', 'Jan', 82, 'A', '2015-07-10 10:37:37', 0, 'killerbunny', 0),
('s005', 'Jos', 301, 'B', '2015-07-10 10:37:18', 0, 'killerbunny', 0),
('s006', 'Josha', 0, 'B', '0000-00-00 00:00:00', 0, 'killerbunny', 0),
('s007', 'Karel', 0, 'B', '0000-00-00 00:00:00', 0, 'killerbunny', 0),
('s008', 'Klaas', 0, 'B', '0000-00-00 00:00:00', 0, 'killerbunny', 0),
('s009', 'Laura', 630, 'C', '0000-00-00 00:00:00', 0, 'killerbunny', 0),
('s010', 'Mariska', 0, 'C', '0000-00-00 00:00:00', 0, 'killerbunny', 0),
('s011', 'Maud', 21, 'D', '2015-07-08 17:24:20', 0, 'killerbunny', 0),
('s012', 'Maurits', 5, 'D', '0000-00-00 00:00:00', 0, 'killerbunny', 1),
('s013', 'Naut', 2, 'D', '2015-07-10 08:16:03', 0, 'killerbunny', 1),
('s014', 'Pepijn', 720, 'E', '0000-00-00 00:00:00', 0, 'killerbunny', 1),
('s015', 'Piet', 2, 'D', '2015-07-10 10:14:17', 0, 'killerbunny', 1),
('s016', 'Timon', 100, 'F', '0000-00-00 00:00:00', 0, 'killerbunny', 0),
('s1000000', 'Pietje Puk', 0, 'A', '0000-00-00 00:00:00', 0, 'ifierjfire', 0),
('s10456789', 'Robbert Winkel', 1, 'bin1A', '2015-07-09 09:33:49', 0, 'killerbunny', 0),
('s1222222', 'Peter Selie', 0, 'B', '0000-00-00 00:00:00', 0, 'cjhfkjregf', 0),
('s1333333', 'Pinkeltje van Pinkel', 0, 'C', '0000-00-00 00:00:00', 0, 'fwjfiwff', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_meta`
--
ALTER TABLE `admin_meta`
 ADD UNIQUE KEY `name` (`name`,`password`), ADD UNIQUE KEY `name_2` (`name`,`password`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
 ADD UNIQUE KEY `student_name` (`student_name`,`weeknumber`);

--
-- Indexes for table `level_meta`
--
ALTER TABLE `level_meta`
 ADD PRIMARY KEY (`level`), ADD UNIQUE KEY `level` (`level`);

--
-- Indexes for table `points_meta`
--
ALTER TABLE `points_meta`
 ADD UNIQUE KEY `presence` (`presence`);

--
-- Indexes for table `presences`
--
ALTER TABLE `presences`
 ADD PRIMARY KEY (`date`,`student_name`), ADD KEY `student_name` (`student_name`);

--
-- Indexes for table `presences_meta`
--
ALTER TABLE `presences_meta`
 ADD PRIMARY KEY (`date`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
 ADD UNIQUE KEY `student_name` (`student_name`,`weeknumber`);

--
-- Indexes for table `project_meta`
--
ALTER TABLE `project_meta`
 ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `streak`
--
ALTER TABLE `streak`
 ADD UNIQUE KEY `student_name` (`student_name`,`date`), ADD UNIQUE KEY `student_name_2` (`student_name`,`date`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`name`), ADD UNIQUE KEY `name` (`name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `presences`
--
ALTER TABLE `presences`
ADD CONSTRAINT `date_constraint` FOREIGN KEY (`date`) REFERENCES `presences_meta` (`date`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `name_constraint` FOREIGN KEY (`student_name`) REFERENCES `students` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
