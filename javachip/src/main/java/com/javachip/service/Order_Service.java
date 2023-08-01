package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.Order_VO;

@Service
public interface Order_Service {
	// 사용자
	List<Order_VO> selectUserOrder(int uNo);
	int insertOrder(Order_VO order_VO);
	int updateOrderReceiver(Order_VO order_VO);
	
	// 관리자
	List<Order_VO> selectOrderForAdmin();
	int updateOrderStatus(Order_VO order_VO);
}
