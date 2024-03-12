SELECT * FROM "user";

-- Requête pour créer un utilisateur
INSERT INTO "user" (lastname, firstname, email)
VALUES 
    ('Chuck', 'Norris', 'chuck@norris.com');


-- Requête pour qu'un utilisateur connecté puisse modifier son profil
UPDATE "user"
SET lastname = 'Jean-Claude',
    firstname = 'Vandamme',
    email = 'jcv@email.com',
    img_url = ''
WHERE id = 1;

-- Requête pour obtenir le profil d'un utilisateur en fonction de son nom (prénom ou nom)
SELECT * FROM "user" 
WHERE lower(firstname) || ' ' ||lower(lastname) LIKE lower('%vandamme jean-claude%');

-- Lire le flow de publications par popularité
SELECT post.id, post.title, post.description, post.date, COUNT(post_user_react.reaction_id) AS reaction_count
FROM post
LEFT JOIN post_user_react ON post.id = post_user_react.post_id
GROUP BY post.id
ORDER BY reaction_count DESC;

-- Lire le flow de publications par date
SELECT *
FROM post
ORDER BY date DESC;

-- Présenter l'accès au tutoriel : par défaut = true, passe à false après la première connexion : 
UPDATE "user"
SET first_login = false
WHERE id =1;

-- Requête pour suivre un utilisateur
INSERT INTO follow (follower, followed)
VALUES (1,11); -- 1er terme : id de l'utilisateur courant,  2ème terme : id de l'utilisateur que l'on veut suivre

-- Requête pour supprimer le suivi d'un utilisateur
DELETE FROM follow
WHERE follower = 1 AND followed = 11;

-- Requête pour désactiver les notifications reçues par un utilisateur suivi par un autre utilisateur
UPDATE follow
SET toBeNotified = FALSE
WHERE follower = 1 -- id de l'utilisateur suiveur
AND followed = 11; -- id de l'utilisateur suivi

-- Création d'une publication
INSERT INTO post (title, description, date, user_id)
VALUES ('Titre de la publication', 'Description de la publication', CURRENT_TIMESTAMP, 14);


-- Ajout d'un commentaire
INSERT INTO comment (description, post_id, user_id, parent)
VALUES ('Contenu du commentaire', 5, 14, null);


--Répondre à un commentaire
INSERT INTO comment (description, post_id, user_id, parent)
VALUES ('Contenu de la réponse', 5, 8, 4);


--Afficher tous les commentaires d'un post et leurs réponses
SELECT c1.id AS commentaire_id, c1.description AS commentaire_description, c1.user_id AS commentaire_user_id,
       c2.id AS reponse_id, c2.description AS reponse_description, c2.user_id AS reponse_user_id
FROM comment c1
LEFT JOIN comment c2 ON c1.id = c2.parent
WHERE c1.post_id = 5;


--Afficher toutes les réactions à un post
SELECT reaction.type, COUNT(*) AS count
FROM post_user_react
JOIN reaction ON post_user_react.reaction_id = reaction.id
WHERE post_user_react.post_id = 1
GROUP BY reaction.type;


--Recherche par mot clé  dans les publications
SELECT *
FROM post
WHERE title ILIKE 'weeks%' OR description ILIKE '%week%';

--Filtrer les publications selon les auteurs
SELECT *
FROM post
WHERE user_id = 5;


--Filtrer les publications selon la date
SELECT *
FROM post
WHERE date >= '2023-10-11' AND date <= '2024-03-11';


--Filtrer les publications selon la popularité
SELECT post.*, COUNT(post_user_react.reaction_id) AS reactions_count
FROM post
LEFT JOIN post_user_react ON post.id = post_user_react.post_id
GROUP BY post.id
ORDER BY reactions_count DESC;
