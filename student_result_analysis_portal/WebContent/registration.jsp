<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>

<script type="text/javascript" src="js/regjs.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">


<link rel="stylesheet" type="text/css" href="fontawesome/css/all.css">
<script src="fontawesome/js/all.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
	
	
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

			<form onsubmit="return validate();" action="Registration"
				method="post">


				<h2 class="title">Sign Up</h2>
				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user-edit"></i>
					</div>
					<div class="div">
						<h5>User Name</h5>

						<input id="name" type="text"  name="name" class="input"/>
					</div>
				</div>
				<div class="input-div pass">
					<div class="i">

						<i class="fas fa-mobile-alt"></i>
					</div>
					<div class="div">
						<h5>Phone Number</h5>

						<input id="phno" type="number" name="ph" class="input" />
					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-mail-bulk"></i>
					</div>
					<div class="div">
						<h5>Email ID</h5>
						<input id="email" type="text"  name="email" class="input" />
					</div>
				</div>
				<div class="input-div pass">
					<div class="i">

						<i class="fas fa-user-alt"></i>
					</div>
					<div class="div">
						<h5>Create Username</h5>
						<input id="uname" type="text" name="usr" class="input"/>
					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-user-lock"></i>
					</div>
					<div class="div">
						<h5>Create Password</h5>

						<input id="pwd" type="password" name="pwd" class="input" />
					</div>
				</div>


				<input class="btn" type="submit" value="Register" />
				
				 <div class="msg">Already Registered ?          	 
            	  </div>
            	  <div class="reg-sty"> <a class="font15" href="login.jsp"  target="_self">Sign in</a></div>

			</form>

		</div>

	</div>

	<script type="text/javascript" src="js/main.js"></script>

</body>
</html>