package com.javachip.vo;

public class ProductVO {
	private int pNo;
	private String pType;
	private String pName;
	private int pPrice;
	private int pInput;
	private int pOutput;
	private int pStock;
	private String pDate;
	private String pNote;
	private String pDetail;
	
	@Override
	public String toString() {
		return "ProductVO [pNo=" + pNo + ", pType=" + pType + ", pName=" + pName + ", pPrice=" + pPrice + ", pInput="
				+ pInput + ", pOutput=" + pOutput + ", pStock=" + pStock + ", pDate=" + pDate + ", pNote=" + pNote
				+ ", pDetail=" + pDetail + "]";
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpType() {
		return pType;
	}
	public void setpType(String pType) {
		this.pType = pType;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpInput() {
		return pInput;
	}
	public void setpInput(int pInput) {
		this.pInput = pInput;
	}
	public int getpOutput() {
		return pOutput;
	}
	public void setpOutput(int pOutput) {
		this.pOutput = pOutput;
	}
	public int getpStock() {
		return pStock;
	}
	public void setpStock(int pStock) {
		this.pStock = pStock;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getpNote() {
		return pNote;
	}
	public void setpNote(String pNote) {
		this.pNote = pNote;
	}
	public String getpDetail() {
		return pDetail;
	}
	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}
}
