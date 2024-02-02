# Projeto de Análise de Vendas do Walmart
## Motivação do Projeto

Este projeto tem como objetivo explorar os dados de vendas do Walmart para entender as tendências de vendas dos produtos.

## Sobre os Dados

O conjunto de dados foi obtido da Competição de Previsão de Vendas do Walmart no Kaggle. Este conjunto de dados contém transações de vendas de três filiais diferentes do Walmart, localizadas respectivamente em Mandalay, Yangon e Naypyitaw. Os dados contêm 17 colunas e 1000 linhas.
| Variável                | Descrição                            | Tipo de Dado   |
| :---------------------- | :-------------------------------------- | :------------- |
| invoice_id              | Número da fatura das vendas realizadas            | VARCHAR(30)    |
| branch                  | Filial onde as vendas foram realizadas        | VARCHAR(5)     |
| city                    | Localização da filial              | VARCHAR(30)    |
| customer_type           | Tipo de cliente                | VARCHAR(30)    |
| gender                  | 	Gênero do cliente que fez a compra  | VARCHAR(10)    |
| product_line            | 	Linha de produto do produto vendido       | VARCHAR(100)   |
| unit_price              | O preço de cada produto               | DECIMAL(10, 2) |
| quantity                | A quantidade do produto vendido          | INT            |
| VAT                 | O valor do imposto sobre a compra       | FLOAT(6, 4)    |
| total                   | 	O custo total da compra          | DECIMAL(10, 2) |
| date                    | A data em que a compra foi feita | DATE           |
| time                    | A hora em que a compra foi feita | TIMESTAMP      |
| payment_method                 | O método de pagamento utilizado                  | DECIMAL(10, 2) |
| cogs                    | Custo dos produtos vendidos                      | DECIMAL(10, 2) |
| gross_margin_percentage | Porcentagem de margem bruta                 | FLOAT(11, 9)   |
| gross_income            | Renda bruta                            | DECIMAL(10, 2) |
| rating                  | 	Avaliação                                 | FLOAT(2, 1)    |

## Novas Variáveis

Foram criadas 5 novas colunas: Ano, mês, dia, hora e minuto. O intuito de separar a data em novas colunas foi facilitar a descoberta do mês em que há maior número de compras.

## Questões Respondidas

1. Em que mês houve mais compras?
2. Qual a quantidade comprada, em média, por linha de produto?
3. Qual a linha de produtos que, em média, tem maiores gastos?
4. Quais as linhas de produtos que cada gênero tem mais interesse?
5. Foi feito um histórico do total de vendas por dia.
