package com.javachip.vo;

public class NoticeVO {
	private int nNo;
	private int uNo;			// FK
	private String nTitle;
	private String nContents;
	private String nDate;
	private String delYN;
	
	private String uName;
	
	// getter
	public int getnNo() {
		return nNo;
	}
	public int getuNo() {
		return uNo;
	}
	public String getnTitle() {
		return nTitle;
	}
	public String getnContents() {
		return nContents;
	}
	public String getnDate() {
		return nDate;
	}
	// getter 추가
	public String getuName() {
		return uName;
	}
	public String getDelYN() {
		return delYN;
	}
	// setter
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public void setnContents(String nContents) {
		this.nContents = nContents;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	// setter 추가
	public void setuName(String uName) {
		this.uName = uName;
	}

	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}
	// toString
	@Override
	public String toString() {
		return "NoticeVO [nNo=" + nNo + ", uNo=" + uNo + ", nTitle=" + nTitle + ", nContents=" + nContents + ", nDate="
				+ nDate + ", uName=" + uName + "]";
	}
	
}
