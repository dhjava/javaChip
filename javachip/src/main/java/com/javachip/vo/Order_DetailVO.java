package com.javachip.vo;

public class Order_DetailVO {
	private int dNo;
	private int oNo;
	private int pNo;
	private int dCount;
	
	// 외래키 값
	private String pName;
	private String pPrice;
	
	@Override
	public String toString() {
		return "Order_DetailVO [dNo=" + dNo + ", oNo=" + oNo + ", pNo=" + pNo + ", dCount=" + dCount + ", pName="
				+ pName + ", pPrice=" + pPrice + "]";
	}
	
	public int getdNo() {
		return dNo;
	}
	public void setdNo(int dNo) {
		this.dNo = dNo;
	}
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getdCount() {
		return dCount;
	}
	public void setdCount(int dCount) {
		this.dCount = dCount;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
}
