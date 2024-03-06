function loginform_check() {

	var log_id = document.getElementById("login");
	var log_pwd = document.getElementById("password");

	if (log_id.value == "") { 
		alert("아이디를 입력하세요.");
		log_id.focus(); 
		return; 
	};

	if (log_pwd.value == "") {
		alert("비밀번호를 입력하세요.");
		log_pwd.focus();
		return;
	};
	
	document.login_form.submit(); 
}