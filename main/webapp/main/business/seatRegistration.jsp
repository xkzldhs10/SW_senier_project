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
</style>
<script>
  var seatLayoutData = [];

  function generateSeats() {
    var seatNumber = parseInt(document.getElementById("seat-number").value);
    var seatLayout = document.getElementById("seat-layout");

    seatLayout.innerHTML = "";
    seatLayoutData = [];

    var rowNum = Math.ceil(seatNumber / 5); // 5는 한 줄에 표시할 좌석 수입니다.

    for (var i = 0; i; i < rowNum; i++) {
        for (var j = 0; j < 5; j++) {
            var seatIndex = i * 5 + j;

            if (seatIndex < seatNumber) {
              var seat = document.createElement('div');
              seat.className = 'seat';
              seat.style.left = (j * 50 + 10) + 'px'; // 좌석 간격 및 위치 조정
              seat.style.top = (i * 50 + 10) + 'px';

              var seatNumberSpan = document.createElement('span');
              seatNumberSpan.textContent = (seatIndex + 1).toString();

              seat.appendChild(seatNumberSpan);
              seatLayout.appendChild(seat);

              // 좌석 배치 데이터에 좌표 정보 추가
              seatLayoutData.push({
                left: j * 50 + 10,
                top: i * 50 + 10
              });
            }
          }
        }
      }

      function saveSeatLayout() {
        // 좌석 배치 데이터를 세션 스토리지에 저장
        sessionStorage.setItem('seatLayoutData', JSON.stringify(seatLayoutData));

        // 페이지 이동
        window.location.href = 'reservation-complete.jsp';
      }
    </script>
    </head>
    <body>
    <%@ include file="../module/header2.jsp" %>

    <div class="container">
      <div id="seat-layout-container">
        <div id="seat-layout"></div>
      </div>

      <div id="seat-form">
        <label for="seat-number" id="seat-number-label">좌석 수:</label>
        <input type="number" id="seat-number" min="1" value="1">
      </div>

      <button type="button" id="save-seat-layout-button" onclick="saveSeatLayout()">좌석 배치 저장</button>
    </div>

    <%@ include file="../module/footer.jsp" %>
    </body>
    </html>
