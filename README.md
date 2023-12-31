### Pour lancer ou stopper docker il y a deux scripts dans le package.json

# Liste des jeu de requêtes

### les titres et dates de sortie des films du plus récent au plus ancien

```sql
SELECT title, year
FROM movie
ORDER BY year DESC;
```

### les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique

```sql
SELECT lastname, firstname,
YEAR(CURRENT_DATE()) - YEAR(birth_date) - (DATE_FORMAT(CURRENT_DATE(), '%m%d') < DATE_FORMAT(birth_date, '%m%d')) AS age
FROM actor
WHERE YEAR(CURRENT_DATE()) - YEAR(birth_date) > 30
ORDER BY lastname, firstname;

```

### la liste des acteurs/actrices principaux pour un film donné

```sql
SELECT a.lastname, a.firstname
FROM actor a
JOIN movie_actor ma ON a.id_actor = ma.id_actor
WHERE ma.id_movie = 1;
```

### la liste des films pour un acteur/actrice donné

```sql
SELECT m.title
FROM movie m
JOIN movie_actor ma ON m.id_movie = ma.id_movie
WHERE ma.id_actor = 1;
```

### ajouter un film

```sql
INSERT INTO movie (title, duration, year, id_director)
VALUES ('Inglorious Basterds', 153, 2009, 1);
```

### ajouter un acteur/actrice

```sql
INSERT INTO actor (lastname, firstname, role, birth_date)
VALUES ('Brad', 'Pitt', 'Lt. Aldo Raine', '1963-12-18');
```

### modifier un film

```sql
UPDATE movie
SET title = 'Star wars 3', duration = 140, year = 2005, id_director = 2
WHERE id_movie = 4;
```

### supprimer un acteur/actrice

```sql
DELETE FROM actor
WHERE id_actor = 4;
```

### afficher les 3 derniers acteurs/actrices ajouté(e)s

```sql
SELECT lastname, firstname, birth_date
FROM actor
ORDER BY id_actor DESC
LIMIT 3;
```

### lister grâce à une procédure stockée les films d'un réalisateur donné en paramètre

```sql
DELIMITER //

CREATE PROCEDURE ListMoviesByDirector(IN directorName VARCHAR(255))
BEGIN
    SELECT m.title, m.year
    FROM movie m
    JOIN director d ON m.id_director = d.id_director
    WHERE d.lastname = directorName;
END;
//

DELIMITER ;
```

#### pour appeler la procédure stockée

```sql
CALL ListMoviesByDirector('Nom du Réalisateur');
```

### Garder grâce à un trigger une trace de toutes les modifications apportées à la table des utilisateurs avec une table d'archives

```sql
DELIMITER //
CREATE TRIGGER User_Audit_Trigger
AFTER UPDATE ON user FOR EACH ROW
BEGIN
    INSERT INTO user_archive (user_id, action_date, old_value, new_value)
    VALUES (
        OLD.id_user,
        NOW(),
        CONCAT('Nom: ', OLD.last_name, ', Prénom: ', OLD.first_name),
        CONCAT('Nom: ', NEW.last_name, ', Prénom: ', NEW.first_name)
    );
END;
//
DELIMITER ;
```
