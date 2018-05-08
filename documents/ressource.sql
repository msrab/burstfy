-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 24 Août 2017 à 23:46
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

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_939F4544989D9B62` (`slug`),
  ADD KEY `IDX_939F4544BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_939F4544FB88E14F` (`utilisateur_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD CONSTRAINT `FK_939F4544BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_939F4544FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
