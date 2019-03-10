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

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	};

	// ������
	private IdeaService ideaService;

	public void setIdeaService(IdeaService ideaService) {
		this.ideaService = ideaService;
	}

	@RequestMapping(value = "/ajax/project/title", method = RequestMethod.POST)
	@ResponseBody
	public String projectTitleUpdate(Project project) {

		System.out.println(project.getNo());
		System.out.println(project.getTitle());
		System.out.println(project.getGameTitle());
		System.out.println(project.getVisibility());
		System.out.println(project.getMaxPersonnel());
		System.out.println(project.getStartDate());
		System.out.println(project.getEndDate());
		System.out.println(project.getSystem());
		System.out.println(project.getGenreNo());

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

	// ������
	@RequestMapping(value = "/project/main", method = RequestMethod.GET)
	public String projectMain(Model model) {
		System.out.println("GET : project main");
		model.addAttribute("hotProjects", projectService.hotProject());
		model.addAttribute("ideaTens", ideaService.bestTenIdea());
		return "projectMain";
	}// projectMain end

	@RequestMapping(value = "/ajax/project/search/title", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Project> searchProject(String title) {
		System.out.println("POST : search project");
		return projectService.searchProject(title);
	}// searchProject end

	@RequestMapping(value = "/ajax/project/latest/page/{pageNo}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> lastGameList(@PathVariable int pageNo) {
		System.out.println("POST : project pageList By last");
		return projectService.latestPage(pageNo);
	}// lastGameList end

	@RequestMapping(value = "/ajax/project/popular/page/{pageNo}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> popularPage(@PathVariable int pageNo) {
		System.out.println("POST : project pageList By popular");
		return projectService.popularPage(pageNo);
	}// popularPage end
}
