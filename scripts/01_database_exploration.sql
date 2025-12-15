/*
===============================================================================
Exploration de la base de données
===============================================================================
Objectif :

- Explorer la structure de la base de données, notamment la liste des tables et leurs schémas.
- Examiner les colonnes et les métadonnées de tables spécifiques.

Table utilisée :
- INFORMATION_SCHEMA.TABLES
- INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

-- Récupérer la liste de toutes les tables de la base de données
SELECT 
    TABLE_CATALOG, 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

-- Récupérer toutes les colonnes d'une table spécifique (dim_customers)
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
