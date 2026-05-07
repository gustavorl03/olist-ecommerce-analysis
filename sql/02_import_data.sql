-- ================================================
-- PROJETO: Análise E-commerce Olist
-- ETAPA: Importação dos dados
-- AUTOR: Gustavo Lacerda
-- DATA: 2026
-- OBSERVAÇÃO: Usar o comando \copy via psql (SQL Shell)
--             pois o COPY padrão não tem permissão 
--             para acessar arquivos locais no Windows
-- ================================================

-- 1. Customers
\copy customers FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- 2. Product Category Translation
\copy product_category_translation FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/product_category_name_translation.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- 3. Products
\copy products FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/olist_products_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- 4. Sellers
\copy sellers FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- 5. Geolocation
\copy geolocation FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- 6. Orders
\copy orders FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- 7. Order Items
\copy order_items FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- 8. Order Payments
\copy order_payments FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- 9. Order Reviews
\copy order_reviews FROM 'C:/Users/rapha/OneDrive/Documents/olist-ecommerce-analysis/data/raw/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';

-- ================================================
-- VERIFICAÇÃO: Contagem de linhas por tabela
-- ================================================
SELECT 'customers'                    AS tabela, COUNT(*) AS total_linhas FROM customers
UNION ALL
SELECT 'orders',                               COUNT(*) FROM orders
UNION ALL
SELECT 'order_items',                          COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments',                       COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews',                        COUNT(*) FROM order_reviews
UNION ALL
SELECT 'products',                             COUNT(*) FROM products
UNION ALL
SELECT 'sellers',                              COUNT(*) FROM sellers
UNION ALL
SELECT 'geolocation',                          COUNT(*) FROM geolocation
UNION ALL
SELECT 'product_category_translation',         COUNT(*) FROM product_category_translation
ORDER BY tabela;