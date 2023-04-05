package com.kh.perfumePalette;

public class Alert {
	
	private String pageUrl;
	private String alertMessage;

	public Alert() {
		super();
	}

	public Alert(String pageUrl, String alertMessage) {
		super();
		this.pageUrl = pageUrl;
		this.alertMessage = alertMessage;
	}
	
	public String getPageUrl() {
		return pageUrl;
	}

	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}

	public String getAlertMessage() {
		return alertMessage;
	}

	public void setElertMessage(String alertMessage) {
		this.alertMessage = alertMessage;
	}

	@Override
	public String toString() {
		return "Elert [pageUrl=" + pageUrl + ", elertMessage=" + alertMessage + "]";
	}

}
