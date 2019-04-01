package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;

import com.jmt.indiego.vo.Genre;
import com.jmt.indiego.vo.ParentStep;
import com.jmt.indiego.vo.Project;
import com.jmt.indiego.vo.ProjectCheck;
import com.jmt.indiego.vo.Team;

public interface ProjectService {

	public Project getProject(int no);

	public List<Genre> getGenres();

	public List<Team> getTeam(int no);

	public List<ParentStep> getParentStep(int no);

	public List<ProjectCheck> getCheck(int no);

	public boolean modifyAttr(Project project);

	public boolean removeTeamUser(Team team);

	public boolean addParentStep(ParentStep parentStep);

	public Map<String, Object> mainProject();

	public List<Project> searchProject(String title);

	public Map<String, Object> latestPage(int pageNo);

	public Map<String, Object> popularPage(int pageNo);
}
