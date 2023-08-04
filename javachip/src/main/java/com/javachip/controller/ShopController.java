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
@RequestMapping(value="/shop")
public class ShopController {
	
	@Autowired
	private CartService cs;
	
	@RequestMapping(value="/grid.do")
	public String grid() {
		return "shop/grid";
	}
	
	@RequestMapping(value="/details.do")
	public String details() {
		return "shop/details";
	}
	
	@RequestMapping(value="/checkout.do", method=RequestMethod.GET)
	public String checkout(HttpServletRequest req, Model model
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		return "shop/checkout";
	}
	@RequestMapping(value="/checkout.do", method=RequestMethod.POST)
	public String checkout() {
		return "shop/checkout";
	}
	
}
