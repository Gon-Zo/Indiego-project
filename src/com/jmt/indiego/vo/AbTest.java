package com.jmt.indiego.vo;

import java.sql.Date;
import java.time.LocalDateTime;

public class AbTest {
	private int no, userNo, r, voteNum;
	private String title, contentsA, contentsB, imageA, imageB, nickname;
	private Date term, regdate;

	public AbTest() {
		super();
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getVoteNum() {
		return voteNum;
	}

	public void setVoteNum(int voteNum) {
		this.voteNum = voteNum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentsA() {
		return contentsA;
	}

	public void setContentsA(String contentsA) {
		this.contentsA = contentsA;
	}

	public String getContentsB() {
		return contentsB;
	}

	public void setContentsB(String contentsB) {
		this.contentsB = contentsB;
	}

	public String getImageA() {
		return imageA;
	}

	public void setImageA(String imageA) {
		this.imageA = imageA;
	}

	public String getImageB() {
		return imageB;
	}

	public void setImageB(String imageB) {
		this.imageB = imageB;
	}

	public int getDDay() {

		LocalDateTime now = LocalDateTime.now();

		return 0;
	}

	public Date getTerm() {
		return term;
	}

	public void setTerm(Date term) {
		this.term = term;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
