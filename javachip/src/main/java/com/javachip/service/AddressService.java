package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AddressVO;

@Service
public interface AddressService {
	AddressVO addressSelect(int uId);
	int addressSaved(AddressVO vo);
}
