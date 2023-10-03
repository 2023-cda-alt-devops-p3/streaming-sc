-- Créer la base de données "streaming"
CREATE DATABASE IF NOT EXISTS streaming;

-- Utiliser la base de données "streaming"
USE streaming;


-- Table "directors"
CREATE TABLE directors (
    id_director INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL
);

-- Table "movies"
CREATE TABLE movies (
    id_movie INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration INT,
    release_year DATE,
    director_id INT,
    FOREIGN KEY (director_id) REFERENCES directors(id_director)
);

-- Table "actors"
CREATE TABLE actors (
    id_actor INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    role VARCHAR(255)
);


-- Table "users"
CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50)
);

-- Table de liaison "movies_users" (pour la relation n à n entre utilisateurs et films)
CREATE TABLE movies_users (
    user_id INT,
    movie_id INT,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users(id_user),
    FOREIGN KEY (movie_id) REFERENCES movies(id_movie)
);

-- Table de liaison "movies_actors" (pour la relation n à n entre utilisateurs et films)
CREATE TABLE movies_actors (
    actor_id INT,
    movie_id INT,
    PRIMARY KEY (actor_id, movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(id_actor),
    FOREIGN KEY (movie_id) REFERENCES movies(id_movie)
);
