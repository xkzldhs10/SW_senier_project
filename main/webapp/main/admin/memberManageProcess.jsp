<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean class="flyingMember.DeleteBean" id="deleteUser" scope="session"/>
<%
	request.setCharacterEncoding("utf-8");
	
	String memberID = request.getParameter("deletename");
	deleteUser.myPageDelete(memberID);
	
%>
<script>
	alert("<%=memberID %>회원을 탈퇴시켰습니다.");
	location.href = 'memberManage.jsp';
</script>