package com.jmt.indiego.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Idea {
	private int no, userNo, views;
	private String title, contents, type, fileName, nickname;
	private Timestamp regdate;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String changeDate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년MMMdd일");
		String change = form.format(regdate);
		return change;
	}

	public String typeReturn() {
		String typed = this.type;
		if (typed.equals("G")) {
			typed = "그래픽";
		} else if (typed.equals("S")) {
			typed = "스토리";
		} else if (typed.equals("C")) {
			typed = "캐릭터";
		} else if (typed.equals("M")) {
			typed = "음악";
		} else {
			typed = "기타";
		}
		return typed;
	}

}
