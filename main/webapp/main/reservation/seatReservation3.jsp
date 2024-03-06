<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="../css/seatReservation.css">
<%@ page import="java.util.ArrayList" %>
<%@page import="flyingMember.ReserveInfo"%>
<jsp:useBean class="flyingMember.ReservationCompare" id="compare" scope="session"/>
<jsp:useBean class="flyingMember.SearchBean" id="memSearch" scope="session"/>
<jsp:useBean class="flyingMember.ReserveInfo" id="reserveInfo" scope="session"/>
<%
	String memLogin = (String)session.getAttribute("memLogin");
    session.setAttribute("cafeid","3");
	ArrayList<ReserveInfo> reservelist = memSearch.reserveList(3);
	if(memLogin == null){ %>
	<script>
	alert("로그인 후 이용해 주십시오.");
	location.href = '../index.jsp';
	</script>		
<%
	}
	
	int[] seatArray = new int[40];
	int[] lockerArray = new int[30];
	
	for(int i=0; i < reservelist.size(); i++){
		seatArray[i] = Integer.parseInt(reservelist.get(i).getSeatNumber());
		lockerArray[i] = Integer.parseInt(reservelist.get(i).getLockerNumber());
	}
		
%>

<!DOCTYPE html>
<html>
<head>
	<style>
	.disabled {
	    background-color: gray;
	    color: white;
	    cursor: not-allowed; /* 커서를 기본으로 변경하여 클릭을 방지 */
	}
	</style>
  <meta charset="UTF-8">
  <title>Flying</title>
  <script>
    var selectedSeat = null;
    function selectSeat(seat) {
      if (selectedSeat !== null) {
        selectedSeat.classList.remove("selected");
       
      }

      selectedSeat = seat;
      selectedSeat.classList.add("selected");

      document.getElementById("selectedSeat).innerText = selectedSeat.innerText;
      document.getElementById("useSeat").value = selectedSeat.innerText;
    }
    </script>
    <script>
    let selectedlocker = null;

    function selectlocker(locker) {
      if (selectedlocker !== null) {
        selectedlocker.classList.remove("selected");
      }

      selectedlocker = locker;
      selectedlocker.classList.add("selected");

      document.getElementById("selectedlocker").innerText = selectedlocker.innerText;
      document.getElementById("uselocker").value = selectedlocker.innerText;
    }
    function completeReservation() {
      if (selectedlocker === null) {
        alert("사물함을 선택해주세요.");
      } else {
        // 사물함 예약 처리 및 예약 완료 페이지로 이동
        window.location.href = "reservation-complete.jsp";
        window.sessionStorage.setItem('lockNum','selectedlocker');
      }
    }

    </script>
    <script>
    let selectedTime = null;

    function selectTime(time) {
      if (selectedTime !== null) {
        selectedTime.classList.remove("selected");
      }

      selectedTime = time;
      selectedTime.classList.add("selected");

      document.getElementById("selectedTime").innerText = selectedTime.innerText;
      document.getElementById("useTime").value = selectedTime.innerText;
    }
  </script>
<script>
    var selectedSeat = null;

    function selectSeat(seat) {
        if (selectedSeat !== null) {
            selectedSeat.classList.remove("selected");
        }

        // 좌석 번호를 가져오기
        var seatNumber = parseInt(seat.innerText);

        if (seatNumber === 5 || seatNumber === 10 || seatNumber === 15) {
            // 좌석 번호가 5, 10, 15인 경우 비활성화 및 스타일 변경
            seat.classList.add("disabled");
            alert("이 좌석은 선택할 수 없습니다.");
        } else {
            selectedSeat = seat;
            selectedSeat.classList.add("selected");

            document.getElementById("selectedSeat").innerText = selectedSeat.innerText;
            document.getElementById("useSeat").value = selectedSeat.innerText;
        }
    }
</script>
<script>
    function selectSeat(seat) {
        if (seat.classList.contains("disabled")) {
            alert("이 좌석은 선택할 수 없습니다.");
        } else {
            if (selectedSeat !== null) {
                selectedSeat.classList.remove("selected");
            }
            selectedSeat = seat;
            selectedSeat.classList.add("selected");
            document.getElementById("selectedSeat").innerText = selectedSeat.innerText;
            document.getElementById("useSeat").value = selectedSeat.innerText;
        }
    }
    
    function selectlocker(locker) {
        if (locker.classList.contains("disabled")) {
            alert("이 사물함은 선택할 수 없습니다.");
        } else {
            if (selectedlocker !== null) {
                selectedlocker.classList.remove("selected");
            }
            selectedlocker = locker;
            selectedlocker.classList.add("selected");

            document.getElementById("selectedlocker").innerText = selectedlocker.innerText;
            document.getElementById("uselocker").value = selectedlocker.innerText;
        }
    }
</script>
<body>
  <header>
    <jsp:include page="../module/header2.jsp" flush="false" />
  </header>
  <h1 style="margin-top:150px; text-align: center; font-size: 24px; color: #333; font-weight: bold;">원하는 좌석과 사물함을 선택해주세요.</h1>
>

<div class="selected-seat-container" style=" justify-content: right; align-items: center; margin-top:0px;">
  <p class="selected-seat" style="font-size:20px; padding: 15px; border-radius: 10px; background-color: #ECE9E9; width: fit-content;">
    선택된 좌석: <span id="selectedSeat"></span>
  </p>
  
  <p class="selected-locker" style="font-size: 20px; background-color: #ECE9E9; padding: 15px; border-radius: 10px; width: fit-content;">
    선택된 사물함: <span id="selectedlocker"></span>
  </p>
    <p class="selected-locker" style="font-size:20px; background-color: #ECE9E9; padding: 15px; border-radius: 10px;  width: fit-content;">
    선택된 이용권: <span id="selectedTime"></span>
  </p>
</div>
<div class="table-container">
  <table>
    <tr>
      <td colspan="3" style="background-color: #ECE9E9;">스터디 룸</td>
      <td colspan="3" style="background-color: #ECE9E9;">스터디 룸</td>
      <td colspan="3" style="background-color: #ECE9E9;">화장실</td>
    </tr>
    <tr>
      <td onclick="selectSeat(this)" class="<%= compare.SeatCompare(seatArray, 1)%>">1</td>
      <td onclick="selectSeat(this)" class="<%= compare.SeatCompare(seatArray, 2)%>">2</td>
      <td onclick="selectSeat(this)" class="<%= compare.SeatCompare(seatArray, 3)%>">3</td>
      <td onclick="selectSeat(this)" class="<%= compare.SeatCompare(seatArray, 4)%>">4</td>
      <td colspan="3" style="background-color: #ECE9E9;">카운터</td>
    </tr>
    <tr>
      <td onclick="selectSeat(this)" class="<%= compare.SeatCompare(seatArray, 5)%>">5</td>
      <td onclick="selectSeat(this)" class="<%= compare.SeatCompare(seatArray, 6)%>">6</td>
      <td colspan="3" style="background-color: #ECE9E9;">사물함</td>
    </tr>
  </table>
</div>
<br>
<br>
<div class="table-locker">
  <table>
    <tr>
      <td onclick="selectlocker(this)" class="<%= compare.LockerCompare(lockerArray, 1)%>">1</td>
      <td onclick="selectlocker(this)" class="<%= compare.LockerCompare(lockerArray, 2)%>">2</td>
      <td onclick="selectlocker(this)" class="<%= compare.LockerCompare(lockerArray, 3)%>">3</td>
      <td colspan="2" style="background-color: #ECE9E9;">창고</td>
    </tr>
    <tr>
      <td onclick="selectlocker(this)" class="<%= compare.LockerCompare(lockerArray, 4)%>">4</td>
      <td onclick="selectlocker(this)" class="<%= compare.LockerCompare(lockerArray, 5)%>">5</td>
      <td onclick="selectlocker(this)" class="<%= compare.LockerCompare(lockerArray, 6)%>">6</td>
    </tr>
  </table>
</div>


<br>
<br>
<div class="table-time">
<table>
      <tr>
        <td colspan="3" onclick="selectTime(this)">2시간이용권</td>
        <td colspan="3" onclick="selectTime(this)">4시간이용권</td>
		<td colspan="3" onclick="selectTime(this)">6시간이용권</td>
		<td colspan="3" onclick="selectTime(this)">8시간이용권</td>
      </tr>

</table>
</div>
<form action="reservation-complete.jsp" method="get" id="myForm">
	<input type="hidden" id="useSeat" name="selectedSeat">
	<input type="hidden" id="useTime" name="selectedTime">
	<input type="hidden" id="uselocker" name="selectedlocker">
	<input type="submit" style="background-color: #DDDCDC; font-size: 20px; padding: 15px 30px; border-radius: 10px; display: block; margin: 20px auto; text-align: center; color:#000;" value="예약 완료">
</form>

<footer>
    <jsp:include page="../module/footer.jsp"/>
 </footer>
</body>
</html>