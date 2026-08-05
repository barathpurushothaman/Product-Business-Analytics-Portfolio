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

---

## Observations

- All imported tables are stored under the `olist` schema.
- SQL validation queries use schema-qualified table names (e.g., `olist.customers`) to ensure clarity.
- No issues were identified during the validation of the imported tables.

---

## Constraint Validation

The following database constraints were successfully implemented and verified:

### Additional Constraints

The `order_items` table was updated with:

- Composite Primary Key:
  - `(order_id, order_item_id)`

- Foreign Key:
  - `order_items.order_id` → `orders.order_id`

The composite primary key ensures that each item within an order is uniquely identified, while the foreign key enforces referential integrity between orders and order items.

### Primary Keys

- `customers.customer_id`
- `orders.order_id`

### Foreign Keys

- `orders.customer_id` → `customers.customer_id`

These constraints enforce entity integrity and accurately model the one-to-many relationship between customers and orders.

---

## Conclusion

The imported datasets have been successfully validated and are ready for the next stage of database population and analysis.
