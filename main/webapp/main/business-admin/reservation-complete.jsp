<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Flying</title>
<style>
  .seat-layout-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  
  .seat-layout {
    position: relative;
    width: 500px;
    height: 300px;
    border: 1px solid #ccc;
    margin: 0 auto;
  }
  
  .seat {
    position:absolute; 
    transform:translate(1100px, 400px);
    width: 40px;
    height: 40px;
    background-color: #eee;
    border: 1px solid #ccc;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  #footer{
  	margin-top:600px;
  }
  
  #mypagebtn {
    margin-top: -50px; /* 상단 여백 조정 */
    display: block;
    margin-left: auto;
    margin-right: auto;
    background-color: #34B680;
    color: #FFF;
    border: 1px solid #333;
    padding: 10px 20px; /* 버튼 크기 조정 */
    border-radius: 5px; /* 라운드 처리 */
  }
  
  h1{
  	margin-top:50px;
 	text-align:center;
  }
</style>


</head>
<body>
  <%@ include file="../module/header2.jsp" %>
  <h1>좌석상태 저장이 완료되었습니다.</h1>
  <div class="container">
    <div id="seat-layout">
      <script>
    // 세션 스토리지에서 저장한 좌석 배치 데이터를 가져옴
    var seatLayoutData = JSON.parse(sessionStorage.getItem('seatLayoutData'));

    // 좌석 배치를 표시하는 부분
    var seatLayout = document.getElementById('seat-layout');

    for (var i = 0; i < seatLayoutData.length; i++) {
      var seat = document.createElement('div');
      seat.className = 'seat';
      seat.style.left = seatLayoutData[i].left + 'px';
      seat.style.top = seatLayoutData[i].top + 'px';

      var seatNumberSpan = document.createElement('span');
      seatNumberSpan.textContent = (i + 1).toString(); // 좌석 번호 설정

      seat.appendChild(seatNumberSpan);
      seatLayout.appendChild(seat);
    }
  </script>
    </div>
  </div>


<div id="footer">
<button type="button" id="mypagebtn" onclick="location.href='../service/myPage.jsp'">마이페이지로 이동</button>
  <%@ include file="../module/footer.jsp" %>
</div>

</body>
</html>
