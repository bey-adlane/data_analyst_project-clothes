/*
===============================================================================
Exploration des mesures (Key Metrics)
===============================================================================
Objectif :
- Calculer des indicateurs agrégés (totaux, moyennes, etc.) pour obtenir rapidement des informations pertinentes.
- Identifier les tendances générales et repérer les anomalies.

Fonctions SQL utilisées :
- COUNT(), SUM(), AVG()
===============================================================================
*/

-- Trouvez le total des ventes
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales

-- Découvrez combien d'articles sont vendus
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales

-- Trouvez le prix de vente moyen
SELECT AVG(price) AS avg_price FROM gold.fact_sales

-- Trouver le nombre total de commandes
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales

-- Trouvez le nombre total de produits
SELECT COUNT(product_name) AS total_products FROM gold.dim_products

-- Trouvez le nombre total de clients
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers;

-- Trouvez le nombre total de clients ayant passé une commande.
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales;

-- Générez un rapport présentant tous les indicateurs clés de l'entreprise.
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;
