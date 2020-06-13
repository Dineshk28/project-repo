
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dinesh.java.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
        <script   src="datepicker/jquery-2.2.3.min.js"></script>
<link href="datepicker/bootstrap.min.css" rel="stylesheet">
<script src="datepicker/bootstrap.min.js"></script>
<script type="text/javascript" src="datepicker/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="datepicker/bootstrap-datepicker3.min.css">
<link rel="stylesheet" type="text/css" href="css/ddcss.css">
<!-- <script type="text/javascript">
function redirect(){
	var url="http://localhost:8085/student_result_analysis_portal/login.jsp";
	window.location.replace(url);
}
</script> -->
    </head>
    <body>
        
        <div class="header_text">STUDENT RESULT ANALYSIS PORTAL
       <!--  <button id="login_page" class="btn-logout" onClick="redirect()">Logout</button> -->
       <div class="logout_div"><a id="login_page" class="btn-logout" href="<%=request.getContextPath()%>/logoutServlet">Logout</a></div>
           </div> 
            <div class="container">
           <span style="text-transform:uppercase">welcome <%=request.getAttribute("userName") %></span> 
           
            <form id="form">
                <table class="table table-hover">
                    <tr>
                        <td style="width:20%">Year</td>
                        <td >
                            <select class="form-control" id="country_id">
                                <option disabled="" value="" selected="">Select Year</option>
                                <%
                                    Connection con = DB.getConnection();
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from countries");
                                    while (rs.next()) {
                                %>
                                <option value="<%=rs.getString("id")%>"> <%=rs.getString("country_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td style="width:20%">Semester</td>
                        <td id="state_id"><!--  states will display here --->
                            <select class="form-control" name="state">
                                <option>Select Semester</option>
                            </select>      
                        </td>
                    </tr>
                    <tr>
                        <td style="width:20%">Subject</td>
                        <td id="city_name"><!--  cities will display here --->
                            <select name="city" class="form-control">
                                <option>Select Subject</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td><input type="button" id="submit" class="btn-logout" value="Submit"></td>
                    </tr>
                </table>
            </form>
            <div style="color:red;" id="error"></div><!-- error message will display here. --->
            <div id="success"></div><!-- output message will display here. --->
        </div>
    </body>
</html>
<script>
    $(document).ready(function () {
        $("#country_id").on("change", function () {
            var country_id = $("#country_id").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "state.jsp",//your jsp page name
                    data: {country_id: country_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#state_id").html(data);//output or response will display in state select box.
                    }
                });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#submit").on("click",function () {
            var country_id = $("#country_id").val();//id of country select box of index.jsp page;
            var state_id = $("#state").val();//coming value from state.jsp page.
            var city_name = $("#city").val();//coming value from city.jsp page.
            
            // check if country select box have blank or null value.
            if (country_id === ""||country_id===null)
            {
                $("#error").html("All fields are mandatory.");//this message will display in error div.
            }
            else
            {
                $("#error").html("");//show blank message when all select box doesn't have any null value.
                $.ajax({
                    url:"DisplayText",//your servlet or jsp page name.
                    method:"POST",//HTTP method.
                    data:{country_id:country_id,state_id:state_id,city_name:city_name},//sending request to DisplayText.java page.
                    success:function(data)
                    {
                        $("#success").html(data);//output or response will display in success div.
                        $("#form").trigger("reset");//this will reset the form.
                    }
                });
            }
        });
    });
</script>