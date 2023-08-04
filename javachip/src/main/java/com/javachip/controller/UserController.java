package com.javachip.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javachip.service.UserService;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/member")
public class UserController {
	
	@Autowired
	private UserService us;
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public void login(UserVO vo,HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		
		UserVO loginVO = us.selectUserByLogin(vo);
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		if(loginVO != null) {
			//login할 회원이 데이터베이스에 존재
			System.out.println("회원존재");
			
			session.setAttribute("login", loginVO);
			pw.append("<script>alert('로그인에 성공했습니다.');location.href='"+req.getContextPath()+"/';</script>");
			
		}else {
			//login할 회원이 데이터베이스에 존재 X
			System.out.println("회원존재 X");
			pw.append("<script>alert('로그인에 실패했습니다.');location.href='"+req.getContextPath()+"/member/login.do';</script>");
		}
		
		pw.flush();
	}
	
	@RequestMapping(value="/logout.do")
	public void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		try {
			HttpSession session = req.getSession();
			session.invalidate();
			session.setAttribute("key", null);
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
	
	@RequestMapping(value="/joinSelect.do")
	public String joinSelect() {
		return "member/joinSelect";
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.POST)
	public String join(UserVO vo) {
		int result = us.insert(vo);
		
		if(result>0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		
		return "redirect:login.do";
	}
	
	@RequestMapping(value="/joinBiz.do",method=RequestMethod.GET)
	public String joinBiz() {
		return "member/joinBiz";
	}
	
	@RequestMapping(value="/joinBiz.do",method=RequestMethod.POST)
	public String joinBiz(UserVO vo) {
		int result = us.insertBiz(vo);
		
		if(result>0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		
		return "redirect:login.do";
	}

	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectCntById(String uId) {
		int result = us.selectCntById(uId);
		
		return result+"";
	}
	
	@RequestMapping(value="/idFind.do",method=RequestMethod.GET)
	public String idFind() {
		return "member/idFind";
	}
	
	@RequestMapping(value="/idFind.do",method=RequestMethod.POST)
	public void idFind(UserVO vo,HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		
		UserVO findVO = us.idFind(vo);
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		if(findVO != null) {
			//login할 회원이 데이터베이스에 존재
			System.out.println("ID 찾기 성공");
			
			session.setAttribute("idFind", findVO);
			pw.append("location.href='"+req.getContextPath()+"/member/idFindResult.do';</script>");
			
		}else {
			//login할 회원이 데이터베이스에 존재 X
			System.out.println("ID 찾기 실패");
			pw.append("<script>alert('존재하지 않는 ID입니다.');location.href='"+req.getContextPath()+"/member/idFind.do';</script>");
		}
		
		pw.flush();
	}
	
	@RequestMapping(value="/idFindResult.do",method=RequestMethod.GET)
	public String idFindResult() {
		return "member/idFindResult";
	}
	
	@RequestMapping(value="/pwFind.do")
	public String pwFind() {
		return "member/pwFind";
	}
	
}
