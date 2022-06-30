-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 30 juin 2022 à 08:58
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `menuiz`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_d_customerservicefolder_csf`
--

CREATE TABLE `t_d_customerservicefolder_csf` (
  `csf_ID` int(11) NOT NULL,
  `csf_status` varchar(45) NOT NULL,
  `csf_description` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_d_diagsav_dsa`
--

CREATE TABLE `t_d_diagsav_dsa` (
  `dsa_ID` int(11) NOT NULL,
  `dsa_wording` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_d_movestock_mvs`
--

CREATE TABLE `t_d_movestock_mvs` (
  `mvs_ID` int(11) NOT NULL,
  `mvs_product` varchar(45) NOT NULL,
  `mvs_countbuy` decimal(8,2) NOT NULL,
  `mvs_countsell` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_d_tickethistory_thi`
--

CREATE TABLE `t_d_tickethistory_thi` (
  `thi_ID` int(11) NOT NULL,
  `thi_interventionTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_d_ticketsavdetail_tsd`
--

CREATE TABLE `t_d_ticketsavdetail_tsd` (
  `tsd_ID` int(11) NOT NULL,
  `tsd_description` varchar(45) NOT NULL,
  `tsd_IP` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_d_customerservicefolder_csf`
--
ALTER TABLE `t_d_customerservicefolder_csf`
  ADD PRIMARY KEY (`csf_ID`);

--
-- Index pour la table `t_d_diagsav_dsa`
--
ALTER TABLE `t_d_diagsav_dsa`
  ADD PRIMARY KEY (`dsa_ID`);

--
-- Index pour la table `t_d_movestock_mvs`
--
ALTER TABLE `t_d_movestock_mvs`
  ADD PRIMARY KEY (`mvs_ID`);

--
-- Index pour la table `t_d_tickethistory_thi`
--
ALTER TABLE `t_d_tickethistory_thi`
  ADD PRIMARY KEY (`thi_ID`);

--
-- Index pour la table `t_d_ticketsavdetail_tsd`
--
ALTER TABLE `t_d_ticketsavdetail_tsd`
  ADD PRIMARY KEY (`tsd_ID`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_d_customerservicefolder_csf`
--
ALTER TABLE `t_d_customerservicefolder_csf`
  ADD CONSTRAINT `TD_ORDERHEADER_ORH_ID` FOREIGN KEY (`csf_ID`) REFERENCES `t_d_orderheader_ohr` (`OHR_ID`),
  ADD CONSTRAINT `t_d_ticketsavdetail_tsd` FOREIGN KEY (`csf_ID`) REFERENCES `t_d_ticketsavdetail_tsd` (`tsd_ID`);

--
-- Contraintes pour la table `t_d_movestock_mvs`
--
ALTER TABLE `t_d_movestock_mvs`
  ADD CONSTRAINT `td_product_prd` FOREIGN KEY (`mvs_ID`) REFERENCES `t_d_product_prd` (`PRD_ID`);

--
-- Contraintes pour la table `t_d_ticketsavdetail_tsd`
--
ALTER TABLE `t_d_ticketsavdetail_tsd`
  ADD CONSTRAINT `t_d_customerservicefolder_csf` FOREIGN KEY (`tsd_ID`) REFERENCES `t_d_customerservicefolder_csf` (`csf_ID`),
  ADD CONSTRAINT `t_d_diagsavdetail` FOREIGN KEY (`tsd_ID`) REFERENCES `t_d_diagsav_dsa` (`dsa_ID`),
  ADD CONSTRAINT `t_d_historydetail_thi` FOREIGN KEY (`tsd_ID`) REFERENCES `t_d_tickethistory_thi` (`thi_ID`),
  ADD CONSTRAINT `t_d_product_prd` FOREIGN KEY (`tsd_ID`) REFERENCES `t_d_product_prd` (`PRD_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
