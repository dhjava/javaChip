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
	public int selectCntById(String uId) {
		return userDAO.selectCntById(uId);
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
	public UserVO selectUserByIdFind(UserVO vo) {
		
		return userDAO.selectMemberByIdFind(vo);
	}
	
	@Override
	public List<UserVO> list(AdminSearchVO AdminSearchVO) 	//관리자 전체 회원 목록(검색기능추가)
	{
		return userDAO.list(AdminSearchVO);
	}

	@Override
	public UserVO selectUserOneByuNoByAdmin(int uNo)		//관리자 세부 회원 목록
	{
		return userDAO.selectUserOneByuNoByAdmin(uNo);
	}

	@Override
	public int UserTotal(AdminSearchVO AdminSearchVO)		//관리자 전체 회원수 (페이징 기능)
	{
		
		return userDAO.UserTotal(AdminSearchVO);
	}

	@Override
	public List<UserVO> BizList(AdminSearchVO AdminSearchVO) {
		return userDAO.Bizlist(AdminSearchVO);
	}

	@Override
	public int BizUserTotal(AdminSearchVO AdminSearchVO) {
		return userDAO.BizUserTotal(AdminSearchVO);
	}
}
