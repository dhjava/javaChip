package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.UserMapper";
	
	public UserVO selectMemberByLogin(UserVO vo) {
		return sqlSession.selectOne(namespace+".selectUserByLogin", vo);
	}
	
	public int selectCntById(String uId) {
		return sqlSession.selectOne(namespace+".selectCntById", uId);
	}
	
	public int insert(UserVO vo) {
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	public int insertBiz(UserVO vo) {
		return sqlSession.insert(namespace+".insertBiz", vo);
	}
	
	public UserVO selectMemberByIdFind(UserVO vo) {
		return sqlSession.selectOne(namespace+".selectUserByIdFind", vo);
	}
	
	public List<UserVO> list(AdminSearchVO AdminSearchVO)	//관리자 전체 회원관리(검색기능추가)
	{
		return sqlSession.selectList(namespace+".selectUserByAdmin", AdminSearchVO);
	}
	
	public UserVO selectUserOneByuNoByAdmin(int uNo)		//관리자 세부 회원관리
	{
		return sqlSession.selectOne(namespace+".selectUserOneByuNoByAdmin", uNo);
	}
	
	public int UserTotal(AdminSearchVO AdminSearchVO)		//관리자 전체 회원관리(페이징기능의 전체 유저수)
	{
		int value = 0;
		value = sqlSession.selectOne(namespace+".UserTotal", AdminSearchVO);
		return value;
	}
}
