package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Service
public interface UserService {
	UserVO selectUserByLogin(UserVO vo);
	int selectCntById(String id);
	int insert(UserVO vo);
	int insertBiz(UserVO vo);
	
	List<UserVO>list(AdminSearchVO AdminSearchVO);	//관리자용 전체 유저 리스트
	UserVO selectUserOneByuNoByAdmin(int uNo);
}
