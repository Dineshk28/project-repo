<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>


<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/login.js"></script>

<link rel="stylesheet" type="text/css" href="fontawesome/css/all.css">
<script src="fontawesome/js/all.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	
	 <script type="text/javascript"> 
        window.history.forward(); 
        function noBack() { 
            window.history.forward(); 
        } 
    </script> 
	
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">


	
	<img class="wave" src="img/wave.png">
	<div class="container">
		<div class="img">
			<img src="img/bg.svg">
		</div>
		
		<div class="login-content">
		
		<div class="i home-log" > 
		<a href="index.jsp" title="GOTO HOME" >
           		  <i class="fas fa-home"></i></a>
           		   </div> 
			<form onsubmit="return validate();" action="<%=request.getContextPath()%>/loginServlet" method="post">
				<img src="img/avatar.svg">
				<h2 class="title">Welcome</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Username</h5>
           		   		<input  id="uname" type="text" name="usr" class="input">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Password</h5>
           		    	<input id="pass" type="password" name="pwd" class="input">
            	   </div>
            	</div>
            	<span style="color:red"><%=(request.getAttribute("errMessage")==null)? "": request.getAttribute("errMessage") %></span>
            	<input  type="submit" class="btn" value="Login">
            	 <div class="msg">Not Registered?          	 
            	  </div>
            	  <div class="reg-sty"> <a class="font15" href="registration.jsp" title="Registration link" target="_self">Sign Up</a></div>
            	
            	
            	
            	 
            </form>
          <%-- <h2><%=request.getAttribute("errorMessage")%></h2>  --%>
        </div>
         
    </div>
    
    <script type="text/javascript" src="js/main.js"></script>


</body>
</html>