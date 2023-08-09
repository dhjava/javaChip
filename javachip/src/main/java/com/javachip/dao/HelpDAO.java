package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.SearchVO;

@Repository
public class HelpDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertNotice(NoticeVO vo) {
		return sqlSession.insert("com.javachip.mapper.helpMapper.insertNotice", vo);
	}
	
	public List<NoticeVO> selectNoticeList (SearchVO searchVO) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNoticeAll",searchVO);
	}
	
	public NoticeVO selectOneByNno(int nNo) {
		return sqlSession.selectOne("com.javachip.mapper.helpMapper.selectOneByNno", nNo);
	}
	
	public List<NoticeVO> selectNearNno (int nNo) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNearNno", nNo);
	}
	
	public int deleteNotice(int nNo) {
		return sqlSession.update("com.javachip.mapper.helpMapper.deleteNotice", nNo);
	}
	
	public int insertQnA(QnaVO vo) {
		return sqlSession.insert("com.javachip.mapper.helpMapper.insertQnA", vo);
	}
	
	public int updateQno(int qNo) {
		return sqlSession.update("com.javachip.mapper.helpMapper.updateOriginQno",qNo);
	}
	
	public List<QnaVO> selectQnaList (SearchVO searchVO) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectQnaAll",searchVO);
	}
	
	public QnaVO selectOneByQno(int qNo) {
		return sqlSession.selectOne("com.javachip.mapper.helpMapper.selectOneByQno", qNo);
	}
	
	public List<QnaVO> selectNearQno (int qNo) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNearQno", qNo);
	}
	
	public int deleteQna(int qNo) {
		return sqlSession.update("com.javachip.mapper.helpMapper.deleteQna", qNo);
	}
	
	
	//====================================관리자 메소드====================================
	//관리자용 공지사항 검색/페이징 전체 리스트를 위한 메소드
	public List<NoticeVO> selectNoticeByAdmin (AdminSearchVO AdminSearchVO) 
	{
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNoticeByAdmin",AdminSearchVO);
	}
	//관리자용 공지사항 페이징 구현을 위한 메소드(전체 공지사항 수)
	public int NoticeTotal(AdminSearchVO AdminSearchVO)		
	{
		int value = 0;
		value = sqlSession.selectOne("com.javachip.mapper.helpMapper.NoticeTotal", AdminSearchVO);
		return value;
	}
	
	//관리자용 QnA 검색/페이징 전체 리스트를 위한 메소드
	public List<QnaVO> selectQnAByAdmin(AdminSearchVO AdminSearchVO)
	{
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectQnAByAdmin", AdminSearchVO);
	}
	
	//관리자용 QnA 페이징 구현을 위한 메소드(전체 QnA수)
	public int QnATotal(AdminSearchVO AdminSearchVO)
	{
		int value = 0;
		value = sqlSession.selectOne("com.javachip.mapper.helpMapper.QnATotal", AdminSearchVO);
		return value;
	}
}
