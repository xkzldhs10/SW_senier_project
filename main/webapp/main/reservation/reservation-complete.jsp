<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ page import ="java.sql.*"  %>
<jsp:useBean class="flyingMember.InsertBean" id="reserInsert" scope="session"/>
<jsp:useBean class="flyingMember.ReserveInfo" id="reserveInfo" scope="session"/>
<jsp:setProperty name="reserveInfo" property="*" />
<%
  String memId = (String)session.getAttribute("memID");
  String seatNum =  request.getParameter("selectedSeat");
  String useTime =  request.getParameter("selectedTime");
  String locker =  request.getParameter("selectedlocker");
  String cafeId = (String)session.getAttribute("cafeid");
  String status = "0";
  reserInsert.reserveInsert(memId,cafeId,seatNum,locker,useTime,status);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Flying</title>
<style>

	#button1 {
		background-color:  #408080; /* Green */
		border: none;
		color: white;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 20px;
		cursor: pointer;
		border-radius: 12px;
		box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
		font-weight: 800;
	}
  .container {
  	margin-top:150px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50vh;
    text-align: center;
  }
  
  .reservation-info {
    background-color: #ffffff; /* 배경색을 흰색으로 설정 */
    color: #000000; /* 글자색을 검은색으로 설정 */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 그림자 추가 */
  }
  
  .check-icon {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #34B680; /* 배경색을 34B680 색으로 설정 */
    color: #ffffff; /* 글자색을 흰색으로 설정 */
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin: 0 auto;
    margin-bottom: 20px;
  }
  
  .check-icon::before {
    content: '\2713'; /* 체크 표시 아이콘 추가 */
    font-size: 30px;
    line-height: 1;
  }
  
  h1 {
    color: #000000; /* 글자색을 검은색으로 설정 */
    margin-top: 0;
  }
hr {
  width: 40%;
  background-color: #00FF80; /* 선의 색상을 #00FF80으로 설정 */
}

#membutton1 {
	display:inline-block; 
	text-align:center;
	margin: 0 auto;
	display: flex; 
	justify-content: center; 
	align-items: center; 
}
</style>
</head>
<body>
  <header>
    <jsp:include page="../module/header2.jsp" flush="false" />
  </header>
  <div class="container">
  <div class="reservation-info">
    <div class="check-icon"></div> <!-- 체크 아이콘 추가 -->
    <h1>당일 예약이 완료되었습니다</h1>
    <p>지정 좌석에 정상적으로 예약되었습니다.</p>
    <hr>
    <p>신청인: <%out.print(memId);%>님</p>
    <p>좌석번호: <%= seatNum %>번</p>
    <p>이용권: <%=useTime %></p>
    <p>사물함: <%=locker %>번 사물함</p>
  </div>
</div>
 <div id="membutton1">
	 <form action="../index.jsp">
	 	<input type="submit" value="메인화면" id="button1">
	 </form>
</div>

  <footer>
    <jsp:include page="../module/footer.jsp"/>
  </footer>

  <script>
    // 선택된 좌석 정보 업데이트
    document.getElementById("selectedSeat").innerText = selectedSeat;
  </script>
</body>
</html>
