<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 속기 서비스 StoC</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/home.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="/resources/util/jquery.timepicker.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/util/jquery.timepicker.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/resources/js/home.js"></script>
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
	
	$("#dateTxt").datepicker({
        dateFormat: 'yy-mm-dd'
        ,showMonthAfterYear:true
        ,changeYear: true
        ,changeMonth: true                
        ,buttonImageOnly: false
        ,yearSuffix: "년"
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        ,dayNamesMin: ['일','월','화','수','목','금','토']
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
    });                    
    
    $('#dateTxt').datepicker('setDate', 'today');
    
    $("#timeTxt").timepicker({
    	step: 30, timeFormat: "H:i"
    });
    $("#timeTxt").timepicker('setTime', new Date());
    
    $('input[name=dateTxt]').attr("readonly",true);
    
    $("#phoneTxt").on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
     });
    
    $(".gubun").on("click", function(){
    	$("#param_gubun").val($(this).val());
    });
    
    $("#sendBtn").on("click", function(){
    	if($("#nameTxt").val()==""){
    		alert("이름을 입력해주세요.");
    	}
    	else if($("#phoneTxt").val()==""){
    		alert("연락처를 입력해주세요.");
    	}
    	else if($("#dateTxt").val()==""){
    		alert("날짜를 입력해주세요.");
    	}
    	else if($("#timeTxt").val()==""){
    		alert("시간을 입력해주세요.");
    	}
    	else if($("#emailTxt").val()==""){
    		alert("이메일을 입력해주세요.");
    	}
    	else if($("#noteTxt").val()==""){
    		alert("문의 내용을 입력해주세요.");
    	}
    	else if($("#param_gubun").val()==""){
    		alert("문의 내용을 입력해주세요.");
    	}
    	else{
    		$("#param_name").val($("#nameTxt").val());
    		$("#param_phone").val($("#phoneTxt").val());
    		$("#param_date").val($("#dateTxt").val());
    		$("#param_time").val($("#timeTxt").val());
    		$("#param_email").val($("#emailTxt").val());
    		var text = $("#noteTxt").val();
			text = text.replaceAll(/(\n|\r\n)/g, "<br>");
			$("#param_note").val(text);
    		var confirmChk = confirm('문의 메일을 보내시겠습니까?');
		    if(confirmChk) {
				sendMail();
		    }
    	}
    });
    
    $("#qna_mailBtn, #qna_mailDiv").on("click", function(){
    	var offset = $(".homeDiv3_top").offset();
		$("html, body").animate({scrollTop: offset.top-120},400);
    });
    
    $("#qna_talkBtn, #qna_talkDiv").on("click", function(){
    	window.open("https://open.kakao.com/o/skkw8oWe", "_blank");
    });
    
    $("#qna_naverBtn, #qna_naverDiv").on("click", function(){
    	window.open("https://talk.naver.com/ct/w46e1j?frm=pmd", "_blank");
    });
    
});

function sendMail(){
	var params = $("#homeForm").serialize();
	$.ajax({
		type : "post",
		url : "/sendMailAjax",
		data : params,
		success : function(rcvData){
			alert("메일 전송을 완료하였습니다.");
			location.replace("/");
		},
		error : function(request, status, error){
			alert("Error");
			console.log("status : " + request.status);
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
</script>
</head>
<jsp:include page="/WEB-INF/views/header.jsp" flush="false"></jsp:include>
<body>
	<div class="quick">
		<div class="quick_000">
		<img src="/resources/img/qna_logo.png" alt="logo">
	    </div>
		<div class="quick_0 quick_1" id="qna_mailDiv">
		<img src="/resources/img/qna_mail.png" id="qna_mailBtn" alt="qnaBtn">&nbsp;&nbsp;&nbsp;문의하기
	    </div>
		<div class="quick_0 quick_2" id="qna_talkDiv">
		<img src="/resources/img/qna_talk.png" id="qna_talkBtn" alt="kakaoBtn">&nbsp;&nbsp;카톡상담
	    </div>
		<div class="quick_0 quick_3" id="qna_naverDiv">
		<img src="/resources/img/qna_naver.png" id="qna_naverBtn" alt="naverBtn">&nbsp;&nbsp;&nbsp;네이버톡 상담
	    </div>
		<div class="quick_00 quick_4">
		<span style="color:#024C8B;">고객센터</span><br>
		010-3453-5661
	    </div>
		<div class="quick_00 quick_5">
		<span style="color:#024C8B;">상담 시간</span><br>
		24시간
	    </div>
    </div>
	<div class="mgtDiv"></div>
	<div class="swiper mySwiper">
	  <div class="swiper-wrapper">
	    <div class="swiper-slide swiper-slide1">
	    	<img alt="slide1" src="/resources/img/slide1.png">
	    </div>
	    <div class="swiper-slide swiper-slide2">
	    	<img alt="slide1" src="/resources/img/slide2.png">
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
					<img alt="gallery1" src="/resources/img/gallery1.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트 전달해주시면 수정하겠습니다.</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="gallery2" src="/resources/img/gallery2.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트 전달해주시면 수정하겠습니다.</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="gallery3" src="/resources/img/gallery3.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트 전달해주시면 수정하겠습니다.</span>
				</div>
			</div>
		</div>
		<div class="homeDiv1_mid">
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="gallery4" src="/resources/img/gallery4.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트 전달해주시면 수정하겠습니다.</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="gallery5" src="/resources/img/gallery5.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트 전달해주시면 수정하겠습니다.</span>
				</div>
			</div>
			<div class="homeDiv1_mid_imgDiv">
				<div class="homeDiv1_mid_imgDiv_top">
					<img alt="gallery6" src="/resources/img/gallery6.png"><br>
				</div>
				<div class="homeDiv1_mid_imgDiv_bot">
					<span>- 스크립트 전달해주시면 수정하겠습니다.</span>
				</div>
			</div>
		</div>
		</div>
		<div class="homeDiv1_bottom">
			<button class="galAddBtn">+ 갤러리 더보기</button>
		</div>
	</div>
	<div class="homeDiv3_top">
		<문의하기>
	</div>	
	<div class="homeDiv3">
		<div class="homeDiv3_1_blank"></div>
		<div class="homeDiv3_1">
			<div class="homeDiv3_1_l">
				구분
			</div>
			<div class="homeDiv3_1_r">
				<input type="radio" class="gubun" name="gubun" value="실시간 속기">
				<span>실시간 속기</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" class="gubun" name="gubun" value="방송 프리뷰">
				<span>방송 프리뷰</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" class="gubun" name="gubun" value="외국어 자막 송출">
				<span>외국어 자막 송출</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" class="gubun" name="gubun" value="회의록">
				<span>회의록</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" class="gubun" name="gubun" value="교육 속기">
				<span>교육 속기</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" class="gubun" name="gubun" value="각종 자막 작업">
				<span>각종 자막 작업</span>
			</div>
		</div>
		<div class="homeDiv3_1">
			<div class="homeDiv3_1_l">
				이름
			</div>
			<div class="homeDiv3_1_r">
				<input type="text" class="nameTxt" id="nameTxt" maxLength="30"/>
			</div>
		</div>
		<div class="homeDiv3_1">
			<div class="homeDiv3_1_l">
				연락처
			</div>
			<div class="homeDiv3_1_r">
				<input type="text" placeholder="'-' 빼고 입력해주세요." id="phoneTxt" class="phoneTxt" maxLength="15"/>
			</div>
		</div>
		<div class="homeDiv3_1">
			<div class="homeDiv3_1_l">
				날짜
			</div>
			<div class="homeDiv3_1_r">
				<input type="text" class="dateTxt" id="dateTxt"/>&nbsp;&nbsp;
				<input type="text" class="timeTxt" id="timeTxt" maxLength="5"/>
			</div>
		</div>
		<div class="homeDiv3_1">
			<div class="homeDiv3_1_l">
				이메일
			</div>
			<div class="homeDiv3_1_r">
				<input type="text" class="emailTxt" id="emailTxt" maxLength="40"/>
			</div>
		</div>
		<div class="homeDiv3_0">
			<div class="homeDiv3_1_l">
				문의 내용
			</div>
			<div class="homeDiv3_1_r">
				<textarea class="noteTxt" id="noteTxt"></textarea>
			</div>
		</div>
		<div class="homeDiv3_btnDiv">
			<button class="sendBtn" id="sendBtn">전송</button>
		</div>
	</div>
	<form action="#" id="homeForm" method="post">
		<input type="hidden" id="param_gubun" name="param_gubun"/>
		<input type="hidden" id="param_name" name="param_name"/>
		<input type="hidden" id="param_phone" name="param_phone"/>
		<input type="hidden" id="param_date" name="param_date"/>
		<input type="hidden" id="param_time" name="param_time"/>
		<input type="hidden" id="param_email" name="param_email"/>
		<input type="hidden" id="param_note" name="param_note"/>
	</form>
</body>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="false"></jsp:include>
</html>