package com.board.service;

import java.util.Date;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;

public interface UserService {

	// 회원 가입 처리
    void register(UserVO userVO) throws Exception;
    
    // 로그인
    UserVO login(LoginDTO loginDTO) throws Exception;
    
    // 로그인 유지
    void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;
    
    // 회원정보 조회
    UserVO checkLoginBefore(String value) throws Exception;

    
}
