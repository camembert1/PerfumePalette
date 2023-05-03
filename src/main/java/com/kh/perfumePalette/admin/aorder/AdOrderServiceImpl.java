package com.kh.perfumePalette.admin.aorder;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.admin.aorder.domain.AdOrder;

@Service
public class AdOrderServiceImpl implements AdOrderService {
	
	@Autowired
	private AdOrderStore oStore;
	
	@Autowired
	private SqlSession session;

	@Override
	public int getOrderListCount() {
		return oStore.getOrderListCount(session);
	}

	@Override
	public List<AdOrder> selectAdminOrderList(PageInfo pi) {
		return oStore.selectAdminOrderList(session, pi);
	}

	@Override
	public List<AdOrder> selectOneByNo(long orderNo) {
		return oStore.selectOneByNo(session, orderNo);
	}




}
