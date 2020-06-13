package com.dinesh.java;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dinesh.java.LoginBean;

public class LoginDao {
	public String authenticateUser(LoginBean loginbean) {
		String userName=loginbean.getUserName();
		String password=loginbean.getPassword();
		
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		String sql="select User_name,Password from users";
		
		String userNameDB="";
		String passwordDB="";
		/* String roleDB=""; */
		
		try {
			con=DBConnection.createConnection();
			st=con.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()) {
			userNameDB=rs.getString("User_name")	;
			passwordDB=rs.getString("Password");
		/*	roleDB=rs.getString("role");*/

			if(userName.equals(userNameDB) && password.equals(passwordDB) ) {
				return "User_Role";
			}
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "Invalid user credentials";
	}

	}
