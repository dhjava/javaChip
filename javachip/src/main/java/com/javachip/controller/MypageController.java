package com.javachip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javachip.service.CartService;
import com.javachip.service.MileageService;
import com.javachip.vo.CartVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@Autowired
	private CartService cs;
	@Autowired
	private MileageService ms;
	
	
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String cart(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		// 로그인 여부 확인
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		System.out.println("loginVO::"+loginVO);
		
		// 장바구니 조회
		int uNo = 1;
		System.out.println("uNo::"+uNo);
		List<CartVO> cartList = cs.selectCartByUno(uNo);
		System.out.println(cartList);
		// 상품 정보 조회
		
		
		// 모델로 전달
		model.addAttribute("cartList", cartList);
		return "mypage/cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String cart(
			HttpServletRequest req
		,	RedirectAttributes ra
		,	Model model
		) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		String[] cartList = req.getParameterValues("chkCart");
		model.addAttribute(cartList);
		return "redirect:/shop/checkout.do";
	}
	
	// ajax start
	
	@RequestMapping(value="/updateCount.do", method=RequestMethod.POST)
	@ResponseBody
	public int updateCount(int cNo, int cCount) {
		System.out.println("cNo::"+cNo);
		System.out.println("cCount::"+cCount);
		CartVO cv = new CartVO();
		cv.setcNo(cNo);
		cv.setcCount(cCount);
		return cs.updateCart(cv);
	}
	
	@RequestMapping(value="/deleteCart.do", method=RequestMethod.POST)
	@ResponseBody
	public int deleteCart(int cNo) {
		return cs.deleteOneCart(cNo);
	}
	
	// ajax end
	
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
