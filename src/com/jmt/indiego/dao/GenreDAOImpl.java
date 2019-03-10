package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Genre;

public class GenreDAOImpl implements GenreDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
}
	
	@Override
	public List<Genre> selectList() {
	
		return session.selectList("genre.selectList");
	}
}
