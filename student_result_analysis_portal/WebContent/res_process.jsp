<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>STUDENT RESULT ANALYSIS PORTAL</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<link rel="stylesheet" type="text/css"
	href="datepicker/bootstrap-datepicker3.min.css">
<link rel="stylesheet" type="text/css"
	href="datepicker/bootstrap.min.css">
	
<script type="text/javascript" src="datepicker/jquery-2.2.3.min.js"></script>
<script type="text/javascript"
	src="datepicker/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="datepicker/bootstrap.min.js"></script>


<!-- <script src="https://kit.fontawesome.com/ec3905fcc5.js"></script> -->

<link rel="stylesheet" type="text/css" href="fontawesome/css/all.css">
<script type="text/javascript" src="fontawesome/js/all.js"></script>
<script type="text/javascript" src="js/indexjs.js"></script>
 <script type="text/javascript"> 
        window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        } 
    </script>    
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="" >  
<div class="">
		<input type="checkbox" id="check"> <label for="check">
			<i class="fas fa-bars" id="btn"></i>
			 <i class="fas fa-times" id="cancel"></i>
		</label>
		<div class="sidebar">
			<header>Menu</header>
			<ul>
				<!--<li><a href="#"><i class="fas fa-align-left"></i></a></li>  -->
				<li><a href="login.jsp"><i
						class="fas fa-chalkboard-teacher"></i>Admin</a></li>
			</ul>
		</div>


		<!--  <section>  -->
			<div class="header_text">STUDENT RESULT ANALYSIS PORTAL</div>

			<div class="resform">
				<form onsubmit="return validate();" id="form" name="form" action="res_process.jsp" method="post">

					Enter Register Number <input id="regno" type="text" name="id" value="" autocomplete="off" /> 
					
					D:O:B<input id="dob" type="text" name="dob" value="" autocomplete="off" />
					
					 <input id="btn-submit" type="submit" value="Submit" /> 
			<!-- 		    <button type="Submit" id="btn-sub"> 
              Submit
          </button> --> 
				</form>
 			<div style="color:red;" id="error"></div><!-- error message will display here. --->
            <div id="success"></div><!-- output message will display here. --->
			</div>
		<!-- </section>  -->



	</div>
	<%
	
		try {

			String dbname = "jdbc:mysql://localhost:3306/log_reg";
			String username = "testuser";
			String pass = "root";

			Class.forName("com.mysql.jdbc.Driver");
			
			String id = request.getParameter("id");
			//int reg = Integer.parseInt(id);
			String dob=request.getParameter("dob");
		     //int stuDob=Integer.parseInt(dob);

			Connection con = DriverManager.getConnection(dbname, username, pass);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from results where Reg_no = '" + id + "' and  DOB = '" + dob + "' ");

			if (!rs.next()) {
				out.println("Enter Valid Register number");
			}

			else {
				
				
	%>
	
	<div class="container">
	 
		<table id="td01">
		
		 

			<tr>
				<td class="del-td">Name</td>
				<td><%=rs.getString(3)%> [<%=rs.getString(4)%>]</td>
				</tr>

			<tr>
				<td class="del-td">Register number</td>
				<td><%=rs.getString(2)%></td>
			</tr>

			<tr>
				<td class="del-td">Department</td>
				<td><%=rs.getString(11  )%></td>
			</tr>
		</table>

		<table id="td02">
			<tr>
				<th class="headtd02">Subject code</th>
				<th class="headtd02">Course Description</th>
				<th class="headtd02">Grade</th>
				<th class="headtd02">Result</th>
			</tr>
			<!--<tdrs.getString(7)(7) %></td>  -->
			<tr>
				<td class="del-td2"><%=rs.getString(5)%></td>
				<td><%=rs.getString(12)%></td>
				<td><%=rs.getString(18)%></td>
				<td><%=rs.getString(24)%></td>
			</tr>

			<tr>
				<td class="del-td2"><%=rs.getString(6)%></td>
				<td><%=rs.getString(13)%></td>
				<td><%=rs.getString(19)%></td>
				<td><%=rs.getString(25)%></td>
			</tr>
			<tr>
				<td class="del-td2"><%=rs.getString(7)%></td>
				<td><%=rs.getString(14)%></td>
				<td><%=rs.getString(20)%></td>
				<td><%=rs.getString(26)%></td>
			</tr>
			<tr>
				<td class="del-td2"><%=rs.getString(8)%></td>
				<td><%=rs.getString(15)%></td>
				<td><%=rs.getString(21)%></td>
				<td><%=rs.getString(27)%></td>
			</tr>
			<tr>
				<td class="del-td2"><%=rs.getString(9)%></td>
				<td><%=rs.getString(16)%></td>
				<td><%=rs.getString(22)%></td>
				<td><%=rs.getString(28)%></td>
			</tr>
			<tr>
				<td class="del-td2"><%=rs.getString(10)%></td>
				<td><%=rs.getString(17)%></td>
				<td><%=rs.getString(23)%></td>
				<td><%=rs.getString(29)%></td>
			</tr>
    
		</table>

		<br />
		
 
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
				out.println("An Exception is occurred: " + e.getMessage());
			}
	
	
		%>
	</div>


</body>
</html>

<script>
	$(document).ready(function() {
		$("#dob").datepicker({
			format : 'yyyy-mm-dd'
		});
		$("#dob").on("change", function() {
			var fromdate = $(this).val();
			alert(fromdate);
		});
	});
</script>