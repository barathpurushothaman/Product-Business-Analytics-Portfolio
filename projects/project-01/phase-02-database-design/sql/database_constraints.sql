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

-- ====================================================
-- Geolocation
-- ====================================================

-- No constraints implemented.

-- Reason:
-- Candidate key validation confirmed that the imported
-- dataset contains duplicate business records.
--
-- The source data has been preserved exactly as provided.
--
-- Constraints will be introduced only after data
-- cleansing in the analytical layer.

-- ==========================================================
-- Product Category Translation
-- ==========================================================

ALTER TABLE olist.product_category_name_translation
ADD CONSTRAINT pk_product_category_name
PRIMARY KEY (product_category_name);

-- ==========================================================
-- Foreign Key
-- ==========================================================

-- Candidate foreign key validation identified source data
-- inconsistencies between the products table and the
-- product_category_name_translation lookup table.

-- Missing categories:
--     pc_gamer
--     portateis_cozinha_e_preparadores_de_alimentos

-- Therefore the following foreign key was intentionally
-- NOT implemented.

-- ALTER TABLE olist.products
-- ADD CONSTRAINT fk_products_category
-- FOREIGN KEY (product_category_name)
-- REFERENCES olist.product_category_name_translation(product_category_name);