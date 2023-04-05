package com.kh.perfumePalette.perfume;

import java.sql.Timestamp;

public class Perfume {
	
	private int perfumeNo;
	private String perfumeName;
	private String perfumeBrand;
	private int perfumeVolume;
	private int perfumePrice;
	private int perfumeQuantity;
	private String pScentCategory;
	private String pImageCategory;
	private String pFilename;
	private String pFilerename;
	private String pFilepath;
	private Timestamp perfumeDate;
	private int perfumeStatus;
	
	public Perfume() {
		super();
	}

	public Perfume(int perfumeNo, String perfumeName, String perfumeBrand, int perfumeVolume, int perfumePrice,
			int perfumeQuantity, String pScentCategory, String pImageCategory, String pFilename, String pFilerename,
			String pFilepath, Timestamp perfumeDate, int perfumeStatus) {
		super();
		this.perfumeNo = perfumeNo;
		this.perfumeName = perfumeName;
		this.perfumeBrand = perfumeBrand;
		this.perfumeVolume = perfumeVolume;
		this.perfumePrice = perfumePrice;
		this.perfumeQuantity = perfumeQuantity;
		this.pScentCategory = pScentCategory;
		this.pImageCategory = pImageCategory;
		this.pFilename = pFilename;
		this.pFilerename = pFilerename;
		this.pFilepath = pFilepath;
		this.perfumeDate = perfumeDate;
		this.perfumeStatus = perfumeStatus;
	}

	public int getPerfumeNo() {
		return perfumeNo;
	}

	public void setPerfumeNo(int perfumeNo) {
		this.perfumeNo = perfumeNo;
	}

	public String getPerfumeName() {
		return perfumeName;
	}

	public void setPerfumeName(String perfumeName) {
		this.perfumeName = perfumeName;
	}

	public String getPerfumeBrand() {
		return perfumeBrand;
	}

	public void setPerfumeBrand(String perfumeBrand) {
		this.perfumeBrand = perfumeBrand;
	}

	public int getPerfumeVolume() {
		return perfumeVolume;
	}

	public void setPerfumeVolume(int perfumeVolume) {
		this.perfumeVolume = perfumeVolume;
	}

	public int getPerfumePrice() {
		return perfumePrice;
	}

	public void setPerfumePrice(int perfumePrice) {
		this.perfumePrice = perfumePrice;
	}

	public int getPerfumeQuantity() {
		return perfumeQuantity;
	}

	public void setPerfumeQuantity(int perfumeQuantity) {
		this.perfumeQuantity = perfumeQuantity;
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

	public String getpFilename() {
		return pFilename;
	}

	public void setpFilename(String pFilename) {
		this.pFilename = pFilename;
	}

	public String getpFilerename() {
		return pFilerename;
	}

	public void setpFilerename(String pFilerename) {
		this.pFilerename = pFilerename;
	}

	public String getpFilepath() {
		return pFilepath;
	}

	public void setpFilepath(String pFilepath) {
		this.pFilepath = pFilepath;
	}

	public Timestamp getPerfumeDate() {
		return perfumeDate;
	}

	public void setPerfumeDate(Timestamp perfumeDate) {
		this.perfumeDate = perfumeDate;
	}

	public int getPerfumeStatus() {
		return perfumeStatus;
	}

	public void setPerfumeStatus(int perfumeStatus) {
		this.perfumeStatus = perfumeStatus;
	}

	@Override
	public String toString() {
		return "Perfume [perfumeNo=" + perfumeNo + ", perfumeName=" + perfumeName + ", perfumeBrand=" + perfumeBrand
				+ ", perfumeVolume=" + perfumeVolume + ", perfumePrice=" + perfumePrice + ", perfumeQuantity="
				+ perfumeQuantity + ", pScentCategory=" + pScentCategory + ", pImageCategory=" + pImageCategory
				+ ", pFilename=" + pFilename + ", pFilerename=" + pFilerename + ", pFilepath=" + pFilepath
				+ ", perfumeDate=" + perfumeDate + ", perfumeStatus=" + perfumeStatus + "]";
	}
	
}