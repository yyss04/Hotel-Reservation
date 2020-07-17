package com.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.ReservationVO;
import com.board.domain.UserVO;
import com.board.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Inject
	ReservationService reservationService;

	// 예약하기 이동(예약유무판단)
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(HttpSession session, UserVO userVO, Model model) {
		String confirmation_payment = reservationService.PayCheck((String)session.getAttribute("userId"));
		model.addAttribute("confirmation_payment", confirmation_payment);
		return "/reservation/reservation";
	}

	// 예약하기 insert
	@RequestMapping(value = "/reservationCheck", method = RequestMethod.POST)
	public String reservationCheck(ReservationVO reservationVO, HttpSession session, Model model) throws ParseException {
		reservationVO.setUserId((String)session.getAttribute("userId"));
		// 해당날짜가 이미 예약되었을 경우
		int duplicateFind = reservationService.DuplicateFind(reservationVO);
		if (duplicateFind >= 1) {
			model.addAttribute("duplicateFind", duplicateFind);
			return "/reservation/reservationCheck";
		}
		
		// UUID 생성 예약번호로 사용할 것
		// 생성된 예약번호를 담음
		String ReservationNumber = UUID.randomUUID().toString();
		reservationVO.setReservation_number(ReservationNumber);
		// 날짜, 방타입, 인원정보 insert
		reservationService.reservation_number_people(reservationVO);
		// db 룸가격가져와서 RoomPrice에 넣기
		int RoomPrice = reservationService.RoomPrice(reservationVO);
		
		// 체크인, 체크아웃 날짜간 차이 구하기
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");	// 내가 원하는 날짜 형식을 지정 (포맷)
		Date beginDate = formatter.parse(reservationVO.getReservation_data_in());	// 체크인
		Date endDate = formatter.parse(reservationVO.getReservation_data_out());	// 체크아웃
		long diff = endDate.getTime() - beginDate.getTime();	// 체크아웃-체크인 시간차이
		long diffDays = diff / (24 * 60 * 60 * 1000) + 1;	// 날짜 계산 하루예약은 0이므로 +1을 함
		
		// 날짜 차이 * 룸 가격
		int price = RoomPrice * (int) diffDays;
		reservationVO.setPrice(price);
		
		// 예약정보 insert
		reservationService.reservationInsert(reservationVO);
		model.addAttribute("reservationVO", reservationVO);
		
		return "/reservation/reservationCheck";
	}
	
	// 결제처리
	@RequestMapping(value = "/reservationPay", method = RequestMethod.GET)
	public String reservationPay(@RequestParam("number") String number) {
		reservationService.PayCheckUpdate(number);
		return "/home";
	}
	
	
	// 예약 조회
	@RequestMapping(value = "/reservationSelect", method = RequestMethod.GET)
	public String reservationSelect(HttpSession session, ReservationVO reservationVO, Model model) {
		String confirmation_payment = reservationService.PayCheck((String) session.getAttribute("userId"));
		reservationVO = reservationService.reservationSelect((String) session.getAttribute("userId"));
		model.addAttribute("confirmation_payment", confirmation_payment);
		model.addAttribute("reservationVO", reservationVO);
		return "/reservation/reservationSelect";
	}
	
	
	// 예약 취소
	@RequestMapping(value = "/reservationCancel", method = RequestMethod.GET)
	public String reservationCancel() {
		reservationService.ReservationDelete();
		return "/home";
	}
	
	
	
	
	
}
