<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean class="flyingMember.DeleteBean" id="deleteUser" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");
	String memberID = (String)session.getAttribute("memID"); // 입력된 회원의 memberid

	deleteUser.myPageDelete(memberID);
	session.removeAttribute("memLogin"); // 회원탈퇴로 인한 로그인 유지 세션 삭제.
	session.removeAttribute("memberName");
%>
<script>
	alert("회원탈퇴가 완료되었습니다. Flying을 이용해주셔서 감사합니다.");
	location.href = '../index.jsp';
</script>