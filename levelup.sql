-- phpMyAdmin SQL Dump
-- version 4.2.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 08, 2015 at 03:56 PM
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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
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
('blackknight', 'blackknight', 480, 'D', '2015-07-08 13:33:21', 'eggbaconspam', 0),
('s001', 'Bas', 50, 'B', '2015-07-08 13:53:49', 'killerbunny', 0),
('s002', 'Bo', 58, 'A', '0000-00-00 00:00:00', 'killerbunny', 0),
('s003', 'Geert', 60, 'A', '0000-00-00 00:00:00', 'killerbunny', 0),
('s004', 'Jan', 330, 'A', '0000-00-00 00:00:00', 'killerbunny', 0),
('s005', 'Jos', 60, 'B', '2015-07-08 13:36:58', 'killerbunny', 0),
('s006', 'Josha', 0, 'B', '0000-00-00 00:00:00', 'killerbunny', 0),
('s007', 'Karel', 0, 'B', '0000-00-00 00:00:00', 'killerbunny', 0),
('s008', 'Klaas', 0, 'B', '0000-00-00 00:00:00', 'killerbunny', 0),
('s009', 'Laura', 630, 'C', '0000-00-00 00:00:00', 'killerbunny', 0),
('s010', 'Mariska', 0, 'C', '0000-00-00 00:00:00', 'killerbunny', 0),
('s011', 'Maud', 20, 'D', '0000-00-00 00:00:00', 'killerbunny', 0),
('s012', 'Maurits', 5, 'D', '0000-00-00 00:00:00', 'killerbunny', 1),
('s013', 'Naut', 0, 'D', '0000-00-00 00:00:00', 'killerbunny', 1),
('s014', 'Pepijn', 720, 'E', '0000-00-00 00:00:00', 'killerbunny', 1),
('s015', 'Piet', 0, 'D', '0000-00-00 00:00:00', 'killerbunny', 1),
('s016', 'Timon', 100, 'F', '0000-00-00 00:00:00', 'killerbunny', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`name`), ADD UNIQUE KEY `name` (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
