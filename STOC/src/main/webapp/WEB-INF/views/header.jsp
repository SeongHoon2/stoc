<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="resources/img/title.png" sizes="16x16" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/layout.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#homeBtn").addClass("menuBtn_sel");
});

</script>
</head>
<body>
	<div class="headerFrame">
		<div class="headerDiv">
			<div class="headerDiv_logo">
				<img alt="logo" src="resources/img/logo.png">
			</div>
			<div class="headerDiv_menu">
				<button class="menuBtn" id="homeBtn">홈</button>&nbsp;&nbsp;
				<button class="menuBtn" id="infoBtn">소개</button>&nbsp;&nbsp;
				<button class="menuBtn" id="galleryBtn">현장갤러리</button>&nbsp;&nbsp;
				<button class="menuBtn" id="serviceBtn">서비스</button>&nbsp;&nbsp;
				<button class="menuBtn" id="qnaBtn">문의/신청</button>
			</div>
		</div>
	</div>
</body>
</html>