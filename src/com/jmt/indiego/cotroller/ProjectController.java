package com.jmt.indiego.cotroller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jmt.indiego.service.IdeaService;
import com.jmt.indiego.service.ProjectService;
import com.jmt.indiego.vo.ParentStep;
import com.jmt.indiego.vo.Project;
import com.jmt.indiego.vo.Team;

@Controller
public class ProjectController {

	private ProjectService projectService;
	private IdeaService ideaService;

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	};

	// ������

	public void setIdeaService(IdeaService ideaService) {
		this.ideaService = ideaService;
	}

	@RequestMapping(value = "/ajax/project/title", method = RequestMethod.POST)
	@ResponseBody
	public String projectTitleUpdate(Project project) {
		projectService.modifyAttr(project);
		return "{\"result\":true}";
	}

	@RequestMapping(value = "/project/{no}", method = RequestMethod.GET)
	public String projectPage(Model model, @PathVariable int no, ParentStep parentStep) {

		System.out.println("GET /project");

		model.addAttribute("project", projectService.getProject(no));

		model.addAttribute("genres", projectService.getGenres());

		model.addAttribute("projectTeam", projectService.getTeam(no));

		model.addAttribute("parentSteps", projectService.getParentStep(no));

		model.addAttribute("projectCheck", projectService.getCheck(no));

		return "project_page";
	}

	@RequestMapping(value = "/ajax/project/{no}/roadmap/", method = RequestMethod.GET)
	@ResponseBody
	public List<ParentStep> getParentSteps(@PathVariable int no) {

		return projectService.getParentStep(no);
	}

	@RequestMapping(value = "/project/{projectNo}/insertStep", method = RequestMethod.PUT)
	public String addParentStep(ParentStep parentStep, @PathVariable int projectNo) {

		projectService.addParentStep(parentStep);

		return "redirect:/project/{projectNo}";
	}

	@RequestMapping(value = "/project/{projectNo}/{userNo}/deleteTeamUser", method = RequestMethod.DELETE)
	public String projectTeamDelete(Team team, @PathVariable int projectNo, @PathVariable int userNo) {

		projectService.removeTeamUser(team);

		return "redirect:/project/{projectNo}";
	}

	/**
	 * @name projectMain \n
	 * @brief 프로젝트 메인페이지로 가는 함수\n
	 * @return String \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/project/main", method = RequestMethod.GET)
	public String projectMain() {
		return "projectMain";
	}// projectMain end

	/**
	 * @name projectMainList \n
	 * @brief 프로젝트 메인페이지에 보여줄 리스트 출력 함수\n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/project/main", method = RequestMethod.GET)
	public Map<String, Object> projectMainList() {
		return projectService.mainProject();
	}// projectMain end

	/**
	 * @name searchProject \n
	 * @brief 프로젝트 메인페이지에서 자동완성를 보여주는 함수\n
	 * @param String title \n
	 * @return List<Project> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/project/search/title", method = RequestMethod.POST)
	@ResponseBody
	public List<Project> searchProject(String title) {
		return projectService.searchProject(title);
	}// searchProject end

	/**
	 * @name lastProjectList \n
	 * @brief 프로젝트 메인페이지에서 최신순 정렬을 보여주는 함수\n
	 * @param int pageNo \n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/project/latest/page/{pageNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> lastProjectList(@PathVariable int pageNo) {
		return projectService.latestPage(pageNo);
	}// lastGameList end

	/**
	 * @name popularPage \n
	 * @brief 프로젝트 메인페이지에서 인기순 정렬을 보여주는 함수\n
	 * @param int pageNo \n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/project/popular/page/{pageNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> popularPage(@PathVariable int pageNo) {
		return projectService.popularPage(pageNo);
	}// popularPage end
}
