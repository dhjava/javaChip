package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AddressVO;
import com.javachip.vo.SearchVO;

@Service
public interface AddressService {
	List<AddressVO> addressSelect(SearchVO searchVO);
	int addressSaved(AddressVO vo);
	
	//배송시 전달사항
	int updateComment(AddressVO addressVO);
}
