package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.jmt.indiego.dao.GenreDAO;
import com.jmt.indiego.dao.ParentStepDAO;
import com.jmt.indiego.dao.ProjectCheckDAO;
import com.jmt.indiego.dao.ProjectDAO;
import com.jmt.indiego.dao.TeamDAO;
import com.jmt.indiego.util.PaginateUtil;
import com.jmt.indiego.vo.Genre;
import com.jmt.indiego.vo.ParentStep;
import com.jmt.indiego.vo.Project;
import com.jmt.indiego.vo.ProjectCheck;
import com.jmt.indiego.vo.Team;
import com.jmt.indiego.vo.PageVO;


public class ProjectServiceImpl implements ProjectService {

	private ProjectDAO projectDAO;
	private GenreDAO genreDAO;
	private TeamDAO teamDAO;
	private ParentStepDAO parentStepDAO;
	private ProjectCheckDAO projectCheckDAO;

	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	};

	public void setGenreDAO(GenreDAO genreDAO) {
		this.genreDAO = genreDAO;
	};

	public void setTeamDAO(TeamDAO teamDAO) {
		this.teamDAO = teamDAO;
	};

	public void setParentStepDAO(ParentStepDAO parentStepDAO) {
		this.parentStepDAO = parentStepDAO;
	};

	public void setProjectCheckDAO(ProjectCheckDAO projectCheckDAO) {
		this.projectCheckDAO = projectCheckDAO;
	};
	
	
	private PaginateUtil paginateUtil;

	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	@Override
	public Project getProject(int no) {

		return projectDAO.slelectOne(no);
	}

	@Override
	public List<Genre> getGenres() {
		// TODO Auto-generated method stub
		return genreDAO.selectList();
	}

	@Override
	public List<Team> getTeam(int no) {

		return teamDAO.selectList(no);
	}

	@Override
	public List<ParentStep> getParentStep(int no) {

		return parentStepDAO.selectList(no);
	}

	@Override
	public List<ProjectCheck> getCheck(int no) {
		// TODO Auto-generated method stub
		return projectCheckDAO.selectList(no);
	}

	@Override
	public boolean modifyAttr(Project project) {

		return 1 == projectDAO.updateAttr(project);
	}

	@Override
	public boolean removeTeamUser(Team team) {
		// TODO Auto-generated method stub
		return 1 == teamDAO.deleteTeamUser(team);
	}

	@Override
	public boolean addParentStep(ParentStep parentStep) {
		// TODO Auto-generated method stub
		return 1 == parentStepDAO.insertParentStep(parentStep);
	}

	// ������

	@Override
	public List<Project> hotProject() {
		// TODO Auto-generated method stub
		return projectDAO.selectHot();
	}

	@Override
	public List<Project> searchProject(String title) {
		// TODO Auto-generated method stub
		title = "%" + title + "%";
		return projectDAO.searchList(title);
	}

	@Override
	public Map<String, Object> latestPage(int pageNo) {
		Map<String, Object> map = new ConcurrentHashMap<>();
		int numPage = 15;
		PageVO pageVO = new PageVO(pageNo, numPage);
		List<Project> list = projectDAO.selectPageList(pageVO);
		int total = projectDAO.selectTotal();
		int numBlock = 5;

		String url = "/project/main/page/";
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);


		map.put("list", list);
		map.put("paginate", paginate);
		
		return map;
	}

	@Override
	public Map<String, Object> popularPage(int pageNo) {
		Map<String, Object> map = new ConcurrentHashMap<>();

		int numPage = 15;

		PageVO pageVO = new PageVO(pageNo, numPage);
		List<Project> list = projectDAO.selectPopularProject(pageVO);
		int total = projectDAO.selectTotal();
		int numBlock = 5;

		String url = "/project/main/page/";
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("list", list);
		map.put("paginate", paginate);

		return map;
	}

}
