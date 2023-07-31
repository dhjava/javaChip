package com.javachip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javachip.dao.HelpDAO;
import com.javachip.vo.NoticeVO;

@Service
public class HelpServiceImpl implements HelpService {
	
	@Autowired
	private HelpDAO helpDAO;
	
	@Override
	public int insertNotice(NoticeVO vo) {
		
		return helpDAO.insert(vo);
	}
	
}
