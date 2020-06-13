package com.dinesh.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dbname ="jdbc:mysql://localhost:3306/log_reg";
		String username ="testuser";
		String pass ="root";
		
		try {
			String name=request.getParameter("name");
			String ph=request.getParameter("ph");//parsing string from int
			//int num=Integer.parseInt(ph);
			String email=request.getParameter("email");
			String uname=request.getParameter("usr");
			String pwd=request.getParameter("pwd");
			
			String sql="insert into users (Name,Phone_number,Email_id,user_name,Password) values(?,?,?,?,?)";
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(dbname,username,pass);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, ph);
			ps.setString(3, email);
			ps.setString(4, uname);
			ps.setString(5, pwd);
			ps.executeUpdate();
			//PrintWriter out=response.getWriter();
			//out.println("You have sucessfully registered!");
		response.sendRedirect("login.jsp");
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}


