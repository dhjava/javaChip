package com.javachip.vo;

public class NoticeVO {
	private int nNo;
	private int uNo;			// FK
	private String nTitle;
	private String nContents;
	private String nDate;
	
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
	
	// toString
	@Override
	public String toString() {
		return "NoticeVO [nNo=" + nNo + ", uNo=" + uNo + ", nTitle=" + nTitle + ", nContents=" + nContents + ", nDate="
				+ nDate + "]";
	}
	
	
}
