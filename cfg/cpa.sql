-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 27 Mai 2018 à 11:47
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cpa`
--

-- --------------------------------------------------------

--
-- Structure de la table `concurrent`
--

CREATE TABLE `concurrent` (
  `id` int(11) NOT NULL,
  `idEpreuve` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idParcours` int(11) NOT NULL,
  `InscriptionValider` int(11) NOT NULL,
  `ParcoursValider` int(11) NOT NULL,
  `NumeroParticipant` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `concurrent`
--

INSERT INTO `concurrent` (`id`, `idEpreuve`, `idUser`, `idParcours`, `InscriptionValider`, `ParcoursValider`, `NumeroParticipant`) VALUES
(1, 2, 7, 2, 1, 0, '1234'),
(2, 3, 6, 3, 1, 0, '4321');

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

CREATE TABLE `epreuve` (
  `id` int(11) NOT NULL,
  `NomEpreuve` varchar(100) NOT NULL,
  `TypeEpreuve` varchar(100) NOT NULL,
  `DateEpeuve` datetime NOT NULL,
  `LieuEpreuve` varchar(100) NOT NULL,
  `idParcours` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `epreuve`
--

INSERT INTO `epreuve` (`id`, `NomEpreuve`, `TypeEpreuve`, `DateEpeuve`, `LieuEpreuve`, `idParcours`) VALUES
(1, 'testt2', 'junior', '2018-04-21 00:00:00', 'Lorgues', 2),
(2, 'test 3', 'Senior', '2018-04-30 00:00:00', 'Lorgues', 3);

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE `parcours` (
  `id` int(11) NOT NULL,
  `NomParcours` int(11) NOT NULL,
  `Date_Debut_Parcours` datetime NOT NULL,
  `Date_Fin_Inscription` datetime NOT NULL,
  `Descriptif_Parcours` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `parcours`
--

INSERT INTO `parcours` (`id`, `NomParcours`, `Date_Debut_Parcours`, `Date_Fin_Inscription`, `Descriptif_Parcours`) VALUES
(2, 2, '2018-04-21 00:00:00', '2018-04-22 00:00:00', '1,2,3,4'),
(3, 3, '2018-04-21 00:00:00', '2018-04-22 00:00:00', '3,4,8,2');

-- --------------------------------------------------------

--
-- Structure de la table `pointparcours`
--

CREATE TABLE `pointparcours` (
  `id` int(11) NOT NULL,
  `Nompoint` varchar(100) NOT NULL,
  `Latitude` double NOT NULL,
  `Longitude` double NOT NULL,
  `Marge` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pointparcours`
--

INSERT INTO `pointparcours` (`id`, `Nompoint`, `Latitude`, `Longitude`, `Marge`) VALUES
(1, 'Infirmerie', 43.491667, 6.354394, 20),
(2, 'Petit_TerrainB', 43.49156, 6.355053, 20),
(3, 'Salle_Des_Actes', 43.491431, 6.354527, 20),
(4, 'Entree_Cantine_Lycee', 43.492306, 6.356577, 20),
(5, 'Entree_BatS', 43.492, 6.356356, 20),
(6, 'Loge', 43.492696, 6.355616, 20),
(7, 'Portillon_GymnaseBas', 43.490801, 6.354467, 20),
(8, 'Vie_Scolaire', 43.491851, 6.355946, 20);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(100) NOT NULL,
  `MDP` varchar(100) NOT NULL,
  `DateNaissance` datetime NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `Sexe` varchar(100) NOT NULL,
  `InscritEpreuve` int(11) NOT NULL,
  `nivAdmin` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `Nom`, `Prenom`, `MDP`, `DateNaissance`, `Mail`, `Sexe`, `InscritEpreuve`, `nivAdmin`) VALUES
(1, 'Admin', 'Admin', 'ADMIN', '1945-06-14 00:00:00', 'Admin@gmail.com', 'M', 2, 1),
(7, 'Test', 'Testeur', '987654321', '1990-07-11 00:00:00', 'test.test@gmail.com', 'M', 0, 0),
(6, 'Bois', 'Valentin', '123456', '1997-12-27 00:00:00', 'vbois727@gmail.com', 'M', 0, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `concurrent`
--
ALTER TABLE `concurrent`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pointparcours`
--
ALTER TABLE `pointparcours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `concurrent`
--
ALTER TABLE `concurrent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `epreuve`
--
ALTER TABLE `epreuve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `pointparcours`
--
ALTER TABLE `pointparcours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
