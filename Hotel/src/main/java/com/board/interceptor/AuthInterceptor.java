package com.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	// AuthInterceptor 역할: 특정 경로에 접근할 경우 현재 사용자의 로그인 여부를 체크

	// 사용자가 원하던 페이지를 기억했다가, 로그인을 하면 자동으로 이동(다시 메인으로 이동x)

	// 페이지 요청 정보 저장
    private void saveDestination(HttpServletRequest request) {
        String uri = request.getRequestURI();
        String query = request.getQueryString();
        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }

        if (request.getMethod().equals("GET")) {
            logger.info("destination : " + (uri + query));
            request.getSession().setAttribute("destination", uri + query);
        }
    }
    
    // 현재 사용자가 로그인한 상태여부를 확인하고, 컨트롤러를 호출할 것인지 아닌지를 결정한다.
    // 만약 로그인하지 않은 사용자라면, 로그인 페이지(/user/login)으로 리다이렉트하게 된다.
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("login") == null) {
            logger.info("current user is not logged");
            saveDestination(request);
            response.sendRedirect("/user/login");
            return false;
        }

        return true;
    }
}
