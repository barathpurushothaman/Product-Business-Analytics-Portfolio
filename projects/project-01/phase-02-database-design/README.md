# Phase 02 - Database Design

**Project:** Olist E-Commerce Business Analysis

**Status:** 🚧 In Progress

**Tools Used:** PostgreSQL, pgAdmin, SQL

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

## Activities Performed

- Created the PostgreSQL database for the project.
- Imported raw CSV datasets into PostgreSQL using pgAdmin.
- Validated imported tables to ensure successful data loading.
- Verified record counts and table structure.
- Established the foundation for future SQL analysis.

---

## Deliverables

- PostgreSQL database created
- Imported datasets
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

## Current Progress

| Table | Status |
|--------|--------|
| Customers | ✅ Imported & Validated |
| Orders | ✅ Imported & Validated |
| Order Items | ⏳ Pending |
| Payments | ⏳ Pending |
| Reviews | ⏳ Pending |
| Products | ⏳ Pending |
| Sellers | ⏳ Pending |
| Geolocation | ⏳ Pending |
| Category Translation | ⏳ Pending |

---

## Outcome

A PostgreSQL database has been successfully created, and the first two datasets have been imported and validated. The database structure is now ready for the remaining datasets to be loaded.

---

## Next Phase Activity

Continue importing and validating the remaining datasets before proceeding to exploratory data analysis.