package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.reviewMapper";
	
	public List<ReviewVO> selectAllReview() {
		return sqlSession.selectList(namespace+".selectAllReview");
	}
	public List<ReviewVO> selectReview(int pNo) {
		return sqlSession.selectList(namespace+".selectReview", pNo);
	}
	public List<ReviewVO> selectUserReview(int uNo) {
		return sqlSession.selectList(namespace+".selectUserReview", uNo);
	}
	public int countUserReview(int uNo) {
		return sqlSession.selectOne(namespace+".countUserReview", uNo);
	}
	public int insertReview(ReviewVO reviewVO) {
		return sqlSession.insert(namespace+".insertReview", reviewVO);
	}
	public int updateReview(ReviewVO reviewVO) {
		return sqlSession.update(namespace+".updateReview", reviewVO);
	}
	public int deleteReview(ReviewVO reviewVO) {
		return sqlSession.update(namespace+".deleteReview", reviewVO);
	}
}
