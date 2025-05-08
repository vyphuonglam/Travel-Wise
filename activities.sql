-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2025 at 03:11 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_site`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `activity_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time_of_day` varchar(20) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `activity_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `activity_name`, `description`, `city`, `price`, `duration`, `date`, `time_of_day`, `image_url`, `activity_type`) VALUES
(4, 'Kart King - San Francisco', 'Race your friends on an adrenaline-filled go kart track.', 'San Francisco', 67.48, '1 hour', '2025-05-18', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(5, 'Bowl Lounge - San Francisco', 'Strike up fun with a round of bowling.', 'San Francisco', 174.17, '2 hours', '2025-05-09', 'Evening', 'https://i.imgur.com/y8Xnttr.png', 'Bowling'),
(6, 'Exit Quest - San Francisco', 'Solve puzzles to escape themed rooms before time runs out.', 'San Francisco', 43.27, '30 minutes', '2025-05-08', 'Afternoon', 'https://i.imgur.com/TkT0qK8.png\r\n', 'Escape Room'),
(7, 'Hatchet Zone - San Francisco', 'Sharpen your skills with a competitive axe throwing session.', 'San Francisco', 43.74, '1 hour', '2025-05-18', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(8, 'City Treks - San Francisco', 'Join a guided tour of the city\'s best sights and secrets.', 'San Francisco', 62.61, '2.5 hours', '2025-05-20', 'Morning', 'https://i.imgur.com/6aWHGmw.png', 'Tour'),
(9, 'Smash Pit - San Francisco', 'Relieve stress in a controlled smash room.', 'San Francisco', 172.22, '2 hours', '2025-05-10', 'Afternoon', 'https://i.imgur.com/paotvGH.png', 'Rage Room'),
(10, 'Aim High - San Francisco', 'Aim and score in a cozy darts lounge.', 'San Francisco', 135.58, '1 hour', '2025-05-05', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(11, 'PaintForce - San Francisco', 'Team up for a thrilling paintball match.', 'San Francisco', 110.49, '3 hours', '2025-05-02', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(12, 'Puzzle Vault - San Francisco', 'Solve puzzles to escape themed rooms before time runs out.', 'San Francisco', 85.72, '1 hour', '2025-05-12', 'Afternoon', 'https://i.imgur.com/TkT0qK8.png\r\n', 'Escape Room'),
(13, 'City Safari Park - San Francisco', 'Visit with exotic animals from around the world.', 'San Francisco', 60.41, '3 hours', '2025-05-23', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(14, 'Tech Time Museum - San Francisco', 'Explore fascinating exhibits and learn something new.', 'San Francisco', 82.33, '1.5 hours', '2025-05-06', 'Morning', 'https://i.imgur.com/lACeBOy.png', 'Museum'),
(15, 'Epic Dramas - San Francisco', 'Enjoy a captivating live performance or play.', 'San Francisco', 69.44, '30 minutes', '2025-05-27', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(16, 'TurboTrack - San Francisco', 'Race your friends on an adrenaline-filled go kart track.', 'San Francisco', 87.04, '1.5 hours', '2025-05-26', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(17, 'StarLight Theater - San Francisco', 'Enjoy a captivating live performance or play.', 'San Francisco', 151.14, '2 hours', '2025-05-06', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(18, 'CityStage - San Francisco', 'Enjoy a captivating live performance or play.', 'San Francisco', 195.22, '2 hours', '2025-05-01', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(19, 'City Treks - San Francisco', 'Join a guided tour of the city\'s best sights and secrets.', 'San Francisco', 64.92, '30 minutes', '2025-05-18', 'Morning', 'https://i.imgur.com/6aWHGmw.png', 'Tour'),
(20, 'Urban Jungle - San Francisco', 'Visit with exotic animals from around the world.', 'San Francisco', 185.10, '2 hours', '2025-05-27', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(21, 'WildWorld Zoo - San Francisco', 'Visit with exotic animals from around the world.', 'San Francisco', 46.83, '1 hour', '2025-05-01', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(22, 'TurboTrack - San Francisco', 'Race your friends on an adrenaline-filled go kart track.', 'San Francisco', 87.04, '1.5 hours', '2025-05-26', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(23, 'StarLight Theater - San Francisco', 'Enjoy a captivating live performance or play.', 'San Francisco', 151.14, '2 hours', '2025-05-06', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(24, 'CityStage - San Francisco', 'Enjoy a captivating live performance or play.', 'San Francisco', 195.22, '2 hours', '2025-05-01', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(25, 'City Treks - San Francisco', 'Join a guided tour of the city\'s best sights and secrets.', 'San Francisco', 64.92, '30 minutes', '2025-05-18', 'Morning', 'https://i.imgur.com/6aWHGmw.png', 'Tour'),
(26, 'Urban Jungle - San Francisco', 'Visit with exotic animals from around the world.', 'San Francisco', 185.10, '2 hours', '2025-05-27', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(27, 'WildWorld Zoo - San Francisco', 'Visit with exotic animals from around the world.', 'San Francisco', 46.83, '1 hour', '2025-05-01', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(28, 'Aim High - San Francisco', 'Aim and score in a cozy darts lounge.', 'San Francisco', 127.84, '1.5 hours', '2025-05-12', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(29, 'StarLight Theater - San Francisco', 'Enjoy a captivating live performance or play.', 'San Francisco', 127.20, '1 hour', '2025-05-15', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(30, 'StarLight Theater - San Francisco', 'Enjoy a captivating live performance or play.', 'San Francisco', 161.87, '30 minutes', '2025-05-09', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(31, 'Bullseye Bar - San Francisco', 'Aim and score in a cozy darts lounge.', 'San Francisco', 92.29, '1 hour', '2025-05-07', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(32, 'Urban Jungle - San Francisco', 'Visit with exotic animals from around the world.', 'San Francisco', 98.93, '1 hour', '2025-05-26', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(33, 'Explore & More - San Francisco', 'Join a guided tour of the city\'s best sights and secrets.', 'San Francisco', 141.34, '2.5 hours', '2025-05-17', 'Morning', 'https://i.imgur.com/6aWHGmw.png', 'Tour'),
(34, 'Hatchet Zone - San Francisco', 'Sharpen your skills with a competitive axe throwing session.', 'San Francisco', 165.26, '3 hours', '2025-05-06', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(35, 'Hatchet Zone - San Francisco', 'Sharpen your skills with a competitive axe throwing session.', 'San Francisco', 170.21, '1 hour', '2025-05-08', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(36, 'Kart King - San Francisco', 'Race your friends on an adrenaline-filled go kart track.', 'San Francisco', 98.22, '30 minutes', '2025-05-02', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(37, 'SplatterField - San Francisco', 'Team up for a thrilling paintball match.', 'San Francisco', 138.30, '1.5 hours', '2025-05-11', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(38, 'Kart King - San Francisco', 'Race your friends on an adrenaline-filled go kart track.', 'San Francisco', 129.89, '2 hours', '2025-05-19', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(39, 'BowMaster Range - San Francisco', 'Try your aim with a bow and arrow at a local range.', 'San Francisco', 49.43, '1 hour', '2025-05-26', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(40, 'Flight Lounge - San Francisco', 'Aim and score in a cozy darts lounge.', 'San Francisco', 131.12, '3 hours', '2025-05-11', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(41, '8-Ball Room - San Francisco', 'Challenge your friends to a casual game of pool.', 'San Francisco', 142.50, '2 hours', '2025-05-15', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(42, 'StrikeZone - San Francisco', 'Strike up fun with a round of bowling.', 'San Francisco', 191.28, '1 hour', '2025-05-16', 'Evening', 'https://i.imgur.com/y8Xnttr.png', 'Bowling'),
(43, 'PaintForce - San Francisco', 'Team up for a thrilling paintball match.', 'San Francisco', 185.44, '1.5 hours', '2025-05-24', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(44, 'Bowl Lounge - San Francisco', 'Strike up fun with a round of bowling.', 'San Francisco', 110.34, '30 minutes', '2025-05-23', 'Evening', 'https://i.imgur.com/y8Xnttr.png', 'Bowling'),
(45, 'PaintForce - San Francisco', 'Team up for a thrilling paintball match.', 'San Francisco', 152.17, '2.5 hours', '2025-05-09', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(46, 'PaintForce - San Francisco', 'Team up for a thrilling paintball match.', 'San Francisco', 99.89, '3 hours', '2025-05-09', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(47, 'Axe On - San Francisco', 'Sharpen your skills with a competitive axe throwing session.', 'San Francisco', 159.32, '2.5 hours', '2025-05-24', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(48, 'PaintForce - San Francisco', 'Team up for a thrilling paintball match.', 'San Francisco', 80.08, '3 hours', '2025-05-04', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(49, 'City Safari Park - San Francisco', 'Visit with exotic animals from around the world.', 'San Francisco', 108.53, '1 hour', '2025-05-28', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(50, 'SplatterField - San Francisco', 'Team up for a thrilling paintball match.', 'San Francisco', 112.88, '1 hour', '2025-05-25', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(51, 'Rack & Roll - San Francisco', 'Challenge your friends to a casual game of pool.', 'San Francisco', 113.24, '1.5 hours', '2025-05-30', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(52, 'SplatterField - San Francisco', 'Team up for a thrilling paintball match.', 'San Francisco', 137.87, '2 hours', '2025-05-03', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(53, 'TurboTrack - San Francisco', 'Race your friends on an adrenaline-filled go kart track.', 'San Francisco', 135.43, '3 hours', '2025-05-23', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(54, 'EscapeX - San Francisco', 'Solve puzzles to escape themed rooms before time runs out.', 'San Francisco', 187.37, '30 minutes', '2025-05-21', 'Afternoon', 'https://i.imgur.com/TkT0qK8.png\r\n', 'Escape Room'),
(55, 'Arrow Point - San Francisco', 'Try your aim with a bow and arrow at a local range.', 'San Francisco', 140.25, '1 hour', '2025-05-19', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(56, 'Smash Pit - San Francisco', 'Relieve stress in a controlled smash room.', 'San Francisco', 112.59, '2 hours', '2025-05-23', 'Afternoon', 'https://i.imgur.com/paotvGH.png', 'Rage Room'),
(57, 'Flight Lounge - San Francisco', 'Aim and score in a cozy darts lounge.', 'San Francisco', 158.69, '2 hours', '2025-05-25', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(58, 'Urban Jungle - San Francisco', 'Visit with exotic animals from around the world.', 'San Francisco', 70.50, '2 hours', '2025-05-10', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(59, 'Top Swing - San Francisco', 'Play a game of high-tech golf with food and drinks.', 'San Francisco', 176.56, '1.5 hours', '2025-05-18', 'Afternoon', 'https://i.imgur.com/hu6Hklr.png\r\n', 'Topgolf'),
(60, 'TurboTrack - San Jose', 'Race your friends on an adrenaline-filled go kart track.', 'San Jose', 72.91, '1 hour', '2025-05-04', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(61, 'EscapeX - San Jose', 'Solve puzzles to escape themed rooms before time runs out.', 'San Jose', 170.25, '2 hours', '2025-05-14', 'Afternoon', 'https://i.imgur.com/TkT0qK8.png\r\n', 'Escape Room'),
(62, 'Aim High - San Jose', 'Aim and score in a cozy darts lounge.', 'San Jose', 65.91, '30 minutes', '2025-05-24', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(63, 'StarLight Theater - San Jose', 'Enjoy a captivating live performance or play.', 'San Jose', 75.45, '30 minutes', '2025-05-24', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(64, 'Kart King - San Jose', 'Race your friends on an adrenaline-filled go kart track.', 'San Jose', 43.58, '30 minutes', '2025-05-02', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(65, 'GolfHub - San Jose', 'Play a game of high-tech golf with food and drinks.', 'San Jose', 104.67, '2 hours', '2025-05-12', 'Afternoon', 'https://i.imgur.com/hu6Hklr.png\r\n', 'Topgolf'),
(66, 'Rack & Roll - San Jose', 'Challenge your friends to a casual game of pool.', 'San Jose', 177.60, '1.5 hours', '2025-05-13', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(67, 'Civic History Gallery - San Jose', 'Explore fascinating exhibits and learn something new.', 'San Jose', 171.29, '2 hours', '2025-05-19', 'Morning', 'https://i.imgur.com/lACeBOy.png', 'Museum'),
(68, 'DriveTime - San Jose', 'Play a game of high-tech golf with food and drinks.', 'San Jose', 47.07, '30 minutes', '2025-05-07', 'Afternoon', 'https://i.imgur.com/hu6Hklr.png\r\n', 'Topgolf'),
(69, 'Kart King - San Jose', 'Race your friends on an adrenaline-filled go kart track.', 'San Jose', 114.01, '1 hour', '2025-05-18', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(70, 'BowMaster Range - San Jose', 'Try your aim with a bow and arrow at a local range.', 'San Jose', 109.99, '3 hours', '2025-05-06', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(71, 'EscapeX - San Jose', 'Solve puzzles to escape themed rooms before time runs out.', 'San Jose', 159.49, '2 hours', '2025-05-09', 'Afternoon', 'https://i.imgur.com/TkT0qK8.png\r\n', 'Escape Room'),
(72, 'Bullseye Bar - San Jose', 'Aim and score in a cozy darts lounge.', 'San Jose', 125.24, '1 hour', '2025-05-31', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(73, 'Kart King - San Jose', 'Race your friends on an adrenaline-filled go kart track.', 'San Jose', 136.57, '1.5 hours', '2025-05-18', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(74, 'Arrow Point - San Jose', 'Try your aim with a bow and arrow at a local range.', 'San Jose', 68.57, '1.5 hours', '2025-05-08', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(75, 'Hatchet Zone - San Jose', 'Sharpen your skills with a competitive axe throwing session.', 'San Jose', 95.73, '30 minutes', '2025-05-14', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(76, 'City Safari Park - San Jose', 'Visit with exotic animals from around the world.', 'San Jose', 193.35, '2 hours', '2025-05-21', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(77, 'Hidden Gems Tour - San Jose', 'Join a guided tour of the city\'s best sights and secrets.', 'San Jose', 196.34, '30 minutes', '2025-05-20', 'Morning', 'https://i.imgur.com/6aWHGmw.png', 'Tour'),
(78, 'Hatchet Zone - San Jose', 'Sharpen your skills with a competitive axe throwing session.', 'San Jose', 184.67, '30 minutes', '2025-05-08', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(79, 'Puzzle Vault - San Jose', 'Solve puzzles to escape themed rooms before time runs out.', 'San Jose', 165.57, '1.5 hours', '2025-05-12', 'Afternoon', 'https://i.imgur.com/TkT0qK8.png\r\n', 'Escape Room'),
(80, 'Axe On - San Jose', 'Sharpen your skills with a competitive axe throwing session.', 'San Jose', 152.97, '2.5 hours', '2025-05-23', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(81, 'Axe On - San Jose', 'Sharpen your skills with a competitive axe throwing session.', 'San Jose', 46.30, '1 hour', '2025-05-10', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(82, 'Axe On - San Jose', 'Sharpen your skills with a competitive axe throwing session.', 'San Jose', 178.02, '2 hours', '2025-05-11', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(83, 'TurboTrack - San Jose', 'Race your friends on an adrenaline-filled go kart track.', 'San Jose', 159.84, '30 minutes', '2025-05-30', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(84, 'Smash Pit - San Jose', 'Relieve stress in a controlled smash room.', 'San Jose', 100.32, '1 hour', '2025-05-23', 'Afternoon', 'https://i.imgur.com/paotvGH.png', 'Rage Room'),
(85, '8-Ball Room - San Jose', 'Challenge your friends to a casual game of pool.', 'San Jose', 98.58, '3 hours', '2025-05-15', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(86, '8-Ball Room - San Jose', 'Challenge your friends to a casual game of pool.', 'San Jose', 48.58, '30 minutes', '2025-05-02', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(87, 'Top Swing - San Jose', 'Play a game of high-tech golf with food and drinks.', 'San Jose', 77.46, '1.5 hours', '2025-05-10', 'Afternoon', 'https://i.imgur.com/hu6Hklr.png\r\n', 'Topgolf'),
(88, 'Arrow Point - San Jose', 'Try your aim with a bow and arrow at a local range.', 'San Jose', 146.88, '2.5 hours', '2025-05-11', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(89, 'ColorCombat - San Jose', 'Team up for a thrilling paintball match.', 'San Jose', 109.06, '2 hours', '2025-05-22', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(90, 'Epic Dramas - San Jose', 'Enjoy a captivating live performance or play.', 'San Jose', 87.04, '2.5 hours', '2025-05-13', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(91, 'Hatchet Zone - San Jose', 'Sharpen your skills with a competitive axe throwing session.', 'San Jose', 185.65, '1.5 hours', '2025-05-28', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(92, 'City Treks - San Jose', 'Join a guided tour of the city\'s best sights and secrets.', 'San Jose', 163.64, '3 hours', '2025-05-08', 'Morning', 'https://i.imgur.com/6aWHGmw.png', 'Tour'),
(93, 'Precision Archery - San Jose', 'Try your aim with a bow and arrow at a local range.', 'San Jose', 89.26, '2.5 hours', '2025-05-16', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(94, 'Cue Club - San Jose', 'Challenge your friends to a casual game of pool.', 'San Jose', 93.60, '3 hours', '2025-05-18', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(95, 'Epic Dramas - San Jose', 'Enjoy a captivating live performance or play.', 'San Jose', 192.26, '1 hour', '2025-05-25', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(96, 'PaintForce - San Jose', 'Team up for a thrilling paintball match.', 'San Jose', 126.76, '2 hours', '2025-05-05', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(97, 'Rack & Roll - San Jose', 'Challenge your friends to a casual game of pool.', 'San Jose', 185.17, '1.5 hours', '2025-05-17', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(98, 'ColorCombat - San Jose', 'Team up for a thrilling paintball match.', 'San Jose', 169.85, '1.5 hours', '2025-05-13', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(99, 'Rolling Lanes - San Jose', 'Strike up fun with a round of bowling.', 'San Jose', 165.81, '1.5 hours', '2025-05-18', 'Evening', 'https://i.imgur.com/y8Xnttr.png', 'Bowling'),
(100, 'Urban Jungle - Oakland', 'Visit with exotic animals from around the world.', 'Oakland', 124.94, '1 hour', '2025-05-22', 'Morning', 'https://i.imgur.com/GxiIz73.png', 'Zoo'),
(101, 'City Treks - Oakland', 'Join a guided tour of the city\'s best sights and secrets.', 'Oakland', 131.50, '30 minutes', '2025-05-13', 'Morning', 'https://i.imgur.com/6aWHGmw.png', 'Tour'),
(102, 'Tech Time Museum - Oakland', 'Explore fascinating exhibits and learn something new.', 'Oakland', 136.91, '2.5 hours', '2025-05-14', 'Morning', 'https://i.imgur.com/lACeBOy.png', 'Museum'),
(103, 'TurboTrack - Oakland', 'Race your friends on an adrenaline-filled go kart track.', 'Oakland', 89.32, '30 minutes', '2025-05-06', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(104, 'Arrow Point - Oakland', 'Try your aim with a bow and arrow at a local range.', 'Oakland', 93.52, '2 hours', '2025-05-08', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(105, 'Smash Pit - Oakland', 'Relieve stress in a controlled smash room.', 'Oakland', 67.62, '30 minutes', '2025-05-05', 'Afternoon', 'https://i.imgur.com/paotvGH.png', 'Rage Room'),
(106, 'Cue Club - Oakland', 'Challenge your friends to a casual game of pool.', 'Oakland', 80.66, '30 minutes', '2025-05-11', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(107, 'Epic Dramas - Oakland', 'Enjoy a captivating live performance or play.', 'Oakland', 196.67, '2.5 hours', '2025-05-05', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(108, 'Tech Time Museum - Oakland', 'Explore fascinating exhibits and learn something new.', 'Oakland', 115.32, '30 minutes', '2025-05-23', 'Morning', 'https://i.imgur.com/lACeBOy.png', 'Museum'),
(109, 'Modern Arts Museum - Oakland', 'Explore fascinating exhibits and learn something new.', 'Oakland', 172.78, '2.5 hours', '2025-05-09', 'Morning', 'https://i.imgur.com/lACeBOy.png', 'Museum'),
(110, 'Lumber Rage - Oakland', 'Sharpen your skills with a competitive axe throwing session.', 'Oakland', 167.32, '3 hours', '2025-05-04', 'Evening', 'https://i.imgur.com/p1rKDpI.png', 'Axe Throwing'),
(111, 'Aim High - Oakland', 'Aim and score in a cozy darts lounge.', 'Oakland', 164.36, '2 hours', '2025-05-09', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(112, 'CityStage - Oakland', 'Enjoy a captivating live performance or play.', 'Oakland', 121.24, '30 minutes', '2025-05-24', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(113, 'DriveTime - Oakland', 'Play a game of high-tech golf with food and drinks.', 'Oakland', 118.80, '30 minutes', '2025-05-22', 'Afternoon', 'https://i.imgur.com/hu6Hklr.png\r\n', 'Topgolf'),
(114, 'Bullseye Bar - Oakland', 'Aim and score in a cozy darts lounge.', 'Oakland', 158.33, '1.5 hours', '2025-05-16', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(115, 'Kart King - Oakland', 'Race your friends on an adrenaline-filled go kart track.', 'Oakland', 183.01, '30 minutes', '2025-05-28', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(116, 'BowMaster Range - Oakland', 'Try your aim with a bow and arrow at a local range.', 'Oakland', 157.54, '2.5 hours', '2025-05-13', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(117, 'Puzzle Vault - Oakland', 'Solve puzzles to escape themed rooms before time runs out.', 'Oakland', 189.71, '30 minutes', '2025-05-25', 'Afternoon', 'https://i.imgur.com/TkT0qK8.png\r\n', 'Escape Room'),
(118, '8-Ball Room - Oakland', 'Challenge your friends to a casual game of pool.', 'Oakland', 157.45, '2 hours', '2025-05-20', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(119, 'City Treks - Oakland', 'Join a guided tour of the city\'s best sights and secrets.', 'Oakland', 44.17, '1 hour', '2025-05-27', 'Morning', 'https://i.imgur.com/6aWHGmw.png', 'Tour'),
(120, 'SpeedZone - Oakland', 'Race your friends on an adrenaline-filled go kart track.', 'Oakland', 199.96, '30 minutes', '2025-05-19', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(121, 'Bullseye Bar - Oakland', 'Aim and score in a cozy darts lounge.', 'Oakland', 88.41, '1.5 hours', '2025-05-23', 'Evening', 'https://i.imgur.com/59vmNkg.png\r\n', 'Darts'),
(122, 'ColorCombat - Oakland', 'Team up for a thrilling paintball match.', 'Oakland', 176.80, '2 hours', '2025-05-10', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(123, 'Rack & Roll - Oakland', 'Challenge your friends to a casual game of pool.', 'Oakland', 71.56, '1 hour', '2025-05-24', 'Evening', 'https://i.imgur.com/P7uFtsC.png', 'Pool'),
(124, 'SpeedZone - Oakland', 'Race your friends on an adrenaline-filled go kart track.', 'Oakland', 128.85, '1.5 hours', '2025-05-20', 'Afternoon', 'https://i.imgur.com/h1uNHY1.png', 'Go Karting'),
(125, 'ColorCombat - Oakland', 'Team up for a thrilling paintball match.', 'Oakland', 197.58, '2 hours', '2025-05-26', 'Afternoon', 'https://i.imgur.com/KOe4grn.png', 'Paintball'),
(126, 'Top Swing - Oakland', 'Play a game of high-tech golf with food and drinks.', 'Oakland', 81.95, '2 hours', '2025-05-17', 'Afternoon', 'https://i.imgur.com/hu6Hklr.png\r\n', 'Topgolf'),
(127, 'StarLight Theater - Oakland', 'Enjoy a captivating live performance or play.', 'Oakland', 69.51, '1.5 hours', '2025-05-25', 'Evening', 'https://i.imgur.com/RZqor8W.png', 'Theater'),
(128, 'Arrow Point - Oakland', 'Try your aim with a bow and arrow at a local range.', 'Oakland', 126.58, '1.5 hours', '2025-05-19', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery'),
(129, 'Arrow Point - Oakland', 'Try your aim with a bow and arrow at a local range.', 'Oakland', 98.31, '1.5 hours', '2025-05-12', 'Morning', 'https://i.imgur.com/yoFN1Pn.png', 'Archery');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
