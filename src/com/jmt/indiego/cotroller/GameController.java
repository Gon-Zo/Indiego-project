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

	/**
	 * @name gameMain \n
	 * @brief 게임 메인 페이지로 이동 및 게임 인기순 탑10출력 \n
	 * @param Model model \n
	 * @return String \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/game/main", method = RequestMethod.GET)
	public String gameMain(Model model) {
		model.addAttribute("gamePopulars", gameService.popularGame());
		return "gameMain";
	}// gameMain end

	/**
	 * @name searchGame \n
	 * @brief 게임 페이지에서 검색 할시 자동완성 기능 함수 \n
	 * @param String title \n
	 * @return List<Game>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/game/search/title", method = RequestMethod.POST)
	@ResponseBody
	public List<Game> searchGame(String title) {
		return gameService.search(title);
	}

	/**
	 * @name lastGameList \n
	 * @brief 최근 순 정렬 게임 리스트 \n
	 * @param int pageNo \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/game/latest/page/{pageNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> lastGameList(@PathVariable int pageNo) {
		return gameService.latestPage(pageNo);
	}

	/**
	 * @name popularPage \n
	 * @brief 인기 순 정렬 게임 리스트 \n
	 * @param int pageNo \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/game/popular/page/{pageNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> popularPage(@PathVariable int pageNo) {
		System.out.println("POST : game pageList By popular");
		return gameService.popularPage(pageNo);
	}

	/**
	 * @name gameDetail \n
	 * @brief 게임 상세 페이지로 이동 및 리스트 출력 하는 함수 \n
	 * @param       int no \n
	 * @param Model model \n
	 * @return String\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/game/{no}/detail", method = RequestMethod.GET)
	public String gameDetail(@PathVariable int no, Model model) {
		model.addAllAttributes(gameService.gameDeatil(no));
		return "gameDetail";
	}// gameDetail end

	/**
	 * @name attackList \n
	 * @brief 게임 상세 페이지에서 어텍탭에서 공략에 대한 리스트 출력 \n
	 * @param int pageNo \n
	 * @param int gameNo \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/attack/{pageNo}/list/{gameNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> attackList(@PathVariable int gameNo, @PathVariable int pageNo) {
		return gameService.attackPage(pageNo, gameNo);
	}// attackList end

	/**
	 * @name questionList \n
	 * @brief 게임 상세 페이지에서 어텍탭에서 문의 대한 리스트 출력 \n
	 * @param int pageNo \n
	 * @param int gameNo \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/question/{pageNo}/list/{gameNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> questionList(@PathVariable int gameNo, @PathVariable int pageNo) {
		return gameService.questionPage(pageNo, gameNo);
	}// questionList end

	/**
	 * @name questionDetail \n
	 * @brief 문의 대한 리스트에서 클릭시 팝업 출력 되는 데이터를 불러준다,\n
	 * @param int dataNo \n
	 * @return Question \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/question/detail/{dataNo}", method = RequestMethod.POST)
	@ResponseBody
	public Question questionDetail(@PathVariable int dataNo) {
		return gameService.questionDetail(dataNo);
	}// questionList end

	/**
	 * @name questionReply \n
	 * @brief 문의에 대한 댓글 리스트 출력\n
	 * @param Reply reply \n
	 * @return List<Reply> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/question/detail/reply", method = RequestMethod.GET)
	@ResponseBody
	public List<Reply> questionReply(Reply reply) {
		return gameService.replyQuestion(reply);
	}// questionList end

	/**
	 * @name questionReply \n
	 * @brief 문의에 작성 함수\n
	 * @param Question question \n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/question/insert", method = RequestMethod.POST)
	@ResponseBody
	public int questionReply(Question question) {
		return gameService.writeQuestion(question);
	}// questionList end

	/**
	 * @name numAjax \n
	 * @brief 좋아요 수 와 다운로드 수 데이터를 불러오는 함수\n
	 * @param int gameNo \n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/heart/download/{gameNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> numAjax(@PathVariable int gameNo) {
		return gameService.numAjext(gameNo);
	}// questionList end
	
	/**
	 * @name insertHeart \n
	 * @brief 버튼을 누를시 하트의 유무와 하트의 갯수를 높여주거나 낮춰준다.\n
	 * @param Like likes \n
	 * @return String \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = "/ajax/heart/insert/{contentsNo}/{userNo}", method = RequestMethod.GET)
	@ResponseBody
	public String insertHeart(Like likes) {
		return "{\"result\":" + gameService.touchHeart(likes) + "}";
	}// questionList end

	// ����ȣ

	@RequestMapping(value = "/project/{no}/upload", method = RequestMethod.GET)
	public String projectUpload(Model model, @PathVariable int no) {
		System.out.println("GET //project/" + no + "/upload");
		model.addAttribute("project", projectService.getProject(no));
		return "project_upload";
	}// project upload page end

	@RequestMapping(value = "/gameSpec", method = RequestMethod.POST)
	public String GameSpecMInsert(@RequestHeader String referer, Game game, GameSpec gameSpec) {

		System.out.println("POST /gameSpec");

		gameService.upLoadGame(game);
		gameService.upLoadSpecM(gameSpec);
		gameService.upLoadSpecB(gameSpec);

		return "redirect:" + referer;
	}// game insert end
}
