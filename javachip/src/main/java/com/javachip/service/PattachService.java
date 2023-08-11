package com.javachip.service;

import org.springframework.stereotype.Service;

import com.javachip.vo.PattachVO;

@Service
public interface PattachService {
	PattachVO selectPattach(int pNo);
	int insertPattach(PattachVO pattachVO);
	int deletePattach(int pNo);
	int updatePattach(PattachVO pattachVO);
}
