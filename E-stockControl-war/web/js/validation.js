/*
	@author Ugwu Chika (--- Ltd)
*/
	var radio = false;
	
	function trim(str) {
		return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
	}
	
	function checks(field,alerttxt) {
		with (field) {
			if (value == null || trim(value) == "")
				{alert(alerttxt);return false;}
			else {return true;}
		}
	}
	
	function validate(thisform) {
		for(var i = 0; i<=thisform.length; i++) {
			if(thisform.elements[i].id == "") { continue }
				
			else {
				with (thisform) {
					if (checks(elements[i],elements[i].id+" Cannot be empty")==false) 
						{elements[i].focus();return false;}
				}
			}
		}		
		return true;
	}
	
	function checkEmail(email) {
		var e = trim(email.value);
		if(e == "" || e == null) { return; }
		var pattern = /^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]+$/;
		var regexp = new RegExp(pattern);
		
		if(!regexp.test(e)) {
			alert("Please enter a valid email address " + e);
			email.focus();
			return;
		}
		else return;
			
		return;
	}
	
	function checkPasswords(p) {
		pass = p.value;
		if(pass == "" || pass == null) return;
		
		if(document.forms[0].password.value != pass){ 
			alert("Passwords do not match"); 
			return;
		}
		return;
	}
	
	function checkExt(formObj) {
		var filename = trim(formObj.value);
		
		if(filename == "") return;
		
		var filelength = parseInt(filename.length) - 3;
		var fileext = filename.substring(filelength,filelength + 3);
		
		// Check file extenstion
		if (fileext.toLowerCase() != "gif" && fileext.toLowerCase() != "jpg" ) {
			alert ("You can only upload gif or jpg images");
			formObj.focus();
			return;
		}
		return;
	}
        function checkExt2(formObj) {
		var filename = trim(formObj.value);

		if(filename == "") return;

		var filelength = parseInt(filename.length) - 3;
		var fileext = filename.substring(filelength,filelength + 3);

		// Check file extenstion
		if (fileext.toLowerCase() != "gif" && fileext.toLowerCase() != "jpg" && fileext.toLowerCase() != "csv") {
			alert ("You can only upload gif or jpg images");
			formObj.focus();
			return;
		}
		return;
	}


	function checkNum(obj) {
		str = trim(obj.value);
		if(!isInteger(str)) {
			alert("Please enter a valid number");
			obj.focus();
			return;
		}
		return;
	}
	
	function isInteger (str) {
		var s = str;
		for (var i = 0; i < s.length; i++) {
			var c = s.charAt(i);
			if (!isDigit(c)) return false;
		}
      return true;
   }

	function isDigit (c) {
		return ((c >= "0") && (c <= "9"))
	}
	
	function checkMatnum(obj) {
		//this should be used only if a student is selected
		if(document.forms[0].category.value == "STUDENT") {
			matNum = trim(obj.value);
			if(matNum == "") return;
			var pattern = /^(BSU\/|bsu\/|Bsu\/)([a-zA-Z\/])+([0-9]){2}(\/)([0-9]){4,10}$/;
			var regexp = new RegExp(pattern);
		
			if(!regexp.test(matNum)) {
				alert("Please enter a valid Matriculation Number");
				obj.focus();
				return;
			}
		}
		return
	}		
	
	function validateName(obj) {
		var name = trim(obj.value);
		var pattern = /^[a-zA-Z\.\s]+$/;
		var regexp = new RegExp(pattern);
		
		if(name == "") return;
		
		if(!regexp.test(name)) {
			alert("Field contains illegal characters");
			obj.focus();
			return;
		}
		return;
	}
		
	function validateF(obj){
    	var name = trim(obj.value);
    //x=document.myForm
    //input=x.myInput.value
    if (name.length<3){
        alert("The field should be more than 3 characters!")
        return false
    }else {
        return true
    }
}