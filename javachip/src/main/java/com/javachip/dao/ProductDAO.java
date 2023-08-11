package com.javachip.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.ProductVO;
import com.javachip.vo.SearchVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.productMapper";
	
	public List<ProductVO> selectAllProduct(SearchVO searchVO) {
		return sqlSession.selectList(namespace+".selectAllProduct", searchVO);
	}	
	public List<ProductVO> selectProductType(String pType) {
		return sqlSession.selectList(namespace+".selectProductType", pType);
	}	
	public ProductVO selectOneProduct(int pNo) {
		return sqlSession.selectOne(namespace+".selectOneProduct", pNo);
	}	
	public int insertProduct(ProductVO productVO) {
		return sqlSession.insert(namespace+".insertProduct", productVO);
	}	
	public int inputProduct(ProductVO productVO) {
		return sqlSession.update(namespace+".inputProduct", productVO);
	}	
	public int outputProduct(ProductVO productVO) {
		return sqlSession.update(namespace+".outputProduct", productVO);
	}	
	public int updateProduct(ProductVO productVO) {
		return sqlSession.update(namespace+".updateProduct", productVO);
	}	
	public int deleteProduct(int pNo) {
		return sqlSession.delete(namespace+".deleteProduct", pNo);
	}
}
