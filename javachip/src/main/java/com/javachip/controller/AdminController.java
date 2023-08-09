package com.javachip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

import com.javachip.service.HelpService;
import com.javachip.service.UserService;
import com.javachip.vo.*;

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
	public String delivery()
	{
		return "admin/deliveryList";
	}
	
	@RequestMapping(value="/main.do")
	public String main()
	{
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
	public int boardDelete(HttpSession session,
			@RequestParam(value = "chbox[]") List<String> chArr, NoticeVO NoticeVO)
	{
		NoticeVO notice = (NoticeVO)session.getAttribute("notice");
		int result = 0;
		int nNo = 0;
		
		for(String i : chArr) {
			nNo = Integer.parseInt(i);
			NoticeVO.setnNo(nNo);
			hs.deleteNoticeByAdmin(NoticeVO);
		}
		result = 1;
		return result;
		
/*		String[] BoardMsg = request.getParameterValues("valueArr");
		int size = BoardMsg.length;
		for(int i = 0; i < size; i++)
		{
			hs.deleteNotice(BoardMsg);
		}
*/
	}
	
	@RequestMapping(value="/product.do")
	public String product()
	{
		return "admin/product";
	}
	
	@RequestMapping(value="/productList.do")
	public String productList()
	{
		return "admin/productList";
	}
}
