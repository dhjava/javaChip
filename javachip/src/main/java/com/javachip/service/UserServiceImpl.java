package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.UserDAO;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Repository
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO selectUserByLogin(UserVO vo) {
		
		return userDAO.selectMemberByLogin(vo);
	}

	@Override
	public int selectCntById(String id) {
		return userDAO.selectCntById(id);
	}

	@Override
	public int insert(UserVO vo) {
		return userDAO.insert(vo);
	}
	
	@Override
	public int insertBiz(UserVO vo) {
		return userDAO.insert(vo);
	}

	@Override
	public List<UserVO> list(AdminSearchVO AdminSearchVO) 	//관리자용 전체 유저 리스트
	{
		return userDAO.list(AdminSearchVO);
	}

	@Override
	public UserVO selectUserOneByuNoByAdmin(int uNo)
	{
		return userDAO.selectUserOneByuNoByAdmin(uNo);
	}
}
