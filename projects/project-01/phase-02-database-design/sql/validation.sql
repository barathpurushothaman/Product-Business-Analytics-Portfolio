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