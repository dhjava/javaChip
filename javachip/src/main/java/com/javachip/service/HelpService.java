package com.javachip.service;

import java.util.List;

import com.javachip.vo.NoticeVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.SearchVO;

public interface HelpService {
	
	int insertNotice(NoticeVO vo);

	List<NoticeVO> selectNoticeList(SearchVO searchVO);
	
	NoticeVO selectOneByNno(int nNo);
	
	List<NoticeVO> selectNearNno(int nNo);
	
	int deleteNotice(int nNo);
	
	int insertQnA(QnaVO vo);
	
	List<QnaVO> selectQnaList(SearchVO searchVO);
	
	QnaVO selectOneByQno(int qNo);
	
	List<QnaVO> selectNearQno(int qNo);
	
	int deleteQna(int qNo);
}
