package com.javachip.service;

import java.util.List;

import com.javachip.vo.NoticeVO;

import com.javachip.vo.SearchVO;

public interface HelpService {
	
	int insertNotice(NoticeVO vo);

	List<NoticeVO> selectNoticeList(SearchVO searchVO);
	
	NoticeVO selectOneByNno(int nNo);
}
