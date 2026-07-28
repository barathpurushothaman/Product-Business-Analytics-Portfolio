# Data Dictionary

## Purpose

This document provides an overview of each dataset used in Project 01.

The objective is to understand the business meaning of each table, identify the key entities within the dataset, and establish the foundation for data modeling and analysis.

Detailed column-level documentation and data quality assessments will be added as the project progresses.

---

# Dataset Overview

| Dataset | Business Entity | One Row Represents | Primary Identifier | Related Entities |
|---------|-----------------|--------------------|--------------------|------------------|
| olist_customers_dataset | Customer | A customer record | customer_id | Orders |
| olist_orders_dataset | Order | A customer order | order_id | Customers, Order Items, Payments, Reviews |
| olist_order_items_dataset | Order Item | A single product within an order | order_id + order_item_id | Orders, Products, Sellers |
| olist_products_dataset | Product | A product available for sale | product_id | Order Items |
| olist_sellers_dataset | Seller | A marketplace seller | seller_id | Order Items |
| olist_order_payments_dataset | Payment | A payment transaction for an order | order_id + payment_sequential | Orders |
| olist_order_reviews_dataset | Review | A customer review for an order | review_id | Orders |
| olist_geolocation_dataset | Geolocation | A geographic location identified by ZIP code prefix | geolocation_zip_code_prefix | Customers, Sellers |
| product_category_name_translation | Product Category Translation | A category name translation | product_category_name | Products |

---

# Dataset Details

## Customers

**Business Purpose**

Stores customer information associated with purchases made through the marketplace.

**Primary Identifier**

- customer_id

**Important Columns**

- customer_unique_id
- customer_zip_code_prefix
- customer_city
- customer_state

---

## Orders

**Business Purpose**

Represents the lifecycle of customer orders from purchase through delivery.

**Primary Identifier**

- order_id

**Important Columns**

- customer_id
- order_status
- order_purchase_timestamp
- order_approved_at
- order_delivered_customer_date
- order_estimated_delivery_date

---

## Order Items

**Business Purpose**

Represents individual products included within customer orders.

One order may contain multiple items.

**Primary Identifier**

- order_id
- order_item_id

**Important Columns**

- product_id
- seller_id
- price
- freight_value

---

## Products

**Business Purpose**

Stores descriptive information about products sold through the marketplace.

**Primary Identifier**

- product_id

**Important Columns**

- product_category_name
- product_weight_g
- product_length_cm
- product_height_cm
- product_width_cm

---

## Sellers

**Business Purpose**

Stores information about marketplace sellers.

**Primary Identifier**

- seller_id

**Important Columns**

- seller_zip_code_prefix
- seller_city
- seller_state

---

## Order Payments

**Business Purpose**

Stores payment information associated with customer orders.

An order may contain multiple payment records.

**Primary Identifier**

- order_id
- payment_sequential

**Important Columns**

- payment_type
- payment_installments
- payment_value

---

## Order Reviews

**Business Purpose**

Stores customer reviews submitted after order completion.

**Primary Identifier**

- review_id

**Important Columns**

- order_id
- review_score
- review_comment_title
- review_creation_date

---

## Geolocation

**Business Purpose**

Provides geographic reference data based on ZIP code prefixes.

**Primary Identifier**

- geolocation_zip_code_prefix

**Important Columns**

- geolocation_city
- geolocation_state
- geolocation_lat
- geolocation_lng

---

## Product Category Translation

**Business Purpose**

Maps Portuguese product category names to their English equivalents.

**Primary Identifier**

- product_category_name

**Important Columns**

- product_category_name_english

---

# Initial Observations

- The dataset follows a normalized relational structure with separate tables for customers, orders, products, sellers, payments, reviews, and geographic information.
- Several datasets appear to be connected through identifier fields such as `customer_id`, `order_id`, `product_id`, and `seller_id`.
- Multiple datasets use composite identifiers, suggesting one-to-many relationships (for example, orders to order items and orders to payments).
- The geolocation and category translation datasets appear to function as reference data rather than transactional data.

These observations will be verified during the entity relationship analysis.

---

# Next Steps

The next phase of the project is to identify:

- Primary Keys
- Foreign Keys
- Cardinality between tables
- Entity relationships

This information will be used to create the Entity Relationship Diagram (ERD).
