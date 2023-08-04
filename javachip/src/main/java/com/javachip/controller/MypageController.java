package com.javachip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javachip.service.CartService;
import com.javachip.vo.CartVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@Autowired
	private CartService cs;
	
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String cart(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		System.out.println("loginVO::"+loginVO);
		int uNo = loginVO.getuNo();
		System.out.println("uNo::"+uNo);
		List<CartVO> cartList = cs.selectCartByUno(uNo);
		int totalPrice = cs.totalPrice(uNo);
		System.out.println(totalPrice);
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("totalPrice", totalPrice);
		return "mypage/cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String cart(
			HttpServletRequest req
		,	Model model
		,	String point) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		System.out.println(point);
		model.addAttribute("point", point);
		return "redirect:/shop/checkout.do";
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
