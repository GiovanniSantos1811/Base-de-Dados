-- Tabelas estão na ordem para o comando Executar script (F5) funcionar corretamente

-- Medico
CREATE TABLE Medico(
    CPF CHAR(14) NOT NULL,
    CRM VARCHAR2(20) NOT NULL,
    Telefone1 VARCHAR2(15),
    Telefone2 VARCHAR2(15),
    Nome VARCHAR2(100),
    Especialidade VARCHAR2(50),
    Email VARCHAR2(100),
    CONSTRAINT PK_MEDICO PRIMARY KEY(CPF),
    CONSTRAINT UN_MEDICO UNIQUE(CRM),
    --formatando CPF, Telefone1 e Telefone2
    CONSTRAINT CK_CPF_MEDICO CHECK(REGEXP_LIKE(CPF, '[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}')),
    CONSTRAINT CK_TELEFONE1_MEDICO CHECK(REGEXP_LIKE(TELEFONE1, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}')),
    CONSTRAINT CK_TELEFONE2_MEDICO CHECK(REGEXP_LIKE(TELEFONE2, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}'))
);

-- Convenios
CREATE TABLE Convenios(
    Nome VARCHAR2(100) NOT NULL,
    Medico CHAR(14) NOT NULL,
    CONSTRAINT PK_CONVENIOS PRIMARY KEY(NOME, MEDICO),
    --chave estrangeira
    CONSTRAINT FK_CONVENIOS FOREIGN KEY(Medico)
        REFERENCES Medico(CPF) ON DELETE CASCADE
);

-- Aluno
CREATE TABLE Aluno (
    CPF CHAR(14) NOT NULL,
    NUSP NUMBER(9) NOT NULL,
    Telefone1 VARCHAR2(15),
    Telefone2 VARCHAR2(15),
    Nome VARCHAR2(100),
    Funcao VARCHAR2(50),
    Ano_ingresso NUMBER(4),
    Data_nascimento DATE,
    Curso VARCHAR2(100),
    Email VARCHAR2(100),
    CONSTRAINT PK_ALUNO PRIMARY KEY(CPF),
    CONSTRAINT UN_ALUNO UNIQUE(NUSP),
    --formatando CPF, Telefone1, Telefone2
    CONSTRAINT CK_CPF_ALUNO CHECK(REGEXP_LIKE(CPF, '[0-9]{3}\.[0-9]{3}\.[0-9]{3}\-[0-9]{2}')),
    CONSTRAINT CK_TELEFONE1_ALUNO CHECK(REGEXP_LIKE(TELEFONE1, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}')),
    CONSTRAINT CK_TELEFONE2_ALUNO CHECK(REGEXP_LIKE(TELEFONE2, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}')),
    --check de funcao
    CONSTRAINT CK_FUNCAO CHECK(UPPER(Funcao) IN ('ATLETA', 'ORGANIZAÇÃO', 'OUTRO'))
);

-- Organizacao_interna
CREATE TABLE Organizacao_interna (
    CPF CHAR(14) NOT NULL,
    Area VARCHAR2(100),
    CONSTRAINT PK_ORGANIZACAO_INTERNA PRIMARY KEY(CPF),
    --chave estrangeira
    CONSTRAINT FK_ORGANIZACAO_INTERNA FOREIGN KEY(CPF)
        REFERENCES Aluno(CPF) ON DELETE CASCADE,
    --check de area
    CONSTRAINT CK_AREA CHECK(UPPER(Area) IN ('ADM', 'DM'))
);

-- Modalidade
CREATE TABLE Modalidade(
    Nome VARCHAR2(100),
    CONSTRAINT PK_MODALIDADE PRIMARY KEY (Nome)
);

-- Atleta
CREATE TABLE Atleta (
    CPF CHAR(14) NOT NULL,
    Condicao VARCHAR2(50),
    Modalidade VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_ATLETA PRIMARY KEY(CPF),
    --chave estrangeira
    CONSTRAINT FK_ATLETA_CPF FOREIGN KEY(CPF)
        REFERENCES Aluno(CPF) ON DELETE CASCADE,
    CONSTRAINT FK_ATLETA_MODALIDADE FOREIGN KEY(Modalidade)
        REFERENCES Modalidade(Nome) ON DELETE CASCADE
);

-- Consulta
CREATE TABLE Consulta (
    Paciente CHAR(14) NOT NULL,
    Medico CHAR(14) NOT NULL,
    Data_Horario DATE NOT NULL,
    Rua VARCHAR2(100),
    Numero NUMBER(4),
    CEP CHAR(9),
    Cidade VARCHAR2(100),
    CONSTRAINT PK_CONSULTA PRIMARY KEY(Paciente, Medico, Data_Horario),
    --formatando CEP
    CONSTRAINT CK_CEP_CONSULTA CHECK(REGEXP_LIKE(CEP, '[0-9]{5}\-[0-9]{3}')),
    --chave estrangeira
    CONSTRAINT FK_CONSULTA_PACIENTE FOREIGN KEY(Paciente) 
        REFERENCES Atleta(CPF) ON DELETE CASCADE,
    CONSTRAINT FK_CONSULTA_MEDICO FOREIGN KEY(Medico) 
        REFERENCES Medico(CPF) ON DELETE CASCADE
);

-- Patrocinador
CREATE TABLE Patrocinador (
    CNPJ CHAR(18) NOT NULL,
    Organizacao CHAR(14) NOT NULL,
    Website VARCHAR2(100),
    Telefone1 VARCHAR2(15),
    Telefone2 VARCHAR2(15),
    Rua VARCHAR2(100),
    Numero NUMBER,
    CEP CHAR(9),
    Cidade VARCHAR2(100),
    Nome VARCHAR2(100),
    CONSTRAINT PK_PATROCINADOR PRIMARY KEY(CNPJ),
    --formatando CNPJ, Telefone1, Telefone2
    CONSTRAINT CK_CNPJ_PATROCINADOR CHECK(REGEXP_LIKE(CNPJ, '[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}\-[0-9]{2}')),
    CONSTRAINT CK_CEP_PATROCINADOR CHECK(REGEXP_LIKE(CEP, '[0-9]{5}\-[0-9]{3}')),
    CONSTRAINT CK_TELEFONE1_PATROCINADOR CHECK(REGEXP_LIKE(TELEFONE1, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}')),
    CONSTRAINT CK_TELEFONE2_PATROCINADOR CHECK(REGEXP_LIKE(TELEFONE2, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}')),
    --chave estrangeira
    CONSTRAINT FK_PATROCINADOR FOREIGN KEY(Organizacao) 
        REFERENCES Organizacao_interna(CPF) ON DELETE CASCADE
);

-- Administracao
CREATE TABLE Administracao (
    CPF CHAR(14) NOT NULL,
    Cargo VARCHAR2(50),
    CONSTRAINT PK_ADMINISTRACAO PRIMARY KEY(CPF),
    --chave estrangeira
    CONSTRAINT FK_ADMINISTRACAO FOREIGN KEY(CPF) 
        REFERENCES Organizacao_interna(CPF) ON DELETE CASCADE,
    --check de cargo
    CONSTRAINT CK_CARGO CHECK(UPPER(Cargo) IN ('MEMBRO', 'DIRETOR'))
);

-- Diretor_de_modalidade
CREATE TABLE Diretor_de_modalidade (
    CPF CHAR(14) NOT NULL,
    CONSTRAINT PK_DIRETOR_MODALIDADE PRIMARY KEY(CPF),
    CONSTRAINT FK_DIRETOR_MODALIDADE FOREIGN KEY(CPF) 
        REFERENCES Organizacao_interna(CPF) ON DELETE CASCADE
);

-- Local
CREATE TABLE LOCAL(
    Cidade VARCHAR2(100) NOT NULL,
    Rua VARCHAR2(100) NOT NULL,
    Numero NUMBER(4) NOT NULL,
    CEP CHAR(9) NOT NULL,
    Nome VARCHAR2(100) NOT NULL,
    Nome_instalacao VARCHAR(50) NOT NULL,
    Numero_instalacao NUMBER(3) NOT NULL,
    Condicao VARCHAR2(50),
    CONSTRAINT PK_LOCAL PRIMARY KEY (Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao),
    --formatando CEP
    CONSTRAINT CK_CEP_LOCAL CHECK(REGEXP_LIKE(CEP, '[0-9]{5}\-[0-9]{3}'))
);

-- Treinador
CREATE TABLE Treinador(
    CPF CHAR(14) NOT NULL,
    Email VARCHAR2(100),
    Telefone1 VARCHAR2(15),
    Telefone2 VARCHAR2(15),
    Nome VARCHAR2(100),
    Salario NUMBER,
    Diretor_contrata CHAR(14),
    CONSTRAINT PK_TREINADOR PRIMARY KEY(CPF),
    --chave estrangeira
    CONSTRAINT FK_TREINADOR FOREIGN KEY (Diretor_contrata) 
        REFERENCES Diretor_de_modalidade(CPF) ON DELETE SET NULL,
    --formatando telefone1 e telefone2
    CONSTRAINT CK_TELEFONE1_TREINADOR CHECK(REGEXP_LIKE(TELEFONE1, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}')),
    CONSTRAINT CK_TELEFONE2_TREINADOR CHECK(REGEXP_LIKE(TELEFONE2, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}'))
);

-- Treinamento
CREATE TABLE Treinamento(
    Data_Horario DATE NOT NULL,
    Treinador CHAR(14) NOT NULL,
    Cidade VARCHAR2(100) NOT NULL,
    Rua VARCHAR2(100) NOT NULL,
    Numero NUMBER(4) NOT NULL,
    CEP CHAR(9) NOT NULL,
    Nome VARCHAR2(100) NOT NULL,
    Nome_instalacao VARCHAR(50) NOT NULL,
    Numero_instalacao NUMBER(3) NOT NULL,
    Duracao NUMBER(3),
    Tipo VARCHAR2(50),
    Diretor_agenda CHAR(14) NOT NULL,
    CONSTRAINT PK_TREINAMENTO PRIMARY KEY (Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao),
    --chaves estrangeiras
    CONSTRAINT FK_TREINAMENTO_TREINADOR FOREIGN KEY (Treinador) 
        REFERENCES Treinador(CPF) ON DELETE CASCADE,
     CONSTRAINT FK_TREINAMENTO_DIRETOR_MODALIDADE FOREIGN KEY (Diretor_agenda)
        REFERENCES Diretor_de_modalidade (CPF) ON DELETE CASCADE,
    CONSTRAINT FK_TREINAMENTO_LOCAL FOREIGN KEY(Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao)
        REFERENCES Local(Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao) ON DELETE CASCADE
);

-- Participa
CREATE TABLE Participa (
    Atleta CHAR(14) NOT NULL,
    Data_Horario DATE NOT NULL,
    Treinador CHAR(14) NOT NULL,
    Cidade VARCHAR2(100) NOT NULL,
    Rua VARCHAR2(100) NOT NULL,
    Numero NUMBER(4) NOT NULL,
    CEP CHAR(9) NOT NULL,
    Nome VARCHAR2(100) NOT NULL,
    Nome_instalacao VARCHAR(50) NOT NULL,
    Numero_instalacao NUMBER(3) NOT NULL,
    CONSTRAINT PK_PARTICIPA PRIMARY KEY (Atleta, Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao),
    --chave estrangeira
    CONSTRAINT FK_PARTICIPA_ATLETA FOREIGN KEY(Atleta) 
        REFERENCES Atleta(CPF) ON DELETE CASCADE,
    CONSTRAINT FK_PARTICIPA_TREINAMENTO FOREIGN KEY(Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao)
        REFERENCES Treinamento(Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao) ON DELETE CASCADE
);

--Busca
CREATE TABLE Busca(
    Administracao CHAR(14) NOT NULL,
    Patrocinador  CHAR(18) NOT NULL,
    CONSTRAINT PK_BUSCA PRIMARY KEY (Administracao, Patrocinador),
    --chave estrangeira
    CONSTRAINT FK_BUSCA_PATROCINADOR FOREIGN KEY(Patrocinador) 
        REFERENCES Patrocinador(CNPJ) ON DELETE CASCADE,
    CONSTRAINT FK_BUSCA_ADMINISTRACAO FOREIGN KEY(Administracao) 
        REFERENCES Administracao(CPF) ON DELETE CASCADE
);

-- Diretor
CREATE TABLE Diretor(
    CPF CHAR(14) NOT NULL,
    CONSTRAINT PK_DIRETOR PRIMARY KEY(CPF),
    CONSTRAINT FK_DIRETOR FOREIGN KEY(CPF)
        REFERENCES Administracao(CPF) ON DELETE CASCADE
);

-- Membro
CREATE TABLE Membro(
    CPF CHAR(14) NOT NULL,
    Diretor CHAR(14) NOT NULL,
    CONSTRAINT PK_MEMBRO PRIMARY KEY(CPF),
    --chaves estrangeiras
    CONSTRAINT FK_MEMBRO_CPF FOREIGN KEY(CPF)
        REFERENCES Administracao(CPF) ON DELETE CASCADE,
    CONSTRAINT FK_MEMBRO_DIRETOR FOREIGN KEY(Diretor)
        REFERENCES Diretor(CPF) ON DELETE CASCADE
);

-- Orienta
CREATE TABLE Orienta(
    Treinador CHAR(14) NOT NULL,
    Modalidade VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_ORIENTA PRIMARY KEY(Treinador, Modalidade),
    --chaves estrangeiras
    CONSTRAINT FK_ORIENTA_TREINADOR FOREIGN KEY(Treinador) 
        REFERENCES Treinador(CPF) ON DELETE CASCADE,
    CONSTRAINT FK_ORIENTA_MODALIDADE FOREIGN KEY(Modalidade)
        REFERENCES Modalidade(Nome)
);

-- Armazem
CREATE TABLE Armazem(
    Campus VARCHAR2(50) NOT NULL,
    Numero_sala VARCHAR2(10) NOT NULL,
    CONSTRAINT PK_ARMAZEM PRIMARY KEY (Campus, Numero_sala)
);

-- Material esportivo
CREATE TABLE Material_esportivo(
    Nome VARCHAR2(50) NOT NULL,
    Estado VARCHAR2(50),
    Armazem_campus VARCHAR2(50) NOT NULL,
    Armazem_numero_sala VARCHAR2(10) NOT NULL,
    Quantidade NUMBER(3),
    CONSTRAINT PK_MATERIAL_ESPORTIVO PRIMARY KEY(Nome),
    --chave estrangeira
    CONSTRAINT FK_MATERIAL_ESPORTIVO FOREIGN KEY (Armazem_campus, Armazem_numero_sala)
        REFERENCES Armazem(Campus, Numero_sala)
);

-- Utiliza
CREATE TABLE Utiliza(
    Data_Horario DATE NOT NULL,
    Treinador CHAR(14) NOT NULL,
    Cidade VARCHAR2(100) NOT NULL,
    Rua VARCHAR2(100) NOT NULL,
    Numero NUMBER(4) NOT NULL,
    CEP CHAR(9) NOT NULL,
    Nome VARCHAR2(100) NOT NULL,
    Nome_instalacao VARCHAR(50) NOT NULL,
    Numero_instalacao NUMBER(3) NOT NULL,
    Material_esportivo VARCHAR2(50) NOT NULL,
    Quantidade NUMBER(3),
    CONSTRAINT PK_UTILIZA PRIMARY KEY (Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao),
    --chaves estrangeiras
    CONSTRAINT FK_UTILIZA_TREINAMENTO FOREIGN KEY (Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao)
        REFERENCES Treinamento(Data_Horario, Treinador, Cidade, Rua, Numero, CEP, Nome, Nome_instalacao, Numero_instalacao) ON DELETE CASCADE,
    CONSTRAINT FK_UTILIZA_MATERIAL_ESPORTIVO FOREIGN KEY (Material_esportivo)
        REFERENCES Material_esportivo(Nome) ON DELETE CASCADE
);

-- Loja
CREATE TABLE Loja (
    CNPJ CHAR(18) NOT NULL,
    Nome VARCHAR2(100),
    Website VARCHAR2(100),
    Telefone1 VARCHAR2(15),
    Telefone2 VARCHAR2(15),
    Rua VARCHAR2(100),
    Numero NUMBER,
    CEP CHAR(9),
    Cidade VARCHAR2(100),
    CONSTRAINT PK_LOJA PRIMARY KEY (CNPJ),
    --formatando CNPJ, CEP, Telefone1 e Telefone2
    CONSTRAINT CK_CNPJ_LOJA CHECK(REGEXP_LIKE(CNPJ, '[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}\-[0-9]{2}')),
    CONSTRAINT CK_CEP_LOJA CHECK(REGEXP_LIKE(CEP, '[0-9]{5}\-[0-9]{3}')),
    CONSTRAINT CK_TELEFONE1_LOJA CHECK(REGEXP_LIKE(TELEFONE1, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}')),
    CONSTRAINT CK_TELEFONE2_LOJA CHECK(REGEXP_LIKE(TELEFONE2, '\([0-9]{2}\)[0-9]{5}\-[0-9]{4}'))
);

-- Compra
CREATE TABLE Compra(
    Nota_fiscal VARCHAR2(40) NOT NULL,
    Loja CHAR(18) NOT NULL,
    Administracao CHAR(14) NOT NULL,
    CONSTRAINT PK_COMPRA PRIMARY KEY (Nota_fiscal),
    --chaves estrangeiras
    CONSTRAINT FK_COMPRA_LOJA FOREIGN KEY (Loja)
        REFERENCES Loja(CNPJ) ON DELETE CASCADE,
    CONSTRAINT FK_COMPRA_ADMINISTRACAO FOREIGN KEY(Administracao)
        REFERENCES Administracao(CPF) ON DELETE CASCADE
);

-- Compoe
CREATE TABLE Compoe(
    Compra VARCHAR2(40) NOT NULL,
    Material_esportivo VARCHAR2(50) NOT NULL,
    Quantidade NUMBER(3),
    CONSTRAINT PK_COMPOE PRIMARY KEY (Compra, Material_esportivo),
    --chaves estrangeiras
    CONSTRAINT FK_COMPOE_COMPRA FOREIGN KEY (Compra)
        REFERENCES Compra(Nota_fiscal) ON DELETE CASCADE,
    CONSTRAINT FK_COMPOE_MATERIAL_ESPORTIVO FOREIGN KEY(Material_esportivo)
        REFERENCES Material_esportivo(Nome) ON DELETE CASCADE
);

-- DirMod
CREATE TABLE DirMod(
    Modalidade VARCHAR2(100) NOT NULL,
    Diretor_modalidade CHAR(14) NOT NULL,
    CONSTRAINT PK_DIRMOD PRIMARY KEY (Modalidade),
    CONSTRAINT UN_DIRMOD UNIQUE (Diretor_modalidade),
    --chaves estrangeiras
    CONSTRAINT FK_DIRMOD_MODALIDADE FOREIGN KEY (Modalidade) 
        REFERENCES Modalidade(Nome),
    CONSTRAINT FK_DIRMOD_DIRETOR_MODALIDADE FOREIGN KEY (Diretor_modalidade) 
        REFERENCES Diretor_de_modalidade(CPF)
);

-- Usa
CREATE TABLE Usa(
    Material_esportivo VARCHAR2(50) NOT NULL,
    Modalidade VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_USA PRIMARY KEY (Material_esportivo, Modalidade),
    --chaves estrangeiras
    CONSTRAINT FK_USA_MATERIAL_ESPORTIVO FOREIGN KEY (Material_esportivo)
        REFERENCES Material_esportivo(Nome) ON DELETE CASCADE,
    CONSTRAINT FK_USA_MODALIDADE FOREIGN KEY (Modalidade)
        REFERENCES Modalidade(Nome) ON DELETE CASCADE
);