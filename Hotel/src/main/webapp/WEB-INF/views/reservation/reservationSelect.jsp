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
        <h3>예약조회 및 취소</h3>
    </div>
    <!-- bradcam_area_end -->
    
    
 	<!-- Content -->
 	<section class="whole-wrap" style="height: 700px">
	 	<div class="container box_1170">
		 	<div class="section-top-border">
		 		<h2 class="mb-30"></h2>
			</div>
			
			
			<div class="container clearfix">

                <!-- Contact Form Overlay
                ============================================= -->
                <div id="contact-form-overlay" class="clearfix bgcolor-grey">

                    <div class="fancy-title title-dotted-border">
                        <h3>예약 조회 및 취소</h3>
                    </div>

                    <div id="contact-form-result" data-notify-type="success" data-notify-msg="<i class=icon-ok-sign></i> Message Sent Successfully!">
                    </div>
                   
                     <c:if test="${confirmation_payment eq null}">
                             <span style="color: red"> 현재 조회된 결과가 없습니다</span>  
                      </c:if>
                    <!-- Contact Form
                    ============================================= -->
                       <c:if test="${confirmation_payment ne null}">
                    <form>
					<%-- <input type="hidden" name="reservation_number" id="reservation_number" value="${dto.reservation_number}"> --%>
			
						 	<div class="col_full">
							<label for="template-contactform-name">예약번호</label><br>
							<div class="well well-sm"><c:out value="${reservationVO.reservation_number}" /></div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<label for="template-contactform-name">아이디</label><br>
							<div class="well well-sm"><c:out value="${reservationVO.userId}" /></div>
						</div> 
						
						
                      	 <div class="col-md-6">
							<label for="template-contactform-name">룸 번호</label><br>
							<div class="well well-sm"><c:out value="${reservationVO.room_type}"/></div>
						</div> 
						
					</div>
					<div class="row">
						<div class="col-md-6">
							<label for="template-contactform-name">성인</label><br>
							<div class="well well-sm"><c:out value="${reservationVO.adult}" /></div>
						</div>

						<div class="col-md-6">
							<label for="template-contactform-name">어린이</label><br>
							<div class="well well-sm"><c:out value="${reservationVO.child}" /></div>
						</div>
					</div>
					
					<div class="col_full">
							<label for="template-contactform-name">가격</label><br>
							<div class="well well-sm"><fmt:formatNumber value="${reservationVO.price}" pattern="#,###" /></div>
					</div>
					
                        <div class="clearfix" style=" text-align:center;" >
		                        <c:if test="${confirmation_payment eq '0'}">
		                           <button type="button" id="pay"  class="btn btn-danger" >
		                                <span >결제하기</span> 
		                                <i class="icon-angle-right"></i>
		                           </button>
                            	</c:if>
                                <c:if test="${confirmation_payment eq '1' || confirmation_payment eq '0'}">
                               		<button type="button" id="cancel"  class="btn btn-danger" onclick="ReservationCancel()">
		                                <span >예약취소</span> 
		                                <i class="icon-angle-right"></i>
		                           </button>
                               	</c:if>
                                </div>
                        </form>
                         </c:if>
                 <script>
                       
                       $("#pay").click(function(){
                    	   location.href = "${pageContext.request.contextPath}/reservation/reservationPay?number=${reservationVO.reservation_number}"
                       });
                       
                       $("#cancel").click(function(){ //예약취소 버튼을 클릭 시 
							location.href = "${pageContext.request.contextPath}/reservation/reservationCancel"
							alert('예약이 정상적으로 취소되었습니다. 감사합니다.');
                       	});
                       
               	   
	             </script>

                    <script type="text/javascript">
                        $("#template-contactform").validate({
                            submitHandler: function(form) {
                                $('.form-process').fadeIn();
                                $(form).ajaxSubmit({
                                    target: '#contact-form-result',
                                    success: function() {
                                        $('.form-process').fadeOut();
                                        $('#template-contactform').find('.sm-form-control').val('');
                                        $('#contact-form-result').attr('data-notify-msg', $('#contact-form-result').html()).html('');
                                        IGNITE.widget.notifications($('#contact-form-result'));
                                    }
                                });
                            }
                        });
                    </script>
                    
             
                    <div class="line"></div>

                    <!-- Contact Info
                    ============================================= -->
                 
                    </div>

                </div><!-- Contact Form Overlay End -->

		</div>
		
	</section>
 		
 	
 	
 	<!-- Content end -->
 	
 	
    <!-- footer -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer end -->



    <!-- JS here -->
    <%@ include file="../include/hotel_js.jsp"%>   
</body>
</html>