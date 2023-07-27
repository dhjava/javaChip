package com.javachip.service;

import org.springframework.stereotype.Service;

import com.javachip.vo.UserVO;

@Service
public interface UserService {
	UserVO selectUserByLogin(UserVO vo);
	int selectCntById(String id);
	int insert(UserVO vo);
}
