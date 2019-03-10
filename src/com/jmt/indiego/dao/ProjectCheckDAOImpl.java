package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.ProjectCheck;

public class ProjectCheckDAOImpl implements ProjectCheckDAO{

	
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
}
	
	@Override
	public List<ProjectCheck> selectList(int no) {
		// TODO Auto-generated method stub
		return session.selectList("projectcheck.selectList",no);
	}
}
