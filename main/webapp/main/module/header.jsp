<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memLogin = (String)session.getAttribute("memLogin");
	String memId = (String)session.getAttribute("memID");
	String adminTrue= (String)session.getAttribute("UserAdmin");
%>
<!DOCTYPE html>
<html>

    <style>
        /* 헤더 스타일링 */
        header {
            margin-bottom: 20px;
            height: 150px;
        }

        header #top {
            width: 1170px;
            margin: 0 auto;
        }

        header #logo {
            float: left;
            margin: 50px 0 0 0;
        }

        header #logomessage {
            float: left;
            margin: 70px 0 0 10px;
            position: static;
            font-family: "Raleway", sans-serif;
        }

        header #loginButton {
            float: right;
            margin: 90px 0 0 0;
        }

        HR {
            background-color: #00FF80;
            width: 100%;
            border: 0px;
            height: 3px;
        }

        /* 네비게이션 스타일링 */
        #headernv {
            border-top: 1px solid #E5E5E5;
        }

        #headerul {
            width: 100%;
            background-color: #fff;
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            display: inline-block;
            position: relative;
        }

        nav ul li a {
            display: block;
            color: #333333;
            text-align: center;
            padding: 20px 25px;
            text-decoration: none;
        }

        nav ul li:hover {
            background-color: #fff;
            color: #2A8F57;
            font-weight: bold;
        }

        /* 드롭다운 메뉴 스타일링 */
        .dropdown {
            position: relative;
        }

        .dropdown-menu {
            background-color: #34B680;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #34B680;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropdown-menu {
            background-color: #fff;
            color: #2A8F57;
        }

        /* 홈 버튼 스타일링 */
        .home {
            background-color: #fff;
            width: 100px;
            text-align: center;
            font-weight: bold;
            float: right;
        }

        .home a {
            display: block;
            text-decoration: none;
            color: #333333;
            padding: 20px 25px;
        }

        .home a:hover {
            color: #2A8F57;
            font-weight: bold;
        }

        /* 호버 시 글자 색 변경 */
        .dropdown:hover > a {
            color: #2A8F57;
        }
        
        
        
    </style>
    
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<title> Flying </title>

</head>
<body>
<div id="headcolor">
    <header>
        <section id="top">
            <a id="logo" href="index.jsp"><img src="img/mainlogo.png" width="200" height="70" alt="로고"></a>
			<span id="logomessage">당신의 시간은 소중하니까요.<br>비교는 플라잉에 맡겨주세요.</span>
			<% if(memLogin != null && adminTrue != null) { %>
				<div id="loginButton">
				관리자님, 환영합니다! | <a href="admin/memberManage.jsp">회원관리창</a> | <a href="login/logoutProcess.jsp">로그아웃</a>
				</div>					
			<%} else if(memLogin != null){ %> 
				<div id="loginButton">
					<%out.print(memId);%>님, 환영합니다! | <a href="service/myPage.jsp">MyPage</a> | <a href="login/logoutProcess.jsp">로그아웃</a> | <a href="payment/time_selection.jsp">이용권결제</a>
        		</div>
			<% } else { %>
            	<div id=loginButton>
	           		 <a href="login/loginPage.jsp">로그인</a> | <a href="login/signUp.jsp">회원가입</a>
            	</div>	
            <% } %>
        </section>
    </header>
    
<nav id="headernv">
  <ul id="headerul">
    <li class="home">
      <a href="#">메인</a>
    </li>

    <li class="pay">
<a href="payment/time_selection.jsp">결제 시스템</a>

    <li class="dropdown">
      <a href="./index.jsp">회사 소개</a>
      <div class="dropdown-content">
        <a href="./index.jsp">솔루션 소개</a>
        <a href="./index.jsp">내 예약 확인하기</a>
      </div>
    </li>
    
    <li class="dropdown">
      <a href="./index.jsp">예약</a>
      <div class="dropdown-content">
        <a href="./index.jsp">예약하기</a>
        <a href="./index.jsp">내 예약 확인하기</a>
      </div>
    </li>
    
    <li class="dropdown">
      <a href="#">
        예약 및 이용 방법
      </a>
      <div class="dropdown-content">
        <a href="#">예약하는 법</a>
        <a href="#">사업자 신청하기</a>
      </div>
    </li>
  </ul>
</nav>



    
</div>
</body>
</html>
