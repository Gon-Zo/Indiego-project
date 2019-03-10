package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Follow;

public class FollowDAOImpl implements FollowDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
}

	@Override
	public int selectFollower(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("follow.selectFollower",userNo);
	}

	@Override
	public int selectFollow(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("follow.selectFollow",userNo);
	}

	@Override
	public int selectOne(Follow follow) {
		// TODO Auto-generated method stub
		return session.selectOne("follow.selectOne",follow);
	}

	@Override
	public int insert(Follow follow) {
		// TODO Auto-generated method stub
		return session.insert("follow.insert",follow);
	}

	@Override
	public int delete(Follow follow) {
		// TODO Auto-generated method stub
		return session.delete("follow.delete",follow);
	}
}
