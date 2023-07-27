package com.javachip.vo;

public class Order_VO {
	private int oNo;
	private int uNo;
	private int cNo;
	private String oName;
	private String oAdd;
	private String oPhone;
	private int oTrackNo;
	private int oTotalPrice;
	private String oPay;
	private String oStatus;
	
	@Override
	public String toString() {
		return "Order_VO [oNo=" + oNo + ", uNo=" + uNo + ", cNo=" + cNo + ", oName=" + oName + ", oAdd=" + oAdd
				+ ", oPhone=" + oPhone + ", oTrackNo=" + oTrackNo + ", oTotalPrice=" + oTotalPrice + ", oPay=" + oPay
				+ ", oStatus=" + oStatus + "]";
	}
	
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getoAdd() {
		return oAdd;
	}
	public void setoAdd(String oAdd) {
		this.oAdd = oAdd;
	}
	public String getoPhone() {
		return oPhone;
	}
	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}
	public int getoTrackNo() {
		return oTrackNo;
	}
	public void setoTrackNo(int oTrackNo) {
		this.oTrackNo = oTrackNo;
	}
	public int getoTotalPrice() {
		return oTotalPrice;
	}
	public void setoTotalPrice(int oTotalPrice) {
		this.oTotalPrice = oTotalPrice;
	}
	public String getoPay() {
		return oPay;
	}
	public void setoPay(String oPay) {
		this.oPay = oPay;
	}
	public String getoStatus() {
		return oStatus;
	}
	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}
}
