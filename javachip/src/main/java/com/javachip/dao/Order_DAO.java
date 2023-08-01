package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.Order_VO;

@Repository
public class Order_DAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.cartMapper";
	
	public List<Order_VO> selectUserOrder(int uNo) {
		return sqlSession.selectList(namespace+".selectUserOrder", uNo);
	}
	public int insertOrder(Order_VO order_VO) {
		return sqlSession.insert(namespace+".insertOrder", order_VO);
	}
	public int updateOrderReceiver(Order_VO order_VO) {
		return sqlSession.update(namespace+".updateOrderReceiver", order_VO);
	}
	public List<Order_VO> selectOrderForAdmin() {
		return sqlSession.selectList(namespace+".selectOrderForAdmin");
	}
	public int updateOrderStatus(Order_VO order_VO) {
		return sqlSession.update(namespace+".updateOrderStatus", order_VO);
	}
}
