# Database Validation Notes

## Validation Objective

The objective of this validation was to confirm that the imported datasets were successfully loaded into the PostgreSQL database and were ready for subsequent analysis.

---

## Validation Performed

The following checks were completed for each imported table:

- Verified that the table exists in the `olist` schema.
- Verified the total number of imported records.
- Reviewed a sample of the imported data.
- Confirmed that the table structure matched the source dataset.

---

## Validation Results

| Table | Validation Status | Notes |
|--------|-------------------|-------|
| Customers | ✅ Passed | Successfully imported and record count verified. |
| Orders | ✅ Passed | Successfully imported and record count verified. |
| Orders Items | ✅ Passed | Successfully imported, validated, and composite primary key verified. |
| Products | ✅ Passed | Successfully imported, validated, and composite primary key verified. |
| Sellers | ✅ Passed | Successfully imported, validated, and composite primary key verified. |
| Payments | ✅ Passed | Successfully imported, validated, and composite primary key verified. |

---

## Observations

- All imported tables are stored under the `olist` schema.
- SQL validation queries use schema-qualified table names (e.g., `olist.customers`) to ensure clarity.
- No issues were identified during the validation of the imported tables.

---

## Constraint Validation

The following database constraints were implemented and verified during Phase 02 to ensure entity integrity and maintain referential integrity across the Olist database.

---

### Primary Keys

| Table | Primary Key |
|--------|-------------|
| Customers | `customer_id` |
| Orders | `order_id` |
| Order Items | `(order_id, order_item_id)` |
| Products | `product_id` |
| Sellers | `seller_id` |
| Payments | `(order_id, payment_sequential)` |
| Reviews | `(review_id, order_id)` |

---

### Foreign Keys

| Child Table | Foreign Key | References |
|-------------|-------------|------------|
| Orders | `customer_id` | `customers.customer_id` |
| Order Items | `order_id` | `orders.order_id` |
| Order Items | `product_id` | `products.product_id` |
| Order Items | `seller_id` | `sellers.seller_id` |
| Payments | `order_id` | `orders.order_id` |
| Reviews | `order_id` | `orders.order_id` |

---

## Data Modeling Discoveries

During constraint implementation, several business rules were validated against the imported dataset before defining the final database design.

### Reviews

The `reviews` table required additional investigation before selecting its primary key.

#### Candidate Key Validation

Validation confirmed that:

- `review_id` is **not unique** within the dataset.
- `order_id` is **not unique** within the dataset.
- Some `review_id` values are associated with multiple orders.
- Some orders contain multiple review records.

A candidate key analysis confirmed that the combination:

- `(review_id, order_id)`

uniquely identifies every record in the table.

#### Design Decision

Based on the validation results, the following constraints were implemented:

**Composite Primary Key**

- `(review_id, order_id)`

**Foreign Key**

- `reviews.order_id` → `orders.order_id`

This approach preserves referential integrity while accurately representing the structure of the Olist dataset without making unsupported assumptions about review uniqueness.

## Conclusion

The imported datasets have been successfully validated and are ready for the next stage of database population and analysis.
