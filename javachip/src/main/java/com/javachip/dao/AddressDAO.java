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
	
    public AddressVO addressSelect(int uId) {
        return sqlSession.selectOne(namespace+".addressSelect", uId);
    }
	
	public int addressSaved(AddressVO vo) {
		return sqlSession.insert(namespace+".addressSaved", vo);
	}
}
