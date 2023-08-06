Algoritmo "recodefly_pseudocodigo"
//  
//  
// Descrição   : Menu de cadastro para a agência de viagens(fictícia)RecodeFly
// Autor(a)    : Fabrício Gregório
// Data atual  : 05/08/2023
Var

   // VARIAVEL PRA CHAMAR AS FUNÇÕES:
   chamarfuncao:logico

   // VETORES USADOS PARA ARMAZENAR DADOS DOS CLIENTES:
   vetorNomes, vetorSexo: vetor [1..50] de caractere
   vetorIdade, vetorCpf: vetor [1..50] de inteiro

   // VETORES USADOS PARA ARMAZENAR DADOS DOS DESTINOS:
   vetorDestino: vetor [1..50] de caracter
   vetorValor: vetor [1..50] de real

   // VARIAVEIS GLOBAIS
   opcao,totalClientes,totalDestinos: inteiro
   
   // PROCEDIMENTO PARA GERAR CARACTERES PARA EFEITO VISUAL DO MENU:
Procedimento gerarCaracteres()
inicio
   escreval("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
fimprocedimento

// PROCEDIMENTO PARA CRIAR O MENU:
Procedimento menu()
inicio
   gerarCaracteres()
   escreval("               BEM VINDO A RECODEFLY!")
   gerarCaracteres()
   escreval(" ")
   escreval("               MENU:")
   escreval("               CADASTRO DE CLIENTE (1)")
   escreval("               CADASTRO DE DESTINO (2)")
   escreval("               CONSULTAR CLIENTES  (3)")
   escreval("               CONSULTAR DESTINOS  (4)")
   escreval("               SAIR                (0)")
   escreval(" ")
   gerarCaracteres()
   escreva("DIGITE QUAL OPÇÃO DESEJA ACESSAR: ")
   leia(opcao)
fimprocedimento

// FUNÇÃO PARA CADASTRAR CLIENTES:
funcao cadastroCliente:logico
// Variáveis locais:
var nome,sexo:caractere
   idade,cpf:inteiro
Inicio
   limpatela
   gerarCaracteres()
   // Verificando se há vagas para cadastro e recebendo os dados:
   se totalClientes < 50 entao
      escreva("Digite o nome do cliente: ")
      leia(nome)
      escreva("Digite o sexo(M/F): ")
      leia(sexo)
      escreva("Digite a idade do cliente: ")
      leia(idade)
      escreva("Digite o CPF(sem pontos,virgula e simbolos): ")
      leia(cpf)
      gerarCaracteres()

      // Adcionando o cliente e guardando seus dados:
      totalClientes <- totalClientes + 1
      vetorNomes[totalClientes] <- nome
      vetorSexo[totalClientes] <- sexo
      vetorIdade[totalClientes] <- idade
      vetorCpf[totalClientes] <- cpf

      // Timer de 1.5s para o usuário ver a mensagem na tela antes de limpar
      escreval("CLIENTE CADASTRADO COM SUCESSO!")
      timer 1500
      limpatela
      timer 0
   senao
      escreval("Limite de clientes excedido!")
      timer 1500
      limpatela
      timer 0
   fimse
   gerarCaracteres()
   retorne verdadeiro
fimfuncao

// FUNÇÃO PARA CADASTRAR DESTINOS:
Funcao cadastroDestino:logico
// Variáveis locais:
var destino:caracter
   valor:real
Inicio
   limpatela
   gerarCaracteres()
   // Verificando se há vagas para cadastro de destinos:
   se totalDestinos < 50 entao
      escreva("Digite o nome do destino: ")
      leia(destino)
      escreva("Digite o valor: R$")
      leia(valor)

      // Adcionando o destino e guardando os dados:
      totalDestinos <- totalDestinos + 1
      vetorDestino[totalDestinos] <- destino
      vetorValor[totalDestinos] <- valor
      gerarCaracteres()

      // Timer de 1.5s para o usuário ver a mensagem na tela antes de limpar
      escreval("DESTINO CADASTRADO COM SUCESSO!")
      timer 1500
      limpatela
      timer 0
   senao
      escreval("Limite de clientes excedido!")
      timer 1500
      limpatela
      timer 0
   fimse
   gerarCaracteres()
   retorne verdadeiro
fimfuncao

// FUNÇÃO PARA CONSULTAR CLIENTES:
Funcao consultaCliente:logico

// Variáveis locais:
var consulta,indiceCliente,i,voltarMenu:inteiro

Inicio

   limpatela
   gerarCaracteres()
   // Verifica se há cadastros de clientes e pergunta ao usuário se quer
   // consultar individualmente algum cadastro ou consultar todos:
   se totalClientes > 0 entao
      escreval("Há",totalClientes," clientes cadastrados, digite 1 se deseja consultar")
      escreva("algum específico ou digite 2 para consultar todos: ")
      leia(consulta)
      se consulta = 1 entao
         escreva("Qual o número de cadastro você deseja consultar? ")
         leia(indiceCliente)
         se indiceCliente > totalClientes entao
            escreval("Esse número de cadastro não existe. Há apenas",totalClientes," cadastrados.")
         senao
            escreval("Nome:",vetorNomes[indiceCliente])
            escreval("Sexo:",vetorSexo[indiceCliente])
            escreval("Idade:",vetorIdade[indiceCliente])
            escreval("CPF:",vetorCpf[indiceCliente])
         fimse
      senao
           gerarCaracteres()
         para i <- 1 ate totalClientes faca
            escreval("Nome: ",vetorNomes[i]," - Sexo: ",vetorSexo[i]," - Idade:",vetorIdade[i]," - CPF:",vetorCpf[i])
         fimpara
      fimse
   senao
      escreval("NÃO HÁ CLIENTES CADASTRADOS!")
   fimse
   gerarCaracteres()
   // Pergunta ao usuário se deseja fazer outra consulta ou voltar ao menu:
   escreva("Digite 1 se deseja fazer outra consulta ou 2 para voltar ao menu: ")
   leia(voltarMenu)
   se voltarMenu = 1 entao
      chamarfuncao <- consultaCliente()
   senao
      limpatela
   fimse
   retorne verdadeiro
fimfuncao

// FUNÇÃO PARA CONSULTAR DESTINOS:
Funcao consultaDestino:logico

// Variáveis locais:
Var consulta, indiceDestino, i, voltarMenu: inteiro

Inicio

   limpatela
   gerarCaracteres()
   // Verifica se há destinos cadastrados e pergunta ao usuário se deseja
   // consultar algum individualmente ou todos:
   se totalDestinos > 0 entao
      escreval("Há ", totalDestinos, " destinos cadastrados, digite 1 se deseja consultar")
      escreva("algum específico ou digite 2 para consultar todos: ")
      leia(consulta)
      se consulta = 1 entao
         escreva("Qual o número de cadastro do destino que você deseja consultar? ")
         leia(indiceDestino)
         se indiceDestino > totalDestinos entao
            escreval("Esse número de cadastro não existe. Há apenas ", totalDestinos, " destinos cadastrados.")
         senao
            escreval("Destino: ", vetorDestino[indiceDestino])
            escreval("Valor: R$ ", vetorValor[indiceDestino])
         fimse
      senao
         para i <- 1 ate totalDestinos faca
            escreval("Destino: ", vetorDestino[i], " - Valor: R$ ", vetorValor[i])
         fimpara
      fimse
   senao
      escreval("NÃO HÁ DESTINOS CADASTRADOS!")
   fimse

   gerarCaracteres()
   // Pergunta ao usuário se deseja fazer outra consulta ou voltar ao menu:
   escreva("Digite 1 se deseja fazer outra consulta ou 2 para voltar ao menu: ")
   leia(voltarMenu)

   se voltarMenu = 1 entao
      chamarfuncao <- consultaDestino()
   senao
      limpatela
   fimse

   retorne verdadeiro
Fimfuncao

// PROGRAMA PRINCIPAL:
Inicio

   // ABRINDO O MENU E PEDINDO AO USUÁRIO QUAL OPÇÃO ELE DESEJA ACESSAR EM UM
   // LAÇO DE REPETIÇÃO QUE SÓ IRÁ PARAR QUANDO O USUÁRIO DIGITAR "0" PARA SAIR
   opcao<-999
   repita
      menu()
      escolha opcao
      caso 0
         gerarCaracteres()
         escreval("Encerrando...")
   // Aqui é dado 2 seg para o usuário ler a mensagem do menu ("Encerrando...")
   // antes de limpar a tela
         timer 2000
         limpatela
         timer 0
      caso 1
         chamarfuncao <- cadastrocliente()
      caso 2
         chamarfuncao <- cadastroDestino()
      caso 3
         chamarfuncao <- consultaCliente()
      caso 4
         chamarfuncao <- consultaDestino()
      outrocaso
         gerarCaracteres()
         escreval("Opção inválida.")
   // Aqui é dado 2 segundos para o usuário ler a mensagem "Opção inválida."
   // antes de limpar a tela. Isso também evita um bug do VisualG, onde ele
   // sobrepõe o menu quando repete o laço.
         timer 2000
         limpatela
         timer 0
      fimescolha
   ate opcao = 0
fimalgoritmo