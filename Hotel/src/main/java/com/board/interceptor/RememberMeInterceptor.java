package com.board.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.board.domain.UserVO;
import com.board.service.UserService;

public class RememberMeInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(RememberMeInterceptor.class);

    @Inject
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	// 사용자 접속
        HttpSession httpSession = request.getSession();
        
        // 접속한 사용자가 loginCookie를 가지고 있으면
        // loginCookie의 정보를 이용해 사용자정보 존재하는지 조건문
        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        
        // 사용자 정보가 존재할 경우, HttpSession에 회원의 정보를 넣음
        if (loginCookie != null) {
            UserVO userVO = userService.checkLoginBefore(loginCookie.getValue());
            if (userVO != null)
                httpSession.setAttribute("login", userVO);
        }

        return true;
    }
}