package com.javachip.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "index";
	}
	
	// info
	// 회사 소개
	@RequestMapping(value="/info/intro.do")
	public String intro() {
		
		return "/info/intro";
	}
	
	// 회사 연락
	@RequestMapping(value="/info/contact.do")
	public String contact() {
		
		return "/info/contact";
	}
}
