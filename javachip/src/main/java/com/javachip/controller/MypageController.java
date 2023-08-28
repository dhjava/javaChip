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
import com.javachip.service.Order_DetailService;
import com.javachip.service.Order_Service;
import com.javachip.service.UserService;
import com.javachip.vo.CartVO;
import com.javachip.vo.MileageVO;
import com.javachip.vo.Order_DetailVO;
import com.javachip.vo.Order_VO;
import com.javachip.vo.PageMaker;
import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@Autowired
	private CartService cs;
	@Autowired
	private MileageService ms;
	@Autowired
	private UserService us;
	@Autowired
	private Order_Service os;
	@Autowired
	private Order_DetailService ods;
	@Autowired
	private PageMaker pm;
	
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
		int uNo = loginVO.getuNo();
		System.out.println("uNo::"+uNo);
		List<CartVO> cartList = cs.selectCartByUno(uNo);
		System.out.println(cartList);
		// 상품 정보 조회
		
		
		// 모델로 전달
		model.addAttribute("cartList", cartList);
		model.addAttribute("uNo", uNo);
		return "mypage/cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String cart(
			HttpServletRequest req
		,	RedirectAttributes rttr
		) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		String[] selCartList = req.getParameterValues("chkCart");
		for(String items : selCartList) {
			System.out.println("selCart::"+items);
		}
		rttr.addAttribute("selCartList", selCartList);
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
	
	@RequestMapping(value="/deleteAllCart.do", method=RequestMethod.POST)
	@ResponseBody
	public int deleteAllCart(int uNo) {
		return cs.deleteAllCart(uNo);
	}
	// ajax end
	
	@RequestMapping(value="/goodbye.do", method=RequestMethod.GET)
	public String goodbye() {
		return "mypage/goodbye";
	}
	
	@RequestMapping(value="/goodbye.do", method=RequestMethod.POST)
	public String goodbye(UserVO vo, RedirectAttributes ra, HttpServletRequest req) throws Exception{
		System.out.println("removePOST");
		
		HttpSession session = req.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		
		String oldPass = user.getuPw();
		String newPass = vo.getuPw();
		
		if(oldPass.equals(newPass)) {
			us.byebye(vo);
			ra.addFlashAttribute("result", "removeOK");
			session.invalidate();
			return "redirect:/";
		} else {
			ra.addFlashAttribute("result", "removeFalse");
			return "redirect:/mypage/goodbye";
		}
	}
	
	@RequestMapping(value="/history.do")
	public String history(
			HttpServletRequest req,
			Model model,
			SearchVO searchVO
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		
		List<Order_VO> orderList = os.selectUserOrder(uNo);
		int cnt = os.countUserOrder(uNo);
		System.out.println("uNo::"+uNo);
		System.out.println("cnt::"+cnt);
		
		pm.setSearchVO(searchVO);
		pm.setTotalCount(cnt);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pm", pm);
		
		return "mypage/history";
	}
	
	@RequestMapping(value="/hdetail.do")
	public String hdetail(
			int oNo,
			HttpServletRequest req,
			Model model
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		
		// 주문 조회
		List<Order_VO> orderList = os.selectUserOrder(uNo);
		int chkDup = 0;
		Order_VO thisOrder = null;
		for(Order_VO items : orderList) {
			if(items.getoNo() == oNo) {
				chkDup += 1;
				thisOrder = items;
			}
		}
		if(chkDup != 1) {
			// 해당 주문이 없거나 오류
			return "mypage/history";
		}
		
		List<Order_DetailVO> orderDetail = ods.selectOrderDetail(oNo);
		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("thisOrder", thisOrder);
		
		return "mypage/hdetail";
	}
	
	
	@RequestMapping(value="/main.do")
	public String main() {
		return "mypage/main";
	}
	
	@RequestMapping(value="/mileage.do")
	public String mileage(
			HttpServletRequest req
		,	Model model
		) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		if(ms.selectAllMileage(uNo) != null) {
			List<MileageVO> mileageList = ms.selectAllMileage(uNo);
			model.addAttribute("mileageList", mileageList);
		}
		
		
		return "mypage/mileage";
	}
	
	@RequestMapping(value="/myboard.do")
	public String myboard() {
		return "mypage/myboard";
	}
	
	@RequestMapping(value="/myinfo.do")
	public String myinfo(HttpServletRequest req,Model model,int uNo){
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		return "mypage/myinfo";
	}
	
	@RequestMapping(value="/myinfoUpdate.do")
	public String myinfoUpdate(HttpServletRequest req,UserVO vo,Model model) throws Exception{
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		vo.setuNo(uNo);
		System.out.println(vo);
		us.infoUpdate(vo);
		model.addAttribute("vo",vo);
		return "redirect:myinfo.do";
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
