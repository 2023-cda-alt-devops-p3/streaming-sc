-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mer. 04 oct. 2023 à 11:50
-- Version du serveur : 8.1.0
-- Version de PHP : 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `streaming`
--

-- --------------------------------------------------------

--
-- Structure de la table `actor`
--

CREATE TABLE `actor` (
  `id_actor` int NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `actor`
--

INSERT INTO `actor` (`id_actor`, `lastname`, `firstname`, `role`, `birth_date`) VALUES
(1, 'Travolta', 'John', 'Vincent Vega', '1954-02-18'),
(2, 'Thurman', 'Uma', 'Mia Wallace', '1970-04-29'),
(3, 'De Niro', 'Robert', 'Vito Corleone', '1943-08-17'),
(4, 'Keir Dullea', 'Gary', 'Dave Bowman', '1936-05-30'),
(5, 'Ray Liotta', 'Ray', 'Henry Hill', '1954-12-18');

-- --------------------------------------------------------

--
-- Structure de la table `director`
--

CREATE TABLE `director` (
  `id_director` int NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `director`
--

INSERT INTO `director` (`id_director`, `lastname`, `firstname`) VALUES
(1, 'Tarantino', 'Quentin'),
(2, 'Spielberg', 'Steven'),
(3, 'Coppola', 'Francis Ford'),
(4, 'Kubrick', 'Stanley'),
(5, 'Scorsese', 'Martin');

-- --------------------------------------------------------

--
-- Structure de la table `movie`
--

CREATE TABLE `movie` (
  `id_movie` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `id_director` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `movie`
--

INSERT INTO `movie` (`id_movie`, `title`, `duration`, `year`, `id_director`) VALUES
(1, 'Pulp Fiction', 154, 1994, 1),
(2, 'E.T. the Extra-Terrestrial', 115, 1982, 2),
(3, 'The Godfather', 175, 1972, 3),
(4, '2001: A Space Odyssey', 149, 1968, 4),
(5, 'Goodfellas', 146, 1990, 5);

-- --------------------------------------------------------

--
-- Structure de la table `movie_actor`
--

CREATE TABLE `movie_actor` (
  `id_actor` int NOT NULL,
  `id_movie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `movie_actor`
--

INSERT INTO `movie_actor` (`id_actor`, `id_movie`) VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `movie_user`
--

CREATE TABLE `movie_user` (
  `id_user` int NOT NULL,
  `id_movie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `movie_user`
--

INSERT INTO `movie_user` (`id_user`, `id_movie`) VALUES
(1, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `lastname`, `firstname`, `email`, `password`, `role`) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@example.com', 'motdepasse1', 'Utilisateur'),
(2, 'Martin', 'Sophie', 'sophie.martin@example.com', 'motdepasse2', 'Utilisateur'),
(3, 'Garcia', 'Luis', 'luis.garcia@example.com', 'motdepasse3', 'Administrateur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id_actor`);

--
-- Index pour la table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id_director`);

--
-- Index pour la table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id_movie`),
  ADD KEY `id_director` (`id_director`);

--
-- Index pour la table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD PRIMARY KEY (`id_actor`,`id_movie`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `movie_user`
--
ALTER TABLE `movie_user`
  ADD PRIMARY KEY (`id_user`,`id_movie`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actor`
--
ALTER TABLE `actor`
  MODIFY `id_actor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `director`
--
ALTER TABLE `director`
  MODIFY `id_director` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `movie`
--
ALTER TABLE `movie`
  MODIFY `id_movie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`);

--
-- Contraintes pour la table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`),
  ADD CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);

--
-- Contraintes pour la table `movie_user`
--
ALTER TABLE `movie_user`
  ADD CONSTRAINT `movie_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `movie_user_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
