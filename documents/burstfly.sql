-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 24 Août 2017 à 15:15
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `guermit_be`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `categorie`:
--

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `slug`, `image`) VALUES
(1, 'Illustrator', 'ai', 'img/icon-ai.svg'),
(2, 'Photoshop', 'psd', 'img/icon-psd.svg'),
(3, 'Theme', 'theme', 'img/icon-themes.svg'),
(4, 'Font', 'font', 'img/icon-font.svg'),
(5, 'Photo', 'photo', 'img/icon-photo.svg'),
(6, 'Premium', 'premium', 'img/icon-premium.svg');

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

-- --------------------------------------------------------

--
-- Structure de la table `ressource`
--

CREATE TABLE `ressource` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `datePublication` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `nbrVue` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fichier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `poidsFichier` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONS POUR LA TABLE `ressource`:
--   `categorie_id`
--       `categorie` -> `id`
--   `utilisateur_id`
--       `utilisateur` -> `id`
--

--
-- Contenu de la table `ressource`
--

INSERT INTO `ressource` (`id`, `categorie_id`, `utilisateur_id`, `titre`, `slug`, `datePublication`, `description`, `nbrVue`, `image`, `fichier`, `poidsFichier`) VALUES
(11, 1, 2, 'Deux', 'deux', '2017-07-19 11:19:10', 'rtety', 107, 'c0c4f9ccf117cef947688ad5f061a5e8.jpeg', '05eb40ce9537d77dd0dc25fbf5a465e8.jpeg', 0),
(18, 3, 2, 'Au maroc avec les Moulay', 'au_maroc_avec_les_moulay', '2017-07-22 10:29:01', 'super séjour avec la famille Moulay', 101, '27393d0699aa908be23f3f193934e8a5.jpg', '439255aa719302ea40513a7001f9e3d5.jpg', 0),
(19, 6, 2, 'Redwane Guermit', 'redwane_guermit', '2017-07-24 17:06:53', 'Bonjour je m\'appelle redwane et mon ami s\'appelle Jean Mahmoud', 64, 'e26e88a86bf93ac40417a2d4890b2ce1.jpg', '5ae845ae39cf81ba90e7ff6da4a38239.png', 0.10630321502686),
(20, 1, 3, 'kj', 'kj', '2017-07-30 20:25:34', 'h', 22, '69662dd148bf7ea53225e011500d61a4.jpeg', '855bfb038cb6def7a476197a2fafa017.jpeg', 974757),
(21, 1, 3, 'Hahaha', 'hahaha', '2017-07-30 20:36:35', 'me revoila', 33, '130912151e46cf22ca251fe5a3334452.jpeg', 'f4f113ac7a80841a4174cfedbac0bc5a.jpeg', 0.015435218811035),
(22, 6, 1, 'Cho cho chocolat', 'cho_cho_chocolat', '2017-08-02 11:04:33', 'ioergehioreureihr g eiorhgjdhdhf ej edjvhdfh egjh h jn fj erghd nnef,nvjdfh  nbcx, dfgjheduighern vnb djhb dhgerg j jhuiv dgn er,g ergh iohhdbnn erg herigh dfjgbe rget', 17, 'd444aa0da3539287d9eac42570008efe.jpeg', '74af68e664a3a6d8a457227e3a0e59ed.jpeg', 0.074931144714355),
(23, 6, 2, 'Je viens de commencer laravel', 'je_viens_de_commencer_laravel', '2017-08-20 18:18:23', 'ertyuiuyutree', 9, '7d395eb46455c4c5f6cc1d1490884bcc.png', 'ecc64657557a37d53d4f2d7e17882b07.png', 0.018160820007324),
(24, 3, 7, 'Algerie', 'algerie', '2017-08-22 13:56:34', 'rtjt tyjty jye jetyj etty  tjyt jet j', 7, 'd8bfc52e74a4dc167c4e3320fb82cba4.png', '9269db77a59b2979d80aeb389a54c8df.png', 0.093227386474609);

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
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_497DD634989D9B62` (`slug`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCFB88E14F` (`utilisateur_id`),
  ADD KEY `IDX_67F068BCFC6CD52A` (`ressource_id`);

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_939F4544989D9B62` (`slug`),
  ADD KEY `IDX_939F4544BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_939F4544FB88E14F` (`utilisateur_id`);

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
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FK_67F068BCFC6CD52A` FOREIGN KEY (`ressource_id`) REFERENCES `ressource` (`id`);

--
-- Contraintes pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD CONSTRAINT `FK_939F4544BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_939F4544FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
