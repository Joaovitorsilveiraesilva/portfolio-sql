









Select *
From Portifoliosql..vendas_walmart
Order by Date, Time


--------------Criando novas colunas--------------
--Vamos criar 3 novas colunas separando a data para saber se há algum dia em especial que as pessoas compram mais, por estar perto da data de
--recebimento ou mês, por exemplo, no natal

ALTER TABLE Portifoliosql..vendas_walmart
ADD ano INT,
    mes INT,
    dia INT;

UPDATE Portifoliosql..vendas_walmart
SET 
    ano = YEAR(Date),
    mes = MONTH(Date),
    dia = DAY(Date);

--Também vamos criar duas novas colunas separando o horário da compra em hora e minuto. Pode existir um horário onde há maior fluxo de comprar, essa
--informação pode servir para aumentar a quantidade de propaganda naquele horário

ALTER TABLE Portifoliosql..vendas_walmart
ADD hora INT,
    minuto INT;

UPDATE Portifoliosql..vendas_walmart
Set hora = DATEPART(HOUR, Time),
    minuto = DATEPART(MINUTE, Time);

--Podemos agora saber a porcentagem de compras total por mês, para saber se há algum mês especifico que há um maior fluxo de compra

SELECT
    mes,
    SUM(Total) AS total_mes,
    (SUM(Total) * 100.0) / (
        SELECT SUM(Total)
        FROM Portifoliosql..vendas_walmart
        WHERE ano = 2019
    ) AS porcentagem_total_2019
FROM Portifoliosql..vendas_walmart
WHERE ano = 2019
GROUP BY mes;

--A tabela apresentada mostra uma maior quantidade de compra em janeiro 36% em relação a fevereiro 30% e março 33%

--Agora podemos querer saber a média de quantidade comprada por linha de produto, vamos descobrir!

SELECT
    [Product Line],
    AVG(Quantity) AS media_quantidade_comprada
FROM Portifoliosql..vendas_walmart
GROUP BY [Product Line];

--A quantidade comprada em média, de todas linhas, está em torno de 5 itens; inclusive para linhas diferentes. Agora vamos descobrir a média gasta por linha de produtos

SELECT
    [Product Line],
    AVG(Total) AS media_total_comprado
FROM Portifoliosql..vendas_walmart
GROUP BY [Product Line];

--A linha de produto que, em média, tem os maiores gastos é com a casa e estilo de vida com uma média de 336 reais


--Agora podemos estar interessados em saber se homens gastam, em média, mais com determinada linha de produtos do que mulheres, vamos descobrir

SELECT
    [Product Line],
    AVG(CASE WHEN Gender = 'Male' THEN Total END) AS media_quantidade_gasta_homens,
    AVG(CASE WHEN Gender = 'Female' THEN Total END) AS media_quantidade_gasta_mulheres
FROM Portifoliosql..vendas_walmart
GROUP BY [Product Line];

-- As mulheres gastam mais, em média, com casa e estilo de vida enquanto os homens com beleza e saúde, 380 reais para mulheres e 348 para os homens.

-- Agora vamos fazer um histórico por dia de vendas

SELECT
    Date,
    SUM(Total) AS total_compras
FROM Portifoliosql..vendas_walmart
GROUP BY Date
ORDER BY Date;