package com.javachip.vo;

//어드민 페이징
public class AdminCriteria 
{
	
	private int page;    //페이지번호를 담는 변수
	
	private int perPageNum;  //글목록갯수
	
	private int sNum;    // 쿼리 시작 번호
	
	// 생성자가 생성될때 멤버변수 초기화 값을 넣는다
	public AdminCriteria() 
	{
		this.page = 1;
		this.perPageNum =10;
	}
	
	public int getsNum() 
	{
		return sNum;
	}

	public void setsNum(int sNum) 
	{
		this.sNum = sNum;
	}

		
	public int getPage() 
	{
		return page;
	}

	public void setPage(int page) 
	{
		this.page = page;
	}

	public int getPerPageNum() 
	{
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) 
	{
		this.perPageNum = perPageNum;
	}
}
