package com.board.dao;

import com.board.domain.ReservationVO;

public interface ReservationDAO {
	
	public void reservation_number_people(ReservationVO reservationVO);
	
	public int RoomPrice(ReservationVO reservationVO);
	
	public void reservationInsert(ReservationVO reservationVO);
	
	public int DuplicateFind(ReservationVO reservationVO);
	
	public String PayCheck(String userId);

	public void PayCheckUpdate(String number);
	
	public ReservationVO ReservationSelect(String userId);
	
	public void ReservationDelete();

}
