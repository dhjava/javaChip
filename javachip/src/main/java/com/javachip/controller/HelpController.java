package com.javachip.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javachip.service.HelpService;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;


@Controller
@RequestMapping(value="/help")
public class HelpController {
	
	@Autowired
	private HelpService helpService;
	
	// faq
	@RequestMapping(value="/faq.do", method = RequestMethod.GET)
	public String faq() {
		return "help/faq";
	}
	
	//qna
	@RequestMapping(value="/qna.do", method = RequestMethod.GET)
	public String qna(SearchVO searchVO, Model model) {
		
		List<QnaVO> list = helpService.selectQnaList(searchVO);
		
		model.addAttribute("list",list);
		
		return "help/qna";
	}
	@RequestMapping(value="/qnaWrite.do", method = RequestMethod.GET)
	public String qnaWrite(String qType, Model model, HttpServletRequest req) {
		
		String path = "";
					
		// 로그인 확인
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		if( loginVO == null ) {
			path = "redirect:/member/login.do";
		}else {
			
			// qType 이 없을 경우 qType은 nQnA
			if(qType == null || qType.equals("")) {
				qType = "N";
			}
			
			model.addAttribute("qType", qType);
			
			
			if(qType != "N" || qType != "P") {
				
				return "help/qnaWrite";
			}else {
				
				path = "redirect:/";
			}
		}
		// 잘못된 타입일 경우 qna 페이지로
		return path;
	}
	@RequestMapping(value="/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWriteAction(QnaVO qnaVO, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		String path = "";
		// 글 출력
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = res.getWriter();
					
		// 로그인 확인
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		if( loginVO == null ) {
			pw.append("<script>alert('잘못된 접근입니다.');location.href='../';</script>");
			path = "login.do";
			pw.flush();
			
		}else {
			
			int uNo = 3;
			
			qnaVO.setuNo( uNo );
			
			// insertQnA 실행
			int result = helpService.insertQnA(qnaVO);
			
			System.out.println("qNo :" + qnaVO.getqNo());
			
			// 성공 : 1 , 실패 : 0
			if( result == 1 ) {
				path = "qnaView.do?qNo=" + qnaVO.getqNo();
			}else {
				pw.append("<script>alert('게시글 등록을 실패하였습니다.');location.href='qna.do';</script>");
				path = "qna.do";
				pw.flush();
			}
		}
		
		return "redirect:" + path ;
	}
	@RequestMapping(value="/qnaView.do", method = RequestMethod.GET)
	public String qnaView(int qNo, Model model) {
		
		QnaVO qnaVO = helpService.selectOneByQno(qNo);
		List<QnaVO> nearQnaList = helpService.selectNearQno(qNo);
		model.addAttribute("qnaVO",qnaVO);
		model.addAttribute("nearQnaList",nearQnaList);
		
		return "help/qnaView";
	}
	
	@RequestMapping(value="/qnaDelete.do", method = RequestMethod.POST)
	public String qnaDelete(int qNo, HttpServletResponse res,HttpServletRequest req) throws IOException {
		
		HttpSession session = req.getSession();
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if( loginVO == null ) {
			pw.append("<script>alert('잘못된 접근입니다.');location.href='../';</script>");
			pw.flush();
		}
		
		int result = helpService.deleteQna(qNo);
		
		if( result > 0 ) {
			// 삭제 성공
			pw.append("<script>alert('게시글을 삭제하였습니다.');location.href='qna.do'</script>");
		}else {
			// 삭제 실패
			pw.append("<script>alert('게시글을 삭제를 실패하였습니다.');location.href='qnaView.do?qNo=" + qNo + "'</script>");
		}
		
		pw.flush();
		
		return "redirect:qna.do";
	}
	
	//notice
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice(SearchVO searchVO, Model model, HttpServletRequest req) {
		
		List<NoticeVO> list = helpService.selectNoticeList(searchVO);

		model.addAttribute("list",list);
		
		
		return "help/notice";
	}
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWrite(HttpServletResponse res , HttpServletRequest req) throws IOException {
		
		// 글 출력
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		// 로그인 확인
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
			
		if( loginVO == null || loginVO.getuStatus() != "A") {
			
			pw.append("<script>alert('잘못된 접근입니다.');location.href='/'</script>");
		}
			
		return "help/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	
	public String noticeWriteAction(NoticeVO noticeVO, HttpServletResponse res , HttpServletRequest req) throws IOException {
		
		// 글 출력
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
				
		// 로그인 확인
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		if( loginVO == null || loginVO.getuStatus() != "A") {
			pw.append("<script>alert('잘못된 접근입니다.');location.href='../';</script>");
			pw.flush();
		}
		
		noticeVO.setuNo( loginVO.getuNo() );
		
		
		int result = helpService.insertNotice(noticeVO);
		
		if( result != 1 ) {
			pw.append("<script>alert('게시글 등록을 실패하였습니다.');location.href='qna.do';</script>");
			pw.flush();
		}
		
		return "redirect:noticeView.do?nNo=" + noticeVO.getnNo();
	}
	
	@RequestMapping(value="/noticeView.do", method = RequestMethod.GET)
	public String noticeView(int nNo, Model model) {
		
		NoticeVO noticeVO = helpService.selectOneByNno(nNo);
		List<NoticeVO> nearNoticeList = helpService.selectNearNno(nNo);
		
		model.addAttribute("noticeVO", noticeVO);
		model.addAttribute("nearNoticeList", nearNoticeList);
		
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
	public String noticeDelete(int nNo, HttpServletResponse res, HttpServletRequest req) throws IOException {
	
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		HttpSession session = req.getSession();
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		if(loginVO==null || loginVO.getuStatus() != "A") {
			pw.append("<script>alert('잘못된 접근입니다.');location.href='/'</script>");
		}else {
			// uNo 비교
			int result = 0;
			
			NoticeVO noticeVO = helpService.selectOneByNno(nNo);
			if(noticeVO.getuNo() == loginVO.getuNo()) {
				result = helpService.deleteNotice(nNo);
			}
			
			
			if( result > 0 ) {
				// 삭제 성공
				pw.append("<script>alert('게시글을 삭제하였습니다.');location.href='notice.do'</script>");
			}else {
				// 삭제 실패
				pw.append("<script>alert('게시글을 삭제를 실패하였습니다.');location.href='noticeView.do?nNo=" + nNo + "'</script>");
			}
			
			pw.flush();
		}
		
		return "redirect:notice.do";
	}


	
}