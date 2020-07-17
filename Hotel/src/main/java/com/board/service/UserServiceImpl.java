package com.board.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.UserDAO;
import com.board.domain.LoginDTO;
import com.board.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	private final UserDAO userDAO;
	
	@Inject
    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

	// 회원 가입 처리
    @Override
    public void register(UserVO userVO) throws Exception {
        userDAO.register(userVO);
    }
    
    // 로그인
    @Override
    public UserVO login(LoginDTO loginDTO) throws Exception {
        return userDAO.login(loginDTO);
    }
    
    // 로그인 유지
	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
		userDAO.keepLogin(userId, sessionId, sessionLimit);
	}
	
	// 회원정보 조회
	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return userDAO.checkUserWithSessionKey(value);
	}

}
