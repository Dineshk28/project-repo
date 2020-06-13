function validate(){
	var name=document.getElementById("name");
	var phno=document.getElementById("phno");
	var email=document.getElementById("email");
	var uname=document.getElementById("uname");
	var password=document.getElementById("pwd");
	
	if(name.value.trim()==""){
	alert("Fill the name field ");
	return false;
	}else{
		true;
	}
	if(phno.value.trim()==""){
		alert("Fill the phone number field ");
		return false;
		}else{
			true;
		}
	if(email.value.trim()==""){
		alert("Fill the e-mail field ");
		return false;
		}else{
			true;
		}
	if(uname.value.trim()==""){
		alert("Create the username");
		return false;
		}else{
			true;
		}
	if(password.value.trim()==""){
		alert("Create the password ");
		return false;
		}else{
			true;
		}
}