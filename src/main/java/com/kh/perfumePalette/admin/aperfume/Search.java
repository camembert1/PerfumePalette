package com.kh.perfumePalette.admin.aperfume;

public class Search {
	private String searchValue;
	private String searchOder; // 순서
	private String searchIncense;  // 향분류
	private String searchCondition; // 브랜드, 이름
	
	public Search() {
		super();
	}

	public Search(String searchValue, String searchOder, String searchIncense, String searchCondition) {
		super();
		this.searchValue = searchValue;
		this.searchOder = searchOder;
		this.searchIncense = searchIncense;
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchOder() {
		return searchOder;
	}

	public void setSearchOder(String searchOder) {
		this.searchOder = searchOder;
	}

	public String getSearchIncense() {
		return searchIncense;
	}

	public void setSearchIncense(String searchIncense) {
		this.searchIncense = searchIncense;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	@Override
	public String toString() {
		return "Search [searchValue=" + searchValue + ", searchOder=" + searchOder + ", searchIncense=" + searchIncense
				+ ", searchCondition=" + searchCondition + "]";
	}

	
	
}
