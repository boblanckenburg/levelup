-- phpMyAdmin SQL Dump
-- version 4.2.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 04, 2015 at 12:02 PM
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
-- Table structure for table `level_meta`
--

CREATE TABLE IF NOT EXISTS `level_meta` (
  `level` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `imageurl` varchar(100) NOT NULL,
  `videourl` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level_meta`
--

INSERT INTO `level_meta` (`level`, `points`, `imageurl`, `videourl`) VALUES
(1, 0, '', ''),
(2, 30, '', ''),
(3, 60, '', ''),
(4, 100, '', ''),
(5, 150, '', '');

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
('2014-11-06 00:00:00', 1, 'Bas'),
('2014-11-06 00:00:00', 1, 'Bo'),
('2014-11-06 00:00:00', 1, 'Geert'),
('2014-11-06 00:00:00', 1, 'Jan'),
('2014-11-06 00:00:00', 1, 'Josha'),
('2014-11-06 00:00:00', 0, 'Karel'),
('2014-11-06 00:00:00', 1, 'Klaas'),
('2014-11-06 00:00:00', 1, 'Laura'),
('2014-11-06 00:00:00', 1, 'Maud'),
('2014-11-06 00:00:00', 0, 'Maurits'),
('2014-11-06 00:00:00', 1, 'Naut'),
('2014-11-06 00:00:00', 0, 'Pepijn'),
('2014-11-06 00:00:00', 1, 'Piet'),
('2014-11-06 00:00:00', 1, 'Timon'),
('2014-11-11 09:30:00', 1, 'Bo'),
('2014-11-11 09:30:00', 1, 'Geert'),
('2014-11-11 09:30:00', 1, 'Jan'),
('2014-11-11 09:30:00', 1, 'Jos'),
('2014-11-11 09:30:00', 0, 'Josha'),
('2014-11-11 09:30:00', 1, 'Karel'),
('2014-11-11 09:30:00', 0, 'Klaas'),
('2014-11-11 09:30:00', 1, 'Laura'),
('2014-11-11 09:30:00', 1, 'Maud'),
('2014-11-11 09:30:00', 1, 'Piet'),
('2014-11-16 00:00:00', 0, 'Bas'),
('2014-11-16 00:00:00', 1, 'Bo'),
('2014-11-16 00:00:00', 0, 'Geert'),
('2014-11-16 00:00:00', 1, 'Jan'),
('2014-11-16 00:00:00', 1, 'Jos'),
('2014-11-16 00:00:00', 0, 'Josha'),
('2014-11-16 00:00:00', 1, 'Karel'),
('2014-11-16 00:00:00', 0, 'Klaas'),
('2014-11-16 00:00:00', 1, 'Laura'),
('2014-11-16 00:00:00', 1, 'Maud'),
('2014-11-16 00:00:00', 0, 'Maurits'),
('2014-11-16 00:00:00', 0, 'Naut'),
('2014-11-16 00:00:00', 0, 'Pepijn'),
('2014-11-16 00:00:00', 1, 'Piet'),
('2014-11-16 00:00:00', 1, 'Timon'),
('2014-11-24 00:00:00', 1, 'Bas'),
('2014-11-24 00:00:00', 1, 'Bo'),
('2014-11-24 00:00:00', 1, 'Geert'),
('2014-11-24 00:00:00', 1, 'Jan'),
('2014-11-24 00:00:00', 0, 'Jos'),
('2014-11-24 00:00:00', 1, 'Josha'),
('2014-11-24 00:00:00', 0, 'Karel'),
('2014-11-24 00:00:00', 1, 'Klaas'),
('2014-11-24 00:00:00', 1, 'Laura'),
('2014-11-24 00:00:00', 1, 'Maud'),
('2014-11-24 00:00:00', 0, 'Maurits'),
('2014-11-24 00:00:00', 0, 'Naut'),
('2014-11-24 00:00:00', 0, 'Pepijn'),
('2014-11-24 00:00:00', 1, 'Piet'),
('2014-11-24 00:00:00', 0, 'Timon'),
('2014-11-26 00:00:00', 1, 'Bas'),
('2014-11-26 00:00:00', 1, 'Bo'),
('2014-11-26 00:00:00', 0, 'Geert'),
('2014-11-26 00:00:00', 1, 'Jan'),
('2014-11-26 00:00:00', 1, 'Josha'),
('2014-11-26 00:00:00', 1, 'Klaas'),
('2014-11-26 00:00:00', 1, 'Laura'),
('2014-11-26 00:00:00', 1, 'Maud'),
('2014-11-26 00:00:00', 0, 'Maurits'),
('2014-11-26 00:00:00', 1, 'Naut'),
('2014-11-26 00:00:00', 0, 'Pepijn'),
('2014-11-26 00:00:00', 1, 'Piet'),
('2014-11-26 00:00:00', 1, 'Timon'),
('2015-01-01 12:00:00', 1, 'Bo'),
('2015-01-01 12:00:00', 0, 'Geert'),
('2015-01-01 12:00:00', 0, 'Jan'),
('2015-01-01 12:00:00', 1, 'Jos'),
('2015-01-01 12:00:00', 1, 'Karel'),
('2015-01-01 12:00:00', 0, 'Laura'),
('2015-01-01 12:00:00', 1, 'Maurits'),
('2015-02-01 12:00:00', 0, 'Bas'),
('2015-02-01 12:00:00', 0, 'Bo'),
('2015-02-01 12:00:00', 0, 'Geert'),
('2015-02-01 12:00:00', 0, 'Jan'),
('2015-02-01 12:00:00', 1, 'Jos'),
('2015-02-01 12:00:00', 0, 'Josha'),
('2015-02-01 12:00:00', 1, 'Karel'),
('2015-02-01 12:00:00', 0, 'Klaas'),
('2015-02-01 12:00:00', 0, 'Laura'),
('2015-02-01 12:00:00', 1, 'Maud'),
('2015-02-01 12:00:00', 1, 'Maurits'),
('2015-02-01 12:00:00', 0, 'Naut'),
('2015-02-01 12:00:00', 0, 'Pepijn'),
('2015-02-01 12:00:00', 1, 'Piet'),
('2015-02-01 12:00:00', 1, 'Timon');

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
('Bas', 'Bas', 12, 'B', '2015-05-28 08:58:39', '006e1b246132abb622fedc6c74bf35c0', 1),
('Bo', 'Bo', 50, 'A', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Geert', 'Geert', 60, 'A', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Jan', 'Jan', 10, 'A', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Jos', 'Jos', 40, 'B', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Josha', 'Josha', 50, 'B', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Karel', 'Karel', 56, 'B', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Klaas', 'Klaas', 25, 'B', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Laura', 'Laura', 80, 'C', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Mariska', 'Mariska', 35, 'C', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Maud', 'Maud', 40, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Maurits', 'Maurits', 78, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Naut', 'Naut', 7, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Pepijn', 'Pepijn', 53, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Piet', 'Piet', 60, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0),
('Timon', 'Timon', 45, 'D', '0000-00-00 00:00:00', '006e1b246132abb622fedc6c74bf35c0', 0);

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
