<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<%@ include file="include/head.jsp"%>
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
    <%@ include file="include/header.jsp"%>
    <!-- header-end -->

    <!-- slider_area_start -->
    <%@ include file="include/slider_area.jsp"%>
    <!-- slider_area_end -->

    <!-- about_area_start -->
    <div class="about_area">
        <div class="container">
            <div class="row slideanim">
                <div class="col-xl-5 col-lg-5">
                    <div class="about_info sl">
                        <div class="section_title mb-20px">
                            <span>About Us</span>
                            <h3>자연과 함께하는 <br>
                               	 럭셔리 호텔</h3>
                        </div>
                        <p>마음까지 탁 트이게 해주는 멋진 바다풍경,<br>
			                        지친 몸과 마음을 힐링시켜줄 휴식공간,<br>
			                        럭셔리 호텔로 여러분을 초대합니다.</p>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7">
                    <div class="about_thumb d-flex">
                        <div class="img_1">
                            <img src="img/about/about_1.png" alt="">
                        </div>
                        <div class="img_2">
                            <img src="img/about/about_2.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about_area_end -->


    <!-- about_area_start -->
    <div class="about_area">
        <div class="container">
            <div class="row  slideanim">
                <div class="col-xl-7 col-lg-7">
                    <div class="about_thumb2 d-flex">
                        <div class="img_1">
                            <img src="img/about/1.png" alt="">
                        </div>
                        <div class="img_2">
                            <img src="img/about/2.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5">
                    <div class="about_info">
                        <div class="section_title mb-20px">
                            <span>Delicious Food</span>
                            <h3>신선한 재료로 만든<br>
								특별하고 맛있는 음식</h3>
                        </div>
                        <p>셰프가 매일 직접 엄선한 신선한 재료들을 이용하여<br>
                        	열정이 살아 숨쉬는 맛있는 음식을 제공합니다.<br>
                        	모던하고 안락한 분위기에서 최고의 서비스와 함께<br>
                        	정성스럽게 준비한 건강한 음식을 맛보실 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about_area_end -->
    
    
        <!-- about_info_area_start -->
    <div class="about_info_area">
        <div class="about_active owl-carousel">
            <div class="single_slider about_bg_1"></div>
            <div class="single_slider about_bg_1"></div>
            <div class="single_slider about_bg_1"></div>
            <div class="single_slider about_bg_1"></div>
        </div>
    </div>
    <!-- about_info_area_start -->

    <!-- about_main_info_start -->
    <div class="about_main_info">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-md-6">
                    <div class="single_about_info">
                        <h3>Relax and Enjoy your<br>
						Vacation</h3>
                            <p>지친 일상에서 벗어나 어디론가 훌쩍 떠나고 싶을 때,<br>
                            문득 가슴이 답답해 바다를 보러 가고 싶은 그런 날,<br>
                            럭셔리 호텔이 여러분을 기다리고 있습니다.<br>
                            바다가 보이는 예쁜 카페와 라운지가<br>
                            여러분의 여행을 더욱 특별하게 만들어줄 것입니다.
                            </p>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- about_main_info_end -->

   	<!-- footer -->
    <%@ include file="include/footer.jsp"%>
    <!-- footer end -->


    <!-- JS here -->
    <%@ include file="include/hotel_js.jsp"%>
    



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