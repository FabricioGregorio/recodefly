package principal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DestinoDAO {

    Connection conn = null;
    PreparedStatement pstm = null;
    ResultSet rset = null;

    public void save(Destino destino) {
        String sql = "INSERT INTO Destino (origem, destino) VALUES (?, ?)";

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, destino.getOrigem());
            pstm.setString(2, destino.getDestino());
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }
    }

    public void removeById(int idDestino) {
        String sql = "DELETE FROM Destino WHERE idDestino = ?";

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idDestino);
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }
    }

    public void update(Destino destino) {
        String sql = "UPDATE Destino SET origem = ?, destino = ? WHERE idDestino = ?";

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, destino.getOrigem());
            pstm.setString(2, destino.getDestino());
            pstm.setInt(3, destino.getIdDestino());
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }
    }

    public List<Destino> getDestinos() {
        String sql = "SELECT * FROM Destino";
        List<Destino> destinos = new ArrayList<>();

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            rset = pstm.executeQuery();

            while (rset.next()) {
                Destino destino = new Destino();
                destino.setIdDestino(rset.getInt("idDestino"));
                destino.setOrigem(rset.getString("origem"));
                destino.setDestino(rset.getString("destino"));
                destinos.add(destino);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }

        return destinos;
    }

    public Destino getDestinoById(int idDestino) {
        String sql = "SELECT * FROM Destino WHERE idDestino = ?";
        Destino destino = null;

        try {
            conn = Conexao.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idDestino);
            rset = pstm.executeQuery();

            if (rset.next()) {
                destino = new Destino();
                destino.setIdDestino(rset.getInt("idDestino"));
                destino.setOrigem(rset.getString("origem"));
                destino.setDestino(rset.getString("destino"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }

        return destino;
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
