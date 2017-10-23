package base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DanConn {
	private static String driver="sun.jdbc.odbc.JdbcOdbcDriver";
	private static String url="jdbc:odbc:Edn";
	private static String username="sa";
	private static String password="123456";
	private static Connection conn=null;
	static{
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,password);
			System.out.println("数据库连接成功");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//连接数据库
	public static Connection openDB(){
		try {
			//判断连接状态
			if(conn.isClosed()){
				conn = DriverManager.getConnection(url,username,password);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
