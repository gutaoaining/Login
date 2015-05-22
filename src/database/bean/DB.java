package database.bean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DB {   
    public static Connection getConn() throws Exception{ 
    //第一步：加载MySQL的JDBC的驱动 
    Class.forName("com.mysql.jdbc.Driver"); 

    String url = "jdbc:mysql://127.0.0.1:3306/student";
    String user = "root"; 
    String password = "root";

    Connection con = DriverManager.getConnection(url, user, password); 
    return con; 
    } 

	public static Statement getStatement() throws Exception{
		return getConn().createStatement();
	}

    
}

