package com.javachip.service;

import java.util.List;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.SearchVO;

public interface HelpService {
	
	int insertNotice(NoticeVO vo);

	List<NoticeVO> selectNoticeList(SearchVO searchVO);
	
	NoticeVO selectOneByNno(int nNo);
	
	List<NoticeVO> selectNearNno(int nNo);
	
	int deleteNotice(int nNo);
	
	int modifyNotice(NoticeVO vo);
	
	int totalNotice(SearchVO searchVO);
	
	int insertQna(QnaVO vo);
	
	List<QnaVO> selectQnaList(SearchVO searchVO);
	
	QnaVO selectOneByQno(int qNo);
	
	List<QnaVO> selectNearQno(int qNo);
	
	int deleteQna(int qNo);
	
	int totalQna(SearchVO searchVO);
	
	
	
	//====================================관리자 메소드====================================
	//관리자용 공지사항 페이징 구현을 위한 메소드
	List<NoticeVO> selectNoticeByAdmin(AdminSearchVO AdminSearchVO);
	int NoticeTotal(AdminSearchVO AdminSearchVO);		//관리자 전체 공지사항수(페이징기능)
	//관리자용 QnA 검색/페이징 전체 리스트를 위한 메소드
	List<QnaVO> selectQnAByAdmin(AdminSearchVO AdminSearchVO);
	//관리자용 전체 Qna수(페이징기능)
	int QnATotal(AdminSearchVO AdminSearchVO);
}
