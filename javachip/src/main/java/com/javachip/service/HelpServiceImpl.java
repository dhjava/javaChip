package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javachip.dao.HelpDAO;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.QnaVO;
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
	
	@Override
	public List<NoticeVO> selectNearNno(int nNo) {
		
		return helpDAO.selectNearNno(nNo);
	}
	
	@Override
	public int deleteNotice(int nNo) {
		
		return helpDAO.deleteNotice(nNo);
	}

	@Override
	public int insertQnA(QnaVO vo) {
		
		int result = helpDAO.insertQnA(vo);
		helpDAO.updateQno(vo.getqNo());
		
		return result;
	}

	@Override
	public List<QnaVO> selectQnaList(SearchVO searchVO) {
		
		return helpDAO.selectQnaList(searchVO);
	}

	@Override
	public QnaVO selectOneByQno(int qNo) {
		
		return helpDAO.selectOneByQno(qNo);
	}

	@Override
	public List<QnaVO> selectNearQno(int qNo) {
		
		return helpDAO.selectNearQno(qNo);
	}
	
	@Override
	public int deleteQna(int qNo) {
		
		return helpDAO.deleteQna(qNo);
	}

	//관리자용 notice 페이징을 위한 메소드
	@Override
	public List<NoticeVO> selectNoticeByAdmin(AdminSearchVO AdminSearchVO) 
	{
		return helpDAO.selectNoticeByAdmin(AdminSearchVO);
	}

	//관리자 전체공지사항 수(페이징)
	@Override
	public int NoticeTotal(AdminSearchVO AdminSearchVO) 
	{
		return helpDAO.NoticeTotal(AdminSearchVO);
	}
}
