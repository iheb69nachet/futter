-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 04 juin 2021 à 18:47
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `flutter`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'admin', 'admin@admin.com', 'admin@admin.com');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `qr_code` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `qr_code`, `owner_id`) VALUES
(1, 'dfsd', 1, 1),
(2, 'aaa', 121, 12);

-- --------------------------------------------------------

--
-- Structure de la table `production`
--

CREATE TABLE `production` (
  `id` int(11) NOT NULL,
  `id_product` int(255) NOT NULL,
  `production` varchar(255) NOT NULL,
  `day` int(255) NOT NULL,
  `month` int(255) NOT NULL,
  `year` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `production`
--

INSERT INTO `production` (`id`, `id_product`, `production`, `day`, `month`, `year`) VALUES
(1, 1, '4', 2, 1, 2021),
(2, 1, '3', 3, 1, 2021),
(3, 1, '5', 4, 1, 2021),
(4, 1, '3', 5, 1, 2021),
(5, 1, '1', 6, 1, 2021),
(6, 1, '4', 7, 1, 2021),
(7, 1, '1', 8, 1, 2021),
(8, 1, '5', 9, 1, 2021),
(9, 1, '3', 10, 1, 2021),
(10, 1, '0', 11, 1, 2021),
(11, 1, '0', 12, 1, 2021),
(12, 1, '3', 13, 1, 2021),
(13, 1, '9', 14, 1, 2021),
(14, 1, '6', 15, 1, 2021),
(15, 1, '5', 16, 1, 2021),
(16, 1, '5', 17, 1, 2021),
(17, 1, '3', 18, 1, 2021),
(18, 1, '0', 19, 1, 2021),
(19, 1, '8', 20, 1, 2021),
(20, 1, '0', 21, 1, 2021),
(21, 1, '4', 22, 1, 2021),
(22, 1, '7', 23, 1, 2021),
(23, 1, '7', 24, 1, 2021),
(24, 1, '4', 25, 1, 2021),
(25, 1, '3', 26, 1, 2021),
(26, 1, '5', 27, 1, 2021),
(27, 1, '3', 28, 1, 2021),
(28, 1, '0', 29, 1, 2021),
(29, 1, '4', 30, 1, 2021),
(30, 1, '9', 1, 1, 2021),
(31, 1, '9', 2, 2, 2021),
(32, 1, '0', 3, 2, 2021),
(33, 1, '2', 4, 2, 2021),
(34, 1, '7', 5, 2, 2021),
(35, 1, '2', 6, 2, 2021),
(36, 1, '8', 7, 2, 2021),
(37, 1, '8', 8, 2, 2021),
(38, 1, '1', 9, 2, 2021),
(39, 1, '3', 10, 2, 2021),
(40, 1, '8', 11, 2, 2021),
(41, 1, '2', 12, 2, 2021),
(42, 1, '6', 13, 2, 2021),
(43, 1, '2', 14, 2, 2021),
(44, 1, '4', 15, 2, 2021),
(45, 1, '4', 16, 2, 2021),
(46, 1, '6', 17, 2, 2021),
(47, 1, '3', 18, 2, 2021),
(48, 1, '7', 19, 2, 2021),
(49, 1, '9', 20, 2, 2021),
(50, 1, '7', 21, 2, 2021),
(51, 1, '0', 22, 2, 2021),
(52, 1, '1', 23, 2, 2021),
(53, 1, '4', 24, 2, 2021),
(54, 1, '2', 25, 2, 2021),
(55, 1, '5', 26, 2, 2021),
(56, 1, '8', 27, 2, 2021),
(57, 1, '4', 28, 2, 2021),
(58, 1, '7', 29, 2, 2021),
(59, 1, '9', 30, 2, 2021),
(60, 1, '9', 1, 2, 2021),
(61, 1, '8', 2, 3, 2021),
(62, 1, '5', 3, 3, 2021),
(63, 1, '4', 4, 3, 2021),
(64, 1, '0', 5, 3, 2021),
(65, 1, '0', 6, 3, 2021),
(66, 1, '7', 7, 3, 2021),
(67, 1, '0', 8, 3, 2021),
(68, 1, '0', 9, 3, 2021),
(69, 1, '5', 10, 3, 2021),
(70, 1, '5', 11, 3, 2021),
(71, 1, '7', 12, 3, 2021),
(72, 1, '6', 13, 3, 2021),
(73, 1, '7', 14, 3, 2021),
(74, 1, '7', 15, 3, 2021),
(75, 1, '8', 16, 3, 2021),
(76, 1, '8', 17, 3, 2021),
(77, 1, '5', 18, 3, 2021),
(78, 1, '5', 19, 3, 2021),
(79, 1, '0', 20, 3, 2021),
(80, 1, '8', 21, 3, 2021),
(81, 1, '3', 22, 3, 2021),
(82, 1, '7', 23, 3, 2021),
(83, 1, '6', 24, 3, 2021),
(84, 1, '5', 25, 3, 2021),
(85, 1, '8', 26, 3, 2021),
(86, 1, '2', 27, 3, 2021),
(87, 1, '3', 28, 3, 2021),
(88, 1, '4', 29, 3, 2021),
(89, 1, '7', 30, 3, 2021),
(90, 1, '8', 1, 3, 2021),
(91, 1, '0', 2, 4, 2021),
(92, 1, '2', 3, 4, 2021),
(93, 1, '3', 4, 4, 2021),
(94, 1, '2', 5, 4, 2021),
(95, 1, '4', 6, 4, 2021),
(96, 1, '0', 7, 4, 2021),
(97, 1, '4', 8, 4, 2021),
(98, 1, '2', 9, 4, 2021),
(99, 1, '2', 10, 4, 2021),
(100, 1, '3', 11, 4, 2021),
(101, 1, '7', 12, 4, 2021),
(102, 1, '4', 13, 4, 2021),
(103, 1, '1', 14, 4, 2021),
(104, 1, '7', 15, 4, 2021),
(105, 1, '4', 16, 4, 2021),
(106, 1, '2', 17, 4, 2021),
(107, 1, '0', 18, 4, 2021),
(108, 1, '2', 19, 4, 2021),
(109, 1, '1', 20, 4, 2021),
(110, 1, '8', 21, 4, 2021),
(111, 1, '0', 22, 4, 2021),
(112, 1, '6', 23, 4, 2021),
(113, 1, '2', 24, 4, 2021),
(114, 1, '2', 25, 4, 2021),
(115, 1, '1', 26, 4, 2021),
(116, 1, '4', 27, 4, 2021),
(117, 1, '2', 28, 4, 2021),
(118, 1, '4', 29, 4, 2021),
(119, 1, '1', 30, 4, 2021),
(120, 1, '8', 1, 4, 2021),
(121, 1, '0', 2, 5, 2021),
(122, 1, '2', 3, 5, 2021),
(123, 1, '4', 4, 5, 2021),
(124, 1, '9', 5, 5, 2021),
(125, 1, '7', 6, 5, 2021),
(126, 1, '5', 7, 5, 2021),
(127, 1, '8', 8, 5, 2021),
(128, 1, '2', 9, 5, 2021),
(129, 1, '6', 10, 5, 2021),
(130, 1, '1', 11, 5, 2021),
(131, 1, '1', 12, 5, 2021),
(132, 1, '7', 13, 5, 2021),
(133, 1, '5', 14, 5, 2021),
(134, 1, '0', 15, 5, 2021),
(135, 1, '7', 16, 5, 2021),
(136, 1, '1', 17, 5, 2021),
(137, 1, '5', 18, 5, 2021),
(138, 1, '3', 19, 5, 2021),
(139, 1, '9', 20, 5, 2021),
(140, 1, '3', 21, 5, 2021),
(141, 1, '2', 22, 5, 2021),
(142, 1, '7', 23, 5, 2021),
(143, 1, '3', 24, 5, 2021),
(144, 1, '1', 25, 5, 2021),
(145, 1, '1', 26, 5, 2021),
(146, 1, '5', 27, 5, 2021),
(147, 1, '6', 28, 5, 2021),
(148, 1, '4', 29, 5, 2021),
(149, 1, '6', 30, 5, 2021),
(150, 1, '7', 1, 5, 2021),
(151, 1, '6', 2, 6, 2021),
(152, 1, '5', 3, 6, 2021),
(153, 1, '3', 4, 6, 2021),
(154, 1, '9', 5, 6, 2021),
(155, 1, '3', 6, 6, 2021),
(156, 1, '0', 7, 6, 2021),
(157, 1, '7', 8, 6, 2021),
(158, 1, '2', 9, 6, 2021),
(159, 1, '3', 10, 6, 2021),
(160, 1, '0', 11, 6, 2021),
(161, 1, '5', 12, 6, 2021),
(162, 1, '9', 13, 6, 2021),
(163, 1, '7', 14, 6, 2021),
(164, 1, '0', 15, 6, 2021),
(165, 1, '1', 16, 6, 2021),
(166, 1, '5', 17, 6, 2021),
(167, 1, '6', 18, 6, 2021),
(168, 1, '3', 19, 6, 2021),
(169, 1, '9', 20, 6, 2021),
(170, 1, '5', 21, 6, 2021),
(171, 1, '5', 22, 6, 2021),
(172, 1, '4', 23, 6, 2021),
(173, 1, '4', 24, 6, 2021),
(174, 1, '6', 25, 6, 2021),
(175, 1, '2', 26, 6, 2021),
(176, 1, '6', 27, 6, 2021),
(177, 1, '3', 28, 6, 2021),
(178, 1, '8', 29, 6, 2021),
(179, 1, '0', 30, 6, 2021),
(180, 1, '4', 1, 6, 2021),
(181, 1, '2', 2, 7, 2021),
(182, 1, '3', 3, 7, 2021),
(183, 1, '0', 4, 7, 2021),
(184, 1, '7', 5, 7, 2021),
(185, 1, '6', 6, 7, 2021),
(186, 1, '9', 7, 7, 2021),
(187, 1, '0', 8, 7, 2021),
(188, 1, '2', 9, 7, 2021),
(189, 1, '1', 10, 7, 2021),
(190, 1, '7', 11, 7, 2021),
(191, 1, '0', 12, 7, 2021),
(192, 1, '7', 13, 7, 2021),
(193, 1, '4', 14, 7, 2021),
(194, 1, '6', 15, 7, 2021),
(195, 1, '7', 16, 7, 2021),
(196, 1, '1', 17, 7, 2021),
(197, 1, '5', 18, 7, 2021),
(198, 1, '5', 19, 7, 2021),
(199, 1, '7', 20, 7, 2021),
(200, 1, '3', 21, 7, 2021),
(201, 1, '8', 22, 7, 2021),
(202, 1, '5', 23, 7, 2021),
(203, 1, '7', 24, 7, 2021),
(204, 1, '7', 25, 7, 2021),
(205, 1, '1', 26, 7, 2021),
(206, 1, '5', 27, 7, 2021),
(207, 1, '0', 28, 7, 2021),
(208, 1, '1', 29, 7, 2021),
(209, 1, '3', 30, 7, 2021),
(210, 1, '0', 1, 7, 2021),
(211, 1, '8', 2, 8, 2021),
(212, 1, '3', 3, 8, 2021),
(213, 1, '3', 4, 8, 2021),
(214, 1, '9', 5, 8, 2021),
(215, 1, '0', 6, 8, 2021),
(216, 1, '5', 7, 8, 2021),
(217, 1, '7', 8, 8, 2021),
(218, 1, '3', 9, 8, 2021),
(219, 1, '9', 10, 8, 2021),
(220, 1, '6', 11, 8, 2021),
(221, 1, '3', 12, 8, 2021),
(222, 1, '4', 13, 8, 2021),
(223, 1, '6', 14, 8, 2021),
(224, 1, '7', 15, 8, 2021),
(225, 1, '7', 16, 8, 2021),
(226, 1, '7', 17, 8, 2021),
(227, 1, '4', 18, 8, 2021),
(228, 1, '2', 19, 8, 2021),
(229, 1, '3', 20, 8, 2021),
(230, 1, '5', 21, 8, 2021),
(231, 1, '1', 22, 8, 2021),
(232, 1, '1', 23, 8, 2021),
(233, 1, '6', 24, 8, 2021),
(234, 1, '9', 25, 8, 2021),
(235, 1, '2', 26, 8, 2021),
(236, 1, '8', 27, 8, 2021),
(237, 1, '7', 28, 8, 2021),
(238, 1, '3', 29, 8, 2021),
(239, 1, '1', 30, 8, 2021),
(240, 1, '5', 1, 8, 2021),
(241, 1, '1', 2, 9, 2021),
(242, 1, '1', 3, 9, 2021),
(243, 1, '5', 4, 9, 2021),
(244, 1, '7', 5, 9, 2021),
(245, 1, '4', 6, 9, 2021),
(246, 1, '0', 7, 9, 2021),
(247, 1, '1', 8, 9, 2021),
(248, 1, '0', 9, 9, 2021),
(249, 1, '1', 10, 9, 2021),
(250, 1, '1', 11, 9, 2021),
(251, 1, '9', 12, 9, 2021),
(252, 1, '6', 13, 9, 2021),
(253, 1, '6', 14, 9, 2021),
(254, 1, '1', 15, 9, 2021),
(255, 1, '6', 16, 9, 2021),
(256, 1, '7', 17, 9, 2021),
(257, 1, '4', 18, 9, 2021),
(258, 1, '1', 19, 9, 2021),
(259, 1, '9', 20, 9, 2021),
(260, 1, '9', 21, 9, 2021),
(261, 1, '2', 22, 9, 2021),
(262, 1, '5', 23, 9, 2021),
(263, 1, '0', 24, 9, 2021),
(264, 1, '4', 25, 9, 2021),
(265, 1, '9', 26, 9, 2021),
(266, 1, '5', 27, 9, 2021),
(267, 1, '4', 28, 9, 2021),
(268, 1, '9', 29, 9, 2021),
(269, 1, '5', 30, 9, 2021),
(270, 1, '0', 1, 9, 2021),
(271, 1, '4', 2, 10, 2021),
(272, 1, '9', 3, 10, 2021),
(273, 1, '1', 4, 10, 2021),
(274, 1, '5', 5, 10, 2021),
(275, 1, '1', 6, 10, 2021),
(276, 1, '0', 7, 10, 2021),
(277, 1, '6', 8, 10, 2021),
(278, 1, '6', 9, 10, 2021),
(279, 1, '9', 10, 10, 2021),
(280, 1, '1', 11, 10, 2021),
(281, 1, '0', 12, 10, 2021),
(282, 1, '6', 13, 10, 2021),
(283, 1, '7', 14, 10, 2021),
(284, 1, '7', 15, 10, 2021),
(285, 1, '5', 16, 10, 2021),
(286, 1, '2', 17, 10, 2021),
(287, 1, '5', 18, 10, 2021),
(288, 1, '8', 19, 10, 2021),
(289, 1, '8', 20, 10, 2021),
(290, 1, '9', 21, 10, 2021),
(291, 1, '5', 22, 10, 2021),
(292, 1, '4', 23, 10, 2021),
(293, 1, '6', 24, 10, 2021),
(294, 1, '4', 25, 10, 2021),
(295, 1, '7', 26, 10, 2021),
(296, 1, '0', 27, 10, 2021),
(297, 1, '4', 28, 10, 2021),
(298, 1, '0', 29, 10, 2021),
(299, 1, '0', 30, 10, 2021),
(300, 1, '0', 1, 10, 2021),
(301, 1, '0', 2, 11, 2021),
(302, 1, '1', 3, 11, 2021),
(303, 1, '6', 4, 11, 2021),
(304, 1, '6', 5, 11, 2021),
(305, 1, '5', 6, 11, 2021),
(306, 1, '5', 7, 11, 2021),
(307, 1, '8', 8, 11, 2021),
(308, 1, '5', 9, 11, 2021),
(309, 1, '7', 10, 11, 2021),
(310, 1, '0', 11, 11, 2021),
(311, 1, '1', 12, 11, 2021),
(312, 1, '7', 13, 11, 2021),
(313, 1, '0', 14, 11, 2021),
(314, 1, '3', 15, 11, 2021),
(315, 1, '8', 16, 11, 2021),
(316, 1, '9', 17, 11, 2021),
(317, 1, '1', 18, 11, 2021),
(318, 1, '2', 19, 11, 2021),
(319, 1, '9', 20, 11, 2021),
(320, 1, '9', 21, 11, 2021),
(321, 1, '5', 22, 11, 2021),
(322, 1, '9', 23, 11, 2021),
(323, 1, '3', 24, 11, 2021),
(324, 1, '7', 25, 11, 2021),
(325, 1, '3', 26, 11, 2021),
(326, 1, '4', 27, 11, 2021),
(327, 1, '5', 28, 11, 2021),
(328, 1, '5', 29, 11, 2021),
(329, 1, '2', 30, 11, 2021),
(330, 1, '0', 1, 11, 2021),
(331, 1, '4', 2, 12, 2021),
(332, 1, '4', 3, 12, 2021),
(333, 1, '7', 4, 12, 2021),
(334, 1, '7', 5, 12, 2021),
(335, 1, '1', 6, 12, 2021),
(336, 1, '1', 7, 12, 2021),
(337, 1, '4', 8, 12, 2021),
(338, 1, '9', 9, 12, 2021),
(339, 1, '3', 10, 12, 2021),
(340, 1, '9', 11, 12, 2021),
(341, 1, '7', 12, 12, 2021),
(342, 1, '3', 13, 12, 2021),
(343, 1, '3', 14, 12, 2021),
(344, 1, '4', 15, 12, 2021),
(345, 1, '9', 16, 12, 2021),
(346, 1, '8', 17, 12, 2021),
(347, 1, '2', 18, 12, 2021),
(348, 1, '3', 19, 12, 2021),
(349, 1, '5', 20, 12, 2021),
(350, 1, '6', 21, 12, 2021),
(351, 1, '0', 22, 12, 2021),
(352, 1, '6', 23, 12, 2021),
(353, 1, '3', 24, 12, 2021),
(354, 1, '2', 25, 12, 2021),
(355, 1, '5', 26, 12, 2021),
(356, 1, '4', 27, 12, 2021),
(357, 1, '7', 28, 12, 2021),
(358, 1, '9', 29, 12, 2021),
(359, 1, '9', 30, 12, 2021),
(360, 1, '8', 1, 12, 2021),
(361, 2, '7', 2, 1, 2021),
(362, 2, '9', 3, 1, 2021),
(363, 2, '1', 4, 1, 2021),
(364, 2, '5', 5, 1, 2021),
(365, 2, '5', 6, 1, 2021),
(366, 2, '0', 7, 1, 2021),
(367, 2, '1', 8, 1, 2021),
(368, 2, '9', 9, 1, 2021),
(369, 2, '7', 10, 1, 2021),
(370, 2, '6', 11, 1, 2021),
(371, 2, '7', 12, 1, 2021),
(372, 2, '8', 13, 1, 2021),
(373, 2, '1', 14, 1, 2021),
(374, 2, '5', 15, 1, 2021),
(375, 2, '2', 16, 1, 2021),
(376, 2, '2', 17, 1, 2021),
(377, 2, '6', 18, 1, 2021),
(378, 2, '8', 19, 1, 2021),
(379, 2, '1', 20, 1, 2021),
(380, 2, '0', 21, 1, 2021),
(381, 2, '9', 22, 1, 2021),
(382, 2, '6', 23, 1, 2021),
(383, 2, '9', 24, 1, 2021),
(384, 2, '9', 25, 1, 2021),
(385, 2, '6', 26, 1, 2021),
(386, 2, '7', 27, 1, 2021),
(387, 2, '8', 28, 1, 2021),
(388, 2, '0', 29, 1, 2021),
(389, 2, '1', 30, 1, 2021),
(390, 2, '7', 1, 1, 2021),
(391, 2, '6', 2, 2, 2021),
(392, 2, '8', 3, 2, 2021),
(393, 2, '7', 4, 2, 2021),
(394, 2, '9', 5, 2, 2021),
(395, 2, '7', 6, 2, 2021),
(396, 2, '3', 7, 2, 2021),
(397, 2, '9', 8, 2, 2021),
(398, 2, '6', 9, 2, 2021),
(399, 2, '4', 10, 2, 2021),
(400, 2, '2', 11, 2, 2021),
(401, 2, '3', 12, 2, 2021),
(402, 2, '9', 13, 2, 2021),
(403, 2, '7', 14, 2, 2021),
(404, 2, '3', 15, 2, 2021),
(405, 2, '4', 16, 2, 2021),
(406, 2, '4', 17, 2, 2021),
(407, 2, '0', 18, 2, 2021),
(408, 2, '2', 19, 2, 2021),
(409, 2, '1', 20, 2, 2021),
(410, 2, '3', 21, 2, 2021),
(411, 2, '2', 22, 2, 2021),
(412, 2, '5', 23, 2, 2021),
(413, 2, '0', 24, 2, 2021),
(414, 2, '7', 25, 2, 2021),
(415, 2, '1', 26, 2, 2021),
(416, 2, '8', 27, 2, 2021),
(417, 2, '5', 28, 2, 2021),
(418, 2, '3', 29, 2, 2021),
(419, 2, '9', 30, 2, 2021),
(420, 2, '5', 1, 2, 2021),
(421, 2, '1', 2, 3, 2021),
(422, 2, '8', 3, 3, 2021),
(423, 2, '3', 4, 3, 2021),
(424, 2, '3', 5, 3, 2021),
(425, 2, '7', 6, 3, 2021),
(426, 2, '4', 7, 3, 2021),
(427, 2, '2', 8, 3, 2021),
(428, 2, '3', 9, 3, 2021),
(429, 2, '3', 10, 3, 2021),
(430, 2, '8', 11, 3, 2021),
(431, 2, '3', 12, 3, 2021),
(432, 2, '3', 13, 3, 2021),
(433, 2, '4', 14, 3, 2021),
(434, 2, '0', 15, 3, 2021),
(435, 2, '9', 16, 3, 2021),
(436, 2, '2', 17, 3, 2021),
(437, 2, '4', 18, 3, 2021),
(438, 2, '2', 19, 3, 2021),
(439, 2, '7', 20, 3, 2021),
(440, 2, '4', 21, 3, 2021),
(441, 2, '7', 22, 3, 2021),
(442, 2, '3', 23, 3, 2021),
(443, 2, '9', 24, 3, 2021),
(444, 2, '0', 25, 3, 2021),
(445, 2, '9', 26, 3, 2021),
(446, 2, '8', 27, 3, 2021),
(447, 2, '4', 28, 3, 2021),
(448, 2, '2', 29, 3, 2021),
(449, 2, '4', 30, 3, 2021),
(450, 2, '4', 1, 3, 2021),
(451, 2, '2', 2, 4, 2021),
(452, 2, '6', 3, 4, 2021),
(453, 2, '5', 4, 4, 2021),
(454, 2, '7', 5, 4, 2021),
(455, 2, '5', 6, 4, 2021),
(456, 2, '8', 7, 4, 2021),
(457, 2, '4', 8, 4, 2021),
(458, 2, '9', 9, 4, 2021),
(459, 2, '2', 10, 4, 2021),
(460, 2, '5', 11, 4, 2021),
(461, 2, '7', 12, 4, 2021),
(462, 2, '1', 13, 4, 2021),
(463, 2, '7', 14, 4, 2021),
(464, 2, '3', 15, 4, 2021),
(465, 2, '2', 16, 4, 2021),
(466, 2, '4', 17, 4, 2021),
(467, 2, '0', 18, 4, 2021),
(468, 2, '4', 19, 4, 2021),
(469, 2, '9', 20, 4, 2021),
(470, 2, '0', 21, 4, 2021),
(471, 2, '1', 22, 4, 2021),
(472, 2, '3', 23, 4, 2021),
(473, 2, '3', 24, 4, 2021),
(474, 2, '4', 25, 4, 2021),
(475, 2, '1', 26, 4, 2021),
(476, 2, '6', 27, 4, 2021),
(477, 2, '4', 28, 4, 2021),
(478, 2, '9', 29, 4, 2021),
(479, 2, '6', 30, 4, 2021),
(480, 2, '5', 1, 4, 2021),
(481, 2, '6', 2, 5, 2021),
(482, 2, '0', 3, 5, 2021),
(483, 2, '2', 4, 5, 2021),
(484, 2, '9', 5, 5, 2021),
(485, 2, '4', 6, 5, 2021),
(486, 2, '9', 7, 5, 2021),
(487, 2, '0', 8, 5, 2021),
(488, 2, '6', 9, 5, 2021),
(489, 2, '3', 10, 5, 2021),
(490, 2, '4', 11, 5, 2021),
(491, 2, '3', 12, 5, 2021),
(492, 2, '3', 13, 5, 2021),
(493, 2, '4', 14, 5, 2021),
(494, 2, '4', 15, 5, 2021),
(495, 2, '7', 16, 5, 2021),
(496, 2, '2', 17, 5, 2021),
(497, 2, '2', 18, 5, 2021),
(498, 2, '2', 19, 5, 2021),
(499, 2, '4', 20, 5, 2021),
(500, 2, '9', 21, 5, 2021),
(501, 2, '3', 22, 5, 2021),
(502, 2, '3', 23, 5, 2021),
(503, 2, '6', 24, 5, 2021),
(504, 2, '4', 25, 5, 2021),
(505, 2, '5', 26, 5, 2021),
(506, 2, '0', 27, 5, 2021),
(507, 2, '6', 28, 5, 2021),
(508, 2, '5', 29, 5, 2021),
(509, 2, '5', 30, 5, 2021),
(510, 2, '7', 1, 5, 2021),
(511, 2, '7', 2, 6, 2021),
(512, 2, '0', 3, 6, 2021),
(513, 2, '9', 4, 6, 2021),
(514, 2, '6', 5, 6, 2021),
(515, 2, '0', 6, 6, 2021),
(516, 2, '0', 7, 6, 2021),
(517, 2, '4', 8, 6, 2021),
(518, 2, '8', 9, 6, 2021),
(519, 2, '8', 10, 6, 2021),
(520, 2, '3', 11, 6, 2021),
(521, 2, '1', 12, 6, 2021),
(522, 2, '4', 13, 6, 2021),
(523, 2, '2', 14, 6, 2021),
(524, 2, '4', 15, 6, 2021),
(525, 2, '7', 16, 6, 2021),
(526, 2, '4', 17, 6, 2021),
(527, 2, '6', 18, 6, 2021),
(528, 2, '2', 19, 6, 2021),
(529, 2, '6', 20, 6, 2021),
(530, 2, '5', 21, 6, 2021),
(531, 2, '2', 22, 6, 2021),
(532, 2, '1', 23, 6, 2021),
(533, 2, '3', 24, 6, 2021),
(534, 2, '9', 25, 6, 2021),
(535, 2, '3', 26, 6, 2021),
(536, 2, '2', 27, 6, 2021),
(537, 2, '8', 28, 6, 2021),
(538, 2, '9', 29, 6, 2021),
(539, 2, '2', 30, 6, 2021),
(540, 2, '1', 1, 6, 2021),
(541, 2, '7', 2, 7, 2021),
(542, 2, '1', 3, 7, 2021),
(543, 2, '8', 4, 7, 2021),
(544, 2, '9', 5, 7, 2021),
(545, 2, '9', 6, 7, 2021),
(546, 2, '6', 7, 7, 2021),
(547, 2, '4', 8, 7, 2021),
(548, 2, '6', 9, 7, 2021),
(549, 2, '4', 10, 7, 2021),
(550, 2, '4', 11, 7, 2021),
(551, 2, '3', 12, 7, 2021),
(552, 2, '0', 13, 7, 2021),
(553, 2, '6', 14, 7, 2021),
(554, 2, '3', 15, 7, 2021),
(555, 2, '3', 16, 7, 2021),
(556, 2, '0', 17, 7, 2021),
(557, 2, '0', 18, 7, 2021),
(558, 2, '2', 19, 7, 2021),
(559, 2, '7', 20, 7, 2021),
(560, 2, '5', 21, 7, 2021),
(561, 2, '7', 22, 7, 2021),
(562, 2, '8', 23, 7, 2021),
(563, 2, '4', 24, 7, 2021),
(564, 2, '0', 25, 7, 2021),
(565, 2, '6', 26, 7, 2021),
(566, 2, '3', 27, 7, 2021),
(567, 2, '7', 28, 7, 2021),
(568, 2, '5', 29, 7, 2021),
(569, 2, '0', 30, 7, 2021),
(570, 2, '0', 1, 7, 2021),
(571, 2, '4', 2, 8, 2021),
(572, 2, '1', 3, 8, 2021),
(573, 2, '6', 4, 8, 2021),
(574, 2, '7', 5, 8, 2021),
(575, 2, '6', 6, 8, 2021),
(576, 2, '7', 7, 8, 2021),
(577, 2, '8', 8, 8, 2021),
(578, 2, '9', 9, 8, 2021),
(579, 2, '2', 10, 8, 2021),
(580, 2, '0', 11, 8, 2021),
(581, 2, '5', 12, 8, 2021),
(582, 2, '0', 13, 8, 2021),
(583, 2, '5', 14, 8, 2021),
(584, 2, '4', 15, 8, 2021),
(585, 2, '6', 16, 8, 2021),
(586, 2, '2', 17, 8, 2021),
(587, 2, '9', 18, 8, 2021),
(588, 2, '3', 19, 8, 2021),
(589, 2, '0', 20, 8, 2021),
(590, 2, '8', 21, 8, 2021),
(591, 2, '5', 22, 8, 2021),
(592, 2, '6', 23, 8, 2021),
(593, 2, '3', 24, 8, 2021),
(594, 2, '7', 25, 8, 2021),
(595, 2, '0', 26, 8, 2021),
(596, 2, '1', 27, 8, 2021),
(597, 2, '9', 28, 8, 2021),
(598, 2, '4', 29, 8, 2021),
(599, 2, '5', 30, 8, 2021),
(600, 2, '9', 1, 8, 2021),
(601, 2, '9', 2, 9, 2021),
(602, 2, '0', 3, 9, 2021),
(603, 2, '8', 4, 9, 2021),
(604, 2, '9', 5, 9, 2021),
(605, 2, '4', 6, 9, 2021),
(606, 2, '3', 7, 9, 2021),
(607, 2, '0', 8, 9, 2021),
(608, 2, '5', 9, 9, 2021),
(609, 2, '2', 10, 9, 2021),
(610, 2, '8', 11, 9, 2021),
(611, 2, '5', 12, 9, 2021),
(612, 2, '5', 13, 9, 2021),
(613, 2, '6', 14, 9, 2021),
(614, 2, '5', 15, 9, 2021),
(615, 2, '5', 16, 9, 2021),
(616, 2, '7', 17, 9, 2021),
(617, 2, '7', 18, 9, 2021),
(618, 2, '3', 19, 9, 2021),
(619, 2, '3', 20, 9, 2021),
(620, 2, '7', 21, 9, 2021),
(621, 2, '7', 22, 9, 2021),
(622, 2, '1', 23, 9, 2021),
(623, 2, '7', 24, 9, 2021),
(624, 2, '7', 25, 9, 2021),
(625, 2, '6', 26, 9, 2021),
(626, 2, '1', 27, 9, 2021),
(627, 2, '1', 28, 9, 2021),
(628, 2, '3', 29, 9, 2021),
(629, 2, '2', 30, 9, 2021),
(630, 2, '0', 1, 9, 2021),
(631, 2, '4', 2, 10, 2021),
(632, 2, '6', 3, 10, 2021),
(633, 2, '2', 4, 10, 2021),
(634, 2, '7', 5, 10, 2021),
(635, 2, '8', 6, 10, 2021),
(636, 2, '1', 7, 10, 2021),
(637, 2, '4', 8, 10, 2021),
(638, 2, '0', 9, 10, 2021),
(639, 2, '6', 10, 10, 2021),
(640, 2, '5', 11, 10, 2021),
(641, 2, '7', 12, 10, 2021),
(642, 2, '5', 13, 10, 2021),
(643, 2, '8', 14, 10, 2021),
(644, 2, '8', 15, 10, 2021),
(645, 2, '3', 16, 10, 2021),
(646, 2, '9', 17, 10, 2021),
(647, 2, '3', 18, 10, 2021),
(648, 2, '5', 19, 10, 2021),
(649, 2, '6', 20, 10, 2021),
(650, 2, '1', 21, 10, 2021),
(651, 2, '3', 22, 10, 2021),
(652, 2, '2', 23, 10, 2021),
(653, 2, '7', 24, 10, 2021),
(654, 2, '8', 25, 10, 2021),
(655, 2, '6', 26, 10, 2021),
(656, 2, '6', 27, 10, 2021),
(657, 2, '2', 28, 10, 2021),
(658, 2, '7', 29, 10, 2021),
(659, 2, '8', 30, 10, 2021),
(660, 2, '4', 1, 10, 2021),
(661, 2, '1', 2, 11, 2021),
(662, 2, '1', 3, 11, 2021),
(663, 2, '5', 4, 11, 2021),
(664, 2, '9', 5, 11, 2021),
(665, 2, '2', 6, 11, 2021),
(666, 2, '2', 7, 11, 2021),
(667, 2, '3', 8, 11, 2021),
(668, 2, '0', 9, 11, 2021),
(669, 2, '5', 10, 11, 2021),
(670, 2, '0', 11, 11, 2021),
(671, 2, '0', 12, 11, 2021),
(672, 2, '9', 13, 11, 2021),
(673, 2, '1', 14, 11, 2021),
(674, 2, '5', 15, 11, 2021),
(675, 2, '6', 16, 11, 2021),
(676, 2, '2', 17, 11, 2021),
(677, 2, '3', 18, 11, 2021),
(678, 2, '3', 19, 11, 2021),
(679, 2, '9', 20, 11, 2021),
(680, 2, '9', 21, 11, 2021),
(681, 2, '0', 22, 11, 2021),
(682, 2, '9', 23, 11, 2021),
(683, 2, '7', 24, 11, 2021),
(684, 2, '2', 25, 11, 2021),
(685, 2, '5', 26, 11, 2021),
(686, 2, '5', 27, 11, 2021),
(687, 2, '2', 28, 11, 2021),
(688, 2, '7', 29, 11, 2021),
(689, 2, '9', 30, 11, 2021),
(690, 2, '3', 1, 11, 2021),
(691, 2, '8', 2, 12, 2021),
(692, 2, '4', 3, 12, 2021),
(693, 2, '6', 4, 12, 2021),
(694, 2, '2', 5, 12, 2021),
(695, 2, '1', 6, 12, 2021),
(696, 2, '6', 7, 12, 2021),
(697, 2, '5', 8, 12, 2021),
(698, 2, '2', 9, 12, 2021),
(699, 2, '2', 10, 12, 2021),
(700, 2, '3', 11, 12, 2021),
(701, 2, '5', 12, 12, 2021),
(702, 2, '5', 13, 12, 2021),
(703, 2, '1', 14, 12, 2021),
(704, 2, '2', 15, 12, 2021),
(705, 2, '8', 16, 12, 2021),
(706, 2, '1', 17, 12, 2021),
(707, 2, '2', 18, 12, 2021),
(708, 2, '8', 19, 12, 2021),
(709, 2, '0', 20, 12, 2021),
(710, 2, '5', 21, 12, 2021),
(711, 2, '3', 22, 12, 2021),
(712, 2, '6', 23, 12, 2021),
(713, 2, '3', 24, 12, 2021),
(714, 2, '5', 25, 12, 2021),
(715, 2, '6', 26, 12, 2021),
(716, 2, '3', 27, 12, 2021),
(717, 2, '1', 28, 12, 2021),
(718, 2, '8', 29, 12, 2021),
(719, 2, '0', 30, 12, 2021),
(720, 2, '1', 1, 12, 2021),
(721, 1, '0', 0, 0, 2021);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`) VALUES
(1, '7ouma weld 7ouma', '7ouma@gmail.com', 0, '12345678'),
(12, 'chenti', 'chenti@gmail.com', 12345678, 'root12345678'),
(13, 'iheb', 'inachet3@gmail.com', 123245, 'inachet3@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`owner_id`);

--
-- Index pour la table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `production`
--
ALTER TABLE `production`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `user` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
