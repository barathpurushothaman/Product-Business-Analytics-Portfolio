# Entity Relationships

## Purpose

This document identifies the relationships between the datasets used in Project 01.

The objective is to understand how business entities are connected, identify primary and foreign keys, and establish the relational data model that will support SQL analysis.

The relationships documented here are based on the structure of the dataset and will be validated during data exploration.

---

# Entity Overview

| Entity | Primary Key | Business Purpose |
|---------|-------------|------------------|
| Customers | customer_id | Stores customer information |
| Orders | order_id | Stores customer orders |
| Order Items | order_id + order_item_id | Stores products purchased within an order |
| Products | product_id | Stores product information |
| Sellers | seller_id | Stores seller information |
| Payments | order_id + payment_sequential | Stores payment information |
| Reviews | review_id | Stores customer reviews |
| Geolocation | geolocation_zip_code_prefix | Stores location reference data |
| Product Category Translation | product_category_name | Stores category name translations |

---

# Relationship Summary

| Parent Entity | Child Entity | Relationship | Foreign Key |
|---------------|--------------|--------------|-------------|
| Customers | Orders | One-to-Many | customer_id |
| Orders | Order Items | One-to-Many | order_id |
| Orders | Payments | One-to-Many | order_id |
| Orders | Reviews | One-to-One (Expected) | order_id |
| Products | Order Items | One-to-Many | product_id |
| Sellers | Order Items | One-to-Many | seller_id |
| Product Category Translation | Products | One-to-Many | product_category_name |
| Geolocation | Customers | One-to-Many (via ZIP code prefix) | customer_zip_code_prefix |
| Geolocation | Sellers | One-to-Many (via ZIP code prefix) | seller_zip_code_prefix |

---

# Relationship Details

## Customers → Orders

**Relationship**

One customer can place multiple orders.

**Primary Key**

customer_id

**Foreign Key**

Orders.customer_id

---

## Orders → Order Items

**Relationship**

One order can contain multiple products.

Each product purchased is stored as a separate order item.

---

## Orders → Payments

**Relationship**

An order may contain multiple payment records.

This allows payments to be split across different payment methods or installments.

---

## Orders → Reviews

**Relationship**

An order may have an associated customer review.

Based on the available identifiers, this appears to be a one-to-one relationship, which will be validated during analysis.

---

## Products → Order Items

**Relationship**

A product can appear in many different customer orders.

---

## Sellers → Order Items

**Relationship**

One seller can sell many products across many customer orders.

---

## Product Category Translation → Products

**Relationship**

Each product category maps to an English translation.

This table functions as a lookup table.

---

## Geolocation → Customers

**Relationship**

Customer ZIP code prefixes can be matched to geolocation records.

This relationship enables geographic analysis.

---

## Geolocation → Sellers

**Relationship**

Seller ZIP code prefixes can be matched to geolocation records.

This relationship enables regional seller analysis.

---

# Logical Relationship Diagram

```text
Customers
    │
    │ customer_id
    ▼
Orders
    │
    ├──────────────┐
    ▼              ▼
Order Items     Payments
    │
    ├──────────────┐
    ▼              ▼
Products       Sellers
    │
    ▼
Category Translation

Customers ───────┐
                 │
                 ▼
            Geolocation
                 ▲
                 │
Sellers ─────────┘

Orders
    │
    ▼
Reviews
```

---

# Initial Observations

- Orders act as the central entity within the dataset.
- Most transactional datasets are connected directly or indirectly through the Orders table.
- Order Items serves as the bridge between Orders, Products, and Sellers.
- Geolocation functions as a shared reference dataset.
- Product Category Translation functions as a lookup table.
- The data model appears to follow a normalized relational database design.

These observations will be verified using SQL after the data has been imported into PostgreSQL.

---

# Next Steps

The next phase of the project is to:

1. Import the datasets into PostgreSQL.
2. Verify primary keys and foreign keys.
3. Validate relationship cardinality using SQL.
4. Check for orphan records and referential integrity.
5. Create an Entity Relationship Diagram (ERD) using the validated data model.
