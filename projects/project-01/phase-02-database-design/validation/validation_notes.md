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

---

## Observations

- All imported tables are stored under the `olist` schema.
- SQL validation queries use schema-qualified table names (e.g., `olist.customers`) to ensure clarity.
- No issues were identified during the validation of the imported tables.

---

## Constraint Validation

The following constraints have been implemented and verified during Phase 02.

### Primary Keys

| Table | Primary Key |
|--------|-------------|
| Customers | `customer_id` |
| Orders | `order_id` |
| Order Items | `(order_id, order_item_id)` |
| Products | `product_id` |
| Sellers | `seller_id` |

### Foreign Keys

| Child Table | Foreign Key | References |
|-------------|-------------|------------|
| Orders | `customer_id` | `customers.customer_id` |
| Order Items | `order_id` | `orders.order_id` |
| Order Items | `product_id` | `products.product_id` |
| Order Items | `seller_id` | `sellers.seller_id` |

### Summary

All implemented constraints were successfully verified after creation.

These constraints enforce:

- Entity uniqueness through primary keys.
- Referential integrity through foreign keys.
- Consistent relationships between business entities.

### Primary Keys

| Table | Primary Key |
|--------|-------------|
| Customers | `customer_id` |
| Orders | `order_id` |
| Order Items | `(order_id, order_item_id)` |
| Products | `product_id` |

### Foreign Keys

| Child Table | Foreign Key | References |
|-------------|-------------|------------|
| Orders | `customer_id` | `customers.customer_id` |
| Order Items | `order_id` | `orders.order_id` |
| Order Items | `product_id` | `products.product_id` |

### Summary

All implemented constraints were successfully verified after creation.

These constraints enforce:

- Entity uniqueness through primary keys.
- Referential integrity through foreign keys.
- Consistent relationships between business entities.

### Primary Keys

- `customers.customer_id`
- `orders.order_id`

### Foreign Keys

- `orders.customer_id` → `customers.customer_id`

These constraints enforce entity integrity and accurately model the one-to-many relationship between customers and orders.

---

## Conclusion

The imported datasets have been successfully validated and are ready for the next stage of database population and analysis.
