package com.javachip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/help")
public class HelpController {
	
	@RequestMapping(value="/faq.do", method = RequestMethod.GET)
	public String faq() {
		return "help/faq";
	}
	
	@RequestMapping(value="/modify.do", method = RequestMethod.GET)
	public String modify() {
		return "help/modify";
	}
	
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice() {
		return "help/notice";
	}
	
	@RequestMapping(value="/noticeView.do", method = RequestMethod.GET)
	public String noticeView() {
		return "help/noticeView";
	}
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWrite() {
		return "help/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	public String noticeWriteAction() {
		
		return "redirect:noticeView.do";
	}
	
	@RequestMapping(value="/qna.do", method = RequestMethod.GET)
	public String qna() {
		return "help/qna";
	}
	
	@RequestMapping(value="/qnaView.do", method = RequestMethod.GET)
	public String qnaView() {
		return "help/qnaView";
	}
	
	@RequestMapping(value="/qnaWrite.do", method = RequestMethod.GET)
	public String qnaWrite(String qType, Model model) {
		
		
		// qType 이 없을 경우 qType은 nQnA
		if(qType == null || qType.equals("")) {
			qType = "n";
		}
		
		model.addAttribute("qType", qType);
		
		if(qType == "n" || qType == "p") {
			
			return "help/qnaWrite";
		}
		// 잘못된 타입일 경우 qna 페이지로
		return "help/qna";
	}
	@RequestMapping(value="/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWriteAction() {
		
		return "redirect:qnaView.do";
	}

	
}
