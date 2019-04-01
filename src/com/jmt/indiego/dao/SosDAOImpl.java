package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;

public class SosDAOImpl implements SosDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
}
