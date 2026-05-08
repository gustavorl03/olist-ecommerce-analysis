-- ================================================
-- PROJETO: Análise E-commerce Olist
-- ETAPA: Exploração dos dados
-- AUTOR: Gustavo Lacerda
-- DATA: 2026
-- ================================================

-- ------------------------------------------------
-- 1. VISÃO GERAL DO PERÍODO
-- ------------------------------------------------

-- Período coberto pelo dataset
SELECT 
    MIN(order_purchase_timestamp)::DATE AS primeira_compra,
    MAX(order_purchase_timestamp)::DATE AS ultima_compra,
    COUNT(DISTINCT order_id)            AS total_pedidos,
    COUNT(DISTINCT customer_id)         AS total_clientes
FROM orders;

SELECT COUNT(DISTINCT customer_unique_id) AS clientes_unicos
FROM customers;

-- Clientes únicos reais (usando customer_unique_id)
SELECT COUNT(DISTINCT customer_unique_id) AS clientes_unicos
FROM customers;

-- ------------------------------------------------
-- 2. DISTRIBUIÇÃO DE STATUS DOS PEDIDOS
-- ------------------------------------------------

SELECT 
    order_status,
    COUNT(*)                                    AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) 
          OVER(), 2)                            AS percentual
FROM orders
GROUP BY order_status
ORDER BY total DESC;

-- ------------------------------------------------
-- 3. PEDIDOS POR ANO E MÊS
-- ------------------------------------------------

SELECT 
    EXTRACT(YEAR FROM order_purchase_timestamp)     AS ano,
    EXTRACT(MONTH FROM order_purchase_timestamp)    AS mes,
    COUNT(DISTINCT order_id)                        AS total_pedidos
FROM orders
WHERE order_status = 'delivered'
GROUP BY ano, mes
ORDER BY ano, mes;

-- ------------------------------------------------
-- 4. TICKET MÉDIO GERAL
-- ------------------------------------------------

SELECT 
    ROUND(AVG(payment_value), 2)    AS ticket_medio,
    ROUND(MIN(payment_value), 2)    AS valor_minimo,
    ROUND(MAX(payment_value), 2)    AS valor_maximo,
    ROUND(SUM(payment_value), 2)    AS faturamento_total
FROM order_payments
WHERE payment_type != 'not_defined';

-- ------------------------------------------------
-- 5. FORMAS DE PAGAMENTO
-- ------------------------------------------------

SELECT 
    payment_type,
    COUNT(*)                                        AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) 
          OVER(), 2)                                AS percentual,
    ROUND(AVG(payment_value), 2)                    AS ticket_medio
FROM order_payments
GROUP BY payment_type
ORDER BY total DESC;

-- ------------------------------------------------
-- 6. DISTRIBUIÇÃO DAS AVALIAÇÕES
-- ------------------------------------------------

SELECT 
    review_score,
    COUNT(*)                                        AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) 
          OVER(), 2)                                AS percentual
FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC;

-- ------------------------------------------------
-- 7. TOP 10 ESTADOS POR NÚMERO DE PEDIDOS
-- ------------------------------------------------

SELECT 
    c.customer_state                AS estado,
    COUNT(DISTINCT o.order_id)      AS total_pedidos
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY estado
ORDER BY total_pedidos DESC
LIMIT 10;

-- ------------------------------------------------
-- 8. TOP 10 CATEGORIAS MAIS VENDIDAS
-- ------------------------------------------------

SELECT 
    COALESCE(t.product_category_name_english, 
             p.product_category_name, 
             'Sem categoria')       AS categoria,
    COUNT(oi.order_id)              AS total_vendas,
    ROUND(SUM(oi.price), 2)         AS faturamento_total
FROM order_items oi
JOIN products p      ON oi.product_id = p.product_id
LEFT JOIN product_category_translation t 
                     ON p.product_category_name = t.product_category_name
GROUP BY categoria
ORDER BY total_vendas DESC
LIMIT 10;