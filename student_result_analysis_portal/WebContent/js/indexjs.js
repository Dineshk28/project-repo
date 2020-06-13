function validate(){
	var regno=document.getElementById("regno");
	var dob=document.getElementById("dob");

	if(regno.value.trim() == "" ){
		alert("PLEASE ENTER REGISTER NUMBER! ");
		return false;
	}
	else{
		true;
	}
	if(dob.value.trim() == ""){
		alert("PLEASE ENTER DATE OF BIRTH!");
		return false;
	}else{
		true;
	}
}