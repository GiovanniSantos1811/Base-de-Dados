import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.sql import text

#------------- Funções relacionadas à BD --------------
def connect(username, password, host, port, database): #Função para criar conexão com a base de dados através do sqlalchemy
    try:
        engine = create_engine(f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}")
        print("Conexão com Banco de Dados foi um sucesso")
        return engine
    except Exception as e:
        print("Erro ao tentar se conectar ao Banco de Dados")
        return None

def insert(dados, engine):
    #Definindo a query que irá inserir um novo aluno
    query = """
    INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
(UPPER(:cpf), :nusp, UPPER(:telefone1), UPPER(:telefone2), UPPER(:nome), UPPER(:funcao), :ano_ingresso, TO_DATE(:data_nascimento, 'DD/MM/YYYY'), UPPER(:curso), UPPER(:email));
    """

    try:
        # Criar uma conexão e um cursor
        with engine.connect() as connection:
            with connection.begin():
                connection.execute(text(query), dados)
                print("Dados inseridos com sucesso!")
    except Exception as e:
        print("Erro ao executar a inserção:", e)

def busca(dados, engine):
    #Definindo a query que realizará a busca
    query = text(""" 
        SELECT al.Nome, a.CPF, a.Condicao, a.Modalidade, al.Telefone1, al.Telefone2, al.Email
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
        WHERE DATE_TRUNC('day', t.Data_Horario) = TO_DATE(:data, 'DD-MM-YYYY')
            AND t.Treinador = :cpf;
    """)

    try:
        df = pd.read_sql(query, engine, params=dados) #Realizando a busca e armazenando o resultado no datagrama df

        print(df.head()) #Printando o resultado da busca
    except Exception as e:
        print("Erro na busca: ", e)

#------------- Funções relacionadas à aplicação, interação com usuário -------------
def clear():
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")

def aba_inicial():
    print("--------------------------------------------------")
    print("Bem vindo ao Sistema de Gerenciamento da Atlética")
    print("--------------------------------------------------")
    
    print("Oferecemos dois serviços: um de inserção de dados no banco e outro de busca!")

    while (True):
        opcao = int(input("Digite 1 para o de inserção e 2 para o de busca: "))
        if (opcao != 1 and opcao != 2):
            print("Opção escolhida não existe!")
        else:
            break
    
    clear() #Limpando a tela
    return opcao

def aba_insercao():
    print("--------------------------------------------------")
    print("Inserção de Aluno - Preencha os dados requisitados")
    print("--------------------------------------------------")

    cpf = input("Informe o CPF do aluno (XXX.XXX.XXX-XX): ")
    nusp = int(input("Informe o NUSP do aluno: "))
    telefone1 = input("Informe o primeiro número de telefone (XX)XXXXX-XXXX: ")
    telefone2 = input("Informe o segundo número de telefone (XX)XXXXX-XXXX: ")
    nome = input("Digite o nome do aluno: ")
    funcao = input("Informe a função do aluno (ATLETA, ORGANIZAÇÃO ou OUTRO): ")
    ano_ingresso = int(input("Informe o ano de ingresso do aluno: "))
    data_nascimento = input("Informe a data de nascimento do aluno (AAAA/MM/DD): ")
    curso = input("Digite o curso ao qual o aluno pertence: ")
    email = input("Digite o e-mail do aluno: ")

    dados = {
        'cpf': cpf,
        'nusp': nusp,
        'telefone1': telefone1,
        'telefone2': telefone2,
        'nome': nome,
        'funcao': funcao,
        'ano_ingresso': ano_ingresso,
        'data_nascimento': data_nascimento,
        'curso': curso,
        'email': email
    }

    return dados


def aba_busca():
    print("--------------------------------------------------")
    print("Busca de Atletas que participaram do treinamento X realizado pelo treinador Y - Preencha os dados requisitados")
    print("--------------------------------------------------")

    cpf = input("Informe o CPF do treinador (XXX.XXX.XXX-XX): ")
    data = input("Informe a data na qual foi feito o treinamento: ")

    dados = {
        'cpf': cpf,
        'data': data
    }

    return dados

#Rotina principal da aplicação
def main(): 
    engine = connect("postgres", "senha", "localhost", "5432", "postgres") #Criando a conexão com a base de dados

    #Aba inicial
    opcao = aba_inicial() #Rodando a aba inicial e pegando a opção escolhida pelo usuário

    if (opcao == 1): #Aba de inserção
        dados_insert = aba_insercao() #Mostrando a aba de inserção e pegando os dados que serão inseridos
        insert(dados_insert, engine)

    elif (opcao == 2): #Aba de busca
        dados_busca = aba_busca()
        busca(dados_busca, engine)



if __name__ == "__main__":
    main()