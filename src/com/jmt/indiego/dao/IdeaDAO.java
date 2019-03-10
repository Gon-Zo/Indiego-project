package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.Idea;

public interface IdeaDAO {
	public List<Idea> selctBestTenIdea();
}
