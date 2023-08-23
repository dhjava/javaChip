package com.javachip.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.javachip.service.HelpService;
import com.javachip.service.ProductService;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.PageMaker;
import com.javachip.vo.ProductVO;
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
		int result = helpService.deleteNotice(nNo);
		
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
		if(qType == null || qType.equals("") || !qType.equals("P")) {
			qType = "N";
		}
		
		model.addAttribute("qType", qType);
		
		if( qType.equals("N") || qType.equals("P")) {
			
			path = "help/qnaWrite";
		}else {
			
			path = "redirect:/";
		}
	
		// 잘못된 타입일 경우 qna 페이지로
		return path;
	}
	
	@ResponseBody
	@RequestMapping(value="/productSearch.do", method = RequestMethod.GET)
	public Map<String,Object> productSearch(SearchVO searchVO) {
		
		
		// 전체개수 확인
		int cnt = helpService.totalProduct(searchVO);
		
		System.out.println("cnt::" + cnt);
		
		pageMaker.setSearchVO(searchVO);	// calcData에 담을 searchVO 세팅
		pageMaker.setTotalCount(cnt);
		
		List<ProductVO> list = helpService.selectProductList(searchVO);
		
		
		// Map에 값 담기
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pm", pageMaker);
		
		System.out.println("StartPage ::" + pageMaker.getStartPage());
		System.out.println("EndPage ::" + pageMaker.getEndPage());
		
		
		
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWriteAction(QnaVO qnaVO, HttpServletRequest req) {
		
		// Jackson
		JsonObject jsonObj = new JsonObject();
		
		// 로그인 확인
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String result = "";	
		String path = "";	
		if(loginVO == null) {
			result = "로그인 후 이용이 가능합니다.";
			path = "../member/login.do";
		}else {
			// 로그인 유저번호 등록
			qnaVO.setuNo( loginVO.getuNo() );
			// 비밀글 체크여부
			String secretCheck = req.getParameter("secretCheck");
			if( "Y".equals(secretCheck) ) {			
				qnaVO.setSecretYN("Y");
			}
			// insertQnA 실행
			helpService.insertQna(qnaVO);
			
			System.out.println("uNo :: " + loginVO.getuNo());
			// ajax에 보낼 aNo 등록
			
			result = "게시글을 등록하였습니다";
			path = "qnaView.do?qNo=" + qnaVO.getqNo();
		}
		
		jsonObj.addProperty("result",result);
		jsonObj.addProperty("path",path);
		
		System.out.println(jsonObj.toString());
		
		return jsonObj.toString();
	}
	@RequestMapping(value="/qnaView.do", method = RequestMethod.GET)
	public String qnaView(int qNo, Model model, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		// Qna의 qNo 게시글 내용 및 이전,다음 게시글 정보를 받아옴.
		QnaVO qnaVO = helpService.selectOneByQno(qNo);
		List<QnaVO> nearQnaList = helpService.selectNearQno(qNo);
		
		// 로그인 확인
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		// 글 출력
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		// 비밀글 설정이 켜져있다면,
		if(qnaVO.getSecretYN().equals("Y")) {
			// 작성자 체크
			if(loginVO.getuNo() == qnaVO.getuNo() || loginVO.getuStatus().equals("A")){
				

			}else {
				
				return "help/secret";
			}
			
		}
		
		model.addAttribute("qnaVO",qnaVO);
		model.addAttribute("nearQnaList",nearQnaList);
	/*	
		// qlevel이 0보다 클 경우(=qna답변일 경우) originqno와 일치하는 게시글 정보를 받아옴.
		if(qnaVO.getQlevel() > 0) {
			int originqno = qnaVO.getOriginqno();
			
			QnaVO originQnaVO = helpService.selectOneByQno(originqno);
			model.addAttribute("originQnaVO",originQnaVO);
		}
	*/	
		return "help/qnaView";
	}
	
	@RequestMapping(value="/qnaDelete.do", method = RequestMethod.POST)
	public void qnaDelete(int qNo, HttpServletResponse res,HttpServletRequest req) throws IOException {
		
		HttpSession session = req.getSession();
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if( loginVO == null ) {
			pw.append("<script>alert('로그인 후 이용가능합니다.');location.href='../';</script>");
			pw.flush();
		}
		
		QnaVO qnaVO = helpService.selectOneByQno(qNo);
		int result = 0;
		
		if( qnaVO.getuNo() != loginVO.getuNo()) {
			pw.append("<script>alert('삭제하려면 해당 게시글 작성자이어야만 합니다.');location.href='../';</script>");
			pw.flush();
		}else {
			
			
			result = helpService.deleteQna(qNo);
			
			// 삭제 여부 체크
			if( result > 0 ) {
				// 삭제 성공
				pw.append("<script>alert('게시글을 삭제하였습니다.');location.href='qna.do'</script>");
				pw.flush();
			}else {
				// 삭제 실패
				pw.append("<script>alert('게시글을 삭제를 실패하였습니다.');location.href='qnaView.do?qNo=" + qNo + "'</script>");
				pw.flush();
			}
		}
	}
	
	@RequestMapping(value="/qnaAnswer.do", method = RequestMethod.GET)
	public String qnaAnswer(int qNo,Model model) {
		
		QnaVO qnaVO = helpService.selectOneByQno(qNo);
		
		model.addAttribute("qnaVO",qnaVO);
		
		return "help/qnaAnswer";
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaAnswer.do", method = RequestMethod.POST)
	public String qnaAnswerAction(String secretCheck, QnaVO qnaVO, HttpServletRequest req) {
		
		// Jackson
			JsonObject jsonObj = new JsonObject();
			
			// 로그인 확인
			HttpSession session = req.getSession();
			UserVO loginVO = (UserVO)session.getAttribute("login");
			
			String result = "";	
			String path = "";	
						
			if( loginVO.getuStatus().equals("A")) {
				
				// insertQnA Answer 실행
				helpService.AnswerQna(qnaVO);
				
				// ajax에 보낼 aNo 등록
				
				result = "게시글을 등록하였습니다";
				path = "qnaView.do?qNo=" + qnaVO.getqNo();
			}else {
				result = "관리자만 답변이 가능합니다.";
				path = "javascript:history.back()";
			}
			
			jsonObj.addProperty("result",result);
			jsonObj.addProperty("path",path);
			
			System.out.println(jsonObj.toString());
			
			return jsonObj.toString();
	}
	
	@RequestMapping(value="/fileupload.do", method = RequestMethod.GET)
	public String fileupload() {
			
		return "help/qnaWrite";
	}
	
	
	@RequestMapping(value="/fileupload.do", method = RequestMethod.POST)
	public String fileupload( MultipartFile uploadFile, HttpServletRequest req) throws Exception {
		String realPath = req.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("realPath::::"+realPath);
		
		String path = "../../resources/upload";
		
		File dir = new File(realPath);
		// 디렉토리 존재여부에 따라 디렉토리 생성
		if(!dir.exists()) {
			dir.mkdir();
		}
		
		if(!uploadFile.getOriginalFilename().isEmpty()) {
			
			String fileName = uploadFile.getOriginalFilename();
			// etc에 파일 확장자값 넣기
			// "."으로 배열을 나누고 etc에  맨마지막 배열(배열은 0부터 길이는 1부터 세므로, -1) 값(파일확장자)을 넣는다.
			String fileNameArray[] = fileName.split("\\.");
			String etc = fileNameArray[fileNameArray.length-1];
			
			long timeMilis = System.currentTimeMillis();
			// substring(startIndex,endIndex) : startIndex부터 endIndex이전에 끊는다.
			// ex) index ->substring(1,3) : nd
			// fileName.length()-etc.length()-1 : 파일전체명 - 확장자길이 - "."
			String newFileName = fileName.substring(0,fileName.length()-etc.length()-1) + timeMilis + "." + etc;
			
			// trnasferTo(File file) :: 파일의 저장
			uploadFile.transferTo(new File(realPath,newFileName));
			
			return newFileName;
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/fileload.do", method = RequestMethod.POST)
	public String fileload() {
		
		return "redirect:/";
	}
}