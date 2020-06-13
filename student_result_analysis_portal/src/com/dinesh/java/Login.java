package com.dinesh.java;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dinesh.java.LoginBean;
import com.dinesh.java.LoginDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName= request.getParameter("usr");
		String password= request.getParameter("pwd");
		
		LoginBean loginbean = new LoginBean();
		loginbean.setUserName(userName);
		loginbean.setPassword(password);
		
		LoginDao logindao= new LoginDao();
		try {
			String userValidate=logindao.authenticateUser(loginbean);
			
			if(userValidate.equals("User_Role")) {
				
				HttpSession session=request.getSession();
				session.setMaxInactiveInterval(60);
				//creating a session
				session.setAttribute("User", userName);
				//setting session attribute
				request.setAttribute("userName", userName);
				
				request.getRequestDispatcher("admin.jsp").forward(request, response);
				
			}
			else {
				System.out.println("Error Message = "+userValidate);
				request.setAttribute("errMessage", userValidate);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		
		
		
		
		
		
		
		/*String dbname ="jdbc:mysql://localhost:3306/log_reg";
		String username ="testuser";
		String pass ="root";
		try {
			String name=request.getParameter("usr");
			String pwd=request.getParameter("pwd");
			String dbuname=null;
			String dbpwd=null;
			String sql="select * from portal where user_name=? and Password=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(dbname,username,pass);
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				dbuname=rs.getString("user_name");
				dbpwd=rs.getString("Password");
			}
			if(name.equals(dbuname)&& pwd.equals(dbpwd)) {
				//out.println("You have successfully Logged in");
				RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
				rd.include(request, response);
			}else {
				//response.sendRedirect("login.jsp");
				 request.setAttribute("errorMessage", "Invalid user or password"); 
		 		  RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				  rd.include(request, response);
				 }
			*/
			
			
		}catch(IOException e1) {
			e1.printStackTrace();
		}catch(Exception e2) {
			e2.printStackTrace();
		}


	
}}
