package com.kh.perfumePalette.perfume;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PerfumeStoreImpl implements PerfumeStore{
	
	@Autowired
	private SqlSession session;

}
