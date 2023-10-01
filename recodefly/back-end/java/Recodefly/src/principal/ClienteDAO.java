package principal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rset = null;

    public void save(Cliente cliente) {
        String sql = "INSERT INTO Cliente (nome, dataNascimento, cidade, estado, pais, cpf, login, senha) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, cliente.getNome());
            pstm.setDate(2, new java.sql.Date(cliente.getDataNascimento().getTime()));
            pstm.setString(3, cliente.getCidade());
            pstm.setString(4, cliente.getEstado());
            pstm.setString(5, cliente.getPais());
            pstm.setLong(6, cliente.getCpf());
            pstm.setString(7, cliente.getLogin());
            pstm.setString(8, cliente.getSenha());
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }
    }

    public void removeById(int idCliente, String login) {
        String sql = "DELETE FROM Cliente WHERE idCliente = ? AND login = ?";

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idCliente);
            pstm.setString(2, login);
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }
    }

    public void update(Cliente cliente) {
        String sql = "UPDATE Cliente SET nome = ?, dataNascimento = ?, cidade = ?, estado = ?, pais = ?, cpf = ?, senha = ? WHERE idCliente = ? AND login = ?";

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, cliente.getNome());
            pstm.setDate(2, new java.sql.Date(cliente.getDataNascimento().getTime()));
            pstm.setString(3, cliente.getCidade());
            pstm.setString(4, cliente.getEstado());
            pstm.setString(5, cliente.getPais());
            pstm.setLong(6, cliente.getCpf());
            pstm.setString(7, cliente.getSenha());
            pstm.setInt(8, cliente.getIdCliente());
            pstm.setString(9, cliente.getLogin());
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }
    }

    public List<Cliente> getClientes() {
        String sql = "SELECT * FROM Cliente";
        List<Cliente> clientes = new ArrayList<>();

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            rset = pstm.executeQuery();

            while (rset.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdCliente(rset.getInt("idCliente"));
                cliente.setNome(rset.getString("nome"));
                cliente.setDataNascimento(rset.getDate("dataNascimento"));
                cliente.setCidade(rset.getString("cidade"));
                cliente.setEstado(rset.getString("estado"));
                cliente.setPais(rset.getString("pais"));
                cliente.setCpf(rset.getLong("cpf"));
                cliente.setLogin(rset.getString("login"));
                cliente.setSenha(rset.getString("senha"));
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }

        return clientes;
    }

    public Cliente getClienteById(int idCliente, String login) {
        String sql = "SELECT * FROM Cliente WHERE idCliente = ? AND login = ?";
        Cliente cliente = null;

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idCliente);
            pstm.setString(2, login);
            rset = pstm.executeQuery();

            if (rset.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rset.getInt("idCliente"));
                cliente.setNome(rset.getString("nome"));
                cliente.setDataNascimento(rset.getDate("dataNascimento"));
                cliente.setCidade(rset.getString("cidade"));
                cliente.setEstado(rset.getString("estado"));
                cliente.setPais(rset.getString("pais"));
                cliente.setCpf(rset.getLong("cpf"));
                cliente.setLogin(rset.getString("login"));
                cliente.setSenha(rset.getString("senha"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }

        return cliente;
    }

    private void closeConnections() {
        try {
            if (rset != null) {
                rset.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
