package Controller;
import java.sql.*;
public class DBConnection {
	
	private static final String url = "jdbc:mysql://localhost:3306/construction_agency";
	private static final String user = "root";
	private static final String pass = "";

	public static Connection getConnection() throws SQLException{
		
		return DriverManager.getConnection(url,user,pass);
	}
}
