<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean class="flyingMember.SearchBean" id="login" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	String adminID = "admin";
	String adminPW = "flying";
	
	if(adminID.equals(id) && adminPW.equals(pw)) {
		session.setAttribute("memLogin","OK");
		session.setAttribute("UserAdmin","OK");
		session.setAttribute("memID","admin");
		response.sendRedirect("../index.jsp");
	} 
	else if(adminID.equals(id)){ %>
		 <script>
	         alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
	         location.href="loginPage.jsp";
      	</script>
	<% }
	else {
		
		int loginCheck = login.login(id,pw);

	
			if(loginCheck==1) {
				if(request.getParameter("idSave") == null) 
					session.removeAttribute("memSave");
				else
					session.setAttribute("memSave", "check");
					session.setAttribute("memberName",login.nameSearch(id));
					session.setAttribute("memLogin","OK");
					session.setAttribute("memID",id);
					response.sendRedirect("../index.jsp");
			} else {
				%>
		         <script>
		            alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		            location.href="loginPage.jsp";
		         </script>
		  <% }
		} 
%>
</body>
</html>