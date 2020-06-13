function validate(){
	var username=document.getElementById("uname");
	var password=document.getElementById("pass");
	if(username.value.trim() ==""){
		alert("Please enter username! ");
		return false;
	}
	else
	{
		true; 
	}
	
	if( password.value.trim() == ""){
		alert("Please enter password! ");
		return false;
	}
	else
	{
		true; 
	}
	
	
	
}


