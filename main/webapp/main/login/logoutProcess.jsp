<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.removeAttribute("memberName");
	session.removeAttribute("memLogin");
	session.removeAttribute("UserAdmin");
%>
<script>
	alert("로그아웃 처리되었습니다.");
   	location.href="../index.jsp";
</script>