package com.kh.perfumePalette.perfume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PerfumeServiceImpl implements PerfumeService{
	
	@Autowired
	private PerfumeStore pStore;

}
