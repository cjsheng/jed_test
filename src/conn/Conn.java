package conn;

/**
 * Created by xuhaihua on 17-3-18.
 */
import java.sql.*;

public class Conn {

    public static Connection getConn(String url, String user, String pass) {
        Connection   conn = null;
        try {
            conn = DriverManager.getConnection(url, user, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
