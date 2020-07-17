package com.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private static String namespace = "com.board.mappers.boardproject";
	
	@Override
	public void reservation_number_people(ReservationVO reservationVO) {
		sqlSession.insert(namespace + ".reservation_number_people", reservationVO);
	}

	@Override
	public int RoomPrice(ReservationVO reservationVO) {
		return sqlSession.selectOne(namespace + ".RoomPrice", reservationVO);
	}

	@Override
	public void reservationInsert(ReservationVO reservationVO) {
		sqlSession.selectOne(namespace + ".reservationInsert", reservationVO);
		
	}

	@Override
	public int DuplicateFind(ReservationVO reservationVO) {
		return sqlSession.selectOne(namespace + ".DuplicateFind", reservationVO);
	}

	@Override
	public String PayCheck(String userId) {
		return sqlSession.selectOne(namespace + ".PayCheck", userId);
	}

	@Override
	public void PayCheckUpdate(String number) {
		sqlSession.selectOne(namespace + ".PayCheckUpdate", number);
	}
	
	// 예약 조회
	@Override
	public ReservationVO ReservationSelect(String userId) {
		return sqlSession.selectOne(namespace + ".reservationSelect", userId);
	}

	@Override
	public void ReservationDelete() {
		sqlSession.selectOne(namespace + ".ReservationDelete");
	}

	

}
