package com.kh.perfumePalette.admin.aorder;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.perfumePalette.PageInfo;
import com.kh.perfumePalette.admin.aorder.domain.AdOrder;

public interface AdOrderStore {

	int getOrderListCount(SqlSession session);

	List<AdOrder> selectAdminOrderList(SqlSession session, PageInfo pi);

	List<AdOrder> selectOneByNo(SqlSession session, long orderNo);



}
