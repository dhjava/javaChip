package com.javachip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/help")
public class HelpController {
	
	@RequestMapping(value="/faq.do")
	public String faq() {
		return "help/faq";
	}
	
	@RequestMapping(value="/modify.do")
	public String modify() {
		return "help/modify";
	}
	
	@RequestMapping(value="/notice.do")
	public String notice() {
		return "help/notice";
	}
	
	@RequestMapping(value="/nview.do")
	public String nview() {
		return "help/nview";
	}
	
	@RequestMapping(value="/qna.do")
	public String qna() {
		return "help/qna";
	}
	
	@RequestMapping(value="/qview.do")
	public String qview() {
		return "help/qview";
	}
	
	@RequestMapping(value="/write.do")
	public String write() {
		return "help/write";
	}
	
	@RequestMapping(value="/nwrite.do")
	public String nwrite() {
		return "help/nwrite";
	}
	
	@RequestMapping(value="/qnawrite.do")
	public String qnawrite() {
		return "help/qnawrite";
	}
}
