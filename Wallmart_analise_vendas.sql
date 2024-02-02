









Select *
From Portifoliosql..vendas_walmart
Order by Date, Time


--------------Criando novas colunas--------------
--Vamos criar 3 novas colunas separando a data para saber se h� algum dia em especial que as pessoas compram mais, por estar perto da data de
--recebimento ou m�s, por exemplo, no natal

ALTER TABLE Portifoliosql..vendas_walmart
ADD ano INT,
    mes INT,
    dia INT;

UPDATE Portifoliosql..vendas_walmart
SET 
    ano = YEAR(Date),
    mes = MONTH(Date),
    dia = DAY(Date);

--Tamb�m vamos criar duas novas colunas separando o hor�rio da compra em hora e minuto. Pode existir um hor�rio onde h� maior fluxo de comprar, essa
--informa��o pode servir para aumentar a quantidade de propaganda naquele hor�rio

ALTER TABLE Portifoliosql..vendas_walmart
ADD hora INT,
    minuto INT;

UPDATE Portifoliosql..vendas_walmart
Set hora = DATEPART(HOUR, Time),
    minuto = DATEPART(MINUTE, Time);

--Podemos agora saber a porcentagem de compras total por m�s, para saber se h� algum m�s especifico que h� um maior fluxo de compra

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

--A tabela apresentada mostra uma maior quantidade de compra em janeiro 36% em rela��o a fevereiro 30% e mar�o 33%

--Agora podemos querer saber a m�dia de quantidade comprada por linha de produto, vamos descobrir!

SELECT
    [Product Line],
    AVG(Quantity) AS media_quantidade_comprada
FROM Portifoliosql..vendas_walmart
GROUP BY [Product Line];

--A quantidade comprada em m�dia, de todas linhas, est� em torno de 5 itens; inclusive para linhas diferentes. Agora vamos descobrir a m�dia gasta por linha de produtos

SELECT
    [Product Line],
    AVG(Total) AS media_total_comprado
FROM Portifoliosql..vendas_walmart
GROUP BY [Product Line];

--A linha de produto que, em m�dia, tem os maiores gastos � com a casa e estilo de vida com uma m�dia de 336 reais


--Agora podemos estar interessados em saber se homens gastam, em m�dia, mais com determinada linha de produtos do que mulheres, vamos descobrir

SELECT
    [Product Line],
    AVG(CASE WHEN Gender = 'Male' THEN Total END) AS media_quantidade_gasta_homens,
    AVG(CASE WHEN Gender = 'Female' THEN Total END) AS media_quantidade_gasta_mulheres
FROM Portifoliosql..vendas_walmart
GROUP BY [Product Line];

-- As mulheres gastam mais, em m�dia, com casa e estilo de vida enquanto os homens com beleza e sa�de, 380 reais para mulheres e 348 para os homens.

-- Agora vamos fazer um hist�rico por dia de vendas

SELECT
    Date,
    SUM(Total) AS total_compras
FROM Portifoliosql..vendas_walmart
GROUP BY Date
ORDER BY Date;