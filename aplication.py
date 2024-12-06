import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.sql import text

#------------- Funções relacionadas à BD --------------
def connect(username, password, host, port, database): #Função para criar conexão com a base de dados através do sqlalchemy
    try:
        engine = create_engine(f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}", echo=True)
        print("Conexão com Banco de Dados foi um sucesso")
        return engine
    except Exception as e:
        print("Erro ao tentar se conectar ao Banco de Dados")
        return None

def insert(dados, engine):
    #Definindo a query que irá inserir um novo aluno
    query = """
    INSERT INTO Aluno (CPF, NUSP, Telefone1, Telefone2, Nome, Funcao, Ano_ingresso, Data_nascimento, Curso, Email) VALUES
(:cpf, :nusp, :telefone1, :telefone2, :nome, :funcao, :ano_ingresso, TO_DATE(:data_nascimento, 'DD/MM/YYYY'), :curso, :email);
    """

    try:
        # Criar uma conexão e um cursor
        with engine.connect() as connection:
            with connection.begin():
                connection.execute(text(query), dados)
                print("Dados inseridos com sucesso!")
    except Exception as e:
        print("Erro ao executar a inserção:", e)


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
    print("2")

#Rotina principal da aplicação
def main(): 
    engine = connect("postgres", "senha", "localhost", "5432", "postgres") #Criando a conexão com a base de dados

    #Aba inicial
    opcao = aba_inicial() #Rodando a aba inicial e pegando a opção escolhida pelo usuário

    if (opcao == 1): #Aba de inserção
        dados = aba_insercao()
        insert(dados, engine)

    elif (opcao == 2): #Aba de busca
        aba_busca()


if __name__ == "__main__":
    main()