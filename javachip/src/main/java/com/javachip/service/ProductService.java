package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.SearchVO;

@Service
public interface ProductService {
	List<ProductVO> selectAllProduct(SearchVO searchVO);
	int totalProduct(SearchVO searchVO);
	List<ProductVO> selectProductType(String pType);
	ProductVO selectOneProduct(int pNo);
	int insertProduct(ProductVO productVO);
	int inputProduct(ProductVO productVO);
	int outputProduct(ProductVO productVO);
	int updateProduct(ProductVO productVO);
	int deleteProduct(int pNo);
	
	//관리자 메소드
	//관리자용 상품 리스트(검색기능)
	List<ProductVO> List(AdminSearchVO AdminSearchVO);
	//상픔 전체 목록 갯수(페이징)
	int productTotal(AdminSearchVO AdminSearchVO);
}
