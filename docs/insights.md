# 📋 Insights e Observações da Análise

## Tabela: olist_orders

### Volume
- Total de pedidos: 99.441
- Período: 2016 a 2018

### Qualidade dos Dados
| Coluna | Nulos | Justificativa |
|---|---|---|
| order_approved_at | 160 | Pedidos cancelados antes da aprovação |
| order_delivered_carrier_date | 1.783 | Pedidos não despachados |
| order_estimated_delivery_date | 0 | Sem nulos |
| order_delivered_customer_date | 2.965 | Pedidos não entregues |

### Distribuição de Status
| Status | Quantidade |
|---|---|
| Delivered | 96.478 |
| Shipped | 1.105 |
| Canceled | 625 |
| Unavailable | 604 |
| Invoiced | 314 |
| Processing | 299 |
| Created | 5 |
| Approved | 2 |

### Conclusão
Os nulos encontrados são justificados pelo status dos pedidos.
97% dos pedidos estão com status delivered — dataset confiável.

## Tabela: orders (Power Query)

### Transformações aplicadas
- Tabela renomeada de olist_orders_dataset para orders
- Tipos de dados verificados e confirmados
- Coluna delivery_days criada (dias entre compra e entrega)
- Coluna delivery_delay_days criada (diferença entre entrega real e estimada)

### Observações
- Tempo máximo de entrega: 81 dias (possível anomalia — investigar no SQL)
- Maior atraso: +49 dias após o prazo estimado
- Maior adiantamento: -51 dias antes do prazo
- Hipótese: Olist adota estratégia de underpromise/overdeliver nos prazos


## Tabela: olist_order_items

### Volume
- Total de itens: 112.651
- Total de pedidos únicos: 99.441
- Média de itens por pedido: 1,13
- Pedido com mais itens: 21 itens

### Qualidade dos Dados
| Coluna | Observação |
|---|---|
| price | Veio como texto — convertido via substituição de ponto por vírgula |
| freight_value | Veio como texto — convertido via substituição de ponto por vírgula |
| freight_value | 383 valores zerados — possível frete grátis, investigar no SQL |

### Métricas Iniciais
| Métrica | Valor |
|---|---|
| Preço médio dos produtos | R$ 120,65 |
| Frete médio | R$ 19,99 |

## Tabela: order_items (Power Query)

### Transformações aplicadas
- Tabela renomeada de olist_order_items_dataset para order_items
- Tipos de dados verificados e corrigidos
- Coluna total_value criada (price + freight_value)

### Observações
- Preço máximo: R$ 182.000,00 — possível produto de luxo ou erro, investigar no SQL
- Preço mínimo: R$ 3,49
- Média de preço: R$ 11.384,00 (puxada pelos valores extremos)
- Desvio padrão alto (R$ 14.604) indica grande dispersão nos preços

## Tabela: order_reviews (Power Query)

### Transformações aplicadas
- Tabela renomeada de olist_order_reviews_dataset para order_reviews
- Tipos de dados verificados e corrigidos
- Texto das colunas review_comment_title e review_comment_message 
  padronizado para minúsculas
- Coluna review_category criada (Positiva, Neutra, Negativa)

### Observações
- 88,5% dos clientes não preencheram o título da avaliação
- 56,4% dos clientes não deixaram mensagem
- Vazios são esperados — comentário é campo opcional
- Títulos tinham inconsistência de capitalização — corrigido

## Tabela: order_payments (Power Query)

### Transformações aplicadas
- Tabela renomeada de olist_order_payments_dataset para order_payments
- Tipos de dados verificados e corrigidos
- Coluna installment_category criada (À Vista, Curto Prazo, Médio Prazo, Longo Prazo)

### Observações
- Tabela sem valores vazios — excelente qualidade de dados
- 73% dos pagamentos são via cartão de crédito
- 18% via boleto bancário
- Máximo de 13 parcelas — comportamento típico do e-commerce brasileiro
- Insight: cliente brasileiro compra pelo parcelamento, não pelo preço à vista

## Tabela: products (Power Query)

### Transformações aplicadas
- Tabela renomeada de olist_products_dataset para products
- Tipos de dados verificados e corrigidos
- Mesclada com product_category_name_translation para traduzir categorias
- Coluna product_category_name substituída por product_category_name_english
- 59 categorias distintas de produtos

### Observações
- Sem valores vazios na coluna de categoria
- Peso máximo: 30kg — produtos pesados como móveis e equipamentos
- Peso mínimo: 50g — produtos leves como acessórios e bijuterias

## Tabela: sellers (Power Query)

### Transformações aplicadas
- Tabela renomeada de olist_sellers_dataset para sellers
- Tipos de dados verificados e corrigidos
- seller_zip_code_prefix mantido como Texto

### Observações
- 19 estados com vendedores cadastrados
- São Paulo concentra 60% dos vendedores
- 318 cidades distintas, sem valores vazios
- Insight: concentração em SP pode impactar tempo de entrega 
  para regiões Norte e Nordeste