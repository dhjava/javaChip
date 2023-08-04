package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Service
public interface UserService {
	UserVO selectUserByLogin(UserVO vo);
	int selectCntById(String uId);
	int insert(UserVO vo);
	int insertBiz(UserVO vo);
	UserVO selectUserByIdFind(UserVO vo);
	
	List<UserVO>list(AdminSearchVO AdminSearchVO);	//관리자 전체 회원 목록(검색기능추가)
	UserVO selectUserOneByuNoByAdmin(int uNo);		//관리자 세부 회원 목록
	int UserTotal(AdminSearchVO AdminSearchVO);		//관리자 전체 회원수 (페이징 기능)
	List<UserVO> BizList(AdminSearchVO AdminSearchVO);	//관리자 전체 사업자 목록(검색기능추가)
	int BizUserTotal(AdminSearchVO AdminSearchVO);		//관리자 전체 사업자유저 회원수(페이징기능)
}
