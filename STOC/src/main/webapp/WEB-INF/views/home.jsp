<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 속기 서비스 StoC</title>
<link rel="stylesheet" href="/resources/css/home.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/home.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var swiper = new Swiper(".mySwiper", {
	  spaceBetween: 30,
	  centeredSlides: true,
	  speed : 1000,
	  autoplay: {
	    delay: 3000,
	    disableOnInteraction: false,
	  },
	  pagination: {
	    el: ".swiper-pagination",
	    clickable: true,
	  },
	  navigation: {
	    nextEl: ".swiper-button-next",
	    prevEl: ".swiper-button-prev",
	  },
	});


	$('.swiper-slide').hover(function(){
	  swiper.autoplay.stop();
	}, function(){
	  swiper.autoplay.start();
	});
});
</script>
</head>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"></jsp:include>
<body>
<div class="mgtDiv"></div>
<div class="swiper mySwiper">
  <div class="swiper-wrapper">
    <div class="swiper-slide swiper-slide1">
    	<img alt="slide1" src="/resources/img/slide1.png">
    </div>
    <div class="swiper-slide swiper-slide2">
    	<img alt="slide1" src="/resources/img/slide2.png">
    </div>
    <div class="swiper-slide swiper-slide3">
    	<img alt="slide1" src="/resources/img/slide3.png">
    </div>
  </div>
  <div class="swiper-button-next"></div>
  <div class="swiper-button-prev"></div>
  <div class="swiper-pagination"></div>
</div>
<div class="homeDiv1"></div>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="false"></jsp:include>
</html>