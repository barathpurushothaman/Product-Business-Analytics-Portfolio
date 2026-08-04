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