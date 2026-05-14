## Perguntas de Negócio!!

## P1 — Faturamento por Estado

| Estado | Pedidos | Faturamento | Ticket Médio |
|---|---|---|---|
| SP | 40.501 | R$ 5.769.703,15 | R$ 124,22 |
| RJ | 12.350 | R$ 2.055.401,57 | R$ 145,33 |
| MG | 11.354 | R$ 1.818.891,67 | R$ 140,82 |
| RS | 5.345 | R$ 861.472,79 | R$ 140,44 |
| PR | 4.923 | R$ 781.708,80 | R$ 138,38 |
| ... | ... | ... | ... |
| PB | 517 | R$ 137.838,55 | R$ 235,22 (maior ticket) |

### Conclusões
- SP representa 44,5% do faturamento total
- Nordeste e Norte têm os maiores tickets médios
- Regiões com menos acesso ao e-commerce compram 
  itens de maior valor quando compram
- Oportunidade clara de expansão para Norte e Nordeste

## P2 — Taxa de Entrega no Prazo

| Métrica | Valor |
|---|---|
| Total entregues | 96.470 |
| Entregues no prazo | 88.644 |
| Taxa no prazo | 91,89% |
| Média dias entrega | 12,56 dias |

### Conclusões
- 91,89% de entregas no prazo — acima da média do setor (80-85%)
- Média de 12,56 dias de entrega considerando todo o Brasil
- 8,11% de atrasos (~7.826 pedidos) — investigar impacto nas avaliações
- Confirma hipótese de estratégia underpromise/overdeliver da Olist

## P3 — Avaliação x Tempo de Entrega

| Nota | Total Pedidos | Média Dias Entrega | Média Dias Atraso |
|---|---|---|---|
| 5 | 57.059 | 10,69 dias | -12,69 dias |
| 4 | 18.987 | 12,31 dias | -11,68 dias |
| 3 | 7.961 | 14,26 dias | -10,08 dias |
| 2 | 2.941 | 16,66 dias | -7,94 dias |
| 1 | 9.405 | 21,31 dias | -3,36 dias |

### Conclusões
- Relação direta e clara: quanto mais rápida a entrega, maior a nota
- Nota 5: média de 10,69 dias | Nota 1: média de 21,31 dias
- Diferença de quase o dobro entre melhor e pior avaliação
- Todas as notas têm atraso negativo — todos chegaram antes do prazo
- Cliente não avalia só se chegou no prazo — avalia se chegou rápido
- Insight chave: velocidade de entrega é o principal driver de satisfação

## P4 — Top Vendedores

| Estado | Pedidos | Faturamento | Avaliação | Média Dias Entrega |
|---|---|---|---|---|
| SP | 1.116 | R$ 225.586,34 | 4,14 | 14,93 |
| BA | 346 | R$ 215.904,44 | 4,13 | 13,30 |
| SP | 1.753 | R$ 197.225,32 | 3,83 | 14,41 |
| SP | 574 | R$ 189.649,54 | 4,37 | 13,26 |
| SP | 967 | R$ 186.664,01 | 3,35 | 22,40 |

### Conclusões
- 13 dos 15 maiores vendedores são de SP
- Alerta: 5º maior vendedor tem avaliação 3,35 e 22,40 dias de entrega
- Vendedor da BA tem ticket médio de R$ 624 — produtos de alto valor
- Melhor equilíbrio: avaliação 4,36 com 11,24 dias de entrega
- Volume alto não garante qualidade — tempo de entrega impacta avaliação

## P5 — Categorias com Maior Adiantamento na Entrega

| Categoria | Pedidos | Média Dias Atraso | Avaliação |
|---|---|---|---|
| fashion_shoes | 231 | -14,14 dias | 4,29 |
| fixed_telephony | 209 | -14,02 dias | 3,76 |
| market_place | 272 | -13,96 dias | 4,07 |
| air_conditioning | 242 | -13,57 dias | 4,05 |
| small_appliances | 604 | -13,20 dias | 4,23 |
| fashion_bags_accessories | 1.811 | -12,66 dias | 4,19 |
| luggage_accessories | 1.015 | -11,95 dias | 4,35 |
| pet_shop | 1.680 | -11,86 dias | 4,22 |

### Conclusões
- Todas as categorias chegam antes do prazo — underpromise/overdeliver confirmado
- fashion_shoes chega 14 dias antes do prazo com avaliação 4,29
- fixed_telephony tem avaliação baixa (3,76) mesmo chegando cedo
- Problema em algumas categorias não é logística — é qualidade do produto

## P5b — Categorias com Menor Adiantamento na Entrega

| Categoria | Pedidos | Média Dias Atraso | Avaliação |
|---|---|---|---|
| home_confort | 390 | -9,16 dias | 3,85 |
| food | 437 | -9,18 dias | 4,26 |
| audio | 345 | -9,41 dias | 3,83 |
| electronics | 2.498 | -10,45 dias | 4,07 |
| telephony | 4.069 | -10,70 dias | 4,00 |
| auto | 3.791 | -10,75 dias | 4,12 |
| musical_instruments | 605 | -10,78 dias | 4,22 |

### Conclusões
- Nenhuma categoria tem atraso médio positivo — underpromise/overdeliver
  é consistente em todas as categorias
- home_confort e audio têm avaliações baixas apesar de chegarem antes
  do prazo — problema é qualidade do produto, não logística
- 1.382 pedidos sem categoria cadastrada — oportunidade de melhoria
  nos dados da plataforma

  ## P6 — Perfil de Parcelamento por Categoria

| Categoria | Média Parcelas | Ticket Médio | Total Pedidos |
|---|---|---|---|
| computers | 7,31x | R$ 1.325,17 | 148 |
| home_appliances_2 | 5,43x | R$ 581,25 | 176 |
| office_furniture | 5,22x | R$ 391,92 | 883 |
| home_confort | 5,12x | R$ 189,34 | 315 |
| furniture_living_room | 5,00x | R$ 275,45 | 325 |
| musical_instruments | 4,50x | R$ 354,36 | 451 |
| watches_gifts | 4,40x | R$ 238,54 | 4.463 |
| bed_bath_table | 4,37x | R$ 155,27 | 7.418 |

### Conclusões
- computers lidera com 7,31 parcelas e ticket de R$ 1.325
- bed_bath_table parcela 4,37x mesmo com ticket baixo (R$ 155)
- Brasileiro parcela até compras menores — comportamento cultural
- Parcelamento não é exclusivo de produtos caros no e-commerce BR
- watches_gifts: grande volume (4.463 pedidos) com 4,40 parcelas médias