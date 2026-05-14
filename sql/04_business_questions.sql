-- ================================================
-- PROJETO: Análise E-commerce Olist
-- ETAPA: Perguntas de Negócio
-- AUTOR: Gustavo Lacerda
-- DATA: 2026
-- ================================================

-- ------------------------------------------------
-- P1: Qual o faturamento total por estado?
-- ------------------------------------------------

SELECT 
    c.customer_state                        AS estado,
    COUNT(DISTINCT o.order_id)              AS total_pedidos,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS faturamento_total,
    ROUND(AVG(oi.price + oi.freight_value), 2) AS ticket_medio
FROM orders o
JOIN customers c     ON o.customer_id = c.customer_id
JOIN order_items oi  ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY estado
ORDER BY faturamento_total DESC;

-- ------------------------------------------------
-- P2: Qual a taxa de pedidos entregues no prazo?
-- ------------------------------------------------

SELECT
    COUNT(*)                                            AS total_entregues,
    SUM(CASE WHEN order_delivered_customer_date 
             <= order_estimated_delivery_date 
             THEN 1 ELSE 0 END)                         AS entregues_no_prazo,
    ROUND(SUM(CASE WHEN order_delivered_customer_date 
                   <= order_estimated_delivery_date 
                   THEN 1 ELSE 0 END) * 100.0 
          / COUNT(*), 2)                                AS taxa_no_prazo,
    ROUND(AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - 
              order_purchase_timestamp)) / 86400), 2)   AS media_dias_entrega
FROM orders
WHERE order_status = 'delivered'
AND order_delivered_customer_date IS NOT NULL;

-- ------------------------------------------------
-- P3: Como a avaliação se relaciona com o 
--     tempo de entrega?
-- ------------------------------------------------

SELECT
    r.review_score                                          AS nota,
    COUNT(*)                                                AS total_pedidos,
    ROUND(AVG(EXTRACT(EPOCH FROM (o.order_delivered_customer_date -
              o.order_purchase_timestamp)) / 86400), 2)     AS media_dias_entrega,
    ROUND(AVG(EXTRACT(EPOCH FROM (o.order_delivered_customer_date -
              o.order_estimated_delivery_date)) / 86400), 2) AS media_dias_atraso
FROM orders o
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY nota
ORDER BY nota DESC;

-- ------------------------------------------------
-- P4: Quais vendedores têm melhor desempenho?
-- ------------------------------------------------

SELECT
    s.seller_id,
    s.seller_state                          AS estado,
    COUNT(DISTINCT oi.order_id)             AS total_pedidos,
    ROUND(SUM(oi.price), 2)                 AS faturamento_total,
    ROUND(AVG(r.review_score), 2)           AS media_avaliacao,
    ROUND(AVG(EXTRACT(EPOCH FROM (o.order_delivered_customer_date -
              o.order_purchase_timestamp)) / 86400), 2) AS media_dias_entrega
FROM order_items oi
JOIN orders o        ON oi.order_id = o.order_id
JOIN sellers s       ON oi.seller_id = s.seller_id
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY s.seller_id, s.seller_state
HAVING COUNT(DISTINCT oi.order_id) >= 50
ORDER BY faturamento_total DESC
LIMIT 15;

-- ------------------------------------------------
-- P5: Quais categorias têm maior atraso 
--     na entrega?
-- ------------------------------------------------

SELECT
    COALESCE(t.product_category_name_english,
             p.product_category_name,
             'Sem categoria')                           AS categoria,
    COUNT(DISTINCT o.order_id)                          AS total_pedidos,
    ROUND(AVG(EXTRACT(EPOCH FROM (o.order_delivered_customer_date -
              o.order_estimated_delivery_date)) / 86400), 2) AS media_dias_atraso,
    ROUND(AVG(r.review_score), 2)                       AS media_avaliacao
FROM orders o
JOIN order_items oi  ON o.order_id = oi.order_id
JOIN products p      ON oi.product_id = p.product_id
LEFT JOIN product_category_translation t 
                     ON p.product_category_name = t.product_category_name
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY categoria
HAVING COUNT(DISTINCT o.order_id) >= 100
ORDER BY media_dias_atraso ASC
LIMIT 15;

-- ------------------------------------------------
-- P5b: Quais categorias têm maior atraso REAL
--      na entrega?
-- ------------------------------------------------

SELECT
    COALESCE(t.product_category_name_english,
             p.product_category_name,
             'Sem categoria')                           AS categoria,
    COUNT(DISTINCT o.order_id)                          AS total_pedidos,
    ROUND(AVG(EXTRACT(EPOCH FROM (o.order_delivered_customer_date -
              o.order_estimated_delivery_date)) / 86400), 2) AS media_dias_atraso,
    ROUND(AVG(r.review_score), 2)                       AS media_avaliacao
FROM orders o
JOIN order_items oi  ON o.order_id = oi.order_id
JOIN products p      ON oi.product_id = p.product_id
LEFT JOIN product_category_translation t 
                     ON p.product_category_name = t.product_category_name
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY categoria
HAVING COUNT(DISTINCT o.order_id) >= 100
ORDER BY media_dias_atraso DESC
LIMIT 15;

-- ------------------------------------------------
-- P6: Qual o perfil de parcelamento por 
--     categoria?
-- ------------------------------------------------

SELECT
    COALESCE(t.product_category_name_english,
             p.product_category_name,
             'Sem categoria')                   AS categoria,
    ROUND(AVG(op.payment_installments), 2)      AS media_parcelas,
    ROUND(AVG(op.payment_value), 2)             AS ticket_medio,
    COUNT(DISTINCT o.order_id)                  AS total_pedidos
FROM orders o
JOIN order_items oi      ON o.order_id = oi.order_id
JOIN products p          ON oi.product_id = p.product_id
LEFT JOIN product_category_translation t 
                         ON p.product_category_name = t.product_category_name
JOIN order_payments op   ON o.order_id = op.order_id
WHERE op.payment_type = 'credit_card'
AND o.order_status = 'delivered'
GROUP BY categoria
HAVING COUNT(DISTINCT o.order_id) >= 100
ORDER BY media_parcelas DESC
LIMIT 15;