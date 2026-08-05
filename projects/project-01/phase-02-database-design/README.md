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
6. Data Quality Assessment
7. Business Rule Validation
8. Constraint Implementation (where supported)
9. Documentation
10. Version Contro

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
- Designed and created the `geolocation` table using appropriate data types.
- Imported and validated the `geolocation` dataset.
- Performed candidate key validation to evaluate possible primary key combinations.
- Identified duplicate business records within the source dataset.
- Documented the decision to preserve the raw dataset without implementing database constraints.
- - Designed and created the `product_category_name_translation` lookup table using appropriate data types.
- Imported and validated the category translation dataset.
- Implemented the primary key for the translation table.
- Validated the candidate foreign key relationship between `products` and `product_category_name_translation`.
- Identified source data inconsistencies that prevented safe implementation of the foreign key.
- Documented the design decision to preserve the original source data without enforcing referential integrity.
- 
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
| Geolocation | ✅ Imported & Validated *(No constraints - documented)* |
| Category Translation | ✅ Imported, Validated & Constrained* |

---

## Outcome

## Outcome

The Phase 02 database implementation has been completed successfully.

All Olist datasets were imported into PostgreSQL, validated against the source data, and documented. Primary and foreign key relationships were established where supported by the dataset. Candidate key and business rule validation were performed before implementing constraints, resulting in the identification of several source data quality issues.

Where referential integrity could not be safely enforced (for example, the Product Category Translation lookup table), the original dataset was intentionally preserved and the design decision was documented rather than modifying the source data.

The resulting database accurately represents the structure and quality of the original Olist dataset and provides a reliable foundation for exploratory data analysis and business reporting in the subsequent project phases.

---

## Next Phase Activity

Continue importing and validating the remaining datasets before proceeding to exploratory data analysis.
