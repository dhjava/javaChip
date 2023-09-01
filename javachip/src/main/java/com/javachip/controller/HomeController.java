package com.javachip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javachip.service.ProductService;
import com.javachip.vo.ProductVO;
import com.javachip.vo.SearchVO;

@Controller
public class HomeController {
	
	@Autowired
	private ProductService ps;
	
	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		// 인기순 정렬(별도 쿼리)
		List<ProductVO> indexList = ps.selectIndexProduct();
		
		// 도매 제외 + 정렬
		SearchVO sv = new SearchVO();
		sv.setSearchType("grid");
		
		// 신상
		sv.setSort("new");
		List<ProductVO> newList = ps.selectAllProduct(sv);
		
		// 랜덤 추천
		sv.setSort("random");
		List<ProductVO> randomList = ps.selectAllProduct(sv);
		model.addAttribute("indexList", indexList);
		model.addAttribute("newList", newList);
		model.addAttribute("randomList", randomList);
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
