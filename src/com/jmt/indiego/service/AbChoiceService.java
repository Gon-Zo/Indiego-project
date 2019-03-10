package com.jmt.indiego.service;

import com.jmt.indiego.vo.AbChoice;

public interface AbChoiceService {
	public int addChoice(AbChoice abChoice);
	public String chosen(AbChoice abChoice);
	public boolean editChoice(AbChoice abChoice);
	public int resultA(int contentsNo);
	public int resultB(int contentsNo);
}
