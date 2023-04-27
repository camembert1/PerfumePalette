package com.kh.perfumePalette.admin.areview;

public class Search {
	private String searchValue;
	private String searchOder; // 순서
	private String searchIncense;  // 향분류
	
	public Search() {
		super();
	}

	public Search(String searchValue, String searchOder, String searchIncense) {
		super();
		this.searchValue = searchValue;
		this.searchOder = searchOder;
		this.searchIncense = searchIncense;
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

	@Override
	public String toString() {
		return "Search [searchValue=" + searchValue + ", searchOder=" + searchOder + ", searchIncense=" + searchIncense
				+ "]";
	}


	
	
}
