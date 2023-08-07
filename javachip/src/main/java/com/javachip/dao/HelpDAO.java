package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
