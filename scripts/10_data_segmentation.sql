/*
===============================================================================
Analyse de segmentation des données
===============================================================================
Objectif :
- Regrouper les données en catégories pertinentes pour obtenir des informations ciblées.
- Pour la segmentation client, la catégorisation des produits ou l’analyse régionale.

Fonctions SQL utilisées :
- CASE : Définit une logique de segmentation personnalisée.
- GROUP BY : Regroupe les données en segments.
===============================================================================
*/

/*Segmenter les produits en tranches de prix et compter le nombre de produits appartenant à chaque segment*/
WITH product_segments AS (
    SELECT
        product_key,
        product_name,
        cost,
        CASE 
            WHEN cost < 100 THEN 'Below 100'
            WHEN cost BETWEEN 100 AND 500 THEN '100-500'
            WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
            ELSE 'Above 1000'
        END AS cost_range
    FROM gold.dim_products
)
SELECT 
    cost_range,
    COUNT(product_key) AS total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;

/* Répartissez les clients en trois segments selon leurs habitudes de consommation :
- VIP : Clients ayant au moins 12 mois d’historique et dépensant plus de 5 000 €.
- Régulier : Clients ayant au moins 12 mois d’historique mais dépensant 5 000 € ou moins.
- Nouveau : Clients ayant moins de 12 mois d’ancienneté.
Calculez ensuite le nombre total de clients dans chaque groupe.
*/
WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS total_spending,
        MIN(order_date) AS first_order,
        MAX(order_date) AS last_order,
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)
SELECT 
    customer_segment,
    COUNT(customer_key) AS total_customers
FROM (
    SELECT 
        customer_key,
        CASE 
            WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
            WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS customer_segment
    FROM customer_spending
) AS segmented_customers
GROUP BY customer_segment
ORDER BY total_customers DESC;
