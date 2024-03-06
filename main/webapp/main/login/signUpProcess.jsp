<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*"  %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="flyingMember.MemberInfo" id="memInfo" scope="session"/>
<jsp:setProperty name="memInfo" property="*" />
<jsp:useBean class="flyingMember.InsertBean" id="memInsert" scope="session"/>

<%
 	memInsert.memberInsert(memInfo);
%>

<script>
	alert("flying에 가입해주셔서 감사합니다. 좋은 서비스로 보답하겠습니다.");
	location.href = 'loginBack.jsp';
</script>