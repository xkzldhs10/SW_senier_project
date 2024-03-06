  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Flying</title>
<style>
  #seat-layout-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 50px; /* 상단 여백 조정 */
  }

  #seat-layout {
    width: 500px;
    height: 300px;
    border: 1px solid #ccc;
    position: relative;
  }

  .seat {
    width: 40px;
    height: 40px;
    background-color: #eee;
    border: 1px solid #ccc;
    position: absolute;
    cursor: move;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  #seat-form {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px; /* 상단 여백 조정 */
  }

  #seat-number-label {
    font-size: 24px; /* 글자 크기 조정 */
    margin-right: 50px; /* 좌석 수와 입력 필드 사이의 간격 조정 */
  }

  #save-seat-layout-button,
  #generate-seats-button {
    margin-top: 10px; /* 상단 여백 조정 */
    display: block;
    margin-left: auto;
    margin-right: auto;
    background-color: #34B680;
    color: #FFF;
    border: 1px solid #333;
    padding: 10px 20px; /* 버튼 크기 조정 */
    border-radius: 5px; /* 라운드 처리 */
  }

  #save-seat-layout-button:hover,
  #generate-seats-button:hover {
    background-color: #FFF;
    color: #34B680;
    border-color: #222;
  }
  
  #footer{
  	margin-top:400px;
  }
</style>
<script>
  var seatLayoutData = [];

  function generateSeats() {
    var seatNumber = parseInt(document.getElementById("seat-number").value);
    if(seatNumber>30)
    {
    	alert("좌석은 30개이하만 지정할 수 있습니다.")
    	return;
    }
    var seatLayout = document.getElementById("seat-layout");

    seatLayout.innerHTML = "";
    seatLayoutData = [];

    var rowNum = Math.ceil(seatNumber / 5); // 5는 한 줄에 표시할 좌석 수입니다.

    for (var i = 0; i < seatNumber; i++) {
      var seat = document.createElement("div");
      seat.className = "seat";
      seat.style.left = ((i % 5) * 50) + "px"; // 5는 한 줄에 표시할 좌석 수입니다.
      seat.style.top = (Math.floor(i / 5) * 50) + "px"; // 5는 한 줄에 표시할 좌석 수입니다.
      seat.setAttribute("data-seat-id", i); // 좌석 식별자 설정

      var seatNumberSpan = document.createElement("span");
      seatNumberSpan.textContent = (i + 1).toString(); // 좌석 번호 설정
      seat.appendChild(seatNumberSpan);

      seatLayout.appendChild(seat);
      seatLayoutData.push({ id: i, left: (i % 5) * 50, top: Math.floor(i / 5) * 50 });
      seat.addEventListener("mousedown", startDrag);
    }
  }

  function saveSeatLayout() {
    // 좌석 배치 데이터를 세션 스토리지에 저장
    sessionStorage.setItem('seatLayoutData', JSON.stringify(seatLayoutData));

    // 페이지 이동
    window.location.href = 'reservation-complete.jsp';
  }

  var selectedSeat = null;
  var initialOffsetX = 0;
  var initialOffsetY = 0;

  function startDrag(event) {
    selectedSeat = event.target;
    initialOffsetX = event.clientX - selectedSeat.getBoundingClientRect().left;
    initialOffsetY = event.clientY - selectedSeat.getBoundingClientRect().top;

    document.addEventListener("mousemove", dragSeat);
    document.addEventListener("mouseup", stopDrag);
  }

  function dragSeat(event) {
    var containerRect = document.getElementById("seat-layout").getBoundingClientRect();
    var x = event.clientX - containerRect.left - initialOffsetX;
    var y = event.clientY - containerRect.top - initialOffsetY;

    x = Math.max(0, Math.min(x, containerRect.width - selectedSeat.offsetWidth));
    y = Math.max(0, Math.min(y, containerRect.height - selectedSeat.offsetHeight));

    selectedSeat.style.left = x + "px";
    selectedSeat.style.top = y + "px";

    var seatId = parseInt(selectedSeat.dataset.seatId);
    seatLayoutData[seatId].left = x;
    seatLayoutData[seatId].top = y;
  }

  function stopDrag() {
    selectedSeat = null;

    document.removeEventListener("mousemove", dragSeat);
    document.removeEventListener("mouseup", stopDrag);
  }
</script>



<body>
  <%@ include file="../module/header2.jsp" %>

<div id="seat-layout-container">
   <div id="seat-layout">
  <!-- 좌석 배치도를 표현하는 요소 -->
</div>
   <form id="seat-form">
      <h2 for="seat-number" id="seat-number-label">좌석 수:</h2>
      <input type="number" id="seat-number" min="1" max="100">
      <button type="button" onclick="generateSeats()">생성</button>
    </form>
  </div>

  <button type="button" id="save-seat-layout-button" onclick="saveSeatLayout()">좌석 배치 저장</button>
<footer id ='footer'>
  <%@ include file="../module/footer.jsp" %>
</footer>
</body> 
