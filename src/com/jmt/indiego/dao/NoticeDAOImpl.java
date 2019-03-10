package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;

public class NoticeDAOImpl implements NoticeDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
}
	
}
