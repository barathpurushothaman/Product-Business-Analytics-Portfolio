-- =====================================================
-- Phase 02 - Database Constraints
-- Project: Olist E-Commerce Business Analysis
-- =====================================================

-- =====================================================
-- Primary Keys
-- =====================================================

-- Customers
ALTER TABLE olist.customers
ADD CONSTRAINT pk_customers
PRIMARY KEY (customer_id);

-- Orders
ALTER TABLE olist.orders
ADD CONSTRAINT pk_orders
PRIMARY KEY (order_id);

-- =====================================================
-- Foreign Keys
-- =====================================================

-- Orders → Customers
ALTER TABLE olist.orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES olist.customers(customer_id);