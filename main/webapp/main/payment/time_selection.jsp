<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%
	String memId = (String)session.getAttribute("memID");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Flying</title>
  <script>
  function selectTime(hours) {
      document.getElementById('selectedTime').value = hours;
  }
  </script>
<style>
 .container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 150px;
  margin-bottom: 150px;
}

.container h2 {
  margin-top: 20px;
}



.time-container {
  display: grid; /* Change to grid */
  grid-template-columns: repeat(3, 1fr); /* 3 columns */
  gap: 20px; /* Adjust the gap between items */
  margin-bottom: 50px;
}

.time-option {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100px;
  height: 80px;
  text-align: center;
  line-height: 80px;
  border-radius: 10px;
  margin-bottom: 20px;
  margin-right: 20px; /* Adjusted the margin-right */
  margin-left: 20px; /* Added margin-left to center the tables */
}


.time-option button {
  background-color: #34B680;
  color: #fff;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  transform: scale(1.5);
  border-radius: 5px;
}

.time-option button:hover {
  background-color: #fff;
  color: #34B680;
  border: 1px solid #808080;
}

label {
  display: block;
  margin-bottom: 10px;
}

input[type="number"] {
  width: 100px;
}

form {
  margin-top: 10px;
}

form input[type="submit"] {
  background-color: #34B680;
  color: #fff;
  border: none;
  padding: 10px 50px;
  font-size: 16px;
  transform: scale(1.5);
  border-radius: 5px;
}

form input[type="submit"]:hover {
  background-color: #fff;
  color: #34B680;
  border: 1px solid #808080;
}

</style>

</head>

<body>
<header>
   <jsp:include page="../module/header2.jsp" flush="false" />
</header>
  
  
   <div class="container">
      
          <h2>원하시는 예약 시간을 선택해주세요</h2>
          
<div class="time-container">
  <div class="time-option">
<button onclick="location.href='payment15.jsp'" />
1시간
<span class="price">1500원</span>
  </div>
  
  
  <div class="time-option">
<button onclick="location.href='payment30.jsp'" />
2시간
<span class="price">3000원</span>

  </div>
  <div class="time-option">
<button onclick="location.href='payment50.jsp'" />
3시간
<span class="price">5000원</span>
  </div>
  <div class="time-option">
<button onclick="location.href='payment60.jsp'" />
4시간
<span class="price">6000원</span>
    </button>
  </div>
  <div class="time-option">
<button onclick="location.href='payment70.jsp'" />
5시간
<span class="price">7000원</span>
  </div>
    <div class="time-option">
  <button onclick="location.href='payment80.jsp'" />
6시간
<span class="price">8000원</span>
  </div>
 </div>  
  
</div>
      
    </div>
<footer>
    <jsp:include page="../module/footer.jsp"/>
</footer>
</body>
</html>
