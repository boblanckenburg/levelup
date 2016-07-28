-- phpMyAdmin SQL Dump
-- version 4.2.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 28, 2016 at 01:09 PM
-- Server version: 5.5.50-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `levelup_clean`
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
('blackknight', 'eggbaconspam');

-- --------------------------------------------------------

--
-- Table structure for table `codecademy`
--

CREATE TABLE IF NOT EXISTS `codecademy` (
  `student_name` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `codecademy_meta`
--

CREATE TABLE IF NOT EXISTS `codecademy_meta` (
  `title` varchar(50) NOT NULL,
  `text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `codecademy_meta`
--

INSERT INTO `codecademy_meta` (`title`, `text`) VALUES
('Codecademy!', 'De aller- allerbeste manier om een goeie programmeur te worden, is om heel, maar dan ook heel veel te oefenen. Thuis kun je dat heel goed doen met behulp van <a href="https://www.codecademy.com/en/tracks/python"><FONT COLOR = "1E90FF "> Codecademy</FONT></a>. Op de site kun je zien hoeveel procent van de python track je al gedaan hebt. Vul dat hieronder in, dan verdien je 3 punten per procent! \r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE IF NOT EXISTS `homework` (
  `student_name` varchar(50) NOT NULL,
  `weeknumber` int(11) NOT NULL,
  `grade` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `homework_meta`
--

CREATE TABLE IF NOT EXISTS `homework_meta` (
  `title` varchar(100) NOT NULL,
  `text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homework_meta`
--

INSERT INTO `homework_meta` (`title`, `text`) VALUES
('Huiswerkopgaven', 'Elke week kun je 40 punten verdienen door het huiswerk in te leveren. <a href="https://elo.hsleiden.nl/webapps/blackboard/content/listContentEditable.jsp?content_id=_660294_1&course_id=_15908_1" target="_blank">Hier vinden jullie het huiswerk</a>. \r\n<br><br>\r\nJe kunt altijd 10 punten verdienen als je je huiswerk op tijd inlevert, 30 punten voor de inhoud van het programma, en we geven ook bonuspunten voor extra goed commentaar, slimme uitbereidingen van het programma, of iets anders gaafs wat je aan je programma weet toe te voegen. <br>\r\n<br>\r\nKwam je er niet helemaal uit? Geen punt: lever altijd in wat je wel hebt, en dan kijken we samen hoe je er wel uitkomt. Van fouten leer je veel meer dan van alles in 1x goed doen. En je mag elke opdracht zo vaak inleveren als je zelf wilt.<br>\r\n<br> \r\nWas je niet op tijd? Geen probleem: late inleveraars kunnen altijd nog punten halen. Iets minder dan de mensen die op tijd waren, maar dat moet geen probleem zijn. ');

-- --------------------------------------------------------

--
-- Table structure for table `level_meta`
--

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
(0, 'Movie public', 'Gefeliciteerd met het bereiken van level 0 "Een filmbezoeker" in python programmeren. Een goed begin is het halve werk!\n\nHierbij vast een teaser van de avonturen die je gaat beleven. \n\nAl enthousiast geworden? Op de codecademy pagina kun je alvast oefenen voor de lessen!', 50, '4FhL2-KatRE'),
(1, 'Coconut', 'Van harte gefeliciteerd, je hebt al meer dan 50 BinPunten gescoord en level 1 van python programmeren, ''A coconut?'' bereikt!\n\nPython is vernoemd naar Monty Python, dus hierbij wat nerd-cultuur. Waar kokosnoten al niet goed voor zijn.\n\n', 100, 'rzcLQRXW6B0'),
(2, 'Message from god', 'Een belangrijke mededeling in dit filmpje!\n\nElke programmeur heeft twee mogelijke stadia:  "I''m a god"  en "ik heb geen idee wat ik aan het doen ben". \nMaar je bent hard op weg richting de eerste van de twee. \nVan harte gefeliciteerd met het behalen van meer dan 100 BinPunten.  ', 160, 'jHsbwY4EPyA'),
(3, 'Repressed peasant', 'Broeders! Verenigt u tegen de educatieve dictatuur en werpt uw ketenen af! Al 160 BinPunten in de pocket, je klimt al aardig op. \nTot de volgende les, we rekenen op opstand!', 230, 'JvKIWjnEPNY'),
(4, 'Taunting Frenchman', 'Gefeliciteerd met het bereiken van level 4 "A Taunting Frenchman" in python programmeren.\n\nOefen je fantasievolle beledigingen maar vast voor de klas die lager staat.', 300, 'A8yjNbcKkNY'),
(5, 'Knight of the round table', 'Een liedje om te vieren dat je al meer dan 300 BinPunten hebt behaald! ', 370, 'lfGpVcdqeS0'),
(6, 'Sir Robin', 'Een moreel appel om niet te zwichten voor gevaar; maar soms is het gewoon nodig.\nMaar voor de programmeeropdrachten lopen we natuurlijk niet weg. Kom je er niet uit? Schiet dan een docent of een studentassistent aan!\n\n', 450, 'c4SJ0xR2_bQ'),
(7, 'Sir Galahad', 'Gefeliciteerd! Je hebt al meer dan 400 BinPunten gescoord, en dus absoluut  geen groentje meer. In dit filmpje ligt dat wel anders!\n\nEven bijgekomen van deze prikkelende beelden met een Codecademy opdrachtje?\n', 550, 'jjio-F47IfM'),
(8, 'Swamp Castle', 'Hoera, level 8! Je hebt al meer dan 550 BinPunten verdiend. Bijna op  de helft van je werk tot de toets. Het filmpje van deze week leert ons een belangrijke les: de aanhouder wint!', 630, 'aNaXdLWt17A'),
(9, 'Not a Witch', 'Gefeliciteerd met het bereiken van level 9 "NOT a witch" in python programmeren! Bij deze ben je niet te licht bevonden', 700, 'k3jt5ibfRzw'),
(10, 'Knight of NI', 'Dit filmpje is in mijn opinie eigenlijk wel het raarste stukje python.\nGefeliciteerd met het behalen van level 10 python programmeren: "A Knight who says NI!" Al meer dan 700 BinPunten, je bent bijna klaar voor de toets!\n', 800, 'QTQfGd3G6dg'),
(11, 'Black Knight', 'Gefeliciteerd met het bereiken van level 11 "THE Black Knight" in python programmeren!\nGeen foutmelding die je van je doel kan afbrengen! Het is immers maar code! Je zult winnen!\n\n', 900, 'dhRUe-gz690'),
(12, 'Killer Rabbit', 'Gefeliciteerd met het bereiken van level 12 "The Killer Rabbit" in python programmeren!\nNu ben je echt de pythonkoning.\n', 1000, 'tgj3nZWtOfA'),
(13, 'Not Dead', 'Opgeven? Nooit! Jij draait je toetsenbordje zelfs niet om voor de meest ingewikkelde herhaalopdracht.\nWel duizend punten in de pocket! Huzaa!', 1200, 'dGFXGwHsD_A'),
(14, 'Bridge of Death', 'Het eindpunt! Nu moet de toets echt geen probleem meer zijn. Oh en natuurlijk niet je lievelingskleur vergeten…', 1400, 'RD02dGFXGwHsD_A'),
(15, 'De bovengrens', '', 100000, '');

-- --------------------------------------------------------

--
-- Table structure for table `points_history`
--

CREATE TABLE IF NOT EXISTS `points_history` (
  `student_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `points` int(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points_meta`
--

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

CREATE TABLE IF NOT EXISTS `presences` (
  `date` datetime NOT NULL,
  `present` tinyint(1) NOT NULL,
  `student_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
('2015-09-06 00:00:00', 1),
('2015-09-06 09:30:00', 1),
('2015-09-12 00:00:00', 2),
('2015-09-12 00:00:01', 2),
('2015-09-19 00:00:00', 3),
('2015-09-19 00:00:01', 3),
('2015-09-26 00:00:00', 4),
('2015-09-26 00:00:01', 4),
('2015-10-03 00:00:00', 5),
('2015-10-03 00:00:01', 5),
('2015-10-10 00:00:00', 6),
('2015-10-10 00:00:01', 6),
('2015-10-17 00:00:00', 7),
('2015-10-17 00:00:01', 7),
('2015-10-24 00:00:00', 8),
('2015-10-24 00:00:01', 8),
('2015-11-07 00:00:00', 10),
('2015-11-07 00:00:01', 10),
('2015-11-15 00:00:00', 11),
('2015-11-15 00:00:01', 11),
('2015-11-22 00:00:00', 12),
('2015-11-22 00:00:01', 12),
('2015-11-29 00:00:00', 13),
('2015-11-29 00:00:01', 13),
('2015-12-06 00:00:00', 14),
('2015-12-06 00:00:01', 14),
('2015-12-20 00:00:00', 15),
('2015-12-20 00:00:01', 15),
('2016-01-10 00:00:00', 16),
('2016-01-10 00:00:01', 16),
('2016-01-17 00:00:00', 17),
('2016-01-17 00:00:01', 17),
('2016-01-24 00:00:00', 18),
('2016-01-24 00:00:01', 18);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `student_name` varchar(50) NOT NULL,
  `weeknumber` int(11) NOT NULL,
  `grade` decimal(6,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_meta`
--

CREATE TABLE IF NOT EXISTS `project_meta` (
  `title` varchar(100) NOT NULL,
  `text` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_meta`
--

INSERT INTO `project_meta` (`title`, `text`) VALUES
('Eigen project: de beste manier voor veeeel punten!', 'Uiteindelijk gaan jullie programma''s maken voor problemen die nog geen oplossing hebben. <br>\r\nDaar kun je best vlug al mee beginnen, op kleine schaal. Dus loven wij tot 300 punten uit voor een zelfbedacht programma. Maak iets nieuws, iets dat je zelf leuk vindt, en stuur het naar <a href="mailto:blanckenburg.b@hsleiden.nl">Bo Blanckenburg</a> dan kijken wij hoeveel het waard is. En als je het in je klas laat zien, dan levert dat naast <i> bragging rights </i> voor jou ook een gaaf voorbeeld voor je klasgenoten op. <br>\r\n<br>\r\n<!--In het verleden maakten studenten:  \r\n<a href="./file.zip">Download</a> <br>\r\n - een programma om bij bato de orbitals uit te rekenen <br>-->\r\n\r\n\r\n<br>\r\n<br>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `streak`
--

CREATE TABLE IF NOT EXISTS `streak` (
  `student_name` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `name` varchar(50) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `points` int(4) NOT NULL DEFAULT '0',
  `class` varchar(6) NOT NULL DEFAULT 'None',
  `lastlogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `highest_streak` int(11) NOT NULL DEFAULT '0',
  `password` varchar(40) NOT NULL DEFAULT 'killerbunny',
  `inactive` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`name`, `nickname`, `points`, `class`, `lastlogin`, `highest_streak`, `password`, `inactive`) VALUES
('blackknight', 'blackknight', 1399, 'S', '2016-07-28 10:31:03', 0, 'eggbaconspam', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_meta`
--
ALTER TABLE `admin_meta`
 ADD UNIQUE KEY `name` (`name`,`password`), ADD UNIQUE KEY `name_2` (`name`,`password`);

--
-- Indexes for table `codecademy_meta`
--
ALTER TABLE `codecademy_meta`
 ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
 ADD UNIQUE KEY `student_name` (`student_name`,`weeknumber`);

--
-- Indexes for table `homework_meta`
--
ALTER TABLE `homework_meta`
 ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `level_meta`
--
ALTER TABLE `level_meta`
 ADD PRIMARY KEY (`level`), ADD UNIQUE KEY `level` (`level`);

--
-- Indexes for table `points_history`
--
ALTER TABLE `points_history`
 ADD UNIQUE KEY `student_name` (`student_name`,`date`);

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
