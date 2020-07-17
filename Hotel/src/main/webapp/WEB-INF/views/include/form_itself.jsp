<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<body>
<form id="test-form" class="white-popup-block mfp-hide">
                <div class="popup_box ">
                        <div class="popup_inner">
                            <h3>예약하기</h3>
                            <form action="<c:url value="/reservation/reservationCheck" />" method="post">
                                <div class="row">
                                    <div class="col-xl-6">
                                        <input id="datepicker" placeholder="체크인">
                                    </div>
                                    <div class="col-xl-6">
                                        <input id="datepicker2" placeholder="체크아웃">
                                    </div>
                                    <div class="col-xl-6">
                                        <select class="form-select wide" id="default-select" name="adult">
                                            <option data-display="어른">1</option>
                                            <option value="1">2</option>
                                            <option value="2">3</option>
                                            <option value="3">4</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-6">
                                        <select class="form-select wide" id="default-select" name="child">
                                            <option data-display="어린이">1</option>
                                            <option value="1">2</option>
                                            <option value="2">3</option>
                                            <option value="3">4</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <select class="form-select wide" id="default-select" class="room_type">
                                            <option data-display="Room type">Room type</option>
                                            <option value="1">Superior Rooms</option>
                                            <option value="2">Deluxe Room</option>
                                            <option value="3">Signature Room</option>
                                            <option value="4">Couple Room</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <button type="submit" class="boxed-btn3">예약하기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </form>
</body>
</html>