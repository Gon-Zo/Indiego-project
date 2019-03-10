package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Idea;

public class IdeaDAOImpl implements IdeaDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<Idea> selctBestTenIdea() {
		return session.selectList("idea.selctBestTenIdea");
	}
}