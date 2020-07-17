<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid p-0">
                    <div class="row align-items-center no-gutters">
                        <div class="col-xl-5 col-lg-6">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a class="active" href="${path}/">home</a></li>
                                        <li><a href="#">Rooms <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="${path}/hotel/roompreview">룸 미리보기</a></li>
                                                <li><a href="${path}/hotel/superiorroom">Superior Room</a></li>
                                                <li><a href="${path}/hotel/deluxeroom">Deluxe Room</a></li>
                                                <li><a href="${path}/hotel/signatureroom">Signature Room</a></li>
                                                <li><a href="${path}/hotel/coupleroom">Couple Room</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Reservation <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="${path}/reservation/reservation">예약하기</a></li>
                                                <li><a href="${path}/reservation/reservationSelect">예약조회 및 취소</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Community <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="${path }/article/listSearch">후기게시판</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo-img">
                                <a href="${path}/">
                                    <img src="${path}/img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-4 d-none d-lg-block">
                            <div class="book_room">
                                <div class="socail_links">
                                    <ul>
                                    	<c:if test="${not empty login}">
	                                        <li>
		                                       <a href="${path}/user/logout">LOGOUT</a>
		                                    </li>
                                        </c:if>
                                        <c:if test="${empty login}">
	                                        <li>
		                                       <a href="${path}/user/login">LOGIN</a>
		                                    </li>
		                                    <li>
                                           		<a href="${path}/user/register">JOIN</a>
                                        	</li>
                                        </c:if>
                                       
                                         
                                    </ul>
                                </div>
                               
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->
</html>