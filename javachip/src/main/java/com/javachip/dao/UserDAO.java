package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Repository
public class UserDAO {
	// user 페이지
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

	public UserVO idFind(UserVO vo) {
		return sqlSession.selectOne(namespace+".idFind", vo);
	}
	
	public UserVO pwFind(UserVO vo) {
		return sqlSession.selectOne(namespace+".pwFind", vo);
	}
	
	// mypage 관련
	public UserVO infoCheck(int uNo){
		return sqlSession.selectOne(namespace+".infoCheck", uNo);
	}
	
	public int infoUpdate(UserVO vo){
		return sqlSession.update(namespace+".infoUpdate", vo);
	}
	
	public int byebye(UserVO vo) {
		return sqlSession.delete(namespace+".byebye", vo);
	}
	
	//admin용========================================================
	public List<UserVO> list(AdminSearchVO AdminSearchVO)	//관리자 전체 일반회원관리(검색기능추가)

	{
		return sqlSession.selectList(namespace+".selectUserByAdmin", AdminSearchVO);
	}
	
	public UserVO selectUserOneByuNoByAdmin(int uNo)		//관리자 세부 일반회원관리
	{
		return sqlSession.selectOne(namespace+".selectUserOneByuNoByAdmin", uNo);
	}
	
	public int UserTotal(AdminSearchVO AdminSearchVO)		//관리자 전체 일반회원관리(페이징기능의 전체 유저수)
	{
		int value = 0;
		value = sqlSession.selectOne(namespace+".UserTotal", AdminSearchVO);
		return value;
	}
	
	public List<UserVO> Bizlist(AdminSearchVO AdminSearchVO)		//관리자 전체 사업자회원 관리(검색기능추가)
	{
		return sqlSession.selectList(namespace+".selectBizUserByAdmin", AdminSearchVO);
	}
	
	public int BizUserTotal(AdminSearchVO AdminSearchVO)		//관리자 전체 사업자 회원 수(페이징)
	{
		int value = 0;
		value = sqlSession.selectOne(namespace+".BizUserTotal", AdminSearchVO);
		return value;
	}
	
	public UserVO selectBizUserOneByuNoByAdmin(int uNo)		//관리자 사업자회원 세부목록 관리
	{
		return sqlSession.selectOne(namespace+".selectBizUserOneByuNoByAdmin", uNo);
	}
	
	public List<UserVO> blacklist(AdminSearchVO AdminSearchVO)		//관리자 블랙리스트 전체 목록(경고횟수많은수부터)
	{
		return sqlSession.selectList(namespace+".selectBlakListByAdmin", AdminSearchVO);
	}
	
	public int blacklistTotal(AdminSearchVO AdminSearchVO)		//블랙리스트 총 수 (페이징)
	{
		int value = 0;
		value = sqlSession.selectOne(namespace+".BlacklistTotal", AdminSearchVO);
		return value;
	}
	
	public UserVO selectBlacklistOneByuNoByAdmin(int uNo)
	{
		return sqlSession.selectOne(namespace+".selectBlacklistOneByuNoByAdmin", uNo);
	}
	
	public int stopUser(int uNo)
	{
		return sqlSession.update(namespace+".stopUser", uNo);
	}
	
	public int CancleStopUser(UserVO vo)
	{
		return sqlSession.update(namespace+".CancleStopUser", vo);
	}
}
