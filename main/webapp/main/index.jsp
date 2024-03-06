<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<jsp:useBean class="flyingMember.SearchBean" id="inSearch" scope="session"/>
<link rel="stylesheet" type="text/css" href="css/index.css">

<%
	String memId = (String)session.getAttribute("memID");
	String memLogin = (String)session.getAttribute("memLogin");
	String adminTrue= (String)session.getAttribute("UserAdmin");
	String memType= "";
	String memCheck = "기업회원";
	
	if(memLogin != null)
	{
		if(memCheck.equals(inSearch.indexSearch(memId)))
		{
				memType="기업회원";				
		}
	}
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
<% if(memType.equals(memCheck)) {%>
    <div class="image-container-company">
      <img src="img/StudyCafeListTum1.jpg" alt="이미지 1">
    </div>
<div class="companyindex">
<h1>점장님! 카페정보를 등록해주세요!</h1>
<button type=submit class="companybtn" onclick="location.href='business-admin/seat-registration.jsp'">카페등록하기</button>
</div>

<% } else{ %>


<div class="banner-container">
  <h1 class="banner">
    <img src="img/banner.jpg" alt="공부가 잘되는 공간 플라잉 이미지">
    
  </h1>
</div>




   <div class="search-container">
    <form action="search.jsp" method="GET">
      <input type="text" name="keyword" placeholder="원하는 스터디카페를 검색해보세요...">
      <button type="submit" class="search-btn">검색<i class="fa fa-search"></i></button>
    </form>
  </div>

	
  </div>
  
  
  <div class="gallery-container" >
    <!-- 갤러리 예약 영역 -->
    <div class="image-container" onclick="location.href='reservation/seatReservation.jsp'">
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

    <div class="image-container" onclick="location.href='reservation/seatReservation2.jsp'">
        <img src="img/StudyCafeListTum2.jpg" alt="이미지 2">
        <div class="image-title">블루 스터디카페 영등포점</div>
        <div class "image-description"></div>
        <div class="rating-container">
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9733;</span>
            <span class="star">&#9734;</span>
            <span class="rating-text">4.0 (109)</span>
        </div>
        <div class="image-tags">
            <div class="image-tag">#미성년자가능</div>
            <div class="image-tag">#커피무료</div>
            <div class="image-tag">#시간무료연장</div>
        </div>
    </div>

    <div class="image-container" onclick="location.href='reservation/seatReservation3.jsp'">
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
</div>

    <div class="gallery-container" onclick="location.href='reservation/seatReservation4.jsp'">
    <!-- 갤러리 예약 영역 -->
    <div class="image-container">
      <img src="img/StudyCafeListTum1.jpg" alt="이미지 1">
      <div class="image-title">호그와트 스터디카페 구로점</div>
      <div class="image-description"></div>
     <div class="rating-container">
  	<span class="star">&#9733;</span>
  <span class="star">&#9733;</span>
  <span class="star">&#9733;</span>
  <span class="star">&#9733;</span>
  <span class="star">&#9734;</span>
  <span class="rating-text">4.0 (122)</span>
</div>

      <div class="image-tags">
        <div class="image-tag">#조용해요</div>
        <div class="image-tag">#커피무료</div>
        <div class="image-tag">#오픈행사중</div>
      </div>

    </div>
    <div class="image-container" onclick="location.href='reservation/seatReservation5.jsp'"> 
      <img src="img/StudyCafeListTum2.jpg" alt="이미지 2">
      <div class="image-title">스프링 스터디카페 강남점</div>
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
        <div class="image-tag">#미성년자가능</div>
        <div class="image-tag">#커피무료</div>
        <div class="image-tag">#시간무료연장</div>
      </div>
     
    </div>
    <div class="image-container">
      <img src="img/StudyCafeListTum3.jpg" alt="이미지 3">
      <div class="image-title">커비 스터디카페 코엑스점</div>
      <div class="image-description"></div>
    <div class="rating-container">
  <span class="star">&#9733;</span>
  <span class="star">&#9733;</span>
  <span class="star">&#9733;</span>
  <span class="star">&#9733;</span>
  <span class="star">&#9734;</span>
  <span class="rating-text">4.0 (200)</span>
</div>
      <div class="image-tags">
        <div class="image-tag">#주차가능</div>
        <div class="image-tag">#할인중</div>
        <div class="image-tag">#무소음</div>
      </div>
 
    </div>
    
  </div>
</main>
<% } %>
<footer>
	<jsp:include page="module/footer.jsp"/>
</footer>
</body>
</html>
