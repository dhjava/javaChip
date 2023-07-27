package com.javachip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javachip.dao.UserDAO;
import com.javachip.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO memberDAO;
	
	@Override
	public UserVO selectUserByLogin(UserVO vo) {
		
		return memberDAO.selectMemberByLogin(vo);
	}

	@Override
	public int selectCntById(String id) {
		return memberDAO.selectCntById(id);
	}

	@Override
	public int insert(UserVO vo) {
		return memberDAO.insert(vo);
	}
}
