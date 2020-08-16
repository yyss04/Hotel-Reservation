<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="../include/head.jsp"%>
<style type="text/css">
.slideanim {visibility:hidden;}
.slide {
  animation-name: slide;
  -webkit-animation-name: slide;
  animation-duration: 1s;
  -webkit-animation-duration: 1s;
  visibility: visible;
}

@keyframes slide {
  0% {
    opacity: 0;
    transform: translateY(70%);
  }
  100% {
    opacity: 1;
    transform: translateY(0%);
  }
}
@-webkit-keyframes slide {
  0% {
    opacity: 0;
    -webkit-transform: translateY(70%);
  }
  100% {
    opacity: 1;
    -webkit-transform: translateY(0%);
  }
}</style>
</head>
<body>
	 <!-- header-start -->
    <%@ include file="../include/header.jsp"%>
    <!-- header-end -->
    
     <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3>Rooms</h3>
    </div>
    <!-- bradcam_area_end -->
    
    
 	<!-- Content -->
 	<section class="whole-wrap">
 	<div class="container box_1170">
 		<div class="section-top-border">
	 		<h2 class="mb-30">Couple room</h2>
	 			<div class="row slideanim">
			 			<img src="${path}/img/rooms/4.png" alt="">
				</div>
 		</div>
 		
		<div class="slideanim">
	 		<div class="section-top-border">
	 			<h2 class="mb-30">객실개요</h2>
				<ul class="unordered-list"> 
	                 <li>침대 타입 : 더블침대 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 체크인/체크아웃 : 14:00 / 11:00</li>
	                 <li>최대 수용인원 : 2명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 전망 : 마운틴 뷰</li>
	         	</ul>
			</div>
			<div class="section-top-border">
	       		<h2 class="mb-30">서비스</h2>
	       		<ul class="unordered-list"> 
					<li>아름다운 전망(오션뷰)</li>
					<li>Spa & Garden 해온: 사계절 야외수영장 및 자쿠지, 사우나</li>
					<li>해온(he:on) 베딩 시스템: 최상의 숙면을 위한 침대 및 침구류</li>
					<li>전 객실 초고속 무료 인터넷 (유선, 와이파이)</li>
				</ul>
			</div>
			<div class="section-top-border">
	             <h2 class="mb-30">어메니티</h2>
	             <ul class="unordered-list">
	                <li>일반 : 55" LCD TV / 발코니 / 손전등</li>
	                <li> 욕실 : 욕실용품(몰튼브라운) / 비데 / 면도기 / 목욕 가운 / 헤어드라이어</li>
	                <li>기타 : 케이블,위성 TV채널 / 무료 생수 1일 3병 / 무료 차(Tea) 서비스 제공</li>
	             </ul>
	        </div>
    	</div>
 	</div>
 	</section>
 	<!-- Content end -->
 	
 	
    <!-- footer -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer end -->



    <!-- JS here -->
    <%@ include file="../include/hotel_js.jsp"%>   
</body>
<script type="text/javascript">
$(window).scroll(function() {
	  $(".slideanim").each(function(){
	    var pos = $(this).offset().top;

	    var winTop = $(window).scrollTop();
	    if (pos < winTop + 600) {
	      $(this).addClass("slide");
	    }
	  });
	});
</script>
</html>