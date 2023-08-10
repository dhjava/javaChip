package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.ProductVO;
import com.javachip.vo.SearchVO;

@Service
public interface ProductService {
	List<ProductVO> selectAllProduct(SearchVO searchVO);
	ProductVO selectOneProduct(int pNo);
	int insertProduct(ProductVO productVO);
	int inputProduct(ProductVO productVO);
	int outputProduct(ProductVO productVO);
	int updateProduct(ProductVO productVO);
	int deleteProduct(int pNo);
}
