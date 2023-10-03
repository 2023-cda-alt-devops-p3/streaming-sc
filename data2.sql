DROP TABLE IF EXISTS movie_user;
DROP TABLE IF EXISTS movie_actor;

DROP TABLE IF EXISTS director;
CREATE TABLE director (
    id_director INT PRIMARY KEY AUTO_INCREMENT,
    lastname VARCHAR(255),
    firstname VARCHAR(255)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    lastname VARCHAR(255),
    firstname VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    role VARCHAR(255)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
    id_movie INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    duration INTEGER,
    year INT,
    id_director INT,
    FOREIGN KEY (id_director) REFERENCES director (id_director)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS actor;
CREATE TABLE actor (
    id_actor INT PRIMARY KEY AUTO_INCREMENT,
    lastname VARCHAR(255),
    firstname VARCHAR(255),
    role VARCHAR(255),
    birth_date DATE
) ENGINE=InnoDB;

CREATE TABLE movie_user (
    id_user INT,
    id_movie INT,
    PRIMARY KEY (id_user, id_movie),
    FOREIGN KEY (id_user) REFERENCES user (id_user),
    FOREIGN KEY (id_movie) REFERENCES movie (id_movie)
) ENGINE=InnoDB;

CREATE TABLE movie_actor (
    id_actor INT,
    id_movie INT,
    PRIMARY KEY (id_actor, id_movie),
    FOREIGN KEY (id_actor) REFERENCES actor (id_actor),
    FOREIGN KEY (id_movie) REFERENCES movie (id_movie)
) ENGINE=InnoDB;