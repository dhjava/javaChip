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
import com.javachip.vo.PageMaker;
import com.javachip.vo.QnaVO;
import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;


@Controller
@RequestMapping(value="/help")
public class HelpController {
	
	@Autowired(required = false)	// 주입값이 null이어도 에러를 발생시키지 않음.
	private HelpService helpService;
	
	@Autowired(required = false)
	private PageMaker pageMaker;
	
	// faq
	@RequestMapping(value="/faq.do", method = RequestMethod.GET)
	public String faq() {
		return "help/faq";
	}
	
	//qna
	@RequestMapping(value="/qna.do", method = RequestMethod.GET)
	public String qna(SearchVO searchVO, Model model) {
		
		// 전체개수 확인
		int cnt = helpService.totalQna(searchVO);
		
		System.out.println("cnt::" + cnt);
		
		pageMaker.setSearchVO(searchVO);	// calcData에 담을 searchVO 세팅
		pageMaker.setTotalCount(cnt);
		
		List<QnaVO> list = helpService.selectQnaList(searchVO);
		
		model.addAttribute("list",list);
		model.addAttribute("pm",pageMaker);
		
		System.out.println("StartPage ::" + pageMaker.getStartPage());
		System.out.println("EndPage ::" + pageMaker.getEndPage());
		
		
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
		}
			
		// qType 이 없을 경우 qType은 nQnA
		if(qType == null || qType.equals("")) {
			qType = "N";
		}
		
		model.addAttribute("qType", qType);
		
		
		if( !qType.equals("N") || !qType.equals("P")) {
			
			return "help/qnaWrite";
		}else {
			
			path = "redirect:/";
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
			pw.append("<script>alert('로그인 후 이용해주세요.');location.href='../member/login.do';</script>");
			pw.flush();
		}
		System.out.println("uNo :: " + loginVO.getuNo());
		
		qnaVO.setuNo( loginVO.getuNo() );
		
		// insertQnA 실행
		int result = helpService.insertQna(qnaVO);
		
		System.out.println("qNo :" + qnaVO.getqNo());
		
		// 성공 : 1 , 실패 : 0
		if( result == 1 ) {
			path = "qnaView.do?qNo=" + qnaVO.getqNo();
		}else {
			pw.append("<script>alert('게시글 등록을 실패하였습니다.');location.href='qna.do';</script>");
			path = "qna.do";
			pw.flush();
		
		}
		
		return "redirect:" + path ;
	}
	@RequestMapping(value="/qnaView.do", method = RequestMethod.GET)
	public String qnaView(int qNo, Model model) {
		// Qna의 qNo 게시글 내용 및 이전,다음 게시글 정보를 받아옴.
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
			pw.append("<script>alert('로그인 후 이용가능합니다.');location.href='../';</script>");
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
		
		// 전체개수 확인
			int cnt = helpService.totalNotice(searchVO);
			
			pageMaker.setSearchVO(searchVO);	// calcData에 담을 searchVO 세팅
			pageMaker.setTotalCount(cnt);
		
		List<NoticeVO> list = helpService.selectNoticeList(searchVO);

		model.addAttribute("list",list);
		model.addAttribute("pm",pageMaker);
		
		System.out.println("StartPage ::" + pageMaker.getStartPage());
		System.out.println("EndPage ::" + pageMaker.getEndPage());
		
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
			
		if( loginVO == null ) {
			
			pw.append("<script>alert('관리자 로그인 후 이용하실 수 있습니다.');location.href='../member/login.do'</script>");
			pw.flush();
		}else if( !loginVO.getuStatus().equals("A")) {
			System.out.println("loginVO.getuStatus() ::" + loginVO.getuStatus());
			pw.append("<script>alert('관리자 계정이 아닙니다.');location.href='../'</script>");
			pw.flush();
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
		
		String path="";
		if( loginVO == null || !loginVO.getuStatus().equals("A")) {
			pw.append("<script>alert('관리자 로그인 후 이용하실 수 있습니다.');location.href='../member/login.do'</script>");
			pw.flush();
			path="redirect:../member/login.do";
		}else {
			
			noticeVO.setuNo( loginVO.getuNo() );
			
			int result = helpService.insertNotice(noticeVO);
			if( result != 1 ) {
				pw.append("<script>alert('게시글 등록을 실패하였습니다.');location.href='qna.do';</script>");
				pw.flush();
				path="redirect:notice.do";
			}else {
				path="redirect:noticeView.do?nNo=" + noticeVO.getnNo();
			}
		}

		return path;
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
	public String noticeModify(int nNo,Model model,HttpServletResponse res , HttpServletRequest req) throws IOException {
		// 글 출력
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = res.getWriter();
			
		// 로그인 확인
			HttpSession session = req.getSession();
			UserVO loginVO = (UserVO)session.getAttribute("login");
			
			String path="";
			
			if( loginVO == null ) {
				pw.append("<script>alert('관리자 로그인 후 이용하실 수 있습니다.');location.href='../member/login.do'</script>");
				pw.flush();
				path="redirect:../member/login.do";
			}else {
				if(!loginVO.getuStatus().equals("A")) {
					pw.append("<script>alert('관리자 계정이 아닙니다.');location.href='../'</script>");
					pw.flush();
					path="redirect:../";
				}else {
					NoticeVO noticeVO = helpService.selectOneByNno(nNo);
					
					model.addAttribute("noticeVO", noticeVO);
					
					path="help/noticeModify";
				}
				
			}
			
		return path;
	}
	@RequestMapping(value="/noticeModify.do", method = RequestMethod.POST)
	public String noticeModifyAction(HttpServletResponse res,HttpServletRequest req, NoticeVO noticeVO) throws IOException {
		
		// 글 출력
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		String path="";
		
		// 로그인 확인
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");	
		
		// 게시글 변경여부 확인 : 변경시 로그인 유저의 유저번호로 바꿈.
		NoticeVO originNoticeVO = helpService.selectOneByNno(noticeVO.getnNo());
		if( originNoticeVO.getnTitle().equals(noticeVO.getnTitle()) && originNoticeVO.getnContents().equals(noticeVO.getnContents()) ) {

		}else {

			noticeVO.setuNo(loginVO.getuNo());
		}
		
		int result = helpService.modifyNotice(noticeVO);
		
		if(result > 0) {
			// 수정 성공
			path="redirect:noticeView.do?nNo=" + noticeVO.getnNo();
		}else {
			pw.append("<script>alert('글 수정이 실패하였습니다.');history.back();</script>");
			pw.flush();
			path="redirect:noticeView.do?nNo=" + noticeVO.getnNo();
		}
				
		return path;
	}
	@RequestMapping(value="/noticeDelete.do", method = RequestMethod.POST)
	public String noticeDelete(int nNo, HttpServletResponse res, HttpServletRequest req) throws IOException {
	
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		HttpSession session = req.getSession();
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		if( loginVO == null ) {
			
			pw.append("<script>alert('관리자 로그인 후 이용하실 수 있습니다.');location.href='../member/login.do'</script>");
			pw.flush();
		}else if(!loginVO.getuStatus().equals("A")) {
			pw.append("<script>alert('관리자 계정이 아닙니다.');location.href='../'</script>");
			pw.flush();
		}
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
		
		return "redirect:notice.do";
	}


	
}