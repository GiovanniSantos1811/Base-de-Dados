-- Buscar atributos de atletas que irão participar de um treinamento em certo dia e com certo treinador a partir da data e do cpf do treinador
SELECT a.CPF, a.Condicao, a.Modalidade, al.Telefone1, al.Telefone2, al.Email
    FROM Atleta a JOIN Aluno al ON a.CPF = al.CPF
    JOIN Participa p ON a.CPF = p.Atleta
    JOIN Treinamento t ON p.Data_Horario = t.Data_Horario 
                AND p.Treinador = t.Treinador
                AND p.Cidade = t.Cidade
                AND p.Rua = t.Rua
                AND p.Numero = t.Numero
                AND p.CEP = t.CEP
                AND p.Nome = t.Nome
                AND p.Nome_instalacao = t.Nome_instalacao
                AND p.Numero_instalacao = t.Numero_instalacao
    WHERE TRUNC(t.Data_Horario) = TO_DATE('10-12-2024', 'DD-MM-YYYY')
        AND t.Treinador = '300.000.000-01';

-- Buscar atributos de atletas que participarão de uma consulta em certo dia a partir da data       
SELECT a.CPF AS AtletaCPF, al.Nome AS AtletaNome, al.Telefone1, al.Telefone2, al.Email, c.Data_Horario, c.Rua, c.Numero, c.Cidade, c.CEP
    FROM Consulta c JOIN Atleta a ON c.Paciente = a.CPF
    JOIN Aluno al ON a.CPF = al.CPF
    WHERE TRUNC(c.Data_Horario) = TO_DATE('10-12-2024', 'DD-MM-YYYY');
    
-- Buscar a quantidade de vezes que certa modalidade utilizou certo material esportivo no ano de 2024
SELECT u.Modalidade, u.Material_esportivo, COUNT(*) AS Quantidade_uso
    FROM Usa u JOIN Utiliza util ON u.Material_esportivo = util.Material_esportivo
    JOIN Treinamento t ON util.Data_Horario = t.Data_Horario 
                AND util.Treinador = t.Treinador
                AND util.Cidade = t.Cidade
                AND util.Rua = t.Rua
                AND util.Numero = t.Numero
                AND util.CEP = t.CEP
                AND util.Nome = t.Nome
                AND util.Nome_instalacao = t.Nome_instalacao
                AND util.Numero_instalacao = t.Numero_instalacao
    WHERE EXTRACT(YEAR FROM t.Data_Horario) = 2024
    GROUP BY u.Modalidade, u.Material_esportivo
    ORDER BY u.Modalidade, u.Material_esportivo;

-- Buscar informações sobre quem comprou e onde comprou bola de futsal assim como informações sobre a compra e sobre o material esportivo
SELECT A.Nome AS Nome_Aluno,
    L.Nome AS Nome_Loja,
    L.Cidade AS Cidade_Loja,
    L.Rua AS Rua_Loja,
    L.Numero AS Numero_Loja,
    M.Nome AS Material_Esportivo,
    M.Estado AS Estado_Material,
    M.Quantidade AS Quantidade_Disponível,
    C.Nota_fiscal AS Nota_Fiscal,
    Co.Quantidade AS Quantidade_Comprada,
    M_Armazenamento.Campus AS Armazem_Campus,
    M_Armazenamento.Numero_sala AS Armazem_Numero_Sala
    FROM Aluno A JOIN Organizacao_interna OI ON A.CPF = OI.CPF
    JOIN Administracao AD ON OI.CPF = AD.CPF
    JOIN Compra C ON AD.CPF = C.Administracao
    JOIN Loja L ON C.Loja = L.CNPJ
    JOIN Compoe Co ON C.Nota_fiscal = Co.Compra
    JOIN Material_esportivo M ON Co.Material_esportivo = M.Nome
    JOIN Armazem M_Armazenamento ON M.Armazem_campus = M_Armazenamento.Campus 
                                AND M.Armazem_numero_sala = M_Armazenamento.Numero_sala
    WHERE M.Nome = 'BOLA DE FUTSAL';

-- Busca a quantidade de atletas em cada modalidade
SELECT M.Nome AS Modalidade, COUNT(A.CPF) AS Quantidade_Atletas
    FROM Modalidade M
    LEFT JOIN Atleta A ON M.Nome = A.Modalidade
    GROUP BY M.Nome;





