package com.javachip.vo;

public class UserVO {
	private int uNo;
	private String uId;
	private String uPw;
	private String uName;
	private String uJoin;
	private String uRetire;
	private String uPhone;
	private String uStatus;
	private String uBisno;
	private String uAdd;
	private String uMail;
	private int uAlertNum;
	public int getuNo() {
		return uNo;
	}
	public String getuId() {
		return uId;
	}
	public String getuPw() {
		return uPw;
	}
	public String getuName() {
		return uName;
	}
	public String getuJoin() {
		return uJoin;
	}
	public String getuRetire() {
		return uRetire;
	}
	public String getuPhone() {
		return uPhone;
	}
	public String getuStatus() {
		return uStatus;
	}
	public String getuBisno() {
		return uBisno;
	}
	public String getuAdd() {
		return uAdd;
	}
	public String getuMail() {
		return uMail;
	}
	public int getuAlertNum() {
		return uAlertNum;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public void setuJoin(String uJoin) {
		this.uJoin = uJoin;
	}
	public void setuRetire(String uRetire) {
		this.uRetire = uRetire;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}
	public void setuBisno(String uBisno) {
		this.uBisno = uBisno;
	}
	public void setuAdd(String uAdd) {
		this.uAdd = uAdd;
	}
	public void setuMail(String uMail) {
		this.uMail = uMail;
	}
	public void setuAlertNum(int uAlertNum) {
		this.uAlertNum = uAlertNum;
	}
	@Override
	public String toString() {
		return "UserVO [uNo=" + uNo + ", uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uJoin=" + uJoin
				+ ", uRetire=" + uRetire + ", uPhone=" + uPhone + ", uStatus=" + uStatus + ", uBisno=" + uBisno
				+ ", uAdd=" + uAdd + ", uMail=" + uMail + ", uAlertNum=" + uAlertNum + "]";
	}
	
	
}
