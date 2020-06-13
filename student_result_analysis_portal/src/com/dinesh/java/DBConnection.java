package com.dinesh.java;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection createConnection() {
		Connection con=null;
		String dbName="jdbc:mysql://localhost:3306/log_reg";
		String username="testuser";
		String password="root";
		
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			con=DriverManager.getConnection(dbName,username,password);
			System.out.println("Post establishing a DB Connection -"+con);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return con;
	}

}
