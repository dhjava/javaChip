package com.javachip.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.NoticeVO;

@Repository
public class HelpDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(NoticeVO vo) {
		return sqlSession.insert("com.javachip.mapper.helpMapper.insertNotice", vo);
	}
}
