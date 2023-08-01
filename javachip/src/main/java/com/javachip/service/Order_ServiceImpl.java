package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.Order_DAO;
import com.javachip.vo.Order_VO;

@Repository
public class Order_ServiceImpl implements Order_Service {
	
	@Autowired
	private Order_DAO order_DAO;
	
	@Override
	public List<Order_VO> selectUserOrder(int uNo) {
		return order_DAO.selectUserOrder(uNo);
	}

	@Override
	public int insertOrder(Order_VO order_VO) {
		return order_DAO.insertOrder(order_VO);
	}

	@Override
	public int updateOrderReceiver(Order_VO order_VO) {
		return order_DAO.updateOrderReceiver(order_VO);
	}

	@Override
	public List<Order_VO> selectOrderForAdmin() {
		return order_DAO.selectOrderForAdmin();
	}

	@Override
	public int updateOrderStatus(Order_VO order_VO) {
		return order_DAO.updateOrderStatus(order_VO);
	}

}
