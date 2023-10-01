package principal;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
        ClienteDAO clienteDAO = new ClienteDAO();
        DestinoDAO destinoDAO = new DestinoDAO();
        Scanner scanner = new Scanner(System.in);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

        int opcao;
        do {
            System.out.println("===== Menu Principal =====");
            System.out.println("1 - Cadastrar Cliente");
            System.out.println("2 - Excluir Cliente");
            System.out.println("3 - Atualizar Cliente");
            System.out.println("4 - Listar Clientes");
            System.out.println("5 - Cadastrar Destino");
            System.out.println("6 - Excluir Destino");
            System.out.println("7 - Atualizar Destino");
            System.out.println("8 - Listar Destinos");
            System.out.println("9 - Sair");
            System.out.print("Escolha uma opção: ");
            opcao = scanner.nextInt();

            switch (opcao) {
                case 1: {
                	
                    // Cadastrar Cliente
                	
                    Cliente cliente = new Cliente();
                    System.out.print("Digite o nome: ");
                    cliente.setNome(scanner.next());
                    System.out.print("Digite a data de nascimento (yyyyMMdd): ");
                    String dataNascimentoString = scanner.next();
                    try {
                        cliente.setDataNascimento(dateFormat.parse(dataNascimentoString));
                    } catch (ParseException e) {
                        System.out.println("Formato de data inválido. Use yyyyMMdd.");
                        continue;
                    }
                    System.out.print("Digite a cidade: ");
                    cliente.setCidade(scanner.next());
                    System.out.print("Digite o estado: ");
                    cliente.setEstado(scanner.next());
                    System.out.print("Digite o país: ");
                    cliente.setPais(scanner.next());
                    System.out.print("Digite o CPF: ");
                    cliente.setCpf(scanner.nextLong());
                    System.out.print("Digite o login: ");
                    cliente.setLogin(scanner.next());
                    System.out.print("Digite a senha: ");
                    cliente.setSenha(scanner.next());

                    clienteDAO.save(cliente);
                    System.out.println("Cliente cadastrado com sucesso!");
                    break;
                }
                case 2: {
                	
                    // Excluir Cliente
                	
                    System.out.print("Digite o ID do cliente a ser excluído: ");
                    int idCliente = scanner.nextInt();
                    System.out.print("Digite o login do cliente: ");
                    String login = scanner.next();
                    clienteDAO.removeById(idCliente, login);
                    System.out.println("Cliente removido com sucesso!");
                    break;
                }
                case 3: {
                	
                    // Atualizar Cliente
                	
                    Cliente cliente = new Cliente();
                    System.out.print("Digite o ID do cliente a ser atualizado: ");
                    cliente.setIdCliente(scanner.nextInt());
                    System.out.print("Digite o novo nome: ");
                    cliente.setNome(scanner.next());
                    System.out.print("Digite a nova data de nascimento (yyyyMMdd): ");
                    String novaDataNascimentoString = scanner.next();
                    try {
                        cliente.setDataNascimento(dateFormat.parse(novaDataNascimentoString));
                    } catch (ParseException e) {
                        System.out.println("Formato de data inválido. Use yyyyMMdd.");
                        continue;
                    }
                    System.out.print("Digite a nova cidade: ");
                    cliente.setCidade(scanner.next());
                    System.out.print("Digite o novo estado: ");
                    cliente.setEstado(scanner.next());
                    System.out.print("Digite o novo país: ");
                    cliente.setPais(scanner.next());
                    System.out.print("Digite o novo CPF: ");
                    cliente.setCpf(scanner.nextLong());
                    System.out.print("Digite o novo login: ");
                    cliente.setLogin(scanner.next());
                    System.out.print("Digite a nova senha: ");
                    cliente.setSenha(scanner.next());

                    clienteDAO.update(cliente);
                    System.out.println("Cliente atualizado com sucesso!");
                    break;
                }
                case 4: {
                	
                    // Listar Clientes
                	
                    List<Cliente> clientes = clienteDAO.getClientes();
                    for (Cliente cliente : clientes) {
                        System.out.println("ID: " + cliente.getIdCliente());
                        System.out.println("Nome: " + cliente.getNome());
                        System.out.println("Data de Nascimento: " + cliente.getDataNascimento());
                        System.out.println("Cidade: " + cliente.getCidade());
                        System.out.println("Estado: " + cliente.getEstado());
                        System.out.println("País: " + cliente.getPais());
                        System.out.println("CPF: " + cliente.getCpf());
                        System.out.println("Login: " + cliente.getLogin());
                        System.out.println("Senha: " + cliente.getSenha());
                        System.out.println("--------------------");
                    }
                    break;
                }
                case 5: {
                	
                    // Cadastrar Destino
                	
                    Destino destino = new Destino();
                    System.out.print("Digite a origem: ");
                    destino.setOrigem(scanner.next());
                    System.out.print("Digite o destino: ");
                    destino.setDestino(scanner.next());

                    destinoDAO.save(destino);
                    System.out.println("Destino cadastrado com sucesso!");
                    break;
                }
                case 6: {
                	
                    // Excluir Destino
                	
                    System.out.print("Digite o ID do destino que deseja excluir: ");
                    int idDestino = scanner.nextInt();
                    destinoDAO.removeById(idDestino);
                    System.out.println("Destino removido com sucesso!");
                    break;
                }
                case 7: {
                	
                    // Atualizar Destino
                	
                    Destino destino = new Destino();
                    System.out.print("Digite o ID do destino a ser atualizado: ");
                    destino.setIdDestino(scanner.nextInt());
                    System.out.print("Digite a nova origem: ");
                    destino.setOrigem(scanner.next());
                    System.out.print("Digite o novo destino: ");
                    destino.setDestino(scanner.next());

                    destinoDAO.update(destino);
                    System.out.println("Destino atualizado com sucesso!");
                    break;
                }
                case 8: {
                	
                    // Listar Destinos
                	
                    List<Destino> destinos = destinoDAO.getDestinos();
                    for (Destino destino : destinos) {
                        System.out.println("ID: " + destino.getIdDestino());
                        System.out.println("Origem: " + destino.getOrigem());
                        System.out.println("Destino: " + destino.getDestino());
                        System.out.println("--------------------");
                    }
                    break;
                }
                case 9: {
                	
                    // Sair
                	
                    System.out.println("=== Obrigado e volte sempre! Recodefly ===");
                    break;
                }
                default: {
                    System.out.println("Opção inválida. Tente novamente.");
                }
            }
        } while (opcao != 9);
        scanner.close();
    }
}
