<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="../css/loginPage.css">
<link rel="stylesheet" type="text/css" href="../css/scList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flying</title>

<script>
function goToScList() {
  window.location.href = "#";
}
</script>
</head>
<body>
<header>
    <jsp:include page="../module/header2.jsp" flush="false" />
    
</header>
<main>
  <div class="search-container">
 <form>
  <input type="text" placeholder="원하는 스터디카페를 검색해보세요...">
  <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
  <div class="round-box">실시간 현황 보기</div>
</form>

  </div>
  <div class="gallery-container">
    <!-- 갤러리 예약 영역 -->
    <div class="image-container">
      <img src="../img/Thumbnail/StudyCafeListTum1.jpg" alt="이미지 1">
      <div class="image-title">제목1</div>
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
    <div class="image-container">
      <img src="../img/Thumbnail/StudyCafeListTum2.jpg" alt="이미지 2">
      <div class="image-title">제목2</div>
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
      <img src="../img/Thumbnail/StudyCafeListTum3.jpg" alt="이미지 3">
      <div class="image-title">제목3</div>
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
  
    <div class="gallery-container">
    <!-- 갤러리 예약 영역 -->
    <div class="image-container">
      <img src="../img/Thumbnail/StudyCafeListTum1.jpg" alt="이미지 1">
      <div class="image-title">제목1</div>
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
    <div class="image-container">
      <img src="../img/Thumbnail/StudyCafeListTum2.jpg" alt="이미지 2">
      <div class="image-title">제목2</div>
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
      <img src="../img/Thumbnail/StudyCafeListTum3.jpg" alt="이미지 3">
      <div class="image-title">제목3</div>
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
</main>

<footer>
	<jsp:include page="../module/footer.jsp"/>
</footer>
</body>
</html>