package com.javachip.service;

import com.javachip.vo.UserVO;

public interface UserService {
	UserVO selectUserByLogin(UserVO vo);
	int selectCntById(String id);
	int insert(UserVO vo);
}
