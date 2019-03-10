package com.jmt.indiego.vo;

import java.sql.Date;

public class Follow {
	int no, followNo, userNo;
	Date regdate;

	public Follow() {
	}

	//userNo가 followNo 를 팔로우
	public Follow(int followNo, int userNo) {
		super();
		this.followNo = followNo;
		this.userNo = userNo;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFollowNo() {
		return followNo;
	}

	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
