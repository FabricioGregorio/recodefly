Algoritmo "recodefly_pseudocodigo"
//  
//  
// Descri��o   : Menu de cadastro para a ag�ncia de viagens(fict�cia)RecodeFly
// Autor(a)    : Fabr�cio Greg�rio
// Data atual  : 05/08/2023
Var

   // VARIAVEL PRA CHAMAR AS FUN��ES:
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
   escreva("DIGITE QUAL OP��O DESEJA ACESSAR: ")
   leia(opcao)
fimprocedimento

// FUN��O PARA CADASTRAR CLIENTES:
funcao cadastroCliente:logico
// Vari�veis locais:
var nome,sexo:caractere
   idade,cpf:inteiro
Inicio
   limpatela
   gerarCaracteres()
   // Verificando se h� vagas para cadastro e recebendo os dados:
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

      // Timer de 1.5s para o usu�rio ver a mensagem na tela antes de limpar
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

// FUN��O PARA CADASTRAR DESTINOS:
Funcao cadastroDestino:logico
// Vari�veis locais:
var destino:caracter
   valor:real
Inicio
   limpatela
   gerarCaracteres()
   // Verificando se h� vagas para cadastro de destinos:
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

      // Timer de 1.5s para o usu�rio ver a mensagem na tela antes de limpar
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

// FUN��O PARA CONSULTAR CLIENTES:
Funcao consultaCliente:logico

// Vari�veis locais:
var consulta,indiceCliente,i,voltarMenu:inteiro

Inicio

   limpatela
   gerarCaracteres()
   // Verifica se h� cadastros de clientes e pergunta ao usu�rio se quer
   // consultar individualmente algum cadastro ou consultar todos:
   se totalClientes > 0 entao
      escreval("H�",totalClientes," clientes cadastrados, digite 1 se deseja consultar")
      escreva("algum espec�fico ou digite 2 para consultar todos: ")
      leia(consulta)
      se consulta = 1 entao
         escreva("Qual o n�mero de cadastro voc� deseja consultar? ")
         leia(indiceCliente)
         se indiceCliente > totalClientes entao
            escreval("Esse n�mero de cadastro n�o existe. H� apenas",totalClientes," cadastrados.")
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
      escreval("N�O H� CLIENTES CADASTRADOS!")
   fimse
   gerarCaracteres()
   // Pergunta ao usu�rio se deseja fazer outra consulta ou voltar ao menu:
   escreva("Digite 1 se deseja fazer outra consulta ou 2 para voltar ao menu: ")
   leia(voltarMenu)
   se voltarMenu = 1 entao
      chamarfuncao <- consultaCliente()
   senao
      limpatela
   fimse
   retorne verdadeiro
fimfuncao

// FUN��O PARA CONSULTAR DESTINOS:
Funcao consultaDestino:logico

// Vari�veis locais:
Var consulta, indiceDestino, i, voltarMenu: inteiro

Inicio

   limpatela
   gerarCaracteres()
   // Verifica se h� destinos cadastrados e pergunta ao usu�rio se deseja
   // consultar algum individualmente ou todos:
   se totalDestinos > 0 entao
      escreval("H� ", totalDestinos, " destinos cadastrados, digite 1 se deseja consultar")
      escreva("algum espec�fico ou digite 2 para consultar todos: ")
      leia(consulta)
      se consulta = 1 entao
         escreva("Qual o n�mero de cadastro do destino que voc� deseja consultar? ")
         leia(indiceDestino)
         se indiceDestino > totalDestinos entao
            escreval("Esse n�mero de cadastro n�o existe. H� apenas ", totalDestinos, " destinos cadastrados.")
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
      escreval("N�O H� DESTINOS CADASTRADOS!")
   fimse

   gerarCaracteres()
   // Pergunta ao usu�rio se deseja fazer outra consulta ou voltar ao menu:
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

   // ABRINDO O MENU E PEDINDO AO USU�RIO QUAL OP��O ELE DESEJA ACESSAR EM UM
   // LA�O DE REPETI��O QUE S� IR� PARAR QUANDO O USU�RIO DIGITAR "0" PARA SAIR
   opcao<-999
   repita
      menu()
      escolha opcao
      caso 0
         gerarCaracteres()
         escreval("Encerrando...")
   // Aqui � dado 2 seg para o usu�rio ler a mensagem do menu ("Encerrando...")
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
         escreval("Op��o inv�lida.")
   // Aqui � dado 2 segundos para o usu�rio ler a mensagem "Op��o inv�lida."
   // antes de limpar a tela. Isso tamb�m evita um bug do VisualG, onde ele
   // sobrep�e o menu quando repete o la�o.
         timer 2000
         limpatela
         timer 0
      fimescolha
   ate opcao = 0
fimalgoritmo