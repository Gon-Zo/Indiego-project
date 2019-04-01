package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.UserBadge;

public class UserBadgeDAOImpl implements UserBadgeDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public UserBadge selectMainBadge(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("userBadge.selectMainBadge", userNo);
	}

	@Override
	public int updateMainBadge(UserBadge userBadge) {
		// TODO Auto-generated method stub
		return session.update("userBadge.updateMainBadge", userBadge);
	}
}
