package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.ProjectCheck;

public interface ProjectCheckDAO {
	public List<ProjectCheck> selectList(int no);
}
