package com.board.service;

import com.board.domain.ReservationVO;

public interface ReservationService {
	public void reservation_number_people(ReservationVO reservationVO);

	public int RoomPrice(ReservationVO reservationVO);

	public void reservationInsert(ReservationVO reservationVO);

	public int DuplicateFind(ReservationVO reservationVO);
	
	public String PayCheck(String userId);
	
	public void PayCheckUpdate(String number);
	
	public ReservationVO reservationSelect(String userId);
	
	public void ReservationDelete();
	
}
