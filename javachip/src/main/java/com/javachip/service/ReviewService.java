package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.ReviewVO;

@Service
public interface ReviewService {
	List<ReviewVO> selectAllReview();
	List<ReviewVO> selectReview(int pNo);
	List<ReviewVO> selectUserReview(int uNo);
	int countUserReview(int uNo);
	int insertReview(ReviewVO reviewVO);
	int updateReview(ReviewVO reviewVO);
	int deleteReview(ReviewVO reviewVO);
	int deleteOneReview(int rNo);
}
