package com.board.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static final String LOGIN = "login";
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
    
    
    // LoginInterceptor역할 : 로그인한 사용자에 대한 정보를 HttpSession에 보관처리
    
    // httpSession에 컨트롤러에서 저장한 user를 저장한후, /로 리다이렉트한다.
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object userVO =  modelMap.get("user");

        if (userVO != null) {
            logger.info("new login success");
            httpSession.setAttribute(LOGIN, userVO);
          //response.sendRedirect("/");
            
            
            if(request.getParameter("userCooket") != null) {
            	logger.info("remember me..");
            	
            	// 쿠키생성
            	Cookie loginCookie = new Cookie("loginCooke", httpSession.getId());
            	loginCookie.setPath("/");
            	// 오랜시간 쿠키를 보관하기위해 setMaxAge 사용
            	loginCookie.setMaxAge(60*60*24*7);
            	response.addCookie(loginCookie);
            }
            
            
            
            Object destination = httpSession.getAttribute("destination");
            // destination이 null이 아니다 조건
            // 참 : destination정보호출, 거짓 : 메인페이지
            response.sendRedirect(destination != null ? (String) destination : "/");
        }

    }
    
    // 기존의 로그인 정보가 있을 경우 초기화하는 역할을 수행한다.
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        // 기존의 로그인 정보 제거
        if (httpSession.getAttribute(LOGIN) != null) {
            logger.info("clear login data before");
            httpSession.removeAttribute(LOGIN);
        }

        return true;
    }
}
