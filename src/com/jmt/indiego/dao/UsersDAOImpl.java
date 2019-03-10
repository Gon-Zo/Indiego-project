package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.User;

public class UsersDAOImpl implements UsersDAO {

	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
}
	
	@Override
	public User selectLogin(User user) {
		
		return session.selectOne("users.selectLogin",user);
	}

	@Override
	public int selectCreator(int userNo) {
		return session.selectOne("users.selectUserMode",userNo);
	}

	@Override
	public User selectProfileOne(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("users.selectProfileOne",userNo);
	}

	@Override
	public int updateProfile(User user) {
		// TODO Auto-generated method stub
		return session.update("users.updateProfileImage",user);
	}
}
