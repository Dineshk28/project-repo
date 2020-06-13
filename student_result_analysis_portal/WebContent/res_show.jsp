<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mycss.css">
</head>
<body>

<%
	
		try {

			String dbname = "jdbc:mysql://localhost:3306/log_reg";
			String username = "testuser";
			String pass = "root";
			String sub=request.getParameter("sub");

			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(dbname,username,pass);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from backlog_res where subjects='"+sub+"'");	
			
			if (!rs.next()) {
				out.println("Enter Valid subjects name");
			}
			else{
				%>
				
	<div class="div-td">
	 
		<table id="td02">																			
																							
				
		<tr>
		<th class="headtd02">REGISTER NUMBER</th>
		<th class="headtd02">NAME</th>
		</tr>
		<tr>
		<td class="del-td"><%=rs.getString(4) %></td>
		<td class="del-td"> <%=rs.getString(8) %></td>
		</tr>
		<tr>
		<td class="del-td"><%=rs.getString(5) %></td>
		<td class="del-td"> <%=rs.getString(9) %></td>
		</tr>
		<tr>
		<td class="del-td"><%=rs.getString(6) %></td>
		<td class="del-td"> <%=rs.getString(10) %></td>
		</tr>
		<tr>
		<td class="del-td"><%=rs.getString(7) %></td>
		<td class="del-td"> <%=rs.getString(11) %></td>
		</tr>
		
		</table>
</div>		
				
				
				<% 
			}
		}
catch(Exception e){
	e.printStackTrace();
	out.println("An Error is occured"+e.getMessage());
	
}
					
%>

</body>
</html>