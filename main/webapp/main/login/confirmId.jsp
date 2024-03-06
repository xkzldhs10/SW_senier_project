<%@page import="flyingMember.SearchBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("uid");
	SearchBean dao = new SearchBean(); // 인스턴스 생성
	boolean result = dao.confirmId(id); // 해당 인스턴스에 confirm 메서드 사용. 참, 거짓으로 중복 검사
	
	if(result) { %>
		<center>
		<br/><br/>
		<h4>이미 사용중인 ID 입니다.</h4>
		</center>
	<% } else {%>
		<center>
		<br/><br/>
		<h4>사용 가능한 ID 입니다.</h4>
		</center>
	<% } %>