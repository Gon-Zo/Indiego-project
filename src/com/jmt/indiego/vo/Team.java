package com.jmt.indiego.vo;

import java.sql.Timestamp;

public class Team {

	private int no, projectNo, warnings, userNo;
	private String type, nickName, email, phoneNum, careerV, phoneV, portfolioV, profileImg;
	private Timestamp regdate;

	public Team() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getCareerV() {
		return careerV;
	}

	public void setCareerV(String careerV) {
		this.careerV = careerV;
	}

	public String getPhoneV() {
		return phoneV;
	}

	public void setPhoneV(String phoneV) {
		this.phoneV = phoneV;
	}

	public String getPortfolioV() {
		return portfolioV;
	}

	public void setPortfolioV(String portfolioV) {
		this.portfolioV = portfolioV;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public int getWarnings() {
		return warnings;
	}

	public void setWarnings(int warnings) {
		this.warnings = warnings;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	// ������
	private int warings;
	private String tCase;

	public int getWarings() {
		return warings;
	}

	public void setWarings(int warings) {
		this.warings = warings;
	}

	public String gettCase() {
		return tCase;
	}

	public void settCase(String tCase) {
		this.tCase = tCase;
	}

}
