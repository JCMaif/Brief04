# Brief04

Ce projet est une base de données SQL permettant de répondre aux besoin pour la faisabilité d'un réseau social, qui sera développé par un ou des développeurs full-stack.


## Mise en place 
- Créer une database (par exemple ici 'social', owner postgres)
- Créer les tables par le script create_db.sql : `psql -U postgres -h localhost -p 5432 -d social -f ./data/create_db.sql`
- Peupler les tables avec le jeu de données exemple par le script seed_db.sql : `psql -U postgres -h localhost -p 5432 -d social -f ./data/seed_db.sql`

-- Nota : Sous windows, il est nécessaire d'ajouter le chemin de postgresql à la variable d'environnement PATH. Sous linux, précéder les commandes par `sudo -i -u postgres psql` (remplacer postgres par votre super user)


## Conception

Ce projet comporte les documents de conception du projet :
- [les user stories](./userStories.md), 
- [le MCD](./MCD.md), 
- [le MLD](./mld.drawio)


## Requêtes du projet

- [x] Afficher la liste des utilisateurs
- [x] Créer un utilisateur
- [x] Modifier le profil d'un utilisateur
- [x] Supprimer un utilisateur selon son id
- [x] Obtenir le profil d'un utilisateur en fonction de son nom (prénom ou nom)
- [x] Lire le fil de publications par popularité
- [x] Lire le fil de publications par date 
- [x] Pagination des fils
- [x] Présenter l'accès au tutoriel
- [x] Suivre un utilisateur
- [x] Supprimer le suivi d'un utilisateur
- [x] Gérer la liste des notifications pour un utilisateur suivi
- [x] Créer d'une publication
- [x] Supprimer une publication
- [x] Modifier une publication
- [x] Ajouter un commentaire
- [x] Répondre à un commentaire
- [x] Afficher tous les commentaires d'un post et leurs réponses
- [x] Afficher toutes les réactions à un post
- [x] Rechercher par mot clé  dans les publications
- [x] Filtrer les publications selon les auteurs
- [x] Filtrer les publications selon les dates
- [x] Filtrer les publications selon la popularité
- [x] Créer, modifier, supprimer des groupes de partage
- [x] Créer un membre d'un groupe, lui attribuer un rôle
- [x] Supprimer un membre du groupe
- [x] Créer, modifier, supprimer une publication dans un groupe

Les requêtes sont réalisées dans le fichier [queries.sql](./queries.sql). Elles sont pour la plupart réalisées pour un exemple basé sur le jeu de données fourni. 
Pour faciliter le travail du développeur, la plupart des requêtes présentant des modes d'affichage sont stockées sous forme de vues. Cela garantit l'uniformité des résultats et l'optimisation des requêtes.

### Bonus

- [x] Durée moyenne des sessions utilisateurs
- [x] Durée moyenne des sessions, par
- [] Nombre moyen de posts par utilisateur
- [] Nombre moyen de posts visionnés par session utilisateur
- [] Temps moyen passé à l'écriture d'un post
- [] Nombre moyen de modifications d'un post déjà publié
- [] Temps moyen passé sur un fil, regroupé par type de fil
- [] Visualiser le log des modifications (Nom de compte, post, etc..)