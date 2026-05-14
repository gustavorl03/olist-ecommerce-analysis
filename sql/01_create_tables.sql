-- ================================================
-- PROJETO: Análise E-commerce Olist
-- ETAPA: Criação das tabelas
-- AUTOR: Gustavo Lacerda
-- DATA: 2026
-- ================================================

-- Tabela de clientes
CREATE TABLE customers (
    customer_id             VARCHAR(50) PRIMARY KEY,
    customer_unique_id      VARCHAR(50),
    customer_zip_code_prefix VARCHAR(10),
    customer_city           VARCHAR(100),
    customer_state          CHAR(2)
);

-- Tabela de pedidos
CREATE TABLE orders (
    order_id                        VARCHAR(50) PRIMARY KEY,
    customer_id                     VARCHAR(50) REFERENCES customers(customer_id),
    order_status                    VARCHAR(20),
    order_purchase_timestamp        TIMESTAMP,
    order_approved_at               TIMESTAMP,
    order_delivered_carrier_date    TIMESTAMP,
    order_delivered_customer_date   TIMESTAMP,
    order_estimated_delivery_date   TIMESTAMP
);

-- Tabela de itens do pedido
CREATE TABLE order_items (
    order_id                VARCHAR(50) REFERENCES orders(order_id),
    order_item_id           INTEGER,
    product_id              VARCHAR(50),
    seller_id               VARCHAR(50),
    shipping_limit_date     TIMESTAMP,
    price                   NUMERIC(10,2),
    freight_value           NUMERIC(10,2),
    PRIMARY KEY (order_id, order_item_id)
);

-- Tabela de pagamentos
CREATE TABLE order_payments (
    order_id                VARCHAR(50) REFERENCES orders(order_id),
    payment_sequential      INTEGER,
    payment_type            VARCHAR(20),
    payment_installments    INTEGER,
    payment_value           NUMERIC(10,2),
    PRIMARY KEY (order_id, payment_sequential)
);

-- Tabela de avaliações
CREATE TABLE order_reviews (
    review_id               VARCHAR(50),
    order_id                VARCHAR(50) REFERENCES orders(order_id),
    review_score            INTEGER,
    review_comment_title    TEXT,
    review_comment_message  TEXT,
    review_creation_date    TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    PRIMARY KEY (review_id, order_id)
);

-- Tabela de produtos
CREATE TABLE products (
    product_id                    VARCHAR(50) PRIMARY KEY,
    product_category_name         VARCHAR(100),
    product_name_lenght           INTEGER,
    product_description_lenght    INTEGER,
    product_photos_qty            INTEGER,
    product_weight_g              INTEGER,
    product_length_cm             INTEGER,
    product_height_cm             INTEGER,
    product_width_cm              INTEGER
);

-- Tabela de vendedores
CREATE TABLE sellers (
    seller_id               VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix  VARCHAR(10),
    seller_city             VARCHAR(100),
    seller_state            CHAR(2)
);

-- Tabela de geolocalização
CREATE TABLE geolocation (
    geolocation_zip_code_prefix VARCHAR(10),
    geolocation_lat             NUMERIC(18,15),
    geolocation_lng             NUMERIC(18,15),
    geolocation_city            VARCHAR(100),
    geolocation_state           CHAR(2)
);

-- Tabela de tradução de categorias
CREATE TABLE product_category_translation (
    product_category_name           VARCHAR(100) PRIMARY KEY,
    product_category_name_english   VARCHAR(100)
);