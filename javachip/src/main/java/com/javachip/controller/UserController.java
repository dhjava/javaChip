package com.javachip.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javachip.service.MailSendService;
import com.javachip.service.MileageService;
import com.javachip.service.UserService;
import com.javachip.vo.MileageVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/member")
public class UserController {
	
	@Autowired
	private UserService us;
	@Autowired
	private MileageService ms;
	
	// 이메일 서비스 불러오기
	@Autowired
	private MailSendService mailService;
	
	@RequestMapping(value="/login.do")
	public String login() {
		return "member/login";
	}
	
	// 로그인 컨트롤
	@RequestMapping(value="/loginAction.do")
	public void login(UserVO vo,HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		
		UserVO loginVO = us.selectUserByLogin(vo);
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		if(loginVO != null) {
			//login할 회원이 데이터베이스에 존재
			System.out.println("회원존재");
			session.setAttribute("login", loginVO);
			String uStatus = loginVO.getuStatus();
			
			if(uStatus.equals("W")) {
				System.out.println("가입 대기 회원");
				session.invalidate();
				pw.append("<script>alert('가입 대기 중인 회원입니다.\\n가입 승인 후 로그인 가능합니다."
						+ "\\n(승인 기간 : 가입일에서 최대 1주일)\\n\\n"
						+ "문의사항은 javachip0703@gmail.com으로 보내주세요.');location.href='"
						+req.getContextPath()+"/member/login.do';</script>");
			}else{
			pw.append("<script>alert('로그인에 성공했습니다.\\n\\n회원 이름 : " + loginVO.getuName()
					+ "\\n경고 횟수 : "+ loginVO.getuAlertNum() + "');location.href='"+req.getContextPath()+"/';</script>");
			}
		}else{
			//login할 회원이 데이터베이스에 존재 X
			System.out.println("회원존재 X");
			pw.append("<script>alert('존재하지 않는 아이디나 비밀번호입니다.');location.href='"+req.getContextPath()+"/member/login.do';</script>");
		}
		
		pw.flush();
	}
	
	// 로그아웃 컨트롤
	@RequestMapping(value="/logout.do")
	public void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		try {
			HttpSession session = req.getSession();
			session.invalidate();
			pw.append("<script>alert('로그아웃 되었습니다.');"
						+"location.href='"
					    +req.getContextPath()+"/';</script>");
			
		}catch(Exception e) {
			e.printStackTrace();
			pw.append("<script>alert('로그아웃시 예외가 발생했습니다.');"
					+"location.href='"
				    +req.getContextPath()+"/';</script>");
		}
		
		pw.flush();
		
	}
	
	// 일반/사업자 회원가입 선택
	@RequestMapping(value="/joinSelect.do")
	public String joinSelect() {
		return "member/joinSelect";
	}
	
	
	// 일반 회원가입
	@RequestMapping(value="/join.do",method=RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.POST)
	public String join(UserVO vo) {
		int result = us.insert(vo);
		if(result>0) {
			
			System.out.println("회원가입 성공");
			
			// 신규 가입 적립금
			int uNo = vo.getuNo();
			MileageVO mv = new MileageVO();
			mv.setuNo(uNo);
			mv.setmPlus(1000);
			mv.setmNote("신규 회원 가입");
			ms.plusMileage(mv);
			
		}else {
			System.out.println("회원가입 실패");
		}
		
		return "redirect:login.do";
	}
	
	// 사업자 회원가입
	@RequestMapping(value="/joinBiz.do",method=RequestMethod.GET)
	public String joinBiz() {
		return "member/joinBiz";
	}
	
	@RequestMapping(value="/joinBiz.do",method=RequestMethod.POST)
	public String joinBiz(UserVO vo) {
		int result = us.insertBiz(vo);
		
		if(result>0) {
			System.out.println("회원가입 성공");
			
			// 신규 가입 적립금
			int uNo = vo.getuNo();
			MileageVO mv = new MileageVO();
			mv.setuNo(uNo);
			mv.setmPlus(1000);
			mv.setmNote("신규 회원 가입");
			ms.plusMileage(mv);
			
		}else {
			System.out.println("회원가입 실패");
		}
		
		return "redirect:login.do";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectCntById(String uId) {
		int result = us.selectCntById(uId);
		
		return result+"";
	}
	
	// 아이디 찾기
	@RequestMapping(value="/idFind.do",method=RequestMethod.GET)
	public String idFind() {
		return "member/idFind";
	}
	
	@RequestMapping(value="/idFind.do",method=RequestMethod.POST)
	public String idFind(UserVO vo,Model model) throws IOException {
		
		UserVO user = us.idFind(vo);
		
		if(user != null) { 
			model.addAttribute("check", 0);
			model.addAttribute("uId", user.getuId());
			System.out.println("아이디 확인 O");
		} else { 
			model.addAttribute("check", 1);
			System.out.println("아이디 확인 X");
		}
		
		return "member/idFind";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/pwFind.do",method=RequestMethod.GET)
	public String pwFind() {
		return "member/pwFind";
	}
	
	@RequestMapping(value="/pwFind.do", method=RequestMethod.POST)
	public String pwFind(UserVO vo,Model model) throws Exception{
		
		UserVO user = us.pwFind(vo);
		
		if(user != null) { 
			model.addAttribute("check", 0);
			System.out.println("아이디 확인 O");
		} else { 
			model.addAttribute("check", 1);
			System.out.println("비밀번호 확인 X");
		}
		
		return "member/pwFind";
		}
	
	@ResponseBody
	@RequestMapping(value="/emailAuth.do")
	public String emailAuth( @RequestParam(value= "uId_email",  required=false) String uId_email) {
		
		System.out.println("임시 비밀번호 전송");
		System.out.println("emailAuth="+uId_email);
		return mailService.joinmail(uId_email);
	}
}