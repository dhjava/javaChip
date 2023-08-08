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
	public UserVO idFind(UserVO vo) {
		
		return userDAO.idFind(vo);
	}
	
	@Override
	public UserVO pwFind(UserVO vo) {
		
		return userDAO.pwFind(vo);
	}
	
	
	//admin용========================================================
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
	public List<UserVO> BizList(AdminSearchVO AdminSearchVO)		//관리자 전체 사업자 목록(검색기능추가)
	{
		return userDAO.Bizlist(AdminSearchVO);
	}

	@Override
	public int BizUserTotal(AdminSearchVO AdminSearchVO) 		//관리자 전체 사업자유저 회원수(페이징기능)
	{
		return userDAO.BizUserTotal(AdminSearchVO);
	}

	@Override
	public UserVO selectBizUserOneByuNoByAdmin(int uNo) 		//관리자 사업자회원 세부 목록
	{
		return userDAO.selectBizUserOneByuNoByAdmin(uNo);
	}

	@Override
	public List<UserVO> blacklist(AdminSearchVO AdminSearchVO) 		//관리자 블랙리스트 전체 목록(검색기능추가)
	{
		return userDAO.blacklist(AdminSearchVO);
	}

	@Override
	public int blacklistTotal(AdminSearchVO AdminSearchVO) 		//블랙리스트 총 수(페이징)
	{
		return userDAO.blacklistTotal(AdminSearchVO);
	}

	@Override
	public UserVO selectBlacklistOneByuNoByAdmin(int uNo) 		//블랙리스트 회원 세부 관리
	{
		return userDAO.selectBlacklistOneByuNoByAdmin(uNo);
	}

	@Override
	public int stopUser(UserVO vo) 
	{
		return userDAO.stopUser(vo);
	}

	@Override
	public int CancleStopUser(UserVO vo) 
	{
		return userDAO.CancleStopUser(vo);
	}

}
