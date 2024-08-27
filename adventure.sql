-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 08, 2023 at 11:38 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adventure`
--

-- --------------------------------------------------------

--
-- Table structure for table `adventures`
--

CREATE TABLE `adventures` (
  `adventure_id` int(11) NOT NULL,
  `adventure_name` varchar(25) NOT NULL,
  `adventure_environment` varchar(10) NOT NULL,
  `adventure_price` decimal(8,2) NOT NULL,
  `adventure_duration` varchar(5) NOT NULL,
  `adventure_place` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adventures`
--

INSERT INTO `adventures` (`adventure_id`, `adventure_name`, `adventure_environment`, `adventure_price`, `adventure_duration`, `adventure_place`) VALUES
(1, 'Bouldering', 'Indoor', '80.00', '60min', 'Adventure room'),
(2, 'Horseriding', 'Outdoor', '120.00', '90min', 'Playing Field'),
(3, 'Iceskating', 'Indoor', '180.00', '60min', 'Adventure room'),
(4, 'Lazer Tag', 'Indoor', '80.00', '60min', 'Adventure room'),
(5, 'Paintballing', 'Outdoor', '150.00', '90min', 'Playing Field'),
(6, 'Scavenger Hunt', 'Indoor', '90.00', '60min', 'Adventure room');

-- --------------------------------------------------------

--
-- Table structure for table `adventure_location`
--

CREATE TABLE `adventure_location` (
  `adventure_location_id` int(11) NOT NULL,
  `adventure_location` varchar(25) NOT NULL,
  `adventure_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adventure_location`
--

INSERT INTO `adventure_location` (`adventure_location_id`, `adventure_location`, `adventure_id`) VALUES
(1, 'Rygrass Field', 2),
(2, 'Longwood Field', 5),
(3, 'Room1', 6),
(4, 'Room2', 6),
(5, 'Room3', 1),
(6, 'Room4', 1),
(7, 'Room5', 4),
(8, 'Room6', 4),
(9, 'Room7', 3);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `attendance_status` varchar(10) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `attendance_status`, `group_id`) VALUES
(1, 'present', 1),
(2, 'present', 2),
(3, 'present', 3),
(4, 'present', 4),
(5, 'present', 5),
(6, 'present', 6),
(7, 'present', 7);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `group_id` int(11) NOT NULL,
  `observer_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `adventure_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `booking_date`, `group_id`, `observer_id`, `slot_id`, `adventure_id`) VALUES
(1, '2021-06-23', 1, 1, 6, 5),
(2, '2021-06-23', 2, 2, 8, 2),
(3, '2021-06-22', 3, 3, 3, 6),
(4, '2021-06-19', 4, 4, 20, 1),
(5, '2021-06-15', 5, 5, 1, 4),
(6, '2021-06-09', 6, 6, 7, 3),
(7, '2021-06-19', 7, 3, 21, 5);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(25) NOT NULL,
  `group_size` int(11) NOT NULL,
  `observer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`, `group_size`, `observer_id`) VALUES
(1, 'Warriors', 4, 1),
(2, 'Wildtamers', 2, 2),
(3, 'MysterySolvers', 2, 3),
(4, 'FearlessFighters', 2, 4),
(5, 'Survivors', 2, 5),
(6, 'Gliders', 3, 6),
(7, 'Vultures', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `group_players`
--

CREATE TABLE `group_players` (
  `group_player_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_players`
--

INSERT INTO `group_players` (`group_player_id`, `player_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 2, 2),
(6, 5, 2),
(7, 4, 3),
(8, 6, 3),
(9, 7, 4),
(10, 1, 4),
(11, 2, 5),
(12, 8, 5),
(13, 9, 6),
(14, 8, 6),
(15, 10, 6),
(16, 2, 7),
(17, 9, 7),
(18, 8, 7),
(19, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `observer`
--

CREATE TABLE `observer` (
  `observer_id` int(11) NOT NULL,
  `observer_name` varchar(25) NOT NULL,
  `observer_number` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `observer`
--

INSERT INTO `observer` (`observer_id`, `observer_name`, `observer_number`) VALUES
(1, 'John', '(081)7123456'),
(2, 'Jane', '(061)7789012'),
(3, 'Aqeelah', '(082)8345678'),
(4, 'Xosi', '(081)7652341'),
(5, 'Nathi', '(082)6671234'),
(6, 'Kira', '(082)7683465');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `player_sa_id_num` char(13) NOT NULL,
  `player_name` varchar(25) NOT NULL,
  `player_lastname` varchar(25) NOT NULL,
  `player_gender` char(1) NOT NULL,
  `player_emergency_num` char(12) NOT NULL,
  `player_number` char(12) NOT NULL,
  `player_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `player_sa_id_num`, `player_name`, `player_lastname`, `player_gender`, `player_emergency_num`, `player_number`, `player_email`) VALUES
(1, '0310215092089', 'Ilyaaz ', 'Muhammad', 'M', '(081)4256678', '(061)5467789', 'Ilyaazmuhammad@gmail.com'),
(2, '0110030182089', 'Rania', 'Solomons', 'F', '(081)3456799', '(082)6758897', 'Raniasolomons@gmail.com'),
(3, '0211145789045', 'Yahya ', 'Solomons', 'M', '(081)3456799', '(081)6783738', 'Yahyasolomons@gmail.com'),
(4, '0611035976089', 'Mikaeel ', 'Omar', 'M', '(072)6781234', '(061)3517892', 'Mikaeelomar1@gmail.com'),
(5, '0310135035014', 'Muhammad ', 'Peters', 'M', '(082)4567890', '(082)4182571', 'Muhammadpeters@gmail.com'),
(6, '0211145789045', 'Jared ', 'Ackers', 'M', '(081)3247580', '(061)8727898', 'JaredAcker123@gmail.com'),
(7, '0112295888075', 'Josh ', 'Nightley', 'M', '(061)5647890', '(082)7836785', 'JoshN@gmail.com'),
(8, '0112051752076', 'Ally ', 'Berlin', 'F', '(082)8762637', '(081)5126677', 'AlleyBerlin@icloud.com'),
(9, '0211145789045', 'Lily ', 'Saline', 'F', '(062)7653879', '(081)6751122', 'LilySaline@icloud.com'),
(10, '0210214092069', 'Alina', 'Peters', 'F', '(082)4567890', '(061)5465289', 'Alinapeters@gmail.com'),
(11, '0611034976059', 'Kefilwe', 'Grace', 'F', '(081)8976574', '(021)6968443', 'Kefilwegrace45@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `player_participation`
--

CREATE TABLE `player_participation` (
  `player_part_id` int(11) NOT NULL,
  `adventure_id` int(6) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_participation`
--

INSERT INTO `player_participation` (`player_part_id`, `adventure_id`, `booking_id`, `player_id`) VALUES
(1, 5, 1, 2),
(2, 2, 2, 2),
(3, 4, 5, 2),
(4, 5, 7, 2),
(5, 4, 5, 8),
(6, 3, 6, 8),
(7, 2, 2, 5),
(8, 3, 6, 9),
(9, 3, 6, 10),
(10, 5, 7, 9),
(11, 5, 7, 10),
(12, 5, 7, 11),
(13, 5, 7, 4),
(14, 5, 1, 3),
(15, 5, 1, 4),
(16, 5, 1, 1),
(17, 6, 3, 4),
(18, 6, 3, 6),
(19, 1, 4, 7),
(20, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `slots` (
  `slot_id` int(11) NOT NULL,
  `slot_start` varchar(6) NOT NULL,
  `slot_end` varchar(6) NOT NULL,
  `slot_day` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`slot_id`, `slot_start`, `slot_end`, `slot_day`) VALUES
(1, '08:00', '09:00', 'Tuesday'),
(2, '09:30 ', '11:00', 'Tuesday'),
(3, '13:00', '14:00', 'Tuesday'),
(4, '14:30', '16:00', 'Tuesday'),
(5, '08:00', '09:00', 'Wednesday'),
(6, '9:30 ', '11:00', 'Wednesday'),
(7, '13:00', '14:00', 'Wednesday'),
(8, '14:30', '16:00', 'Wednesday'),
(9, '08:00', '09:00', 'Thursday'),
(10, '9:30 ', '11:00', 'Thursday'),
(11, '13:00', '14:00', 'Thursday'),
(12, '14:30', '16:00', 'Thursday'),
(13, '08:00', '09:00', 'Friday'),
(14, '9:30 ', '11:00', 'Friday'),
(15, '14:30', '16:00', 'Friday'),
(16, '08:00', '09:00', 'Satuday'),
(17, '9:30 ', '11:00', 'Saturday'),
(18, '14:30', '16:00', 'Saturday'),
(19, '13:00', '14:00', 'Saturday'),
(20, '08:00', '09:00', 'Sunday'),
(21, '9:30 ', '11:00', 'Sunday');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adventures`
--
ALTER TABLE `adventures`
  ADD PRIMARY KEY (`adventure_id`);

--
-- Indexes for table `adventure_location`
--
ALTER TABLE `adventure_location`
  ADD PRIMARY KEY (`adventure_location_id`),
  ADD KEY `adventure_location_ibfk_1` (`adventure_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `bookings_ibfk_1` (`group_id`),
  ADD KEY `observer_id` (`observer_id`),
  ADD KEY `slot_id` (`slot_id`),
  ADD KEY `adventure_id` (`adventure_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `observer_id` (`observer_id`);

--
-- Indexes for table `group_players`
--
ALTER TABLE `group_players`
  ADD PRIMARY KEY (`group_player_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `observer`
--
ALTER TABLE `observer`
  ADD PRIMARY KEY (`observer_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_participation`
--
ALTER TABLE `player_participation`
  ADD PRIMARY KEY (`player_part_id`),
  ADD KEY `player_participation_ibfk_1` (`adventure_id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`slot_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adventure_location`
--
ALTER TABLE `adventure_location`
  ADD CONSTRAINT `adventure_location_ibfk_1` FOREIGN KEY (`adventure_id`) REFERENCES `adventures` (`adventure_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`observer_id`) REFERENCES `observer` (`observer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`slot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_4` FOREIGN KEY (`adventure_id`) REFERENCES `adventures` (`adventure_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `observer_ibfk_1` FOREIGN KEY (`observer_id`) REFERENCES `observer` (`observer_id`);

--
-- Constraints for table `group_players`
--
ALTER TABLE `group_players`
  ADD CONSTRAINT `group_players_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `group_players_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`);

--
-- Constraints for table `player_participation`
--
ALTER TABLE `player_participation`
  ADD CONSTRAINT `player_participation_ibfk_1` FOREIGN KEY (`adventure_id`) REFERENCES `adventures` (`adventure_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_participation_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`),
  ADD CONSTRAINT `player_participation_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
