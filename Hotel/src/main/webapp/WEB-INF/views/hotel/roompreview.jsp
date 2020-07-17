<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="../include/head.jsp"%>
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
    
    <!-- features_room_startt -->
    <div class="features_room">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-100">
                        <span>Featured Rooms</span>
                        <h3>객실안내</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="rooms_here">
            <div class="single_rooms">
                <div class="room_thumb">
                    <img src="${path}/img/rooms/1.png" alt="">
                    <div class="room_heading d-flex justify-content-between align-items-center">
                        <div class="room_heading_inner">
                            <span>From $250/night</span>
                            <h3>Superior Room</h3>
                        </div>
                        <a href="${path}/hotel/superiorroom" class="line-button">둘러보기</a>
                    </div>
                </div>
            </div>
            <div class="single_rooms">
                <div class="room_thumb">
                    <img src="${path}/img/rooms/2.png" alt="">
                    <div class="room_heading d-flex justify-content-between align-items-center">
                        <div class="room_heading_inner">
                            <span>From $250/night</span>
                            <h3>Deluxe Room</h3>
                        </div>
                        <a href="${path}/hotel/deluxeroom" class="line-button">둘러보기</a>
                    </div>
                </div>
            </div>
            <div class="single_rooms">
                <div class="room_thumb">
                    <img src="${path}/img/rooms/3.png" alt="">
                    <div class="room_heading d-flex justify-content-between align-items-center">
                        <div class="room_heading_inner">
                            <span>From $250/night</span>
                            <h3>Signature Room</h3>
                        </div>
                        <a href="${path}/hotel/signatureroom" class="line-button">둘러보기</a>
                    </div>
                </div>
            </div>
            <div class="single_rooms">
                <div class="room_thumb">
                    <img src="${path}/img/rooms/4.png" alt="">
                    <div class="room_heading d-flex justify-content-between align-items-center">
                        <div class="room_heading_inner">
                            <span>From $250/night</span>
                            <h3>Couple Room</h3>
                        </div>
                        <a href="${path}/hotel/coupleroom" class="line-button">둘러보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- features_room_end -->
    <!-- footer -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer end -->


    <!-- JS here -->
    <%@ include file="../include/hotel_js.jsp"%>   
</body>
</html>