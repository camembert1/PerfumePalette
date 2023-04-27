package com.kh.perfumePalette.review;

public class Search {
	private String searchValue;
	private String searchCondition;
	private String searchPerfume;
	
	public Search() {}
	
	public Search(String searchValue, String searchCondition, String searchPerfume) {
		super();
		this.searchValue = searchValue;
		this.searchCondition = searchCondition;
		this.searchPerfume = searchPerfume;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchPerfume() {
		return searchPerfume;
	}

	public void setSearchPerfume(String searchPerfume) {
		this.searchPerfume = searchPerfume;
	}

	@Override
	public String toString() {
		return "Search [searchValue=" + searchValue + ", searchCondition=" + searchCondition + ", searchPerfume="
				+ searchPerfume + "]";
	}

}
