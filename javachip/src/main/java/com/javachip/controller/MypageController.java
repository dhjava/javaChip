package com.javachip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@RequestMapping(value="/cart.do")
	public String cart() {
		return "mypage/cart";
	}
	@RequestMapping(value="/goodbye.do")
	public String goodbye() {
		return "mypage/goodbye";
	}
	@RequestMapping(value="/hdetail.do")
	public String hdetail() {
		return "mypage/hdetail";
	}
	@RequestMapping(value="/history.do")
	public String history() {
		return "mypage/history";
	}
	@RequestMapping(value="/main.do")
	public String main() {
		return "mypage/main";
	}
	@RequestMapping(value="/mileage.do")
	public String mileage() {
		return "mypage/mileage";
	}
	@RequestMapping(value="/myboard.do")
	public String myboard() {
		return "mypage/myboard";
	}
	@RequestMapping(value="/myinfo.do")
	public String myinfo() {
		return "mypage/myinfo";
	}
	@RequestMapping(value="/myqna.do")
	public String myqna() {
		return "mypage/myqna";
	}
	@RequestMapping(value="/myreview.do")
	public String myreview() {
		return "mypage/myreview";
	}
	@RequestMapping(value="/regular.do")
	public String regular() {
		return "mypage/regular";
	}
}
