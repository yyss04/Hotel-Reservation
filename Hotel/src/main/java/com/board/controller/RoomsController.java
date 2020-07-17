package com.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/hotel")
public class RoomsController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	
	// 객실 미리보기 이동
	@RequestMapping(value = "/roompreview", method = RequestMethod.GET)
	public String roomPreview() {

		return "/hotel/roompreview";
	}
	
	// superiorroom 미리보기 이동
	@RequestMapping(value = "/superiorroom", method = RequestMethod.GET)
	public String Superiorroom() {

		return "/hotel/superiorroom";
	}
	
	// deluxeroom 미리보기 이동
	@RequestMapping(value = "/deluxeroom", method = RequestMethod.GET)
	public String Deluxeroom() {

		return "/hotel/deluxeroom";
	}	
	
	// signatureroom 미리보기 이동
	@RequestMapping(value = "/signatureroom", method = RequestMethod.GET)
	public String Signatureroom() {

		return "/hotel/signatureroom";
	}	

	// coupleroom 미리보기 이동
	@RequestMapping(value = "/coupleroom", method = RequestMethod.GET)
	public String Coupleroom() {

		return "/hotel/coupleroom";
	}

	
}
