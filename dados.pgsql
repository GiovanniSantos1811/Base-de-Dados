-- Inserção na tabela Medico
INSERT INTO Medico (CPF, CRM, Telefone1, Telefone2, Nome, Especialidade, Email) VALUES
('100.000.000-01', 'CRM111111', '(11)10000-0001', '(11)10000-0002', 'JOÃO SILVA', 'CARDIOLOGISTA', 'JOAO.SILVA@CARDIO.COM');
INSERT INTO Medico (CPF, CRM, Telefone1, Telefone2, Nome, Especialidade, Email) VALUES
('100.000.000-02', 'CRM222222', '(11)10000-0003', '(11)10000-0004', 'MARIA OLIVEIRA', 'ORTOPEDISTA', 'MARIA.OLIVEIRA@ORTO.COM');

-- Inserção na tabela Convenios
INSERT INTO Convenios (Nome, Medico) VALUES ('UNIMED', '100.000.000-01');
INSERT INTO Convenios (Nome, Medico) VALUES ('PORTO SEGURO', '100.000.000-02');

-- Inserção na tabela Aluno
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-01', 00000001, '(11)20000-0001', '(11)20000-0002', 'MARCELO EDUARDO', 'ATLETA', 2022, TO_DATE('2003-08-19', 'YYYY-MM-DD'), 'ENGENHARIA DE COMPUTAÇÃO', 'MARCELO.EDUARDO@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-02', 00000002, '(11)20000-0003', '(11)20000-0004', 'PEDRO ZENATTE', 'ORGANIZAÇÃO', 2022, TO_DATE('2002-07-27', 'YYYY-MM-DD'), 'ENGENHARIA DE COMPUTAÇÃO', 'PEDRO.ZENATTE@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-03', 00000003, '(11)20000-0005', '(11)20000-0006', 'GIOVANNI DOS SANTOS', 'ORGANIZAÇÃO', 2022, TO_DATE('2003-11-18', 'YYYY-MM-DD'), 'ENGENHARIA DE COMPUTAÇÃO', 'GIOVANNI.SANTOS@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-04', 00000004, '(11)20000-0007', '(11)20000-0008', 'GUILHERME FINCATTI', 'ATLETA', 2022, TO_DATE('2003-09-11', 'YYYY-MM-DD'), 'ENGENHARIA DE COMPUTAÇÃO', 'GUILHERME.FINCATTI@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-05', 00000005, '(11)20000-0009', '(11)20000-0010', 'LAURA DALBEM', 'ORGANIZAÇÃO', 2021, TO_DATE('2003-05-24', 'YYYY-MM-DD'), 'ENGENHARIA ELÉTRICA', 'LAURA.DALBEM@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-06', 00000006, '(11)20000-0011', '(11)20000-0012', 'MANUELA BENASSI', 'ATLETA', 2022, TO_DATE('2003-02-19', 'YYYY-MM-DD'), 'ENGENHARIA DE PRODUÇÃO', 'MANU.BENASSI@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-07', 00000007, '(11)20000-0013', '(11)20000-0014', 'PEDRO ZEM', 'ORGANIZAÇÃO', 2022, TO_DATE('2003-09-14', 'YYYY-MM-DD'), 'ENGENHARIA DE MATERIAIS', 'PEDRO.ZEM@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-08', 00000008, '(11)20000-0015', '(11)20000-0016', 'LUIS OTAVIO', 'ATLETA', 2021, TO_DATE('2002-12-11', 'YYYY-MM-DD'), 'ENGENHARIA DE MATERIAIS', 'LUIS.OTAVIO@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-09', 00000009, '(11)20000-0017', '(11)20000-0018', 'ISABELA TELESI', 'ORGANIZAÇÃO', 2023, TO_DATE('2004-03-27', 'YYYY-MM-DD'), 'ARQUITETURA E URBANISMO', 'ISA.TELESI@USP.BR');
INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
('200.000.000-10', 00000010, '(11)20000-0019', '(11)20000-0020', 'FELIPE GRABALOS', 'ORGANIZAÇÃO', 2022, TO_DATE('2004-05-04', 'YYYY-MM-DD'), 'ENGENHARIA ELÉTRICA', 'FEFO.GRABA@USP.BR');
-- Acho que em aluno seria bom fazer um check funcao Organizacao ou atleta

-- Inserção na tabela Organizacao_interna
INSERT INTO Organizacao_interna (CPF, Area) VALUES ('200.000.000-02', 'ADM');
INSERT INTO Organizacao_interna (CPF, Area) VALUES ('200.000.000-03', 'ADM');
INSERT INTO Organizacao_interna (CPF, Area) VALUES ('200.000.000-05', 'DM');
INSERT INTO Organizacao_interna (CPF, Area) VALUES ('200.000.000-07', 'DM');
INSERT INTO Organizacao_interna (CPF, Area) VALUES ('200.000.000-09', 'ADM');
INSERT INTO Organizacao_interna (CPF, Area) VALUES ('200.000.000-10', 'ADM');

-- Inserção na tabela Modalidade
INSERT INTO Modalidade (Nome) VALUES ('FUTEBOL DE CAMPO');
INSERT INTO Modalidade (Nome) VALUES ('BEISEBOL');
INSERT INTO Modalidade (Nome) VALUES ('SOFTBOL');
INSERT INTO Modalidade (Nome) VALUES ('FUTSAL');
INSERT INTO Modalidade (Nome) VALUES ('NATAÇÃO');
INSERT INTO Modalidade (Nome) VALUES ('TENIS');
INSERT INTO Modalidade (Nome) VALUES ('TAEKWONDO');
INSERT INTO Modalidade (Nome) VALUES ('BASQUETE');
INSERT INTO Modalidade (Nome) VALUES ('HANDBOL');
INSERT INTO Modalidade (Nome) VALUES ('TENIS DE MESA');
INSERT INTO Modalidade (Nome) VALUES ('CHEERLEADING');
INSERT INTO Modalidade (Nome) VALUES ('KARATE');
INSERT INTO Modalidade (Nome) VALUES ('VOLEI');

-- Inserção na tabela Atleta
INSERT INTO Atleta (CPF, Condicao, Modalidade) VALUES ('200.000.000-01', 'ATIVO', 'FUTSAL');
INSERT INTO Atleta (CPF, Condicao, Modalidade) VALUES ('200.000.000-04', 'LESIONADO', 'CHEERLEADING');
INSERT INTO Atleta (CPF, Condicao, Modalidade) VALUES ('200.000.000-06', 'ATIVO', 'BASQUETE');
INSERT INTO Atleta (CPF, Condicao, Modalidade) VALUES ('200.000.000-08', 'LESIONADO', 'KARATE');
-- Talvez check ativo, lesionado

-- Inserção na tabela Consulta
INSERT INTO Consulta (Paciente, Medico, Data_Horario, Rua, Numero, CEP, Cidade) VALUES
('200.000.000-04', '100.000.000-01', TO_DATE('2024-12-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'AVENIDA SAO CARLOS', 0001, '10000-001', 'SÃO CARLOS');
INSERT INTO Consulta (Paciente, Medico, Data_Horario, Rua, Numero, CEP, Cidade) VALUES
('200.000.000-08', '100.000.000-02', TO_DATE('2024-12-12 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'RUA EPISCOPAL', 0001, '10000-002', 'SÃO CARLOS');

-- Inserção na tabela Patrocinador
INSERT INTO Patrocinador (CNPJ, Organizacao, Website, Telefone1, Telefone2, Rua, Numero, CEP, Cidade, Nome) VALUES 
('10.000.000/0001-01', '200.000.000-02', 'WWW.REDBULL.COM', '(11)30000-0001', '(11)30000-0002', 'AVENIDA BRASIL', 0002, '20000-001', 'SÃO PAULO', 'REDBULL');
INSERT INTO Patrocinador (CNPJ, Organizacao, Website, Telefone1, Telefone2, Rua, Numero, CEP, Cidade, Nome) VALUES 
('10.000.000/0001-02', '200.000.000-03', 'WWW.ROCAIMOVEIS.COM', '(11)30000-0003', '(11)30000-0004', 'AVENIDA SÃO CARLENSE', 0002, '20000-002', 'SÃO CARLOS', 'ROCA IMÓVEIS');

-- Inserção na tabela Administração
INSERT INTO Administracao (CPF, Cargo) VALUES ('200.000.000-02', 'MEMBRO');
INSERT INTO Administracao (CPF, Cargo) VALUES ('200.000.000-03', 'MEMBRO');
INSERT INTO Administracao (CPF, Cargo) VALUES ('200.000.000-09', 'DIRETOR');
INSERT INTO Administracao (CPF, Cargo) VALUES ('200.000.000-10', 'MEMBRO');

-- Inserção na tabela Diretor modalidade
INSERT INTO Diretor_de_modalidade (CPF) VALUES ('200.000.000-05');
INSERT INTO Diretor_de_modalidade (CPF) VALUES ('200.000.000-07');

-- Inserção na tabela Local
INSERT INTO LOCAL (Cidade, Rua, Numero, CEP, Nome, Nome_Instalacao, Numero_instalacao, Condicao) VALUES
('SÃO CARLOS', 'AVENIDA SAO CARLENSE', 123, '30000-001', 'CEFER', 'QUADRA', 1, 'BOM');
INSERT INTO LOCAL (Cidade, Rua, Numero, CEP, Nome, Nome_Instalacao, Numero_instalacao, Condicao) VALUES
('SÃO CARLOS', 'AVENIDA SAO CARLENSE', 123, '30000-001', 'CEFER', 'QUADRA', 2, 'MÉDIO');

-- Inserção na tabela Treinador
INSERT INTO Treinador (CPF, Email, Telefone1, Telefone2, Nome, Salario, Diretor_contrata) VALUES 
('300.000.000-01', 'ADILSON.FERREIRA@GMAIL.COM', '(11)40000-0001', '(11)40000-0002', 'ADILSON FERREIRA', 2500, '200.000.000-05');
INSERT INTO Treinador (CPF, Email, Telefone1, Telefone2, Nome, Salario, Diretor_contrata) VALUES
('300.000.000-02', 'VIVIANE.AIRA@GMAIL.COM', '(11)40000-0003', '(11)40000-0004', 'VIVIANE AIRA', 2500, '200.000.000-07');

-- Inserção na tabela Treinamento
INSERT INTO Treinamento (Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao, Duracao, Tipo, Diretor_agenda) VALUES 
(TO_DATE('2024-12-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '300.000.000-01', 'SÃO CARLOS', 'AVENIDA SAO CARLENSE', 123, '30000-001', 'CEFER', 'QUADRA', 1, 120, 'LANCES LIVRES', '200.000.000-05');
INSERT INTO Treinamento (Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao, Duracao, Tipo, Diretor_agenda) VALUES 
(TO_DATE('2024-12-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '300.000.000-02', 'SÃO CARLOS', 'AVENIDA SAO CARLENSE', 123, '30000-001', 'CEFER', 'QUADRA', 2, 120, 'CHUTES AO GOL', '200.000.000-07');

-- Inserção na tabela Participa
INSERT INTO Participa (Atleta, Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao) VALUES 
    ('200.000.000-06', TO_DATE('2024-12-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  '300.000.000-01', 'SÃO CARLOS', 'AVENIDA SAO CARLENSE', 123, '30000-001', 'CEFER', 'QUADRA', 1);
INSERT INTO Participa (Atleta, Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao) VALUES 
    ('200.000.000-01', TO_DATE('2024-12-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),  '300.000.000-02', 'SÃO CARLOS', 'AVENIDA SAO CARLENSE', 123, '30000-001', 'CEFER', 'QUADRA', 2);

-- Inserção na tabela Busca
INSERT INTO Busca(Administracao, Patrocinador) VALUES ('200.000.000-02', '10.000.000/0001-01');
INSERT INTO Busca(Administracao, Patrocinador) VALUES ('200.000.000-03', '10.000.000/0001-02');

-- Inserção na tabela Diretor
INSERT INTO Diretor(CPF) VALUES ('200.000.000-09');
-- Diretor único devido a modelagem do problema, tratado na implementação

-- Inserção na tabela Membro
INSERT INTO Membro(CPF, Diretor) VALUES ('200.000.000-02', '200.000.000-09');
INSERT INTO Membro(CPF, Diretor) VALUES ('200.000.000-03', '200.000.000-09');
INSERT INTO Membro(CPF, Diretor) VALUES ('200.000.000-10', '200.000.000-09');

-- Inserção na tabela Orienta
INSERT INTO Orienta(Treinador, Modalidade) VALUES ('300.000.000-01', 'BASQUETE');
INSERT INTO Orienta(Treinador, Modalidade) VALUES ('300.000.000-02', 'FUTSAL');

-- Inserção na tabela Armazem
INSERT INTO Armazem(Campus, Numero_sala) VALUES ('C1', 'C101');
INSERT INTO Armazem(Campus, Numero_sala) VALUES ('C1', 'C102');

-- Inserção na tabela Material Esportivo
INSERT INTO Material_esportivo(Nome, Estado, Armazem_campus, Armazem_numero_sala, Quantidade) VALUES ('BOLA DE FUTSAL', 'BOM', 'C1', 'C101', 15);
INSERT INTO Material_esportivo(Nome, Estado, Armazem_campus, Armazem_numero_sala, Quantidade) VALUES ('BOLA DE BASQUETE', 'RUIM', 'C1', 'C102', 20);

-- Inserção na tabela Utiliza
INSERT INTO Utiliza(Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao, Material_esportivo, Quantidade) VALUES 
    (TO_DATE('2024-12-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '300.000.000-01', 'SÃO CARLOS', 'AVENIDA SAO CARLENSE', 123, '30000-001', 'CEFER', 'QUADRA', 1, 'BOLA DE BASQUETE', 10);
INSERT INTO Utiliza(Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao, Material_esportivo, Quantidade) VALUES 
    (TO_DATE('2024-12-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '300.000.000-02', 'SÃO CARLOS', 'AVENIDA SAO CARLENSE', 123, '30000-001', 'CEFER', 'QUADRA', 2, 'BOLA DE FUTSAL', 5);

-- Inserção na tabela Loja
INSERT INTO Loja (CNPJ, Nome, Website, Telefone1, Telefone2, Rua, Numero, CEP, Cidade) VALUES 
    ('20.000.000/0001-01', 'DECATHLON', 'WWW.DECATHLON.COM', '(11)50000-0001', '(11)50000-0002', 'RUA JACINTO NEVES', 2000, '40000-001', 'CAMPINAS');
INSERT INTO Loja (CNPJ, Nome, Website, Telefone1, Telefone2, Rua, Numero, CEP, Cidade) VALUES 
    ('20.000.000/0001-02', 'CENTAURO', 'WWW.CENTAURO.COM', '(11)50000-0003', '(11)50000-0004', 'RUA COMENDADOR HERMES TRALDI', 111, '40000-002', 'RIBEIRÃO PRETO');

-- Inserção tabela Compra
INSERT INTO Compra (Nota_fiscal, Loja, Administracao) VALUES ('1000000000000000001', '20.000.000/0001-01', '200.000.000-10');
INSERT INTO Compra (Nota_fiscal, Loja, Administracao) VALUES ('2000000000000000002', '20.000.000/0001-02', '200.000.000-09');

-- Inserção tabela Compoe
INSERT INTO Compoe (Compra, Material_esportivo, Quantidade) VALUES ('1000000000000000001', 'BOLA DE FUTSAL', 5);
INSERT INTO Compoe (Compra, Material_esportivo, Quantidade) VALUES ('2000000000000000002', 'BOLA DE BASQUETE', 10);

-- Inserção tabela DirMod
INSERT INTO DirMod (Modalidade, Diretor_modalidade) VALUES ('FUTSAL', '200.000.000-07');
INSERT INTO DirMod (Modalidade, Diretor_modalidade) VALUES ('BASQUETE', '200.000.000-05');

-- Inserção tabela Usa
INSERT INTO Usa (Material_esportivo, Modalidade) VALUES ('BOLA DE FUTSAL', 'FUTSAL');
INSERT INTO Usa (Material_esportivo, Modalidade) VALUES ('BOLA DE BASQUETE', 'BASQUETE');