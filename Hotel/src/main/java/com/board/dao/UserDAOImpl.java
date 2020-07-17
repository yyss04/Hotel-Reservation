package com.board.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.board.mappers.boardproject";
	
	// 회원가입처리
    @Override
    public void register(UserVO userVO) throws Exception {
        sqlSession.insert(NAMESPACE + ".register", userVO);
    }
    
    // 로그인처리
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
	}
	
	// 로그인 유지 처리(	UserDAO 인터페이스에 sessionKey, sessionLimit를 업데이트하는
	// 				메서드 keepLogin	)
	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    paramMap.put("sessionId", sessionId);
	    paramMap.put("sessionLimit", sessionLimit);

	    sqlSession.update(NAMESPACE + ".keepLogin", paramMap);
	}
	
	// 세션키 검증(사용자정보 조회)
	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkUserWithSessionKey", value);
	}




}
