package com.jmt.indiego.cotroller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resources;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jmt.indiego.service.GameService;
import com.jmt.indiego.service.ProjectService;
import com.jmt.indiego.vo.Game;
import com.jmt.indiego.vo.GameSpec;
import com.jmt.indiego.vo.Like;
import com.jmt.indiego.vo.Question;
import com.jmt.indiego.vo.Reply;

@Controller
public class GameController {
	private GameService gameService;
	private ProjectService projectService;
	
	
	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

	public void setGameService(GameService gameService) {
		this.gameService = gameService;
	}// setGameService end

	@RequestMapping(value = "/game/main", method = RequestMethod.GET)
	public String gameMain(Model model) {
		System.out.println("GET : game main");
		model.addAttribute("gamePopulars", gameService.popularGame());
		return "gameMain";
	}// gameMain end

	@RequestMapping(value = "/ajax/game/search/title", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Game> searchGame(String title) {
		System.out.println("POST : search ajax game");
		return gameService.search(title);
	}

	@RequestMapping(value = "/ajax/game/latest/page/{pageNo}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> lastGameList(@PathVariable int pageNo) {
		System.out.println("POST : game pageList By last");
		return gameService.latestPage(pageNo);
	}

	@RequestMapping(value = "/ajax/game/popular/page/{pageNo}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> popularPage(@PathVariable int pageNo) {
		System.out.println("POST : game pageList By popular");
		return gameService.popularPage(pageNo);
	}

	@RequestMapping(value = "/game/{no}/detail", method = RequestMethod.GET)
	public String gameDetail(@PathVariable int no, Model model) {
		System.out.println("GET : game detail ::" + no);
		model.addAllAttributes(gameService.gameDeatil(no));
		return "gameDetail";
	}// gameDetail end

	@RequestMapping(value = "/ajax/attack/{pageNo}/list/{gameNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> attackList(@PathVariable int gameNo, @PathVariable int pageNo) {
		return gameService.attackPage(pageNo, gameNo);
	}// attackList end

	@RequestMapping(value = "/ajax/question/{pageNo}/list/{gameNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> questionList(@PathVariable int gameNo, @PathVariable int pageNo) {
		return gameService.questionPage(pageNo, gameNo);
	}// questionList end

	@RequestMapping(value = "/ajax/question/detail/{dataNo}", method = RequestMethod.POST)
	@ResponseBody
	public Question questionDetail(@PathVariable int dataNo) {
		return gameService.questionDetail(dataNo);
	}// questionList end

	@RequestMapping(value = "/ajax/question/detail/reply", method = RequestMethod.GET)
	@ResponseBody
	public List<Reply> questionReply(int contentsNo, int seqNo) {
		System.out.println("gameNo" + contentsNo + ":: listNo :: " + seqNo);
		Reply reply = new Reply();
		reply.setContentsNo(contentsNo);
		reply.setSeqNo(seqNo);
		/*
		 * System.out.println(reply.getContentsNo());
		 * System.out.println(reply.getSeqNo());
		 */
		return gameService.replyQuestion(reply);
	}// questionList end

	@RequestMapping(value = "/ajax/question/insert", method = RequestMethod.POST)
	@ResponseBody
	public int questionReply(Question question) {

		System.out.println(question.getTitle());
		System.out.println(question.getContents());
		System.out.println(question.getVisibility());
		System.out.println(question.getGameNo());
		System.out.println(question.getUserNo());

		return gameService.writeQuestion(question);
	}// questionList end

	@RequestMapping(value = "/ajax/heart/download/{gameNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> numAjax(@PathVariable int gameNo) {
		System.out.println("ajax : heartNum and DownloadsNum");
		return gameService.numAjext(gameNo);
	}// questionList end

	@RequestMapping(value = "/ajax/heart/insert/{contentsNo}/{userNo}", method = RequestMethod.GET)
	@ResponseBody
	public String insertHeart(Like likes) {
		System.out.println("ajax : insertHeart");
		return "{\"result\":" + gameService.touchHeart(likes) + "}";
	}// questionList end
	
	
	//°­ÅÂÈ£  
	
	@RequestMapping(value = "/project/{no}/upload", method = RequestMethod.GET)
	public String projectUpload(Model model, @PathVariable int no) {
		System.out.println("GET //project/"+no+"/upload");
		
		model.addAttribute("project",projectService.getProject(no));
		
		return "project_upload";
	}//project upload page end
	
	@RequestMapping(value="/gameSpec", method = RequestMethod.POST)
	public String GameSpecMInsert(@RequestHeader String referer, Game game, GameSpec gameSpec) {
		
		System.out.println("POST /gameSpec");
		
		gameService.upLoadGame(game);
		gameService.upLoadSpecM(gameSpec);
		gameService.upLoadSpecB(gameSpec);
		
		return "redirect:"+referer;
	}//game insert end
}
