package com.kh.perfumePalette;

public class Search {
	private String searchValue;
	private String searchCondition;
	
	public Search() {
		super();
	}

	public Search(String searchValue, String searchCondition) {
		super();
		this.searchValue = searchValue;
		this.searchCondition = searchCondition;
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

	@Override
	public String toString() {
		return "Search [searchValue=" + searchValue + ", searchCondition=" + searchCondition + "]";
	}
	
}
