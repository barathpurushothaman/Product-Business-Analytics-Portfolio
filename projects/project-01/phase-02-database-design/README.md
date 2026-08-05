# Phase 02 - Database Design

**Project:** Olist E-Commerce Business Analysis

**Status:** 🚧 In Progress

**Tools Used:** PostgreSQL, pgAdmin, SQL

---

## Phase Methodology

Each table in this phase follows a consistent implementation process:

1. Business Discovery
2. Table Design
3. Data Import
4. Data Validation
5. Candidate Key Validation
6. Business Rule Validation
7. Constraint Implementation
8. Documentation
9. Version Control

---

## Objective

Design and implement a relational database from the raw Olist CSV files.

The objective of this phase is to transform raw datasets into a structured PostgreSQL database that supports reliable business analysis and reporting.

---

## Database Architecture

The project database is named **`olist_business_analysis`**.

All project tables are stored within the **`olist`** schema to keep the project objects logically separated from PostgreSQL's default `public` schema.

Unless otherwise noted, SQL queries in this project use schema-qualified table names (for example, `olist.customers`) to explicitly reference project tables.

---

## Database Constraints

The source CSV files do not contain database constraints such as primary keys or foreign keys. After importing the data into PostgreSQL, constraints are added incrementally to establish data integrity and accurately model the relationships between entities.

This approach mirrors how database structures are often built in analytical environments, where data is first loaded and validated before structural constraints are applied.

---

## Activities Performed

- Created the PostgreSQL database for the project.
- Imported raw CSV datasets into PostgreSQL using pgAdmin.
- Validated imported tables to ensure successful data loading.
- Verified record counts and table structure.
- Established the foundation for future SQL analysis.
- Defined primary key constraints for imported tables.
- Established the foreign key relationship between customers and orders.
- Designed and created the `order_items` table using appropriate data types.
- Imported the `order_items` dataset.
- Implemented a composite primary key for the `order_items` table.
- Established the foreign key relationship between `order_items` and `orders`.
- Designed and created the `products` table using appropriate data types.
- Imported and validated the `products` dataset.
- Implemented the primary key for the `products` table.
- Established the foreign key relationship between `order_items` and `products`.
- Designed and created the `sellers` table using appropriate data types.
- Imported and validated the `sellers` dataset.
- Implemented the primary key for the `sellers` table.
- Established the foreign key relationship between `order_items` and `sellers`.
- Designed and created the `payments` table using appropriate data types.
- Imported and validated the `payments` dataset.
- Implemented a composite primary key for the `payments` table.
- Established the foreign key relationship between `payments` and `orders`.
- Verified the business rule that an order can contain multiple payment transactions.
- Investigated review data anomalies to determine the correct primary key.
- Implemented a composite primary key for the `reviews` table based on dataset validation.
- Established a foreign key relationship between `reviews` and `orders`.
---

## Deliverables

- PostgreSQL database created
- Imported datasets
- Database constraints
- SQL validation scripts
- Validation documentation

---

## Validation

Each imported table is validated by checking:

- Successful import
- Record count
- Column structure
- Data integrity

Validation queries are stored in:

```text
sql/validation.sql
```

Validation observations are documented in:

```text
validation/validation_notes.md
```

---

## Database Build Progress

| Table | Status |
|--------|--------|
| Customers | ✅ Imported, Validated & Constrained |
| Orders | ✅ Imported, Validated & Constrained |
| Order Items | ✅ Imported, Validated & Constrained |
| Products | ✅ Imported, Validated & Constrained |
| Sellers | ✅ Imported, Validated & Constrained |
| Payments | ✅ Imported, Validated & Constrained |
| Reviews | ✅ Imported, Validated & Constrained |
| Geolocation | ⏳ Pending |
| Category Translation | ⏳ Pending |
---

## Outcome

A PostgreSQL database has been successfully created, and the first two datasets have been imported and validated. The database structure is now ready for the remaining datasets to be loaded.

---

## Next Phase Activity

Continue importing and validating the remaining datasets before proceeding to exploratory data analysis.
