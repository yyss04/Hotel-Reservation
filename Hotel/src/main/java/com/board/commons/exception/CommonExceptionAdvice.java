package com.board.commons.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

// @ControllerAdvice : 이 클래스의 객체가 컨트롤러에서 발생하는 예외를 전문적으로 처리한다는 뜻
@ControllerAdvice
public class CommonExceptionAdvice {

		private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
		
		// Modelandview 타입으로 사용해야함. 일반 컨트롤러클래스와는 다르기 때문
		@ExceptionHandler(Exception.class)
		public ModelAndView commonException(Exception e) {
			
			// ModelandView하나의 객체에 Model데이터와 View를 동시에 처리함
			// 예외가 발생한다면 데이터를 exception에 담고, jsp에 전달
			logger.info(e.toString());
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("exception", e);
			modelAndView.setViewName("/commons/common_error");
			
			return modelAndView;
		}
}
