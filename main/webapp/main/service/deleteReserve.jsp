<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean class="flyingMember.DeleteBean" id="deleteUser" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");
	String memberID = (String)session.getAttribute("memID"); // 입력된 회원의 memberid

	deleteUser.myPageReserveDelete(memberID);

%>
<script>
	alert("예약이 취소되었습니다.");
	location.href = 'myPage.jsp';
</script>