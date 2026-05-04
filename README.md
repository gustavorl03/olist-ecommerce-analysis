# 📦 Análise de Desempenho Comercial — E-commerce Brasileiro

![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow)
![Tools](https://img.shields.io/badge/Tools-Excel%20%7C%20PostgreSQL%20%7C%20Power%20BI-blue)

## 📌 Sobre o Projeto

Análise completa do desempenho comercial de um e-commerce brasileiro,
utilizando dados reais da plataforma Olist. O objetivo é extrair insights
de negócio sobre vendas, logística, satisfação de clientes e desempenho
de vendedores.

Este projeto simula o fluxo de trabalho real de um analista de dados,
passando por limpeza de dados, modelagem, análise exploratória e
visualização executiva.

## 🎯 Perguntas de Negócio

- Quais estados geram maior faturamento?
- Quais categorias de produtos vendem mais?
- Qual a taxa de pedidos entregues no prazo?
- Como a avaliação dos clientes se relaciona com o tempo de entrega?
- Quais são os melhores e piores vendedores?

## 🛠️ Ferramentas Utilizadas

| Ferramenta | Finalidade |
|---|---|
| Excel + Power Query | Limpeza e exploração inicial dos dados |
| PostgreSQL | Modelagem e análise via SQL |
| Power BI | Dashboard executivo interativo |
| Git + GitHub | Versionamento e documentação |

## 📁 Estrutura do Projeto

    olist-ecommerce-analysis/
    ├── data/
    │   ├── raw/          # Dados originais (não versionados)
    │   └── processed/    # Dados tratados
    ├── sql/
    │   ├── 01_create_tables.sql
    │   ├── 02_exploration.sql
    │   └── 03_business_questions.sql
    ├── excel/
    │   └── olist_analysis.xlsx
    ├── powerbi/
    │   └── dashboard.pbix
    ├── docs/
    │   └── insights.md
    └── README.md

## 📊 Dataset

- **Fonte:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Licença:** CC BY-NC-SA 4.0
- **Volume:** ~100k pedidos | 9 tabelas | período 2016–2018

## 📈 Resultado Final

> Dashboard e insights serão adicionados ao fim do projeto.

## 👤 Autor

Feito por Gustavo Lacerda — [LinkedIn](www.linkedin.com/in/gustavo-rlacerda) | [GitHub](https://github.com/gustavorl03)