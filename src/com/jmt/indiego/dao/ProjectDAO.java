package com.jmt.indiego.dao;

import java.util.Map;

import com.jmt.indiego.vo.PageVO;
import com.jmt.indiego.vo.Project;
import java.util.List;

public interface ProjectDAO {

	public Project slelectOne(int no);

	public int updateAttr(Project project);

	// ¹ÚÁ¤±Ô
	public List<Project> selectPageList(PageVO pageVO);

	public List<Project> selectPopularProject(PageVO pageVO);

	public List<Project> selectHot();

	public int selectTotal();

	public List<Project> searchList(String title);
}
