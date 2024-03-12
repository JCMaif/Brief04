# Brief04

Ce projet est une base de données SQL permettant de répondre aux besoin pour la faisabilité d'un réseau social, qui sera développé par un ou des développeurs full-stack.


## Mise en place 
- Créer une database (par exemple ici 'social', owner postgres)
- Créer les tables par le script create_db.sql : `psql -U postgres -h localhost -p 5432 -d social -f ./data/create_db.sql`
- Peupler les tables avec le jeu de données exemple par le script seed_db.sql : `psql -U postgres -h localhost -p 5432 -d social -f ./data/seed_db.sql`

-- Nota : Sous windows, il est nécessaire d'ajouter le chemin de postgresql à la variable d'environnement PATH. Sous linux, précéder les commandes par `sudo -i -u postgres psql` (remplacer postgres par votre super user)


## Conception

Ce projet comporte les documents de conception du projet :
-  [les user stories](./userStories.md), 
- [le MCD](./MCD.md), 
- [le MLD](./mld.drawio)


## Requêtes à faire

- [x] Liste des utilisateurs
- [x] Requête pour créer un utilisateur
- [x] Requête pour qu'un utilisateur connecté puisse modifier son profil
- [x] Requête pour obtenir le profil d'un utilisateur en fonction de son nom (prénom ou nom)
- [x] Lire le flow de publications par popularité (+ pagination)
- [x] Lire le flow de publications par date (+ pagination)
- [x] Présenter l'accès au tutoriel
- [x] Requête pour suivre un utilisateur
- [x] Requête pour supprimer le suivi d'un utilisateur
- [x] Requête pour la liste des notifications pour un utilisateur suivi
- [x] Création d'une publication
- [x] Ajout d'un commentaire
- [x] Répondre à un commentaire
- [x] Afficher tous les commentaires d'un post et leurs réponses
- [x] Afficher toutes les réactions à un post
- [x] Recherche par mot clé  dans les publications
- [x] Filtrer les publications selon les auteurs
- [x] Filtrer les publications selon les dates
- [x] Filtrer les publications selon la popularité

Les requêtes sont réalisées dans le fichier [queries.sql](./queries.sql). Elles sont pour la plupart réalisées pour un exemple basé sur le jeu de données fourni.
