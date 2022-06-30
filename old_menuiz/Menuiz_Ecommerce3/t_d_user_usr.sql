-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 29 juin 2022 à 13:42
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
-- Structure de la table `t_d_user_usr`
--

CREATE TABLE `t_d_user_usr` (
  `USR_ID` int(11) NOT NULL,
  `ADR_ID` int(11) DEFAULT NULL,
  `USR_MAIL` varchar(1024) NOT NULL,
  `USR_PASSWORD` varchar(1024) NOT NULL,
  `USR_FIRSTNAME` varchar(1024) NOT NULL,
  `USR_LASTNAME` varchar(1024) NOT NULL,
  `UTY_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `t_d_user_usr`
--

INSERT INTO `t_d_user_usr` (`USR_ID`, `ADR_ID`, `USR_MAIL`, `USR_PASSWORD`, `USR_FIRSTNAME`, `USR_LASTNAME`, `UTY_ID`) VALUES
(1, 1, 'efzefz@zfefze.com', 'e38ad214943daad1d64c102faec29de4afe9da3d', 'Paul', 'Marchand', 1),
(2, 3, 'sefqBZN@sfq.com', '2aa60a8ff7fcd473d321e0146afd9e26df395147', 'Bruno', 'Laporte', 1),
(3, 4, 'drgfagra@aerga.com', '1119cfd37ee247357e034a08d844eea25f6fd20f', 'Benoit', 'Gras', 1),
(4, NULL, 'gdelacroix@hotmail.fr', 'b70f7d0e2acef2e0fa1c6f117e3c11e0d7082232', 'Delacroix', 'Guillaume', 2),
(5, NULL, 'test@hotmail.fr', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'Test', 'Test', 1),
(6, NULL, 'rmenard@hotmail.fr', 'b70f7d0e2acef2e0fa1c6f117e3c11e0d7082232', 'Menard', 'Robert', 1),
(7, NULL, 'pu@hotmail.fr', 'b70f7d0e2acef2e0fa1c6f117e3c11e0d7082232', 'popo', 'pupu', 1),
(8, NULL, 'pu@gmail.com', 'b70f7d0e2acef2e0fa1c6f117e3c11e0d7082232', 'pi', 'pa', 1),
(9, NULL, 'ft@hotmail.fr', 'b70f7d0e2acef2e0fa1c6f117e3c11e0d7082232', 'ft', 'ft', 1),
(10, NULL, 'toto@gmail.com', '0b9c2625dc21ef05f6ad4ddf47c5f203837aa32c', 'toto', 'toto', 1),
(11, NULL, 'titi@gmail.com', 'f7e79ca8eb0b31ee4d5d6c181416667ffee528ed', 'titi', 'titi', 1),
(12, NULL, 'bobyone@gmail.com', 'b0665a537a31a97d6f4e054e44901de7fba74396', 'Bednarek', 'Bed', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `t_d_user_usr`
--
ALTER TABLE `t_d_user_usr`
  ADD PRIMARY KEY (`USR_ID`),
  ADD KEY `FK_T_D_USER_A_COMME_I_T_D_ADDR3` (`ADR_ID`),
  ADD KEY `FK_UserType` (`UTY_ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `t_d_user_usr`
--
ALTER TABLE `t_d_user_usr`
  MODIFY `USR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `t_d_user_usr`
--
ALTER TABLE `t_d_user_usr`
  ADD CONSTRAINT `FK_T_D_USER_A_COMME_I_T_D_ADDR3` FOREIGN KEY (`ADR_ID`) REFERENCES `t_d_address_adr` (`ADR_ID`),
  ADD CONSTRAINT `FK_UserType` FOREIGN KEY (`UTY_ID`) REFERENCES `t_d_usertype_uty` (`UTY_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
