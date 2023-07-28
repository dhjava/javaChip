package com.javachip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.UserDAO;
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
}
