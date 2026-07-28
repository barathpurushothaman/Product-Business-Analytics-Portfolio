# Dataset Inventory

## Purpose

This document provides an inventory of all datasets supplied for Project 01.

The objective is to identify the available data assets before exploring their structure, relationships, or analytical value.

---

# Dataset Information

| Attribute | Value |
|-----------|-------|
| **Dataset Name** | Olist Brazilian E-Commerce Public Dataset |
| **Source** | Kaggle |
| **Business Domain** | E-Commerce |
| **Dataset Type** | Relational Dataset |
| **Project** | Project 01 – Olist E-Commerce Business Analysis |

---

# Dataset Summary

The dataset consists of nine CSV files representing different aspects of an e-commerce marketplace.

Based on the file names and available columns, the data appears to capture the lifecycle of customer orders, including customers, products, sellers, payments, reviews, and geographic information.

Further analysis is required to understand how these datasets are related.

---

# Available Datasets

| File Name | Rows | Columns | Initial Observation | Status |
|-----------|------:|--------:|---------------------|--------|
| olist_orders_dataset.csv | 99,441 | 8 | Stores order lifecycle information | Pending Review |
| olist_order_items_dataset.csv | 112,650 | 7 | Stores products associated with each order | Pending Review |
| olist_products_dataset.csv | 32,951 | 9 | Stores product attributes | Pending Review |
| olist_customers_dataset.csv | 99,441 | 5 | Stores customer information | Pending Review |
| olist_sellers_dataset.csv | 3,095 | 4 | Stores seller information | Pending Review |
| olist_order_payments_dataset.csv | 103,886 | 5 | Stores payment information | Pending Review |
| olist_order_reviews_dataset.csv | 104,719 | 7 | Stores customer review information | Pending Review |
| product_category_name_translation.csv | 71 | 2 | Lookup table for product category translations | Pending Review |
| olist_geolocation_dataset.csv | 1,000,163 | 5 | Stores geographic location information | Pending Review |

---

# Initial Observations

The following observations are based solely on the dataset inventory and column names.

- The project contains nine separate datasets.
- The datasets appear to represent different business entities within an e-commerce marketplace.
- Orders and Customers contain the same number of records (99,441), suggesting a close relationship that will be investigated further.
- The Geolocation dataset is significantly larger than the others, indicating that geographic information is stored independently from customer and seller records.
- The Product Category Translation dataset appears to be a reference (lookup) table rather than a transactional dataset.
- Most datasets contain identifier columns (for example, `order_id`, `customer_id`, `product_id`, and `seller_id`), suggesting a relational data model.

These observations will be validated during the data exploration phase.

---

# Next Steps

The next stage of the project is to:

1. Examine each dataset individually.
2. Build a comprehensive data dictionary.
3. Identify primary and foreign keys.
4. Understand the relationships between datasets.
5. Develop an Entity Relationship Diagram (ERD) before importing the data into PostgreSQL.
