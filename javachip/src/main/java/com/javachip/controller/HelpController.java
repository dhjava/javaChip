package com.javachip.controller;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> branch 'main' of https://github.com/reachless12/javaChip.git
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javachip.service.HelpService;
import com.javachip.vo.NoticeVO;

import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;


@Controller
@RequestMapping(value="/help")
public class HelpController {
	
	@Autowired
	private HelpService helpService;
	@Autowired HelpService helpService;
	
	// faq
	@RequestMapping(value="/faq.do", method = RequestMethod.GET)
	public String faq() {
		return "help/faq";
	}
	
	//qna
	@RequestMapping(value="/qna.do", method = RequestMethod.GET)
	public String qna() {
		
		return "help/qna";
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
	@RequestMapping(value="/qnaView.do", method = RequestMethod.GET)
	public String qnaView() {
		
		return "help/qnaView";
	}
	
	@RequestMapping(value="/qnaModify.do", method = RequestMethod.POST)
	public String qnaModifyAction() {
		return "redirect:qnaView.do";
	}
	
	@RequestMapping(value="/qnaDelete.do", method = RequestMethod.POST)
	public String qnaDelete() {
		return "redirect:qna.do";
	}
	
	@RequestMapping(value="/productSelect.do", method = RequestMethod.GET)
	public String productSelecte() {
		return "help/productSelect";
	}
	
	//notice
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice(Model model, SearchVO searchVO) {
		
		List<NoticeVO> list = helpService.selectNoticeList(searchVO);

		model.addAttribute("list",list);
		
		
		return "help/notice";
	}
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWrite() {
		return "help/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	
	public String noticeWriteAction(NoticeVO noticeVO,HttpServletRequest req) {
		
		// String으로 값을 받음.
		HttpSession session = req.getSession();
		
		// login한 계정의 type이 관리자인지 확인
		// !! - 추가 - !!
		
		
		// 공지사항 글쓰기
		// !!-- 추후 세션에서 uNO를 로그인 값 받아옴. --!!
		
		//UserVO loginVO = (UserVO)session.getAttribute("login");
		
		// if(loginVO == null || 관리자가 아닐때) {
		// return "redirect:notice.do";
		// }
		
		int uNo = 1;
		
		noticeVO.setuNo(uNo);
		
		int result = helpService.insertNotice(noticeVO);
		
		System.out.println(noticeVO.toString());

	public String noticeWriteAction(NoticeVO noticeVO, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
				
		// login 기능 활성화 시 추후 작성
		// UserVO loginVO = (UserVO)session.getAttribute("login");
		int uNo = 1;	// 임시 uNo
		
		noticeVO.setuNo(uNo);
		
		int result = helpService.insertNotice(noticeVO);
		
		return "redirect:noticeView.do";	// 추후 주소 변경
	}
	
	@RequestMapping(value="/noticeView.do", method = RequestMethod.GET)
	public String noticeView(int nNo, Model model) {
		
		NoticeVO noticeVO = helpService.selectOneByNno(nNo);
		
		model.addAttribute("noticeVO", noticeVO);
		
		return "help/noticeView";
	}
	@RequestMapping(value="/noticeModify.do", method = RequestMethod.GET)
	public String noticeModify() {
		return "help/noticeModify";
	}
	@RequestMapping(value="/noticeModify.do", method = RequestMethod.POST)
	public String noticeModifyAction() {
		return "redirect:noticeView.do";
	}
	@RequestMapping(value="/noticeDelete.do", method = RequestMethod.POST)
	public String noticeDelete() {
		return "redirect:notice.do";
	}


	
}