package com.javachip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@RequestMapping(value="/idFind.do")
	public String idfind() {
		return "member/idFind";
	}
	
	@RequestMapping(value="/join.do")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value="/joinBiz.do")
	public String joinBiz() {
		return "member/joinBiz";
	}
	
	@RequestMapping(value="/joinSelect.do")
	public String joinSelect() {
		return "member/joinSelect";
	}
	
	@RequestMapping(value="/login.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/pwFind.do")
	public String pwFind() {
		return "member/pwFind";
	}
	
}
