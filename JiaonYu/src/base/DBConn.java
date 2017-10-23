package base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConn {
	private static String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url="jdbc:sqlserver://localhost\\SQL2005:1433;databasename=textname";
	private static String username="sa";
	private static String password="123456";
	private static Connection conn=null;
	static{
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,password);
			System.out.println("���ݿ����ӳɹ�");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//�������ݿ�
	public static Connection openDB(){
		try {
			//�ж�����״̬
			if(conn.isClosed()){
				conn = DriverManager.getConnection(url,username,password);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
