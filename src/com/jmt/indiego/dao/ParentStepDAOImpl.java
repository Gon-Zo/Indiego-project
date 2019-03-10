package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.ParentStep;

public class ParentStepDAOImpl implements ParentStepDAO {

	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
}
	@Override
	public List<ParentStep> selectList(int no) {
	
		return session.selectList("parentStep.selectList",no);
	}
	@Override
	public int insertParentStep(ParentStep parentStep) {
		// TODO Auto-generated method stub
		return session.insert("parentStep.insertParentStep", parentStep);
	}
}
