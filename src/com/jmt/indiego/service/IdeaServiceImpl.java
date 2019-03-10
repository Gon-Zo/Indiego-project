package com.jmt.indiego.service;

import java.util.List;

import com.jmt.indiego.dao.IdeaDAO;
import com.jmt.indiego.vo.Idea;

public class IdeaServiceImpl implements IdeaService {
	private IdeaDAO ideaDAO;

	public void setIdeaDAO(IdeaDAO ideaDAO) {
		this.ideaDAO = ideaDAO;
	}

	@Override
	public List<Idea> bestTenIdea() {
		// TODO Auto-generated method stub
		return ideaDAO.selctBestTenIdea();
	}

}
