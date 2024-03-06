<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="css/index.css">

<%
  String keyword = request.getParameter("keyword"); // 검색어 가져오기
%>
<!DOCTYPE html>
<html>
<head>
  <header>
    <jsp:include page="module/header.jsp" flush="false" />
  </header>
  <meta charset="UTF-8">
  <title>Flying</title>
  <br>
  <br>
  <main>
    <div class="gallery-container" onclick="location.href='reservation/seatReservation.jsp'">
      <!-- 검색 결과를 표시하는 부분 -->
      <% if ("시크릿 스터디카페 광명점".contains(keyword)) { %>
        <div class="image-container">
          <img src="img/StudyCafeListTum3.jpg" alt="이미지 3">
          <div class="image-title">시크릿 스터디카페 광명점</div>
          <div class="image-description"></div>
          <div class="rating-container">
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9734;</span>
            <span class="rating-text">4.0 (109)</span>
          </div>
          <div class="image-tags">
            <div class="image-tag">#주차가능</div>
            <div class="image-tag">#할인중</div>
            <div class="image-tag">#무소음</div>
          </div>
        </div>
      <% } else if ("철썩 스터디카페 홍대점".contains(keyword)) { %>
        <div class="image-container">
          <img src="img/StudyCafeListTum1.jpg" alt="이미지 1">
          <div class="image-title">철썩 스터디카페 홍대점</div>
          <div class="image-description"></div>
          <div class="rating-container">
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9734;</span>
            <span class="rating-text">4.0 (109)</span>
          </div>
          <div class="image-tags">
            <div class="image-tag">#조용해요</div>
            <div class="image-tag">#커피무료</div>
            <div class="image-tag">#오픈행사중</div>
          </div>
        </div>
      <% } else if ("블루 스터디카페 영등포점".contains(keyword)) { %>
      <div class="image-container">
      <img src="img/StudyCafeListTum2.jpg" alt="이미지 2">
      <div class="image-title">블루 스터디카페 영등포점</div>
      <div class="image-description"></div>
      <div class="rating-container">
        <span class="star">&#9733;</span>
        <span class="star">&#9733;</span>
        <span class="star">&#9733;</span>
        <span class="star">&#9733;</span>
        <span class="star">&#9734;</span>
        <span class="rating-text">4.0 (109)</span>
      </div>
      <div class="image-tags">
        <div class="image-tag">#카페인피스타</div>
        <div class="image-tag">#스터디룸</div>
        <div class="image-tag">#와이파이</div>
      </div>
    </div>
  <% } %>
</div>
</main>
<footer>
<jsp:include page="module/footer.jsp"/>
</footer>
</body>
</html>

