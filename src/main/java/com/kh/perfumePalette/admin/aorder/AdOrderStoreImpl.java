package com.kh.perfumePalette.admin.aorder;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.admin.aorder.domain.AdOrder;

@Repository
public class AdOrderStoreImpl implements AdOrderStore {


	@Override
	public int getOrderListCount(SqlSession session) {
		return session.selectOne("AdminMapper.getOrderListCount");
	}

	@Override
	public List<AdOrder> selectAdminOrderList(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("AdminMapper.selectAdminOrderList", null, rowBounds);
	}

	@Override
	public List<AdOrder> selectOneByNo(SqlSession session, long orderNo) {
		return session.selectList("AdminMapper.selectAdminOrderDetail", orderNo);
	}

	@Override
	public int updateOrder(SqlSession session, AdOrder order) {
		return session.update("AdminMapper.updateOrderStatus", order);
	}




}
