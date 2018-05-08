-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 24 Août 2017 à 23:43
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `burstfly`
--

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateInscription` date NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `utilisateur`:
--

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `nom`, `prenom`, `dateInscription`, `avatar`) VALUES
(1, 'abderchoco', 'abderchoco', 'abderchoco@hotmail.com', 'abderchoco@hotmail.com', 1, NULL, '$2y$13$i/SfW/FyLMrK9sELV6OfQ.3ru1yLYp2Btx54FloVsRWY9TRIfE65K', '2017-08-23 13:01:32', NULL, NULL, 'a:0:{}', 'Msr', 'Choco', '2017-07-17', 'c0b3d0138b488c1e1cf6adbcf1bffe5c.jpg'),
(2, 'abderrahmane', 'abderrahmane', 'abguermit@gmail.com', 'abguermit@gmail.com', 1, NULL, '$2y$13$sC/tvEPbADyLMa33qXW3N.BztZrYXKl0R82R5O8Qw6c0aJ.yZPLB6', '2017-08-22 10:46:31', NULL, NULL, 'a:0:{}', 'Guermit', 'Abder', '2017-07-17', 'defaut.jpg'),
(3, 'cheyma lala', 'cheyma lala', 'cheyma12@hotmail.com', 'cheyma12@hotmail.com', 1, NULL, '$2y$13$x1DmJuda7.jWY8B8Bsu5f.S.4RTQ.Mo1l6PKcVJT0Y65omFlxvSim', '2017-07-27 10:48:02', NULL, NULL, 'a:0:{}', 'Cheyma', 'Guermit', '2017-07-27', 'defaut.jpg'),
(4, 'azert', 'azert', 'islamwa@hotmail.com', 'islamwa@hotmail.com', 1, NULL, '$2y$13$Ush1hJ6C6TVq3JOdb/81BuEIGj0qQ9YycEJfloMDaG.njWLsrwjWu', '2017-08-01 21:11:30', NULL, NULL, 'a:0:{}', 'Guermit', 'Youssef', '2017-08-01', 'defaut.jpg'),
(5, 'bouha', 'bouha', 'bouhanis@hotmail.com', 'bouhanis@hotmail.com', 1, NULL, '$2y$13$VANBABnn/YY6DbdtsPfSJuG8TZpvGry3/JsPo9/yD.jQ2AFbMcsBu', '2017-08-22 11:18:39', NULL, NULL, 'a:0:{}', 'Bouhadi', 'Anis', '2017-08-22', 'defaut.jpg'),
(6, 'chipolata', 'chipolata', 'mamamia@gmail.com', 'mamamia@gmail.com', 1, NULL, '$2y$13$ypZjxe/zsAhJDBMPdRIzs.2nZLopwxYZD1H/2c6/gA5nvkrUAezPS', '2017-08-22 11:19:51', NULL, NULL, 'a:0:{}', 'Mama', 'mia', '2017-08-22', 'defaut.jpg'),
(7, 'mrGuermit', 'mrguermit', 'msg@gmail.com', 'msg@gmail.com', 1, NULL, '$2y$13$Og9Ec35f/CfaKgmG55E/Gu3yURc/fLP.g0KiV3qEcyZkcpC3k9tEG', '2017-08-22 11:21:54', NULL, NULL, 'a:0:{}', 'Mohamed', 'Guermit', '2017-08-22', 'defaut.jpg'),
(8, 'LalaAssya', 'lalaassya', 'assya14@gmail.com', 'assya14@gmail.com', 1, NULL, '$2y$13$GA3d9YfppdGHAr4kPkXSju21NiULreUQjT5n61rwToqiNSPnMnMn6', '2017-08-23 19:36:06', NULL, NULL, 'a:0:{}', 'Guermit', 'Assya', '2017-08-23', '495db1ee5c68f376288a17a85cb2be3e.jpg');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B392FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3C05FB297` (`confirmation_token`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
