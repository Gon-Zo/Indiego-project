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

	/**
	 * @name selectPageList \n
	 * @brief 프로젝트 메인페이지에서 최신순 정렬을 보여주는 함수\n
	 * @param PageVO pageVO \n
	 * @return List<Project> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Project> selectPageList(PageVO pageVO) {
		return session.selectList("project.selectProject", pageVO);
	}// selectPageList end

	/**
	 * @name selectPopularProject \n
	 * @brief 프로젝트 메인페이지에서 인기순 정렬을 보여주는 함수\n
	 * @param PageVO pageVO \n
	 * @return List<Project> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Project> selectPopularProject(PageVO pageVO) {
		return session.selectList("project.selectPopularProject", pageVO);
	}// selectPopularProject end

	/**
	 * @name selectHot \n
	 * @brief 프로젝트에서 좋아요순으로 탑10 리스트 출력\n
	 * @return List<Project>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Project> selectHot() {
		return session.selectList("project.selectHot");
	}// selectHot end

	/**
	 * @name selectTotal \n
	 * @brief 프로젝트 리스트의 총 갯수\n
	 * @return List<Project>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public int selectTotal() {
		return session.selectOne("project.selectTotal");
	}// selectTotal end

	/**
	 * @name searchList \n
	 * @brief 프로젝트 메인페이지에서 자동완성를 보여주는 함수\n
	 * @param String title \n
	 * @return List<Project> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Project> searchList(String title) {
		title = "%" + title + "%";
		return session.selectList("project.searchList", title);
	}// selectHot end}
}