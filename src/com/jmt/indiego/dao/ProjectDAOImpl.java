package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;
import java.util.List;
import com.jmt.indiego.vo.Project;
import com.jmt.indiego.vo.PageVO;

public class ProjectDAOImpl implements ProjectDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public Project slelectOne(int no) {

		return session.selectOne("project.selectOne", no);
	}

	@Override
	public int updateAttr(Project project) {

		return session.update("project.updateAttr", project);
	}

	public List<Project> selectPageList(PageVO pageVO) {
		return session.selectList("project.selectProject", pageVO);
	}// selectPageList end

	public List<Project> selectPopularProject(PageVO pageVO) {
		return session.selectList("project.selectPopularProject", pageVO);
	}// selectPopularProject end

	public List<Project> selectHot() {
		return session.selectList("project.selectHot");
	}// selectHot end

	public int selectTotal() {
		return session.selectOne("project.selectTotal");
	}// selectTotal end

	public List<Project> searchList(String title) {
		return session.selectList("project.searchList", title);
	}// selectHot end}
}