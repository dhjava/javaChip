package com.javachip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/shop")
public class ShopController {
	
	@RequestMapping(value="/grid.do")
	public String grid() {
		return "shop/grid";
	}
	
	@RequestMapping(value="/details.do")
	public String details() {
		return "shop/details";
	}
	
	@RequestMapping(value="/checkout.do")
	public String checkout() {
		return "shop/checkout";
	}
	
}
