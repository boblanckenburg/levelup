-- phpMyAdmin SQL Dump
-- version 4.2.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 19, 2015 at 02:25 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

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

CREATE TABLE IF NOT EXISTS `admin_meta` (
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_meta`
--

INSERT INTO `admin_meta` (`name`, `password`) VALUES
('blackknight', 'f6024f2ea4109be94d0b45736114b8b7 ');

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE IF NOT EXISTS `homework` (
  `student_name` varchar(50) NOT NULL,
  `weeknumber` int(11) NOT NULL,
  `grade` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`student_name`, `weeknumber`, `grade`) VALUES
('Bo', 2, 0.000),
('Bo', 1, 0.000),
('Geert', 1, 50.000),
('Jan', 1, 0.000),
('Jan', 2, 50.000),
('Geert', 2, 0.000),
('Bo', 3, 0.000),
('blackknight', 1, 50.000),
('Jos', 1, 0.000),
('Bo', 7, 0.000),
('Geert', 7, 0.000),
('Jan', 7, 0.000),
('Bo', 4, 0.000),
('Geert', 4, 0.000),
('Jan', 4, 0.000),
('Geert', 3, 0.000),
('Jan', 3, 50.000),
('blackknight', 2, 60.000),
('blackknight', 3, 45.000),
('blackknight', 4, 120.000),
('blackknight', 7, 0.000),
('Bas', 1, 50.000),
('Maurits', 1, 5.000),
('Timon', 1, 100.000),
('Laura', 1, 600.000);

-- --------------------------------------------------------

--
-- Table structure for table `level_meta`
--

CREATE TABLE IF NOT EXISTS `level_meta` (
  `level` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `points` int(11) NOT NULL,
  `imageurl` varchar(100) NOT NULL,
  `videourl` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level_meta`
--

INSERT INTO `level_meta` (`level`, `title`, `description`, `points`, `imageurl`, `videourl`) VALUES
(0, 'Movie public', 'Gefeliciteerd met het bereiken van level 0 "Een filmbezoeker" in python programmeren. Een goed begin is het halve werk!\r\n\r\nHierbij vast een teaser van de avonturen die je gaat beleven. \r\n\r\nAl enthousiast geworden? Bij op de codecademy pagina kun je alvast oefenen voor de lessen!', 40, '../img/emblems/level0', '4FhL2-KatRE'),
(1, 'Coconut', 'Van harte gefeliciteerd, je hebt al meer dan 50 BinPunten gescoord en level 1 van python programmeren, ''A coconut?'' bereikt!\r\n\r\nPython is vernoemd naar Monty Python, dus hierbij wat nerd-cultuur. Waar kokosnoten al niet goed voor zijn.', 76, '../img/emblems/level1', 'rzcLQRXW6B0'),
(2, 'Message from god', 'Een belangrijke mededeling in dit filmpje!\r\n\r\nElke programmeur heeft twee mogelijke stadia:  ‘I’m a god’  en ‘ik heb geen idee wat ik aan het doen ben’. \r\nMaar je bent hard op weg richting de eerste van de twee. \r\nVan harte gefeliciteerd met het behalen van meer dan 75 BinPunten.  ', 114, '../img/emblems/level2', 'jHsbwY4EPyA'),
(3, 'Repressed peasant', 'Broeders! Verenigt u tegen de educatieve dictatuur en werpt uw ketenen af! Al 100 BinPunten in de pocket, je klimt al aardig op. \r\nTot de volgende les, we rekenen op opstand!', 164, '../img/emblems/level3', 'JvKIWjnEPNY'),
(4, 'Taunting Frenchman', 'Gefeliciteerd met het bereiken van level 4 "A Taunting Frenchman" in python programmeren.\r\n\r\nOefen je fantasievolle beledigingen maar vast voor de klas die lager staat.', 228, '../img/emblems/level4', 'A8yjNbcKkNY'),
(5, 'Knight of the round table', 'Een liedje om te vieren dat je al meer dan 220 BinPunten hebt behaald! ', 304, '../img/emblems/level5', 'lfGpVcdqeS0');

-- --------------------------------------------------------

--
-- Table structure for table `points_meta`
--

CREATE TABLE IF NOT EXISTS `points_meta` (
  `presence` int(11) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `points_meta`
--

INSERT INTO `points_meta` (`presence`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `presences`
--

CREATE TABLE IF NOT EXISTS `presences` (
  `date` datetime NOT NULL,
  `present` tinyint(1) NOT NULL,
  `student_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presences`
--

INSERT INTO `presences` (`date`, `present`, `student_name`) VALUES
('2014-11-06 00:00:00', 0, 'Bas'),
('2014-11-06 00:00:00', 1, 'blackknight'),
('2014-11-06 00:00:00', 1, 'Bo'),
('2014-11-06 00:00:00', 0, 'Geert'),
('2014-11-06 00:00:00', 1, 'Jan'),
('2014-11-06 00:00:00', 0, 'Jos'),
('2014-11-06 00:00:00', 0, 'Josha'),
('2014-11-06 00:00:00', 0, 'Karel'),
('2014-11-06 00:00:00', 0, 'Klaas'),
('2014-11-06 00:00:00', 1, 'Laura'),
('2014-11-06 00:00:00', 1, 'Maud'),
('2014-11-06 00:00:00', 0, 'Maurits'),
('2014-11-06 00:00:00', 0, 'Naut'),
('2014-11-06 00:00:00', 0, 'Pepijn'),
('2014-11-06 00:00:00', 0, 'Piet'),
('2014-11-06 00:00:00', 0, 'Timon'),
('2014-11-11 09:30:00', 1, 'blackknight'),
('2014-11-11 09:30:00', 1, 'Bo'),
('2014-11-11 09:30:00', 0, 'Geert'),
('2014-11-11 09:30:00', 1, 'Jan'),
('2014-11-11 09:30:00', 0, 'Jos'),
('2014-11-11 09:30:00', 0, 'Josha'),
('2014-11-11 09:30:00', 0, 'Karel'),
('2014-11-11 09:30:00', 0, 'Klaas'),
('2014-11-11 09:30:00', 1, 'Laura'),
('2014-11-11 09:30:00', 1, 'Maud'),
('2014-11-11 09:30:00', 0, 'Piet'),
('2014-11-16 00:00:00', 0, 'Bas'),
('2014-11-16 00:00:00', 1, 'blackknight'),
('2014-11-16 00:00:00', 1, 'Bo'),
('2014-11-16 00:00:00', 0, 'Geert'),
('2014-11-16 00:00:00', 1, 'Jan'),
('2014-11-16 00:00:00', 0, 'Jos'),
('2014-11-16 00:00:00', 0, 'Josha'),
('2014-11-16 00:00:00', 0, 'Karel'),
('2014-11-16 00:00:00', 0, 'Klaas'),
('2014-11-16 00:00:00', 1, 'Laura'),
('2014-11-16 00:00:00', 0, 'Maud'),
('2014-11-16 00:00:00', 0, 'Maurits'),
('2014-11-16 00:00:00', 0, 'Naut'),
('2014-11-16 00:00:00', 0, 'Pepijn'),
('2014-11-16 00:00:00', 0, 'Piet'),
('2014-11-16 00:00:00', 0, 'Timon'),
('2014-11-24 00:00:00', 0, 'Bas'),
('2014-11-24 00:00:00', 1, 'blackknight'),
('2014-11-24 00:00:00', 0, 'Bo'),
('2014-11-24 00:00:00', 1, 'Geert'),
('2014-11-24 00:00:00', 1, 'Jan'),
('2014-11-24 00:00:00', 0, 'Jos'),
('2014-11-24 00:00:00', 0, 'Josha'),
('2014-11-24 00:00:00', 0, 'Karel'),
('2014-11-24 00:00:00', 0, 'Klaas'),
('2014-11-24 00:00:00', 0, 'Laura'),
('2014-11-24 00:00:00', 0, 'Maud'),
('2014-11-24 00:00:00', 0, 'Maurits'),
('2014-11-24 00:00:00', 0, 'Naut'),
('2014-11-24 00:00:00', 0, 'Pepijn'),
('2014-11-24 00:00:00', 0, 'Piet'),
('2014-11-24 00:00:00', 0, 'Timon'),
('2014-11-26 00:00:00', 0, 'Bas'),
('2014-11-26 00:00:00', 0, 'blackknight'),
('2014-11-26 00:00:00', 0, 'Bo'),
('2014-11-26 00:00:00', 0, 'Geert'),
('2014-11-26 00:00:00', 1, 'Jan'),
('2014-11-26 00:00:00', 0, 'Jos'),
('2014-11-26 00:00:00', 0, 'Josha'),
('2014-11-26 00:00:00', 0, 'Klaas'),
('2014-11-26 00:00:00', 0, 'Laura'),
('2014-11-26 00:00:00', 0, 'Maud'),
('2014-11-26 00:00:00', 0, 'Maurits'),
('2014-11-26 00:00:00', 0, 'Naut'),
('2014-11-26 00:00:00', 0, 'Pepijn'),
('2014-11-26 00:00:00', 0, 'Piet'),
('2014-11-26 00:00:00', 0, 'Timon'),
('2015-01-01 12:00:00', 0, 'blackknight'),
('2015-01-01 12:00:00', 0, 'Bo'),
('2015-01-01 12:00:00', 0, 'Geert'),
('2015-01-01 12:00:00', 1, 'Jan'),
('2015-01-01 12:00:00', 0, 'Jos'),
('2015-01-01 12:00:00', 0, 'Karel'),
('2015-01-01 12:00:00', 0, 'Laura'),
('2015-01-01 12:00:00', 0, 'Maurits'),
('2015-02-01 12:00:00', 0, 'Bas'),
('2015-02-01 12:00:00', 0, 'Bo'),
('2015-02-01 12:00:00', 0, 'Geert'),
('2015-02-01 12:00:00', 1, 'Jan'),
('2015-02-01 12:00:00', 0, 'Jos'),
('2015-02-01 12:00:00', 0, 'Josha'),
('2015-02-01 12:00:00', 0, 'Karel'),
('2015-02-01 12:00:00', 0, 'Klaas'),
('2015-02-01 12:00:00', 0, 'Laura'),
('2015-02-01 12:00:00', 0, 'Maud'),
('2015-02-01 12:00:00', 0, 'Maurits'),
('2015-02-01 12:00:00', 0, 'Naut'),
('2015-02-01 12:00:00', 0, 'Pepijn'),
('2015-02-01 12:00:00', 0, 'Piet'),
('2015-02-01 12:00:00', 0, 'Timon'),
('2015-06-17 00:00:00', 0, 'blackknight'),
('2015-06-17 00:00:00', 1, 'Jan'),
('2015-06-17 00:00:00', 0, 'Jos'),
('2015-06-17 00:00:00', 0, 'Mariska');

-- --------------------------------------------------------

--
-- Table structure for table `presences_meta`
--

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

CREATE TABLE IF NOT EXISTS `project` (
  `student_name` varchar(50) NOT NULL,
  `weeknumber` int(11) NOT NULL,
  `grade` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`student_name`, `weeknumber`, `grade`) VALUES
('Bo', 1, 0.000),
('Geert', 1, 0.000),
('Jan', 1, 0.000),
('Bo', 2, 0.000),
('Geert', 2, 0.000),
('Jan', 2, 50.000),
('Bo', 3, 0.000),
('Geert', 3, 0.000),
('Jan', 3, 0.000),
('Bo', 4, 0.000),
('Geert', 4, 0.000),
('Jan', 4, 0.000),
('Bo', 7, 0.000),
('Geert', 7, 0.000),
('Jan', 7, 0.000),
('blackknight', 1, 23.000),
('blackknight', 3, 0.000),
('blackknight', 4, 0.000),
('blackknight', 7, 0.000),
('blackknight', 2, 10.000),
('Jos', 1, 0.000),
('Bas', 1, 0.000),
('Maurits', 1, 0.000),
('Timon', 1, 0.000),
('Laura', 1, 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `name` varchar(50) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `points` int(4) NOT NULL,
  `class` varchar(3) NOT NULL,
  `lastlogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(40) NOT NULL DEFAULT '006e1b246132abb622fedc6c74bf35c0',
  `inactive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`name`, `nickname`, `points`, `class`, `lastlogin`, `password`, `inactive`) VALUES
('Bas', 'Bas', 50, 'B', '2015-05-28 08:58:39', '006e1b246132abb622fedc6c74bf35c0', 0),
('blackknight', 'blackknight', 348, 'D', '2015-06-18 09:34:18', 'f6024f2ea4109be94d0b45736114b8b7', 0),
('Bo', 'Bo', 30, 'A', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Geert', 'Geert', 60, 'A', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Jan', 'Jan', 230, 'A', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Jos', 'Jos', 0, 'B', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Josha', 'Josha', 0, 'B', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Karel', 'Karel', 0, 'B', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Klaas', 'Klaas', 0, 'B', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Laura', 'Laura', 630, 'C', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Mariska', 'Mariska', 0, 'C', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Maud', 'Maud', 20, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Maurits', 'Maurits', 5, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Naut', 'Naut', 0, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Pepijn', 'Pepijn', 0, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Piet', 'Piet', 0, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Timon', 'Timon', 100, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `level_meta`
--
ALTER TABLE `level_meta`
 ADD PRIMARY KEY (`level`), ADD UNIQUE KEY `level` (`level`);

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
