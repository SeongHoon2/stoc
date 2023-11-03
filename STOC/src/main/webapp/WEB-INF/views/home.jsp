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
	<div class="homeDiv1">
		<div class="homeDiv1_top">
			<현장 갤러리>
		</div>	
		<div class="homeDiv1_mid">
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery1.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 세계 지식 포럼</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery2.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 카카오 모빌리티 동시통역</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery3.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- TV조선 아카데미</span>
				</div>
			</div>
		</div>
		<div class="homeDiv1_mid">
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery4.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 강원도 장애인 단체 협회</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery5.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 경기도 농아인 협회</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery6.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 전주 시청</span>
				</div>
			</div>
		</div>
		<div class="homeDiv1_mid">
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery7.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 전국 민주시민 교육박람회</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery8.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 인천 인권영화제</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery9.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트를 전달해주시면 수정해드리겠습니다.</span>
				</div>
			</div>
		</div>
		<div class="homeDiv1_mid">
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery10.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트를 전달해주시면 수정해드리겠습니다.</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery11.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트를 전달해주시면 수정해드리겠습니다.</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="slide1" src="/resources/img/gallery12.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트를 전달해주시면 수정해드리겠습니다.</span>
				</div>
			</div>
		</div>
		<div class="homeDiv1_bottom">
			<button class="galAddBtn">+ 갤러리 더보기</button>
		</div>
	</div>
	<div class="homeDiv2">
		<img alt="slide1" src="/resources/img/infoBanner.png">		
	</div>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="false"></jsp:include>
</html>