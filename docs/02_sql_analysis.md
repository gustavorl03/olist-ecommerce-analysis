# 📊 Análise SQL — E-commerce Olist

## 1. Visão Geral do Período

| Métrica | Valor |
|---|---|
| Período | 04/09/2016 a 17/10/2018 |
| Total de pedidos | 99.441 |
| Clientes únicos | 96.096 |
| Taxa de recompra | ~3,4% |

### Conclusão
O customer_id é único por pedido — o ID real do cliente
é o customer_unique_id. A baixa taxa de recompra (3,4%) 
é característica do e-commerce brasileiro em 2016-2018,
ainda em fase de aquisição de novos clientes.

--------------------------------------------------------

## 2. Distribuição de Status dos Pedidos

| Status | Total | Percentual |
|---|---|---|
| delivered | 96.478 | 97,02% |
| shipped | 1.107 | 1,11% |
| canceled | 625 | 0,63% |
| unavailable | 609 | 0,61% |
| invoiced | 314 | 0,32% |
| processing | 301 | 0,30% |
| created | 5 | 0,01% |
| approved | 2 | 0,00% |

### Conclusão
Taxa de entrega de 97% indica operação logística eficiente.
Taxa de cancelamento de 0,63% está muito abaixo da média
do e-commerce brasileiro (5-10%).

--------------------------------------------------------

## 3. Pedidos por Ano e Mês

| Ano | Mês | Total Pedidos |
|---|---|---|
| 2016 | Set-Dez | Início das operações — volume insignificante |
| 2017 | Jan | 750 |
| 2017 | Nov | 7.289 (pico máximo — Black Friday) |
| 2018 | Jan | 7.069 |
| 2018 | Ago | 6.351 (último mês do dataset) |

### Conclusão
- Crescimento explosivo em 2017: 872% de janeiro a novembro
- Pico em novembro/2017 confirmado pelo efeito Black Friday
- 2018 mostra estabilização em ~6.500 pedidos/mês
- Indica maturidade operacional da Olist em 2018

--------------------------------------------------------

## 4. Ticket Médio Geral

| Métrica | Valor |
|---|---|
| Ticket médio | R$ 154,10 |
| Valor mínimo | R$ 0,00 |
| Valor máximo | R$ 13.664,08 |
| Faturamento total | R$ 16.008.872,12 |

### Conclusão
- Ticket médio de R$ 154,10 acima da média do e-commerce 
  brasileiro da época (R$ 100-120)
- Faturamento total de ~R$ 16 milhões em 2 anos
- Valores zerados merecem investigação — possível uso de vouchers

--------------------------------------------------------

## 5. Formas de Pagamento

| Forma | Total | Percentual | Ticket Médio |
|---|---|---|---|
| Cartão de crédito | 76.795 | 73,92% | R$ 163,32 |
| Boleto | 19.784 | 19,04% | R$ 145,03 |
| Voucher | 5.775 | 5,56% | R$ 65,70 |
| Cartão de débito | 1.529 | 1,47% | R$ 142,57 |
| Not defined | 3 | 0,00% | R$ 0,00 |

### Conclusão
- Cartão de crédito domina com 73,92% e maior ticket médio
- Boleto ainda relevante em 2016-2018 — contexto pré-PIX
- Voucher tem ticket médio 60% menor que cartão
- Parcelamento incentiva compras de maior valor

--------------------------------------------------------

## 6. Distribuição das Avaliações

| Nota | Total | Percentual |
|---|---|---|
| 5 | 57.328 | 57,78% |
| 4 | 19.142 | 19,29% |
| 3 | 8.179 | 8,24% |
| 2 | 3.151 | 3,18% |
| 1 | 11.424 | 11,51% |

### Conclusão
- 77,07% de avaliações positivas (notas 4 e 5)
- Distribuição bimodal — nota 1 supera notas 2 e 3
- Clientes muito insatisfeitos avaliam com nota 1 diretamente
- 11,51% de nota 1 será investigado nas perguntas de negócio
  cruzando com tempo de entrega

--------------------------------------------------------

  ## 7. Top 10 Estados por Número de Pedidos

| Estado | Total Pedidos | Percentual |
|---|---|---|
| SP | 41.746 | 42,0% |
| RJ | 12.852 | 12,9% |
| MG | 11.635 | 11,7% |
| RS | 5.466 | 5,5% |
| PR | 5.045 | 5,1% |
| SC | 3.637 | 3,7% |
| BA | 3.380 | 3,4% |
| DF | 2.140 | 2,2% |
| ES | 2.033 | 2,0% |
| GO | 2.020 | 2,0% |

### Conclusão
- SP representa 42% dos pedidos — domínio absoluto
- Sudeste concentra 66,6% do volume total
- Nordeste sub-representado — apenas BA no top 10
- Sul surpreende com 14,3% combinado (RS+PR+SC)
- Oportunidade de expansão clara para Norte e Nordeste

--------------------------------------------------------

## 8. Top 10 Categorias Mais Vendidas

| Categoria | Total Vendas | Faturamento Total |
|---|---|---|
| bed_bath_table | 11.115 | R$ 1.036.988,68 |
| health_beauty | 9.670 | R$ 1.258.681,34 |
| sports_leisure | 8.641 | R$ 988.048,97 |
| furniture_decor | 8.334 | R$ 729.762,49 |
| computers_accessories | 7.827 | R$ 911.954,32 |
| housewares | 6.964 | R$ 632.248,66 |
| watches_gifts | 5.991 | R$ 1.205.005,68 |
| telephony | 4.545 | R$ 323.667,53 |
| garden_tools | 4.347 | R$ 485.256,46 |
| auto | 4.235 | R$ 592.720,11 |

### Conclusão
- bed_bath_table lidera em volume mas não em faturamento
- health_beauty é a categoria mais lucrativa
- watches_gifts tem o maior ticket médio (R$ 201,14)
- Categorias de casa e beleza dominam o e-commerce da Olist