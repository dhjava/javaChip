package com.javachip.vo;

public class QnaVO {
	private int qNo;
	private String qTitle;
	private String qContents;
	private int uNo;
	private String qDate;
	private String qType;
	private int pNo;
	
	private int qlevel;
	private int originqno;
	
	private String uName;
	
	// getter
	public int getqNo() {
		return qNo;
	}
	public String getqTitle() {
		return qTitle;
	}
	public String getqContents() {
		return qContents;
	}
	public int getuNo() {
		return uNo;
	}
	public String getqDate() {
		return qDate;
	}
	public String getqType() {
		return qType;
	}
	public int getpNo() {
		return pNo;
	}
	public int getQlevel() {
		return qlevel;
	}
	public int getOriginqno() {
		return originqno;
	}
	public String getuName() {
		return uName;
	}

	// setter
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public void setqContents(String qContents) {
		this.qContents = qContents;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public void setqDate(String qDate) {
		this.qDate = qDate;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public void setQlevel(int qlevel) {
		this.qlevel = qlevel;
	}
	public void setOriginqno(int originqno) {
		this.originqno = originqno;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	// toString
	@Override
	public String toString() {
		return "QnaVO [qNo=" + qNo + ", qTitle=" + qTitle + ", qContents=" + qContents + ", uNo=" + uNo + ", qDate="
				+ qDate + ", qType=" + qType + ", pNo=" + pNo + ", qlevel=" + qlevel + ", originqno=" + originqno
				+ ", uName=" + uName + "]";
	}
}
