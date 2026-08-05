-- =====================================================
-- Phase 02 - Database Validation
-- Project: Olist E-Commerce Business Analysis
-- =====================================================

-- =====================================================
-- Customers Table Validation
-- =====================================================

-- Verify total number of records
SELECT COUNT(*) AS customer_count
FROM olist.customers;

-- Preview imported data
SELECT *
FROM olist.customers
LIMIT 10;


-- =====================================================
-- Orders Table Validation
-- =====================================================

-- Verify total number of records
SELECT COUNT(*) AS order_count
FROM olist.orders;

-- Preview imported data
SELECT *
FROM olist.orders
LIMIT 10;

-- =====================================================
-- Order Items Table Validation
-- =====================================================

-- Verify total number of records
SELECT COUNT(*) AS order_items_count
FROM olist.order_items;

-- Preview imported data
SELECT *
FROM olist.order_items
LIMIT 10;

-- Verify composite primary key uniqueness
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT (order_id, order_item_id)) AS unique_rows
FROM olist.order_items;

-- =====================================================
-- Products Table Validation
-- =====================================================

-- Verify total number of records
SELECT COUNT(*) AS products_count
FROM olist.products;

-- Preview imported data
SELECT *
FROM olist.products
LIMIT 10;

-- Candidate Key Validation
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT product_id) AS unique_product_ids
FROM olist.products;

-- Duplicate Investigation
SELECT
    product_id,
    COUNT(*) AS occurrence_count
FROM olist.products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- =====================================================
-- Sellers Table Validation
-- =====================================================

-- Verify total number of records
SELECT COUNT(*) AS sellers_count
FROM olist.sellers;

-- Preview imported data
SELECT *
FROM olist.sellers
LIMIT 10;

-- Candidate Key Validation
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT seller_id) AS unique_seller_ids
FROM olist.sellers;

-- Duplicate Investigation
SELECT
    seller_id,
    COUNT(*) AS occurrence_count
FROM olist.sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

-- =====================================================
-- Payments Table Validation
-- =====================================================

-- Verify total number of records
SELECT COUNT(*) AS payments_count
FROM olist.payments;

-- Preview imported data
SELECT *
FROM olist.payments
LIMIT 10;

-- Candidate Key Validation
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT (order_id, payment_sequential)) AS unique_payment_records
FROM olist.payments;

-- Business Rule Validation
-- Identify orders with multiple payment transactions
SELECT
    order_id,
    COUNT(*) AS payment_count
FROM olist.payments
GROUP BY order_id
HAVING COUNT(*) > 1;

-- ===========================================================
-- Reviews Validation
-- ===========================================================

-- Validate row count

SELECT COUNT(*) AS reviews_count
FROM olist.reviews;

-- Preview data

SELECT *
FROM olist.reviews
LIMIT 10;

-- ===========================================================
-- Candidate Key Validation
-- ===========================================================

-- Verify that (review_id, order_id) uniquely identifies every record

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT (review_id, order_id)) AS unique_review_order_pairs
FROM olist.reviews;

-- ===========================================================
-- Business Rule Investigation
-- ===========================================================

-- Investigate duplicate review IDs

SELECT
    review_id,
    COUNT(*) AS occurrence_count
FROM olist.reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

-- Investigate orders with multiple reviews

SELECT
    order_id,
    COUNT(*) AS review_count
FROM olist.reviews
GROUP BY order_id
HAVING COUNT(*) > 1;

-- ===========================================================
-- Geolocation Validation
-- ===========================================================

-- Total Rows

SELECT COUNT(*)
FROM olist.geolocation;

-- Duplicate ZIP Prefixes

SELECT
    geolocation_zip_code_prefix,
    COUNT(*)
FROM olist.geolocation
GROUP BY geolocation_zip_code_prefix
HAVING COUNT(*) > 1;

-- Candidate Key Test

SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT(
geolocation_zip_code_prefix,
geolocation_lat,
geolocation_lng,
geolocation_city,
geolocation_state
)) AS unique_records
FROM olist.geolocation;

-- ==========================================================
-- Product Category Translation Validation
-- ==========================================================

-- Verify record count

SELECT COUNT(*) AS product_category_translation_count
FROM olist.product_category_name_translation;

------------------------------------------------------------

-- View sample records

SELECT *
FROM olist.product_category_name_translation
LIMIT 10;

------------------------------------------------------------

-- Candidate Key Validation

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT product_category_name) AS unique_product_categories
FROM olist.product_category_name_translation;

------------------------------------------------------------

-- Investigate duplicate category names

SELECT
    product_category_name,
    COUNT(*) AS occurrence_count
FROM olist.product_category_name_translation
GROUP BY product_category_name
HAVING COUNT(*) > 1;

------------------------------------------------------------

-- Business Rule Validation
-- Verify that each Portuguese category maps to only one
-- English category.

SELECT
    product_category_name,
    COUNT(DISTINCT product_category_name_english) AS english_name_count
FROM olist.product_category_name_translation
GROUP BY product_category_name
HAVING COUNT(DISTINCT product_category_name_english) > 1;

------------------------------------------------------------

-- Candidate Foreign Key Validation
-- Check whether every product category exists in the
-- translation lookup table.

SELECT
    COUNT(*) AS unmatched_categories
FROM olist.products p
LEFT JOIN olist.product_category_name_translation t
ON p.product_category_name = t.product_category_name
WHERE t.product_category_name IS NULL;

------------------------------------------------------------

-- Investigate unmatched categories

SELECT
    p.product_category_name,
    COUNT(*) AS product_count
FROM olist.products p
LEFT JOIN olist.product_category_name_translation t
ON p.product_category_name = t.product_category_name
WHERE t.product_category_name IS NULL
GROUP BY p.product_category_name
ORDER BY product_count DESC;