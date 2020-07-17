package com.board.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;
import com.board.service.UserService;

@Controller
@RequestMapping("/user")
public class UserLoginController {

    private final UserService userService;

    @Inject
    public UserLoginController(UserService userService) {
        this.userService = userService;
    }

    // 로그인 페이지
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
        return "/user/login";
    }

    // 로그인 처리
    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {

        UserVO userVO = userService.login(loginDTO);
        
        // userVO가 null이거나 BCrypt.checkpw()를 통해 검증이 맞지않으면 메서드를 종료
        if (userVO == null || !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())) {
            return;
        }
        
        // 비밀번호가 일치하면 model에 userVO를 user란 이름의 변수에 저장
        model.addAttribute("user", userVO);
        httpSession.setAttribute("userId", loginDTO.getUserId());
        
        
        //////////로그인 유지 선택/////////////
        if(loginDTO.isUseCookie()) {
        	int amount = 60 * 60 * 24 * 7;	// 7일
        	// 로그인 유지기간 설정
        	Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));	// 로그인 유지기간 설정
        	// 해당 유지기간을 DB에 저장하도록 처리
        	userService.keepLogin(userVO.getUserId(), httpSession.getId(), sessionLimit);
        }

    }
    
    
    // 로그아웃 처리
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request,
                         HttpServletResponse response,
                         HttpSession httpSession) throws Exception {
    	// login이라는 객체를 object에 담음
        Object object = httpSession.getAttribute("login");
        
        // 객체가 존재한다면
        if (object != null) {
            UserVO userVO = (UserVO) object;
            // login객체를 삭제
            httpSession.removeAttribute("login");
            // invalidate처리
            httpSession.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
          
            // 사용자가 로그인 유지를 선택했다면, 로그아웃하면서 초기화해야함
            if (loginCookie != null) {
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                // LoginInterceptor에서 설정한 loginCookie 값을 초기화.
                response.addCookie(loginCookie);
                // DB에 저장했던 세션아이디와 자동로그인 유지기간을 초기화
                userService.keepLogin(userVO.getUserId(), "none", new Date());
            }
        }

        return "/user/logout";
    }
    

    
    
    
}
