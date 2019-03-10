package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.ParentStep;

public interface ParentStepDAO {

	public List<ParentStep> selectList(int no);
	
	public int insertParentStep(ParentStep parentStep);
}
