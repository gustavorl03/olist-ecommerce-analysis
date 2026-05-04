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