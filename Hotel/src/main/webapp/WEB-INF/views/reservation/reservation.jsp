<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<%@ include file="../include/head.jsp"%>

<link rel="stylesheet"  type="text/css" href="https://unpkg.com/vue-airbnb-style-datepicker@latest/dist/vue-airbnb-style-datepicker.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/date-fns/1.29.0/date_fns.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>  
<link href="http://fonts.googleapis.com/css?family=PT+Sans:300,400,500,600,700" rel="stylesheet" type="text/css" />

<style>
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap&subset=korean')
	;
</style>
<style>
		html,
		
		.datepicker-container {
		  margin-bottom: 30px;
		}
		
		#datepicker-button-trigger {
		  background: #008489;
		  border: 1px solid #008489;
		  color: white;
		  padding: 6px 10px;
		  border-radius: 4px;
		  font-size: 15px;
		  font-weight: bold;
		  text-align: center;
		  min-width: 200px;
		}
		input {
		  padding: 6px 10px;
		  border: 1px solid rgba(0, 0, 0, 0.2);
		}
		.inline-with-input {
		  width: 300px;
		}
		.inline-with-input input {
		  width: 100%;
		}
		</style>      
</head>
<body>
	 <!-- header-start -->
    <%@ include file="../include/header.jsp"%>
    <!-- header-end -->
    
     <!-- bradcam_area_start -->
    <div class="bradcam_area breadcam_bg_1">
        <h3>예약하기</h3>
    </div>
    <!-- bradcam_area_end -->
    
    <c:if test="${confirmation_payment eq '1'}">
    <script>
		alert('현재 예약하신 룸이 있습니다. 변경을 하실 경우 취소 후에 예약하시길 바랍니다.');
		location.href="${pageContext.request.contextPath}/reservation/reservationSelect"; 
	</script>
    </c:if>
    
    <c:if test="${confirmation_payment eq '0'}">
     <script>
		alert('결제가 완료되지 않은 예약이 있습니다. 변경을 하실 경우 취소 후에 예약하시길 바랍니다.');
		location.href="${pageContext.request.contextPath}/reservation/reservationSelect"; 
	</script>   	
    </c:if>
    
    <!-- Posts =================================================-->
    
    <section class="whole-wrap" style="height: 700px">
 	<div class="container box_1170">
	 	<div class="section-top-border">
	 			<h2 class="mb-30"></h2>
	 	</div>
    <form action="<c:url value="/reservation/reservationCheck" />" method="post">
	<%-- <script src="<c:url value="/resources/js/moment.js" />"></script> --%>
	      <input id="dateOne" name="reservation_data_in" type="hidden">
	      <input id="dateTwo" name="reservation_data_out" type="hidden">
	<section id="content">
		<div class="content-wrap bgcolor-grey-li2ght">
			<div class="container clearfix">
				<!-- Post Content
	          ============================================= -->
	<div>
		<!-- Posts
	              ============================================= -->
	<div id="posts">
		<div class="entry clearfix">
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> 일정체크 & 객실 인원선택 </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
						<div class="row">
						<div class="col-md-3">
						
							<!-- 달력시작 --><!-- 달력시작 --><!-- 달력시작 --><!-- 달력시작 --><!-- 달력시작 --><!-- 달력시작 --><!-- 달력시작 -->
			<div id="app" class="app" :class="{'align-right': alignRight}">
			 <div  class="datepicker-container with-button">
		        <div class="datepicker-trigger">
		          <button id="datepicker-button-trigger" >
		            {{ formatDates(buttonDateOne, buttonDateTwo) || '날짜를 선택해 주세요' }}
		          </button>
		          <airbnb-style-datepicker
		            :trigger-element-id="'datepicker-button-trigger'"
		            :mode="'range'"
		            :date-one="buttonDateOne"
		            :date-two="buttonDateTwo"
		            :min-date="'2020-04-18'"
		            :fullscreen-mobile="true"
		            :months-to-show="2"
		            :offset-y="10"
		            :trigger="trigger"
		            v-on:date-one-selected="function(val) { buttonDateOne = val }"
		            v-on:date-two-selected="function(val) { buttonDateTwo = val }"
		            v-on:closed="onClosed"
		            v-on:previous-month="onMonthChange"
		            v-on:next-month="onMonthChange"
		          ></airbnb-style-datepicker>
		        </div>
		      </div>
		    </div><!-- 달력끝 --><!-- 달력끝 --><!-- 달력끝 --><!-- 달력끝 --><!-- 달력끝 --><!-- 달력끝 --><!-- 달력끝 --><!-- 달력끝 --><!-- 달력끝 --><!-- 달력끝 -->
				    </div>
	
				    <div class="col-md-3">
					<select class="form-control" name="room_type" >
					  <option value="1">Superior Room</option>
					  <option value="2">Deluxe Room</option>
					  <option value="3">Signature Room</option>
					  <option value="4">Couple Room</option>
					</select>
					</div>
					
						<div class="col-md-3">
					
					<select class="form-control" name="adult" >
					  <option value="1">성인 1</option>
					  <option value="2">성인 2</option>
					  <option value="3">성인 3</option>
					</select>
					</div>
					
					<div class="col-md-3">
		
					<select class="form-control" name="child" >
					  <option value="1">어린이 1</option>
					  <option value="2">어린이 2</option>
					  <option value="3">어린이 3</option>
					</select>
					</div>
					</div>
				</div>
			</div>
		</div>
		
	</div><!-- 아코디언 끝 -->
	<div style="float:right">
				<input class="book_btn d-none d-lg-block" type="submit" value="예약하기" >
				</div>
			</div>
		</div>
	
	</div>
	<!-- .sidebar end -->
			</div>
		</div>
	</section>
	</form>
	</div>
	</section>
	
	<!-- #content end -->
	<script src="https://unpkg.com/vue-airbnb-style-datepicker@latest/dist/vue-airbnb-style-datepicker.min.js"></script>
	   <script>
	    var datepickerOptions = {}
	    Vue.use(window.AirbnbStyleDatepicker, datepickerOptions)
	
	    var app = new Vue({
	      el: '#app',
	      data: {
	        dateFormat: 'YYYY년 MM월 D일',
	        inputDateOne: '',
	        inputDateTwo: '',
	        buttonDateOne: '',
	        buttonDateTwo: '',
	        inlineDateOne: '',
	        sundayDateOne: '',
	        sundayFirst: false,
	        alignRight: false,
	        trigger: false,
	      },
	      methods: {
	        formatDates: function(dateOne, dateTwo) {
	          var formattedDates = ''
	          if (dateOne) {
	            formattedDates =  dateFns.format(dateOne, this.dateFormat)
	          }
	          if (dateTwo) {
	            formattedDates += ' - ' + dateFns.format(dateTwo, this.dateFormat)
	          }
	          return formattedDates
	        },
	        onClosed: function() {
	          var datesStr = this.formatDates(this.inputDateOne, this.inputDateTwo)
	          console.log('Dates Selected: ' + datesStr)
	          this.trigger = false
	          $('#dateOne').val(this.buttonDateOne);
	          $('#dateTwo').val(this.buttonDateTwo);
	          if(this.buttonDateOne=="" || this.buttonDateTwo ==""){
	            	alert("날짜를 선택해 주세요.");
	          }else{
	          alert("선택하신 날짜는 "+this.buttonDateOne+"~"+this.buttonDateTwo+"입니다.");
	          }
	        },
	        toggleAlign: function() {
	          this.alignRight = !this.alignRight
	        },
	        triggerDatepicker: function() {
	          this.trigger = !this.trigger
	        },
	        onMonthChange: function(dates) {
	          console.log('months changed', dates)
	        },
	        login: function(dateOne, dateTwo){
	      	  console.log(this.dateOne, this.dateTwo)
	        },
	      },
	    })
	    
	    function printTime() {
	
	        var clock = document.getElementById("clock");// 출력할 장소 선택
	        var now = new Date();// 현재시간
	        var nowTime = "'" + now.getFullYear() + "-" + (now.getMonth()+1) + "-" + now.getDate() + "'";
	        clock.innerHTML = nowTime;// 현재시간을 출력
	}
		window.onload = function() {// 페이지가 로딩되면 실행
		printTime();
		}
	  </script>
    
    
    
    
    
    
    
    
    
    
    
    <!-- Posts end ===============================================-->
    
    
    <!-- footer -->
    <%@ include file="../include/footer.jsp"%>
    <!-- footer end -->


    <!-- form itself end-->
    <%@ include file="../include/form_itself.jsp"%>    
    <!-- form itself end -->


    <!-- JS here -->
    <%@ include file="../include/hotel_js.jsp"%>   
</body>
</html>