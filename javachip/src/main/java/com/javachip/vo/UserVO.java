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
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuJoin() {
		return uJoin;
	}
	public void setuJoin(String uJoin) {
		this.uJoin = uJoin;
	}
	public String getuRetire() {
		return uRetire;
	}
	public void setuRetire(String uRetire) {
		this.uRetire = uRetire;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuStatus() {
		return uStatus;
	}
	public void setuStatus(String uStatus) {
		this.uStatus = uStatus;
	}
	public String getuBisno() {
		return uBisno;
	}
	public void setuBisno(String uBisno) {
		this.uBisno = uBisno;
	}
	public String getuAdd() {
		return uAdd;
	}
	public void setuAdd(String uAdd) {
		this.uAdd = uAdd;
	}
	@Override
	public String toString() {
		return "MemberVO [uNo=" + uNo + ", uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uJoin=" + uJoin
				+ ", uRetire=" + uRetire + ", uPhone=" + uPhone + ", uStatus=" + uStatus + ", uBisno=" + uBisno
				+ ", uAdd=" + uAdd + "]";
	}
	
	
}
