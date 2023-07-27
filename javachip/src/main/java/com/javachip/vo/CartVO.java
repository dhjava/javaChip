package com.javachip.vo;

public class CartVO {
	private int cNo;
	private int pNo;
	private int uNo;
	private int cCount;
	
	@Override
	public String toString() {
		return "CartVO [cNo=" + cNo + ", pNo=" + pNo + ", uNo=" + uNo + ", cCount=" + cCount + "]";
	}
	
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getcCount() {
		return cCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
}
