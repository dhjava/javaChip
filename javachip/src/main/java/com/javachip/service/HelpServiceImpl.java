package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javachip.dao.HelpDAO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.SearchVO;

@Service
public class HelpServiceImpl implements HelpService {
	
	@Autowired
	private HelpDAO helpDAO;
	
	@Override
	public int insertNotice(NoticeVO vo) {
		
		return helpDAO.insertNotice(vo);
	}

	@Override
	public List<NoticeVO> selectNoticeList(SearchVO searchVO) {
		
		return helpDAO.selectNoticeList(searchVO);
	}
	
	@Override
	public NoticeVO selectOneByNno(int nNo) {
		
		return helpDAO.selectOneByNno(nNo);
	}

	
}
