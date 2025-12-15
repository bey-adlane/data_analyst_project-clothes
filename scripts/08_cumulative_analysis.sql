/*
===============================================================================
Cumulative Analysis
===============================================================================
Objectif :
- Calculer les totaux cumulés ou les moyennes mobiles des indicateurs clés.
- Suivre les performances cumulées dans le temps.
- Utile pour l'analyse de la croissance ou l'identification des tendances à long terme.

Fonctions SQL utilisées :
- Fonctions de fenêtrage : SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculer le total des ventes mensuelles
-- et le total cumulé des ventes au fil du temps
SELECT
	order_date,
	total_sales,
	SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
	AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    SELECT 
        DATETRUNC(year, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t
