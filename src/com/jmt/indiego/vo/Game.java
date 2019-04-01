package com.jmt.indiego.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class Game {
	private int no, price, likes, evaluation, downloads, count, userNo;
	private Integer salePrice;
	private String image, contents, fileName, system, gameTitle, genre;
	private Date releaseDate;
	private Timestamp regdate;
	private String gameName, title, projectImg;

	public int getUserNo() {
		return userNo;
	}

	public String getGameTitle() {
		return gameTitle;
	}

	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}

	public Integer getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Integer salePrice) {
		this.salePrice = salePrice;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProjectImg() {
		return projectImg;
	}

	public void setProjectImg(String projectImg) {
		this.projectImg = projectImg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {

		this.count = count;
	}

	public String getGameName() {
		return gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String changeEvaluation() {
		String test = "grin";
		if (this.evaluation >= 70) {
			test = "grin";
		} else {
			test = "meh";
		}
		return test;
	}// changeEvaluation end

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String chanageSystem() {
		String system = "PC";
		if (this.system.equals("M")) {
			system = "모바일";
		}
		return system;
	}

	public String chanageSystemIcon() {
		String system = "desktop";
		if (this.system.equals("M")) {
			system = "mobile-alt";
		}
		return system;
	}

	public String getSystem() {
		return system;
	}

	public void setSystem(String system) {
		this.system = system;
	}

	public Game() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String changePrice() {
		String price;
		if (this.price == 0) {
			price = "무료";
		} else {
			DecimalFormat chpr = new DecimalFormat("###,###,###,###");
			price = chpr.format(this.price);
		}
		return price;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getDownloads() {
		return downloads;
	}

	public void setDownloads(int downloads) {
		this.downloads = downloads;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}

	public String changeDate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년MMMdd일");
		String change = form.format(releaseDate);
		return change;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
