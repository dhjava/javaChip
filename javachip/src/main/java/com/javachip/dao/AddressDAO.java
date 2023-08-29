package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AddressVO;

@Repository
public class AddressDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.addressMapper";
	
    public AddressVO addressSelect(int uNo) {
        return sqlSession.selectOne(namespace+".addressSelect", uNo);
    }
	
	public int addressSaved(AddressVO vo) {
		return sqlSession.insert(namespace+".addressSaved", vo);
	}
	
	//배송시 전달사항
	public int updateComment(AddressVO addressVO)
	{
		return sqlSession.update(namespace+".updateComment", addressVO);
	}
}
