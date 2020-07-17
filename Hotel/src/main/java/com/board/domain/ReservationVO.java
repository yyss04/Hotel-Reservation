package com.board.domain;

/*
 * CREATE TABLE tbl_reservation (
		  reservation_number varchar(40) NOT NULL,
		  userid VARCHAR(50) NOT NULL,
		  RESERVATION_DATE_IN date DEFAULT NULL,
		  RESERVATION_DATE_OUT date DEFAULT NULL,
		  CONFIRMATION_PAYMENT tinyint(1) DEFAULT NULL,
		  price int(50) DEFAULT NULL,
		  PRIMARY KEY (reservation_number),
		  KEY `tbl_reservation_fk` (`userid`),
		  CONSTRAINT `tbl_reservation_fk` FOREIGN KEY (`userid`) REFERENCES `tbl_user` (`userid`),
		  CONSTRAINT `FK_RESERVATION_NUMBER_PEOPLE_TO_RESERVATION` FOREIGN KEY (`reservation_number`) REFERENCES `tbl_room_people` (`reservation_number`)		  
		  );


-- 방 정보 테이블 
CREATE TABLE tbl_room_information(
	room_type VARCHAR(30) NOT NULL,
	room_prices INT NOT NULL,
	PRIMARY KEY(room_type)
);


-- 예약시 선택해야할때(드롭다운) 테이블
CREATE TABLE tbl_room_people(
	reservation_number VARCHAR(40) NOT NULL,	
	room_type VARCHAR(30) NOT NULL,				
	adult INT DEFAULT NULL,							
	child INT NULL,									
	PRIMARY KEY(reservation_number),
	CONSTRAINT `tbl_room_people_fk` FOREIGN KEY (`room_type`) REFERENCES `tbl_room_information` (`room_type`)	
);
 */
public class ReservationVO {
	private String reservation_number;
	private String userId;
	private String reservation_data_in;
	private String reservation_data_out;
	private String room_type;
	private boolean confirmation_payment;
	private int adult;
	private int child;
	private int price;
	public String getReservation_number() {
		return reservation_number;
	}
	public void setReservation_number(String reservation_number) {
		this.reservation_number = reservation_number;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReservation_data_in() {
		return reservation_data_in;
	}
	public void setReservation_data_in(String reservation_data_in) {
		this.reservation_data_in = reservation_data_in;
	}
	public String getReservation_data_out() {
		return reservation_data_out;
	}
	public void setReservation_data_out(String reservation_data_out) {
		this.reservation_data_out = reservation_data_out;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public boolean isConfirmation_payment() {
		return confirmation_payment;
	}
	public void setConfirmation_payment(boolean confirmation_payment) {
		this.confirmation_payment = confirmation_payment;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "ReservationVO [reservation_number=" + reservation_number + ", userId=" + userId
				+ ", reservation_data_in=" + reservation_data_in + ", reservation_data_out=" + reservation_data_out
				+ ", room_type=" + room_type + ", confirmation_payment=" + confirmation_payment + ", adult=" + adult
				+ ", child=" + child + ", price=" + price + "]";
	}
	
	
}
