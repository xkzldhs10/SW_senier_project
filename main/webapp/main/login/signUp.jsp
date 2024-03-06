<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/signUp.css">
<!DOCTYPE html>
<html>
<style>
#title1{ 
	text-align: center;
	margin-top:120px;	
}
</style>
<head>
<script>
//joinform_check 함수로 유효성 검사
function joinform_check() {
	//변수에 담아주기
	var uid = document.getElementById("memberid");
	var pwd = document.getElementById("password");
	var repwd = document.getElementById("repassword");
	var uname = document.getElementById("username");
	var mobile = document.getElementById("pnumber");

	if (uid.value == "") {
		alert("아이디를 입력하세요.");
		uid.focus(); // focus(): 커서가 깜빡이는 현상
		return;
	};

	if (pwd.value == "") {
		alert("비밀번호를 입력하세요.");
		pwd.focus();
		return;
	};
	
	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; // 비밀번호에 숫자, 영문자, 특수문자 3가지 조건을 만족시키기 위한 체크용 변수

	if (!pwdCheck.test(pwd.value)) {
		alert("영문자+숫자+특수문자 조합으로 8자리 이상 작성해주세요.");
		pwd.focus();
		return;
	};

	if (repwd.value !== pwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		repwd.focus();
		return;
	};

	if (uname.value == "") {
		alert("이름을 입력하세요.");
		uname.focus();
		return;
	};
	
	if (mobile.value == "") {
		alert("전화번호를 입력하세요.");
		mobile.focus();
		return;
	};

	var reg = /^[0-9]+/g; // 특수문자 검사 변수

	if (!reg.test(mobile.value)) {
		alert("숫자만 입력해주세요.");
		mobile.focus();
		return;
	};

	// 입력 값 전송
	document.join_form.submit(); // 유효성 검사   
}

function id_check() { // 중복 검사에 대한 결과 페이지 출력
	var uid = document.getElementById("memberid");
	url="confirmId.jsp?uid=" + uid.value;
	open(url, "confirm",
			"toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
}

</script>
<meta charset="UTF-8">
<title> flying </title>
</head>
<body>
<header>
    <jsp:include page="../module/header2.jsp" flush="false" />	
</header>
<main>
	<form action="signUpProcess.jsp" method="post" name="join_form">
		<div id="title1">
			<img src="../img/mainlogo.png" width="300" height="100" alt="로고">
		    <h3>계정정보 입력</h3>
		</div>
	    
	    <section>
			<div class="usrinput">
				<span>*</span> 아이디<br>
				<input type="text" id="memberid" name="memberId" maxlength="20">
				<input type="button" value="중복확인" onclick="id_check()" id="check" name="check">
			</div>
	        
			<div class="usrinput">
				<span>*</span> 비밀번호<br>
				<input type="password" id="password" name="memberPassword" maxlength="30" >
			</div>
			
			<div class="usrinput">
				<span>*</span> 비밀번호 확인<br>
				<input type="password" id="repassword" name="" maxlength="30" >
			</div>
			            
	        <div class="usrinput">
				<span>*</span> 이름<br> 
				<input type="text" id="username" name="memberName" maxlength="10">
			</div>
			
		    <div class="usrinput">
		    	<span>*</span> 회원유형<br> 
	    		<select name="memberType" id="membertype">
				    <option value="">회원유형선택</option>
				    <option value="개인회원" selected="selected">개인회원</option>
				    <option value="기업회원" >기업회원</option>
				</select>
	    	</div>
	              
			<div class="usrinput">
				휴대전화<br>
				<input type="text" id="pnumber" name="phoneNumber" placeholder=" -없이 입력" maxlength="15" >
			</div>
			
			<div class="usrinput">
				이메일 <br>
				<input type="text" id="email" name="memberEmail" placeholder=" 선택입력" maxlength="30" >
			</div>
			    
			<div class="notice">
				<span>*</span> 는 필수입니다.
			</div>
	    </section>
    
	     <div id="signupbtn">
			<input type="button" value="회원가입" id="button1" onclick="joinform_check()"><br>
	</form>
	
	<form action="loginBack.jsp" method="post">
		<input type="submit" value="돌아가기" id="button2" >
	</form>
	
	</div>
</main>
<script type="text/JavaScript"></script>
<footer>
    <jsp:include page="../module/footer.jsp"></jsp:include>
</footer>
</body>
</html>