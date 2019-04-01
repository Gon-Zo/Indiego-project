package com.jmt.indiego.vo;

import java.sql.Timestamp;

public class User {
	private int userNo;
	private String id, pwd, nickName, email, phoneNum, address1, address2, profileImg, userMode, careerV, portfolioV,
			addressV, phoneV;
	private Timestamp regdate;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getUserMode() {
		return userMode;
	}

	public void setUserMode(String userMode) {
		this.userMode = userMode;
	}

	public String getCareerV() {
		return careerV;
	}

	public void setCareerV(String careerV) {
		this.careerV = careerV;
	}

	public String getPortfolioV() {
		return portfolioV;
	}

	public void setPortfolioV(String portfolioV) {
		this.portfolioV = portfolioV;
	}

	public String getAddressV() {
		return addressV;
	}

	public void setAddressV(String addressV) {
		this.addressV = addressV;
	}

	public String getPhoneV() {
		return phoneV;
	}

	public void setPhoneV(String phoneV) {
		this.phoneV = phoneV;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
