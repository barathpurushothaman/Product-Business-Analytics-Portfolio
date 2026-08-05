-- =====================================================
-- Phase 02 - Database Constraints
-- Project: Olist E-Commerce Business Analysis
-- =====================================================

-- =====================================================
-- Customers
-- =====================================================

ALTER TABLE olist.customers
ADD CONSTRAINT pk_customers
PRIMARY KEY (customer_id);


-- =====================================================
-- Orders
-- =====================================================

ALTER TABLE olist.orders
ADD CONSTRAINT pk_orders
PRIMARY KEY (order_id);

ALTER TABLE olist.orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES olist.customers(customer_id);


-- =====================================================
-- Order Items
-- =====================================================

ALTER TABLE olist.order_items
ADD CONSTRAINT pk_order_items
PRIMARY KEY (order_id, order_item_id);

ALTER TABLE olist.order_items
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id)
REFERENCES olist.orders(order_id);

-- =====================================================
-- Products
-- =====================================================

ALTER TABLE olist.products
ADD CONSTRAINT pk_products
PRIMARY KEY (product_id);

ALTER TABLE olist.order_items
ADD CONSTRAINT fk_order_items_products
FOREIGN KEY (product_id)
REFERENCES olist.products(product_id);

-- =====================================================
-- Sellers
-- =====================================================

ALTER TABLE olist.sellers
ADD CONSTRAINT pk_sellers
PRIMARY KEY (seller_id);

ALTER TABLE olist.order_items
ADD CONSTRAINT fk_order_items_sellers
FOREIGN KEY (seller_id)
REFERENCES olist.sellers(seller_id);

-- =====================================================
-- Payments
-- =====================================================

ALTER TABLE olist.payments
ADD CONSTRAINT pk_payments
PRIMARY KEY (order_id, payment_sequential);

ALTER TABLE olist.payments
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id)
REFERENCES olist.orders(order_id);

-- ===========================================================
-- Reviews
-- ===========================================================

-- Composite Primary Key

ALTER TABLE olist.reviews
ADD CONSTRAINT pk_reviews
PRIMARY KEY (review_id, order_id);

-- Foreign Key

ALTER TABLE olist.reviews
ADD CONSTRAINT fk_reviews_orders
FOREIGN KEY (order_id)
REFERENCES olist.orders(order_id);