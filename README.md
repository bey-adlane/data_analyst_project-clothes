# 📊 Projet d'Analyse de Données : Stratégie pour une Marque de Vêtements

Ce projet illustre l'intégralité du cycle d'analyse des données (Data Analytics), de la préparation des données sur SQL Server à la production d'insights stratégiques pour une marque de vêtements.

---

## 🎯 Objectif du Projet

L'objectif principal était de transformer les données de ventes et de clients en informations actionnables, en se concentrant sur les axes suivants :
1.  Évaluer la performance commerciale à travers le temps.
2.  Identifier les segments de clients et de produits les plus importants.
3.  Fournir des bases solides pour des décisions marketing et de gestion des stocks.

### 🛠️ Outils et Technologies

| Domaine | Outils/Langages |
| :--- | :--- |
| **Infrastructure & Requêtes** | SQL (sur SQL Server) |
| **Analyse & Modélisation** | SQL |

---

## 1. 🏗️ Phase d'Ingénierie des Données (BDD / ETL)

### 1.1. Modèle d'Intégration des Données

La première phase a consisté à créer une base de données relationnelle propre sur SQL Server. Les données ont été intégrées à partir de différentes sources (CRM et ERP) pour former un modèle de données centralisé et cohérent, garantissant l'intégrité de l'analyse.

> **Visualisation du Modèle :**
> 
Le script `init_database.sql` contient les commandes de création des tables et d'importation des données.

---

## 2. 📈 Analyse de Données (Data Analytics)

Toutes les analyses ont été réalisées à l'aide de requêtes **SQL** complexes, suivant une approche structurée, de l'exploration initiale à la modélisation avancée.

### 2.1. Structure du Répertoire d'Analyse

Le répertoire est organisé par étapes méthodologiques, correspondant à l'ordre des scripts SQL exécutés :

| Catégorie | Fichiers SQL (Exemples) | Description |
| :--- | :--- | :--- |
| **Exploration (EDA)** | `01_database_exploration.sql`, `04_measures_exploration.sql` | Identification des données disponibles, calcul des agrégats clés et vérification de la qualité. |
| **Analyse de Base** | `05_magnitude_analysis.sql`, `06_ranking_analysis.sql` | Détermination des valeurs extrêmes, identification des Top N/Bottom N (clients, produits). |
| **Analyse Temporelle** | `07_change_over_time_analysis.sql`, `08_cumulative_analysis.sql` | Suivi de l'évolution des ventes sur le temps et calcul des indicateurs de croissance. |
| **Analyse Avancée** | `09_performance_analysis.sql`, `10_data_segmentation.sql`, `11_part_to_whole_analysis.sql` | Modélisation des KPIs, création de segments clients, et analyse de la contribution de chaque composant au total. |
| **Reporting Final** | `12_report_customers.sql`, `13_report_products.sql` | Requêtes finales optimisées pour l'extraction de rapports destinés aux équipes métiers. |

### 2.2. Focus sur les Compétences Développées

L'exécution de cette série de scripts a permis d'approfondir la maîtrise de :
* Fonctions de fenêtrage (`ROW_NUMBER`, `LAG`, `SUM OVER`) pour les analyses cumulatives et de séries temporelles.
* Expressions de Table Communes (CTE) pour structurer des requêtes complexes (segmentation, calculs d'indicateurs composites).
* Logiques conditionnelles (`CASE WHEN`) pour la catégorisation et l'évaluation de la performance.

---
---
