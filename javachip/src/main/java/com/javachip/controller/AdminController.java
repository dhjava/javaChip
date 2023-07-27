package com.javachip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController 
{
	@RequestMapping(value="/boardList.do")
	public String boardList()
	{
		return "admin/boardList";
	}
	
	@RequestMapping(value="/delivery.do")
	public String delivery()
	{
		return "admin/delivery";
	}
	
	@RequestMapping(value="/main.do")
	public String main()
	{
		return "admin/main";
	}
	
	@RequestMapping(value="/memberDetail.do")
	public String memberDetail()
	{
		return "admin/memberDetail";
	}
	
	@RequestMapping(value="/memberList.do")
	public String memberList()
	{
		return "admin/memberList";
	}
	
	@RequestMapping(value="/product.do")
	public String product()
	{
		return "admin/product";
	}
	
	@RequestMapping(value="/productList.do")
	public String productList()
	{
		return "admin/productList";
	}
	
	@RequestMapping(value="/qnaList.do")
	public String qnaList()
	{
		return "admin/qnaList";
	}
	
	
}
