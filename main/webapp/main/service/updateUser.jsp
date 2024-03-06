<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/updateUser.css">

<%
	String memberID = (String)session.getAttribute("memID");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>flying</title>
</head>
<body>
<header>
    <jsp:include page="../module/header2.jsp" flush="false" />
</header>
<main>
	<form action="updateUserProcess.jsp" method="post">
	<div id="title1">
		<img src="../img/mainlogo.png" width="345" height="105" alt="로고">
	    <h3>수정 할 정보 입력</h3>
	</div>
	    
    <section id="log-info">
		<div class="usrinput">
			<span id="tag">*</span>변경 후 비밀번호<br>
			<input type="text" id="input1" name="updatePassword" maxlength="30" >
		</div>
		
		<div class="usrinput">
			<span id="tag">*</span>변경 후 비밀번호 확인<br>
			<input type="text" id="input1"  maxlength="30" >
		</div>
		            
        <div class="usrinput">
			<span id="tag">*</span>변경 후 이름<br> 
			<input type="text" id="input1" name="updateName" maxlength="10">
		</div>
		<div class="usrinput">
			변경 후 휴대전화<br>
			<input type="text" id="input1" name="updatePhoneNumber" placeholder=" -없이 입력" maxlength="15" >
		</div>
		
		<div class="usrinput">
			변경 후 이메일 <br>
			<input type="text" id="input1" name="updateEmail" placeholder=" 선택입력" maxlength="30" >
		</div>
		    
		<div class="notice">
			<span id="tag">*</span> 는 필수입니다.
		</div>
		 
    </section>
    
    <div id="updatebtn">
		<input type="submit" value="수정하기" id="button1"><br>
	</form>
	
	<form action="myPage.jsp" method="post">
		<input type="submit" value="돌아가기" id="button2" >
	</form>
	
	</div>
</main>
<footer>
    <jsp:include page="../module/footer.jsp"></jsp:include>
</footer>
</body>
</html>