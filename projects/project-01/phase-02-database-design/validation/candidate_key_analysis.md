# Candidate Key Analysis

## Purpose

This document records the candidate key analysis performed during Phase 02 - Database Design.

The objective was to determine whether each imported dataset contained a reliable natural key before implementing primary key constraints. Candidate keys were evaluated against the actual source data rather than assumed from column names or business intuition.

The analysis followed this principle:

> A column or combination of columns should only be selected as a primary key when it uniquely identifies every record in the source dataset.

Where no reliable natural key could be established, the raw dataset was preserved and the absence of a primary key was documented rather than introducing an artificial key or modifying the source data.

---

## Candidate Key Summary

| Table | Candidate Key Evaluated | Result | Final Design |
|---|---|---|---|
| Customers | `customer_id` | Unique | Primary Key |
| Orders | `order_id` | Unique | Primary Key |
| Order Items | `(order_id, order_item_id)` | Unique | Composite Primary Key |
| Products | `product_id` | Unique | Primary Key |
| Sellers | `seller_id` | Unique | Primary Key |
| Payments | `(order_id, payment_sequential)` | Unique | Composite Primary Key |
| Reviews | `(review_id, order_id)` | Unique | Composite Primary Key |
| Geolocation | ZIP prefix / coordinate combinations | No reliable natural key | No Primary Key |
| Product Category Translation | `product_category_name` | Unique | Primary Key |

---

## 1. Customers

### Candidate Key

`customer_id`

### Validation

The dataset was checked for:

- Total record count
- Distinct `customer_id` count
- Duplicate `customer_id` values

### Finding

`customer_id` uniquely identifies the records in the customers dataset.

### Design Decision

```text
PRIMARY KEY (customer_id)
```

---

## 2. Orders

### Candidate Key

`order_id`

### Validation

The dataset was checked for:

- Total record count
- Distinct `order_id` count
- Duplicate `order_id` values

### Finding

`order_id` uniquely identifies each order.

### Design Decision

```text
PRIMARY KEY (order_id)
```

The `customer_id` column is treated as a foreign key referencing `customers.customer_id`.

---

## 3. Order Items

### Initial Observation

`order_id` is not unique because a single order can contain multiple items.

`order_item_id` represents the item sequence within an order and therefore cannot be treated as a globally unique identifier on its own.

### Candidate Key

```text
(order_id, order_item_id)
```

### Validation

The dataset was checked for duplicate combinations of:

```text
order_id + order_item_id
```

### Finding

The combination uniquely identifies each order-item record.

### Design Decision

```text
PRIMARY KEY (order_id, order_item_id)
```

Additional relationships:

```text
product_id → products.product_id
seller_id  → sellers.seller_id
```

This reflects the parent-child structure of the dataset:

```text
Order
  └── Order Item
       ├── Product
       └── Seller
```

---

## 4. Products

### Candidate Key

`product_id`

### Validation

The dataset was checked for:

- Total record count
- Distinct `product_id` count
- Duplicate `product_id` values

### Finding

`product_id` uniquely identifies each product record.

### Design Decision

```text
PRIMARY KEY (product_id)
```

The `product_category_name` column was later evaluated as a logical reference to the category translation table.

---

## 5. Sellers

### Candidate Key

`seller_id`

### Validation

The dataset was checked for:

- Total record count
- Distinct `seller_id` count
- Duplicate `seller_id` values

### Finding

`seller_id` uniquely identifies each seller.

### Design Decision

```text
PRIMARY KEY (seller_id)
```

The seller is referenced by `order_items.seller_id`.

---

## 6. Payments

### Initial Observation

`order_id` is not unique because an order can contain multiple payment transactions.

The dataset contains `payment_sequential`, which identifies the payment sequence within an order.

### Candidate Key

```text
(order_id, payment_sequential)
```

### Validation

The dataset was checked for duplicate combinations of:

```text
order_id + payment_sequential
```

### Finding

The combination uniquely identifies each payment transaction.

### Design Decision

```text
PRIMARY KEY (order_id, payment_sequential)
```

The relationship to orders is:

```text
payments.order_id → orders.order_id
```

This supports the business rule:

> One order can have one or more payment transactions.

---

## 7. Reviews

### Initial Assumption

The initial assumption was that `review_id` would uniquely identify a review.

### Validation Finding

The source data showed that:

- `review_id` is not unique.
- `order_id` is not unique.
- Some `review_id` values occur against multiple orders.
- Some orders contain multiple review records.

Therefore, neither column can independently serve as the primary key.

### Candidate Key Investigation

The combination:

```text
(review_id, order_id)
```

was evaluated.

The total number of records matched the number of distinct `(review_id, order_id)` combinations.

### Finding

The combination uniquely identifies every review record in the imported dataset.

### Design Decision

```text
PRIMARY KEY (review_id, order_id)
```

The `order_id` relationship is enforced through:

```text
reviews.order_id → orders.order_id
```

### Important Modeling Note

This design intentionally reflects the observed source data rather than imposing the assumption that one review ID represents exactly one order.

---

## 8. Geolocation

### Initial Hypothesis

Several possible natural keys were considered, including:

```text
geolocation_zip_code_prefix
```

and combinations involving:

```text
geolocation_zip_code_prefix
geolocation_lat
geolocation_lng
geolocation_city
geolocation_state
```

### Validation Findings

The analysis established that:

- ZIP code prefixes are not unique.
- A ZIP prefix can occur with multiple coordinate pairs.
- The initial assumption that ZIP prefix and coordinate values would directly correspond to another dataset's identifiers was not supported.
- Even the broader combination of ZIP prefix, latitude, longitude, city, and state was evaluated against the source data before making a design decision.

The dataset contains duplicate business records rather than a clearly defined row-level natural identifier.

### Design Decision

No primary key was implemented for the geolocation table.

The raw dataset was preserved without adding an artificial identifier.

### Rationale

Creating an artificial key would make every row technically unique without establishing that the key represents a meaningful business entity.

Because the purpose of this phase is to model the source data faithfully, the absence of a reliable natural key is documented rather than hidden.

The table is therefore treated as a reference dataset:

```text
GEOLOCATION
No Primary Key
No Foreign Keys
```

---

## 9. Product Category Name Translation

### Candidate Key

`product_category_name`

### Validation

The translation dataset was checked for:

- Total record count
- Distinct `product_category_name` count
- Duplicate category names

### Finding

`product_category_name` uniquely identifies the translation records.

### Design Decision

```text
PRIMARY KEY (product_category_name)
```

### Relationship Investigation

The `products.product_category_name` column was evaluated as a candidate foreign key to:

```text
product_category_name_translation.product_category_name
```

The validation revealed unmatched product category values in the products dataset.

Therefore, the foreign key could not be safely implemented without modifying or excluding source records.

### Final Decision

The primary key was implemented on the translation table, but the foreign key from `products` was intentionally not enforced.

The logical relationship is documented in the ER diagram as:

```text
Products
    └── Product Category Translation

Logical relationship
FK not enforced
```

---

# Key Design Decisions

The candidate key analysis resulted in three important modeling outcomes.

## 1. Composite Keys Were Used Where the Dataset Required Them

Composite primary keys were implemented for:

```text
order_items
(order_id, order_item_id)

payments
(order_id, payment_sequential)

reviews
(review_id, order_id)
```

These combinations were selected because individual columns did not uniquely identify the records.

---

## 2. No Artificial Key Was Added to Geolocation

The geolocation dataset did not provide a reliable natural key.

Rather than introducing a synthetic identifier solely to satisfy database constraints, the raw dataset was retained and the limitation documented.

This preserves the distinction between:

- a technically unique database row
- and a meaningful business identifier

---

## 3. Referential Integrity Was Not Forced Where Source Data Did Not Support It

The product category translation table demonstrated that a seemingly valid relationship does not automatically justify a foreign key.

The relationship:

```text
products.product_category_name
        ↓
product_category_name_translation.product_category_name
```

was investigated and found to contain unmatched source values.

The source data was preserved without modification, and the relationship remains logical rather than enforced.

---

# Overall Conclusion

Candidate key selection in Phase 02 was driven by observed dataset behavior rather than assumptions based solely on column names.

This resulted in:

- Simple primary keys where natural identifiers were reliable.
- Composite primary keys where multiple attributes were required to uniquely identify a record.
- No primary key where the source data did not provide a defensible natural identifier.
- Foreign keys only where referential integrity was supported by the actual data.

This approach provides a database model that remains faithful to the source Olist datasets while making the important data-quality and modeling limitations explicit.
