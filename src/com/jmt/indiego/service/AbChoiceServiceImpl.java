package com.jmt.indiego.service;

import com.jmt.indiego.dao.AbChoiceDAO;
import com.jmt.indiego.vo.AbChoice;

public class AbChoiceServiceImpl implements AbChoiceService {

	private AbChoiceDAO abChoiceDAO;

	public void setAbChoiceDAO(AbChoiceDAO abChoiceDAO) {
		this.abChoiceDAO = abChoiceDAO;
	}

	@Override
	public int addChoice(AbChoice abChoice) {
		return abChoiceDAO.insert(abChoice);
	}

	@Override
	public boolean editChoice(AbChoice abChoice) {
		return 1 == abChoiceDAO.updateChoice(abChoice);
	}

}
