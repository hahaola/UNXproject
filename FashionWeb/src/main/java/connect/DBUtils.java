package connect;

import java.sql.*;

public class DBUtils {

    public Connection makeConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        }
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

//    private final String serverName = "DESKTOP-6107QRH";
//    private final String dbName = "FashionShop";
//    private final String portNumber = "1433";
//    private final String instance="";
//    private final String userID = "sa";
//    private final String password = "12";
    
    private final String serverName = "LAPTOP-9FFCD11F";
    private final String dbName = "FashionShop";
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "sa";
    private final String password = "binbo123";
    
    public static void main(String[] args) {
        try {
                System.out.println(new DBUtils().makeConnection());
        } catch (Exception e) {

        }
    }

}
