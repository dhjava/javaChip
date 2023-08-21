package com.javachip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javachip.service.HelpService;
import com.javachip.service.Order_Service;
import com.javachip.service.ProductService;
import com.javachip.service.UserService;
import com.javachip.vo.AdminPageMaker;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.Order_VO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/admin")
public class AdminController 
{	
	@Autowired
	private UserService us;
	
	@Autowired
	private AdminPageMaker pm;
	
	@Autowired
	private HelpService hs;
	
	@Autowired
	private Order_Service os;
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping(value="/qnaList.do")
	public String qnaList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = hs.QnATotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<QnaVO> qlist = hs.selectQnAByAdmin(AdminSearchVO);
		model.addAttribute("list", qlist);
		model.addAttribute("pm", pm);
		
		return "admin/qnaList";
	}
	
	@RequestMapping(value="/boardList.do")
	public String boardList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = hs.NoticeTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<NoticeVO> nlist = hs.selectNoticeByAdmin(AdminSearchVO);

		model.addAttribute("list", nlist);
		model.addAttribute("pm", pm);
		
		return "admin/boardList";
	}
	
	@RequestMapping(value="/deliveryList.do")
	public String deliveryList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = os.OrderTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<Order_VO> olist = os.list(AdminSearchVO);
		System.out.println(olist);
		model.addAttribute("list", olist);
		model.addAttribute("pm", pm);
		
		return "admin/deliveryList";
	}
	
	@RequestMapping(value="/main.do")
	public String main(Model model, AdminSearchVO AdminSearchVO)
	{
		int qcnt = hs.QnATotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setqTotalCount(qcnt);
		
		int pcnt = ps.productTotal(AdminSearchVO);
		AdminPageMaker ppm = new AdminPageMaker();
		ppm.setAdminSearchVO(AdminSearchVO);
		ppm.setpTotalCount(pcnt);
		
		int ncnt = hs.NoticeTotal(AdminSearchVO);
		AdminPageMaker npm = new AdminPageMaker();
		npm.setAdminSearchVO(AdminSearchVO);
		npm.setnTotalCount(ncnt);
		
		AdminSearchVO.setPerPageNum(3);
		
		if(AdminSearchVO.getqPage() > 1)
		{
			AdminSearchVO.setsNum((AdminSearchVO.getqPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		if(AdminSearchVO.getpPage() > 1)
		{
			AdminSearchVO.setsNum((AdminSearchVO.getpPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		if(AdminSearchVO.getnPage() > 1)
		{
			AdminSearchVO.setsNum((AdminSearchVO.getnPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		List<QnaVO> qlist = hs.selectQnAByAdmin(AdminSearchVO);
		List<ProductVO> plist = ps.List(AdminSearchVO);
		List<NoticeVO> nlist = hs.selectNoticeByAdmin(AdminSearchVO);
		
		model.addAttribute("qlist", qlist);
		model.addAttribute("plist", plist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("qpm", pm);
		model.addAttribute("ppm", ppm);
		model.addAttribute("npm", npm);
		
		System.out.println(pm);
		System.out.println(ppm);
		System.out.println(npm);
		return "admin/main";
	}

	@RequestMapping(value="/memberList.do")
	public String memberList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = us.UserTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
//		System.out.println("test===");
//		System.out.println(AdminSearchVO.getPage());
//		System.out.println("sNum : "+AdminSearchVO.getsNum());
//		System.out.println("perPageNum : "+AdminSearchVO.getPerPageNum());
//		System.out.println(pm.getTotalCount());
		
		// 다음 페이지인 경우
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
//		System.out.println("after sNum : "+AdminSearchVO.getsNum());
		List<UserVO> list = us.list(AdminSearchVO);
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
		return "admin/memberList";
	}
	
	@RequestMapping(value="/memberDetail.do")
	public String memberDetail(int uNo, Model model)
	{
		UserVO vo = us.selectUserOneByuNoByAdmin(uNo);
		model.addAttribute("vo", vo);
		return "admin/memberDetail";
	}
	
	@RequestMapping(value="/bizmemberList.do")
	public String bizmemberList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = us.BizUserTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		List<UserVO> Bizlist = us.BizList(AdminSearchVO);
		model.addAttribute("list", Bizlist);
		model.addAttribute("pm", pm);
		
		return "admin/bizmemberList";
	}
	
	@RequestMapping(value="/bizmemberDetail.do")
	public String bizmemberDetail(int uNo, Model model)
	{
		UserVO bisvo = us.selectBizUserOneByuNoByAdmin(uNo);
		model.addAttribute("vo", bisvo);
		return "admin/bizmemberDetail";
	}
	
	@RequestMapping(value="/blackList.do")
	public String blackList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = us.blacklistTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		List<UserVO> blacklist = us.blacklist(AdminSearchVO);
		model.addAttribute("list", blacklist);
		model.addAttribute("pm", pm);
		
		return "admin/blackList";
	}
	
	@RequestMapping(value="/blacklistDetail.do")
	public String blacklistDetail(int uNo, Model model)
	{
		UserVO blacklist = us.selectBlacklistOneByuNoByAdmin(uNo);
		model.addAttribute("vo", blacklist);
		return "admin/blacklistDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/AlertUser.do")
	public String AlertUser(int uNo)
	{
		int result = 0;
		result = us.stopUser(uNo);
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(HttpServletRequest request)
	{

		String[] ajaxMsg = request.getParameterValues("valueArr");
		
		
		int size = ajaxMsg.length;
			
			for(int i = 0; i < size; i++) {
				hs.deleteNoticeByAdmin(ajaxMsg[i]);
			}

		return "redirect:/admin/boardList";

	}
	
	@RequestMapping(value="/product.do")
	public String product()
	{
		return "admin/product";
	}
	
	@RequestMapping(value="/productList.do")
	public String productList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = ps.productTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<ProductVO> plist = ps.List(AdminSearchVO);
		model.addAttribute("list", plist);
		model.addAttribute("pm", pm);
		return "admin/productList";
	}
}
