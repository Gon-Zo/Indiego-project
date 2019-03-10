package com.jmt.indiego.vo;


import java.sql.Date;

public class UserBadge {
	
	private int no,badgeNo,userNo,mainNo;
	private String image;
	private Date regdate;
	public UserBadge() {
		super();
	}

	
	public UserBadge(int mainNo, int userNo) {
		super();
		this.mainNo = mainNo;
		this.userNo = userNo;
	}


	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBadgeNo() {
		return badgeNo;
	}
	public void setBadgeNo(int badgeNo) {
		this.badgeNo = badgeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getMainNo() {
		return mainNo;
	}
	public void setMainNo(int mainNo) {
		this.mainNo = mainNo;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
