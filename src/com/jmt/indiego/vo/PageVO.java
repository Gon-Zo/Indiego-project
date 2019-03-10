package com.jmt.indiego.vo;

public class PageVO {

	private int start, end,typeNo,userNo;

	public PageVO() {
		// TODO Auto-generated constructor stub
	}

	public PageVO(int page, int numPage) {
		end = page * numPage;
		start = end - (numPage - 1);
	}

	public PageVO(int page, int numPage, int gameNo) {
		end = page * numPage;
		start = end - (numPage - 1);
		this.gameNo = gameNo;
	}
	
	public PageVO(int page, int numPage, int userNo,int x) {
		super();
		this.userNo = userNo;

		end = page*numPage;
		start = end-(numPage-1);
	}

	
	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	// ������
	private int gameNo;

	public int getGameNo() {
		return gameNo;
	}

	public void setGameNo(int gameNo) {
		this.gameNo = gameNo;
	}
}
