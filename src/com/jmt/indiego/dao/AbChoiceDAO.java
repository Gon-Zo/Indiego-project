package com.jmt.indiego.dao;

import com.jmt.indiego.vo.AbChoice;

public interface AbChoiceDAO {
	public int insert(AbChoice abChoice);

	public String selectedChoice(AbChoice abChoice);

	public int updateChoice(AbChoice abChoice);

	public int selectCountA(int contentsNo);

	public int selectCountB(int contentsNo);
}
