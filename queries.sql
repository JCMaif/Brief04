

--***************** Utilisateurs ***********************
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

-- Présenter l'accès au tutoriel : par défaut = true, passe à false après la première connexion : 
UPDATE "user"
SET first_login = false
WHERE id =1;

-- Supprimer un utilisateur selon son id
DELETE FROM "user" WHERE id=2;

--***************** Publications ***********************
-- Lire le flow de publications par popularité
CREATE VIEW popular_posts AS
SELECT post.id, post.title, post.description, post.date, COUNT(post_user_react.reaction_id) AS reaction_count
FROM post
LEFT JOIN post_user_react ON post.id = post_user_react.post_id
GROUP BY post.id
ORDER BY reaction_count DESC LIMIT 10 OFFSET 0;  -- pour chaque page, on ajoute 10 à offset pour la pagination

-- Utiliser la vue
SELECT * FROM popular_posts;

-- Lire le flow de publications par date
SELECT * FROM post
ORDER BY date DESC LIMIT 10 OFFSET 0; -- pour chaque page, on ajoute 10 à offset pour la pagination

-- Création d'une publication
INSERT INTO post (title, description, date, user_id)
VALUES ('Titre de la publication', 'Description de la publication', CURRENT_TIMESTAMP, 14);

-- Suppression d'une publication
DELETE  FROM post WHERE id=2;

-- Modification d'une publication
UPDATE post 
SET title='Nouveau titre', 
description='Nouvelle description' 
WHERE id=3;

--***************** Following ***********************
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

--***************** Commentaires et réactions ***********************
-- Ajout d'un commentaire
INSERT INTO comment (description, post_id, user_id, parent)
VALUES ('Contenu du commentaire', 5, 14, null);

--Répondre à un commentaire
INSERT INTO comment (description, post_id, user_id, parent)
VALUES ('Contenu de la réponse', 5, 8, 4);

--Afficher tous les commentaires d'un post et leurs réponses
CREATE VIEW all_comments AS
SELECT c1.id AS commentaire_id, c1.description AS commentaire_description, c1.user_id AS commentaire_user_id,
       c2.id AS reponse_id, c2.description AS reponse_description, c2.user_id AS reponse_user_id
FROM comment c1
LEFT JOIN comment c2 ON c1.id = c2.parent
WHERE c1.post_id = 5;

-- Utiliser la vue
SELECT * FROM all_comments;

--Afficher toutes les réactions à un post
CREATE VIEW all_reactions AS
SELECT reaction.type, COUNT(*) AS count
FROM post_user_react
JOIN reaction ON post_user_react.reaction_id = reaction.id
WHERE post_user_react.post_id = 1
GROUP BY reaction.type;

-- Utiliser la vue
SELECT * FROM all_reactions;


--***************** Filtres et recherche ***********************
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
CREATE VIEW popular_posts AS
SELECT post.*, COUNT(post_user_react.reaction_id) AS reactions_count
FROM post
LEFT JOIN post_user_react ON post.id = post_user_react.post_id
GROUP BY post.id
ORDER BY reactions_count DESC;

-- Utiliser la vue
SELECT * FROM popular_posts;

--***************** Groupes ***********************
-- Créer un groupe
INSERT INTO "group" 
    (name, description, private, creator_id) 
VALUES 
('Développement Web', 'Groupe de développeurs', true, 11);

-- Modifier un groupe
UPDATE "group" 
SET name='Développement Mobile', 
description='Nous sommes tous des passionnés de développement mobile.'  
WHERE id=6;

-- Supprimer un groupe
DELETE FROM "group" WHERE id=7;

-- Ajouter un membre au groupe et lui affecter un rôle
INSERT INTO group_member
    (group_id, user_id, role)
VALUES
    (8, 9, 'moderator');

-- Supprimer un membre du groupe (sauf creator)
DELETE FROM group_member
WHERE group_id = 8 
-- AND user_id != (SELECT creator_id FROM "group" WHERE id = 8);
AND user_id = 9;

-- ******************* Analytics*******************
-- Durée de session moyenne
CREATE VIEW avg_session AS
SELECT AVG(end_time - start_time) AS Average_session
FROM session
;

-- Durée de session moyenne, par utilisateur
SELECT user_id, AVG(end_time - start_time) AS Average_session
FROM session
GROUP BY user_id
ORDER BY user_id ASC;