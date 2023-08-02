package com.javachip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javachip.service.UserService;
import com.javachip.vo.AdminPageMaker;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/admin")
public class AdminController 
{
	@Autowired
	private UserService us;
	
	@Autowired
	private AdminPageMaker pm;
	
	@RequestMapping(value="/boardList.do")
	public String boardList()
	{
		return "admin/boardList";
	}
	
	@RequestMapping(value="/deliveryList.do")
	public String delivery()
	{
		return "admin/deliveryList";
	}
	
	@RequestMapping(value="/main.do")
	public String main()
	{
		return "admin/main";
	}
	
	@RequestMapping(value="/memberDetail.do")
	public String memberDetail(int uNo, Model model)
	{
		UserVO vo = us.selectUserOneByuNoByAdmin(uNo);
		model.addAttribute("vo", vo);
		return "admin/memberDetail";
	}
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = us.UserTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		List<UserVO> list = us.list(AdminSearchVO);
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
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
