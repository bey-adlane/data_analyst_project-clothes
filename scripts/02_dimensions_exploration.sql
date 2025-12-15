/*
===============================================================================
Exploration des dimensions
===============================================================================
Objectif :
Explorer la structure des tables de dimensions.

Fonctions SQL utilisées :
DISTINCT
ORDER BY
===============================================================================
*/

-- Récupérer la liste des pays d'origine des clients
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

-- Récupérer une liste des catégories, sous-catégories et produits
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
