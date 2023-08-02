package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.NoticeVO;
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
}
