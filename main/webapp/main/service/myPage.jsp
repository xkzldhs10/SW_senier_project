<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
<jsp:useBean class="flyingMember.MemberInfo" id="memInfo" scope="session"/>
<jsp:useBean class="flyingMember.SearchBean" id="memSearch" scope="session"/>
<jsp:useBean class="flyingMember.ReserveInfo" id="reserveInfo" scope="session"/>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="../css/myPage.css">
<% 
	String memName = (String)session.getAttribute("memberName");
	String memberID = (String)session.getAttribute("memID");
	memInfo = memSearch.memberSearch(memberID);
	reserveInfo = memSearch.reservationSearch(memberID);
	String nullword = " ";
%>	

<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>flying</title>
</head>
<body>
<header>
    <jsp:include page="../module/header2.jsp" flush="false" />
</header>
<div id="title1">
	<img src="../img/mainlogo.png" width="100" height="50" alt="로고">
	<h1><%out.print(memName);%>님의 MyPage</h1>
</div>
<div id="tableLayout">
	<table class="myInfo">
		<thead>
			<tr>
				<th scope="cols">회원정보</th>
				<th scope="cols">내용</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<th scope="row">회원이름</th>
				<td><%= memInfo.getMemberName() %></td>
			</tr>
			<tr>
				<th scope="row">회원아이디</th>
				<td><%= memInfo.getMemberId() %></td>
			</tr>
			<tr>
				<th scope="row">회원등급</th>
				<td>일반회원</td>
			</tr>
			<tr>
				<th scope="row">회원타입</th>
				<td><%= memInfo.getMemberType() %></td>
			</tr>
			<tr>
				<th scope="row">회원전화번호</th>
				<td><%= memInfo.getPhoneNumber() %></td>
			</tr>
			<tr>
				<th scope="row">회원이메일</th>
				<td><%= memInfo.getMemberEmail() %></td>
			</tr>
		</tbody>
	</table>
	<div id="allButton">	
	</div>
	 <div id="membutton1">
		 <form action="updateUser.jsp">
		 	<input type="submit" value="회원정보수정" id="button1">
		 </form>
	</div>
	
	<div id="membutton2">
		<script type="text/javascript">
		function button_event() {
			if (confirm("정말 flying을 탈퇴하시겠습니까??") == true)    
				location.href = 'deleteUser.jsp';
			else
			    return;
		}
		</script>
		<input type="submit" value="회원탈퇴하기" id="button2"  onclick="button_event();">
	</div>
	
	<h1><%out.print(memName);%>님의 예약내역</h1>
	<div id="tableLayout">
	<table class="myInfo">
		<thead>
			<tr>
				<th scope="cols">회원정보</th>
				<th scope="cols">내용</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<th scope="row">회원아이디</th>
				<td><%= memSearch.checkNull(reserveInfo.getMemberId(), nullword) %></td>
			</tr>
			<tr>
				<th scope="row">카페아이디</th>
				<td><%= memSearch.checkNull(reserveInfo.getCafeId(), nullword) %></td>
			</tr>
			<tr>
				<th scope="row">좌석번호</th>
				<td><%= memSearch.checkNull(reserveInfo.getSeatNumber(), nullword) %></td>
			</tr>
			<tr>
				<th scope="row">사물함번호</th>
				<td><%= memSearch.checkNull(reserveInfo.getLockerNumber(), nullword) %></td>
			</tr>
			<tr>
				<th scope="row">이용권</th>
				<td><%= memSearch.checkNull(reserveInfo.getUseTime(), nullword) %></td>
			</tr>
		</tbody>
	</table>
	<div id="membutton2">
		<script type="text/javascript">
		function button_event() {
			if (confirm("예약을 취소하시겠습니까?") == true)    
				location.href = 'deleteReserve.jsp';
			else
			    return;
		}
		</script>
		<input type="submit" value="예약취소" id="button2"  onclick="button_event();">
	</div>
	
</div>
<footer>
	<jsp:include page="../module/footer.jsp" />
</footer>
</body>
</html>
