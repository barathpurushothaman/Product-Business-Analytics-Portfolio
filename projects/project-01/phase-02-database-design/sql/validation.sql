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