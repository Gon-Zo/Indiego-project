package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Badge;

public class BadgeDAOImpl implements BadgeDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Badge> selectUserBadge(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("badge.selectUserBadge", userNo);
	}
}
