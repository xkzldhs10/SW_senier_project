<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean class="flyingMember.UpdateBean" id="update" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");

	String memName = (String)session.getAttribute("memberName");
	String memId = (String)session.getAttribute("memID"); // 회원의 기존 아이디 이름
	String newPw = (String)request.getParameter("updatePassword");
	String newName = (String)request.getParameter("updateName");
	String newPhoneNumber = (String)request.getParameter("updatePhoneNumber");
	String newEmail = (String)request.getParameter("updateEmail"); // 변경할 사항들
	
	update.myPageUpdate(newPw, newName, newPhoneNumber, newEmail, memId);
	
	
	if(newName != memName) // 이름 변경시 바꾸는 코드
		session.setAttribute("memberName", newName);
%>
<script>
	alert("회원정보변경이 완료되었습니다!");
	location.href = 'myPage.jsp';
</script>