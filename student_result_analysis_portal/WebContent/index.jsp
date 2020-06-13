<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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

<body  onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload=""  ><!-- onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="" -->
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


		 <section class="bg"> 
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
		</section> 



	</div>

</body>
</html>

<!--  <script type="text/javascript">

$(document).ready(function(){
$("#btn-submit").on("click",function (){
var registerno=	$("#regno").val();//id of register number text box of index.jsp
 var dateofbirth=$("#dob").val(); 
 if (country_id === ""||country_id===null)
 {
     $("#error").html("All fields are mandatory.");//this message will display in error div.
 }
 else
 {
 $("#error").html("");//show blank message when all select box doesn't have any null value.
	$.ajax({
	url:"res_process.jsp",//your servlet or jsp page name.
	method:"POST",//HTTP method.
	data:{id:registerno,dob:dateofbirth},
	success:function(data) 
	{
		 $("#success").html(data);//output or response will display in success div.
		/*  $("#form").trigger("reset");//this will reset the form. */
	}
	}

})
})
</script>  -->
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

 <!-- <script> 
            $(document).ready(function() { 
                $("#btn-submit").click(function() { 
                    var fn = $("#regno").val(); 
                    var db= $("#dob").val();
                    $.post("res_process.jsp", { 
                        id: fn , dob:db
                    }, function(data) { 
                        $("#success").html(data); 
                    }); 
  
                }); 
            }); 
        </script>  -->




