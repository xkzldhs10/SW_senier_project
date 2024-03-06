<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="flyingMember.MemberInfo"%>
<%@page import="flyingMember.SearchBean"%>
<%@ page import="java.io.PrintWriter" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="../css/memberManage.css">
<jsp:useBean class="flyingMember.SearchBean" id="memSearch" scope="session"/>
<%
	SearchBean search = new SearchBean();
	ArrayList<MemberInfo> memberList = search.memberList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> flying </title>
</head>
<body>
<header>
    <jsp:include page="../module/header2.jsp" flush="false" />
</header>

<h2>Flying 회원목록</h2>
<div id="membertable" align="center">
	<table width="80%" border="1" >
		<thead>
			<tr>
				<td>회원아이디</td><td>비밀번호</td><td>회원이름</td><td>회원타입</td><td>회원연락처</td><td>회원이메일</td>
			</tr>
		</thead>
		<tbody>
		<%for(int i=0; i<memberList.size(); i++){ %>
			<tr>
				<td><%= memberList.get(i).getMemberId() %></td>
				<td><%= memberList.get(i).getMemberPassword() %></td>
				<td><%= memberList.get(i).getMemberName() %></td>
				<td><%= memberList.get(i).getMemberType() %></td>
				<td><%= memberList.get(i).getPhoneNumber() %></td>
				<td><%= memberList.get(i).getMemberEmail() %></td>
			</tr>
			<% } %>
		</tbody>

			
			<form action="memberManageProcess.jsp">
				<input type="text" placeholder="삭제할 회원아이디" id="delete" name="deletename">
				<div id="DeleteButton">
					<input type="submit" value="회원삭제" id="button">
				</div>
			</form>		

	</table>
</div>
</body>
</html>