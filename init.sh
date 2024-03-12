#!/bin/bash

echo "Connexion en tant que super utilisateur postgres..."
psql -U postgres -h localhost -p 5432 -d postgres -c "ALTER USER postgres PASSWORD 'postgres';"

echo "Suppression de la base de données 'social' si elle existe..."
psql -U postgres -h localhost -p 5432 -d postgres -c "DROP DATABASE IF EXISTS social;"

echo "Création de la base de données 'social'..."
psql -U postgres -h localhost -p 5432 -d postgres -c "CREATE DATABASE social;"

echo "Création des tables à partir du fichier create_db.sql..."
psql -U postgres -h localhost -p 5432 -d social -f ./data/create_db.sql

echo "Peuplement des tables à partir du fichier seed_db.sql..."
psql -U postgres -h localhost -p 5432 -d social -f ./data/seed_db.sql

echo "Script terminé."
