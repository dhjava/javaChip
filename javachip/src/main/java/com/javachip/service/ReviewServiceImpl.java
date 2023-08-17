package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.ReviewDAO;
import com.javachip.vo.ReviewVO;

@Repository
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public List<ReviewVO> selectAllReview() {
		return reviewDAO.selectAllReview();
	}
	@Override
	public List<ReviewVO> selectReview(int pNo) {
		return reviewDAO.selectReview(pNo);
	}
	@Override
	public List<ReviewVO> selectUserReview(int uNo) {
		return reviewDAO.selectUserReview(uNo);
	}
	@Override
	public int countUserReview(int uNo) {
		return reviewDAO.countUserReview(uNo);
	}
	@Override
	public int insertReview(ReviewVO reviewVO) {
		return reviewDAO.insertReview(reviewVO);
	}
	@Override
	public int updateReview(ReviewVO reviewVO) {
		return reviewDAO.updateReview(reviewVO);
	}
	@Override
	public int deleteReview(ReviewVO reviewVO) {
		return reviewDAO.deleteReview(reviewVO);
	}
}
