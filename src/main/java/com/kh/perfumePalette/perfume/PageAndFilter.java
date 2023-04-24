package com.kh.perfumePalette.perfume;

import com.kh.perfumePalette.PageInfo;

public class PageAndFilter {
	
	private PageInfo pageInfo;
	
	private String perfumeBrand;
	private String perfumeSearch;
	
	private int startPerfumePrice;
	private int endPerfumePrice = 600000;
	
	private String pScentCategory;
	private String pImageCategory;
	
	private String perfumeSort;
	
	
	
	public PageAndFilter() {}



	public PageInfo getPageInfo() {
		return pageInfo;
	}



	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}



	public String getPerfumeBrand() {
		return perfumeBrand;
	}



	public void setPerfumeBrand(String perfumeBrand) {
		this.perfumeBrand = perfumeBrand;
	}



	public String getPerfumeSearch() {
		return perfumeSearch;
	}



	public void setPerfumeSearch(String perfumeSearch) {
		this.perfumeSearch = perfumeSearch;
	}



	public int getStartPerfumePrice() {
		return startPerfumePrice;
	}



	public void setStartPerfumePrice(int startPerfumePrice) {
		this.startPerfumePrice = startPerfumePrice;
	}



	public int getEndPerfumePrice() {
		return endPerfumePrice;
	}



	public void setEndPerfumePrice(int endPerfumePrice) {
		this.endPerfumePrice = endPerfumePrice;
	}



	public String getpScentCategory() {
		return pScentCategory;
	}



	public void setpScentCategory(String pScentCategory) {
		this.pScentCategory = pScentCategory;
	}



	public String getpImageCategory() {
		return pImageCategory;
	}



	public void setpImageCategory(String pImageCategory) {
		this.pImageCategory = pImageCategory;
	}



	public String getPerfumeSort() {
		return perfumeSort;
	}



	public void setPerfumeSort(String perfumeSort) {
		this.perfumeSort = perfumeSort;
	}

	

	
	
	
}
