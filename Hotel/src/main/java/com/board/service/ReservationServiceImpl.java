package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.ReservationDAO;
import com.board.domain.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDAO reservationDAO;
	
	@Override
	public void reservation_number_people(ReservationVO reservationVO) {
		reservationDAO.reservation_number_people(reservationVO);
		
	}

	@Override
	public int RoomPrice(ReservationVO reservationVO) {
		return reservationDAO.RoomPrice(reservationVO);
	}

	@Override
	public void reservationInsert(ReservationVO reservationVO) {
		reservationDAO.reservationInsert(reservationVO);
		
	}

	@Override
	public int DuplicateFind(ReservationVO reservationVO) {
		return reservationDAO.DuplicateFind(reservationVO);
	}

	@Override
	public String PayCheck(String userId) {
		return reservationDAO.PayCheck(userId);
	}

	@Override
	public void PayCheckUpdate(String number) {
		reservationDAO.PayCheckUpdate(number);
	}

	@Override
	public ReservationVO reservationSelect(String userId) {
		return reservationDAO.ReservationSelect(userId);
	}

	@Override
	public void ReservationDelete() {
		reservationDAO.ReservationDelete();
	}
	

}
