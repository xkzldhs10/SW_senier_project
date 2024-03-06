<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="../css/loginPage.css">

<%
	String idStr = null, checkStr=null;
	String check = (String)session.getAttribute("memSave");
	String memid = (String)session.getAttribute("memID");
	
	if(check == null) {
		idStr=""; checkStr="";
	} else {
		idStr= memid; checkStr="checked";
	}
%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="../js/login_check.js" charset="UTF-8"></script>
<head>
<meta charset="UTF-8">
<title>flying</title>
</head>
<body>
<header>
    <jsp:include page="../module/header2.jsp" flush="false" />
</header>
<main>
	<form id="logintheme" action="loginProcess.jsp" name="login_form">
		<img src="../img/mainlogo.png" width="100" height="50" alt="로고">
		<div id="loginForm">
			<input type="text" placeholder="아이디" id="login" name="id" value=<%=idStr%>>
		</div>

		<div id="passwordForm">
			<input type="password" placeholder="비밀번호" id="password" name="password">
		</div>

		<div id="logincheck">
			아이디 저장 <input type="checkbox" id="logincheckbox"  value="c1" name="idSave" <%=checkStr %>>
		</div>

		<div id="loginButton">
			<input type="button" value="로그인" id="button" onclick="loginform_check()">
		</div>
      
		<div id="linkButton">
			<a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> | <a href="signUp.jsp"> 회원가입</a>
		</div>
	</form>
</main>
<footer>
	<jsp:include page="../module/footer.jsp"/>
</footer>
</body>
</html>
