<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="../css/payment.css">
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <script src="https://js.tosspayments.com/v1/payment"></script>




  </head>
  <body>
<header>
    <jsp:include page="../module/header2.jsp" flush="false" />
</header>


<div id ="title1">
<h1>당일 이용권 구매</h1>

    <section>
     
      <img src="../img/coupon.png" alt="Coupon Icon" style="width:130px; height: 80px;"> <!-- Adjust width and height as needed -->
  <span style="font-size: 15px; font-weight: bold;">당일권 2시간</span>
      <span>3,000원 </span>
      <button id="payment-button">3,000원 결제하기</button>
    </section>
    <script>
      var clientKey = 'test_ck_jExPeJWYVQlyX2DkY1n349R5gvNL'
      var tossPayments = TossPayments(clientKey)
      var button = document.getElementById('payment-button') // 결제하기 버튼
      button.addEventListener('click', function () {
        tossPayments.requestPayment('카드', {
          amount: 3000,
          orderId: 'flying12',
          orderName: '2시간 이용권',
          customerName: 'Flying',
          successUrl: 'http://localhost:8085/Flying/main/payment/payment_complete.jsp',
          failUrl: 'http://localhost:8080/fail',	
        })
      })
    </script>
</div>








<footer>
    <jsp:include page="../module/footer.jsp"/>
</footer>
</body>
</html>
