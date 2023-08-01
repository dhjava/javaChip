package com.javachip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javachip.service.CartService;
import com.javachip.service.UserService;
import com.javachip.vo.CartVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@Autowired
	private CartService cs;
	
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String cart(UserVO vo, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		
		List<CartVO> cartList = cs.selectCartByUno(loginVO.getuNo());
		/*
		 * for(CartVO items : cartList) {
		 * 	cartList에서 pNo 받아서  상품 정보 뭉쳐서 보내기
		 * 	pattach에 있는 상품 사진도 연결해야 하기 때문
		 *  productList.add 사용하는 방법도 좋을 듯
		 * }
		 */
		model.addAttribute("cartList", cartList);
		return "mypage/cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String cart(UserVO vo, HttpServletRequest req, CartVO cv) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		// 결제 페이지를 새로 제작해서 이동? 아니면 바로 결제?
		// 새로 제작하면 페이지 이동 시 cNo와 함께 보내기
		// 바로 결제 시 order_ 테이블에 값 넣어주기. 수령인 관련 정보 페이지 수정 필요
		return "redirect:/mypage/hdetail.do?oNo=";
	}
	
	@RequestMapping(value="/goodbye.do")
	public String goodbye() {
		return "mypage/goodbye";
	}
	
	@RequestMapping(value="/hdetail.do")
	public String hdetail() {
		return "mypage/hdetail";
	}
	
	@RequestMapping(value="/history.do")
	public String history() {
		return "mypage/history";
	}
	
	@RequestMapping(value="/main.do")
	public String main() {
		return "mypage/main";
	}
	
	@RequestMapping(value="/mileage.do")
	public String mileage() {
		return "mypage/mileage";
	}
	
	@RequestMapping(value="/myboard.do")
	public String myboard() {
		return "mypage/myboard";
	}
	
	@RequestMapping(value="/myinfo.do")
	public String myinfo() {
		return "mypage/myinfo";
	}
	
	@RequestMapping(value="/myqna.do")
	public String myqna() {
		return "mypage/myqna";
	}
	
	@RequestMapping(value="/myreview.do")
	public String myreview() {
		return "mypage/myreview";
	}
	
	@RequestMapping(value="/regular.do")
	public String regular() {
		return "mypage/regular";
	}
}
