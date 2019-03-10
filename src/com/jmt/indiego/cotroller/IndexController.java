package com.jmt.indiego.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jmt.indiego.service.AbTestService;
import com.jmt.indiego.service.FreeService;
import com.jmt.indiego.service.GameService;
import com.jmt.indiego.service.ReplyService;

@Controller
public class IndexController {
	private GameService gameService;
	private FreeService freeService;
	private ReplyService replyService;
	private AbTestService abTestService;

	public void setGameService(GameService gameService) {
		this.gameService = gameService;
	}

	public void setFreeService(FreeService freeService) {
		this.freeService = freeService;
	}

	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}

	public void setAbTestService(AbTestService abTestService) {
		this.abTestService = abTestService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		System.out.println("GET : index");

		model.addAttribute("gamePopulars", gameService.popularGame());
		model.addAttribute("freeBests", freeService.bestFreeList());
		model.addAttribute("debateBsets", replyService.debateBestList());
		model.addAttribute("gameBests", gameService.bestGame());
		model.addAttribute("abTestBests", abTestService.bestABTest());

		return "index";
	}// index end
}
