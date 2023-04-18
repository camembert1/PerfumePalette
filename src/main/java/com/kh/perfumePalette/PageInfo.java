package com.kh.perfumePalette;

public class PageInfo {
	
	private int currentPage;	// 현재 페이지
	private int totalCount;		// 전체 게시글 개수
	private int boardLimit;		// 한 페이지당 게시글 개수
	
	private int naviLimit;		// 한 페이지당 pageNavi 개수
	private int startNavi;		// pageNavi 시작값
	private int endNavi;		// pageNavi 마지막값
	private int lastPage;		// 페이지의 마지막 번호
	
	public PageInfo() {
		super();
	}

	public PageInfo(int currentPage, int totalCount, int boardLimit) {
		super();
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.boardLimit = boardLimit;
	    this.naviLimit = 5;         // 한 페이지 당 pageNavi 개수
	    calc();
	}
	
	private void calc() {
		
		lastPage = (int) Math.ceil((double) totalCount / boardLimit); 
		
		if (currentPage > lastPage) {
			currentPage = lastPage;
		}
		if (currentPage < 1) {
			currentPage = 1;
		}
			    
		startNavi = ((currentPage - 1) / naviLimit) * naviLimit + 1;
		
		endNavi = startNavi + naviLimit - 1;
		if (endNavi > lastPage) {
			endNavi = lastPage;
		}
	}	

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getNaviLimit() {
		return naviLimit;
	}

	public void setNaviLimit(int naviLimit) {
		this.naviLimit = naviLimit;
	}

	public int getStartNavi() {
		return startNavi;
	}

	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}
	
	public int getEndNavi() {
		return endNavi;
	}

	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", boardLimit=" + boardLimit + ", naviLimit=" + naviLimit
				+ ", startNavi=" + startNavi + ", endNavi=" + endNavi + ", totalCount=" + totalCount + ", lastPage="
				+ lastPage + "]";
	}

}
