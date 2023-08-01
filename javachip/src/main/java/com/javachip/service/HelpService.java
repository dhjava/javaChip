package com.javachip.service;

import java.util.List;

import com.javachip.vo.NoticeVO;

public interface HelpService {
	
	int insertNotice(NoticeVO vo);

	List<NoticeVO> selectNoticeAll(NoticeVO noticeVO);
	
	NoticeVO selectOneByNno(int nNo);
}
