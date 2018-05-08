-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 24 Août 2017 à 23:51
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
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `ressource_id` int(11) DEFAULT NULL,
  `datePublication` datetime NOT NULL,
  `texte` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `commentaire`:
--   `utilisateur_id`
--       `utilisateur` -> `id`
--   `ressource_id`
--       `ressource` -> `id`
--

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `utilisateur_id`, `ressource_id`, `datePublication`, `texte`) VALUES
(2, 2, 11, '2001-05-19 11:19:10', ' htgh tryh'),
(15, 1, 11, '2017-07-19 11:19:10', ' tyjrtyj '),
(21, 2, 11, '2017-07-19 11:19:10', 'j yruj r'),
(25, 2, 19, '2017-07-24 20:16:30', 'jean mahmoud n\'existe pas !!!'),
(26, 2, 19, '2017-07-24 20:19:33', 'ben si ! il existe !!!'),
(27, 2, 19, '2017-07-24 20:20:27', 'ben si ! il existe !!!'),
(28, 2, 19, '2017-07-24 20:22:54', 'c\'est possible parce qu\'il y a des chrétien arabe !'),
(29, 2, 18, '2017-07-24 20:26:55', 'MAGNIFIQUE VOYAGE !!! A REFAIRE'),
(31, 3, 19, '2017-07-30 12:57:33', 'wesh'),
(32, 3, 18, '2017-07-31 13:43:00', 'La chance! Moi aussi je veux voyager ! J\'en ai marre de rester à la maison à travailler toute la journée!!!'),
(34, 2, 22, '2017-08-02 22:41:36', 'Woaw cheyma c\'est magnifique!'),
(36, 7, 11, '2017-08-22 16:19:08', '(!(!!'),
(65, 7, 11, '2017-08-22 18:28:25', 'zegsrtdyfyghiiuythdhfthj'),
(66, 7, 11, '2017-08-22 18:30:40', 'stp marche'),
(67, 7, 11, '2017-08-22 18:31:41', 'ghfkyu fouyf'),
(68, 7, 11, '2017-08-22 18:33:57', 'jfuyfuy'),
(69, 7, 11, '2017-08-22 18:35:02', 'hjukyu'),
(70, 7, 11, '2017-08-22 18:35:53', 'gjtyu(§èu§(è'),
(71, 7, 11, '2017-08-22 18:36:56', 'ytjturt'),
(72, 7, 11, '2017-08-22 18:38:02', 'jhfkyj'),
(73, 7, 20, '2017-08-22 18:39:49', 'kjkjgkghj'),
(74, 7, 21, '2017-08-22 18:40:53', 'kgy'),
(75, 7, 20, '2017-08-22 18:42:20', 'hgtttrg'),
(76, 7, 21, '2017-08-22 18:43:27', 'gh'),
(77, 7, 20, '2017-08-22 18:44:06', 'gfty'),
(78, 7, 20, '2017-08-22 19:07:24', 'fdhfhg'),
(79, 7, 20, '2017-08-22 19:07:40', 'fdhfhg'),
(80, 7, 20, '2017-08-22 19:08:11', 'gyffyufyui'),
(81, 7, 20, '2017-08-22 19:09:28', 'yufyuffyufyu'),
(82, 7, 20, '2017-08-22 19:11:57', 'kghjgg'),
(83, 7, 20, '2017-08-22 19:12:38', 'hgjhgj'),
(84, 7, 20, '2017-08-22 19:14:16', 'hggh'),
(85, 7, 20, '2017-08-22 19:16:45', 'tyyfttfy'),
(86, 7, 20, '2017-08-22 19:18:45', 'ytrezrty'),
(87, 7, 20, '2017-08-22 19:24:05', 'ergiozer ergteijrgt  ergneriogn erjnrion eenenr nig"neig nbrijn g"iong jbjn "i\'gnjbr nh h"\'(ng \'en bi\'(nh \'rthb br'),
(88, 7, 20, '2017-08-22 19:25:13', 'gzert\'e(y \'(§y(§y\'(y §(u r yruj(§ u'),
(89, 7, 20, '2017-08-22 19:26:19', 'ture(§(u'),
(90, 7, 21, '2017-08-22 19:27:34', 'kfkuyf'),
(91, 7, 21, '2017-08-22 19:28:09', 'hgftyyft'),
(92, 7, 11, '2017-08-22 19:28:48', 'hgftyftyf'),
(93, 7, 11, '2017-08-22 19:29:05', 'gfyyfyft'),
(94, 7, 11, '2017-08-22 19:30:12', 'èiyugouyg'),
(95, 7, 11, '2017-08-22 19:31:00', 'yutu'),
(96, 7, 11, '2017-08-22 19:31:10', 'yutu'),
(97, 7, 11, '2017-08-22 19:32:05', '§è!§!è'),
(99, 8, 20, '2017-08-23 19:17:05', 'oh redwane'),
(100, 8, 21, '2017-08-23 19:19:43', 'ygftjty');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCFB88E14F` (`utilisateur_id`),
  ADD KEY `IDX_67F068BCFC6CD52A` (`ressource_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FK_67F068BCFC6CD52A` FOREIGN KEY (`ressource_id`) REFERENCES `ressource` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
