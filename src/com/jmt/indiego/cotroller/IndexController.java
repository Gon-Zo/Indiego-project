package com.jmt.indiego.cotroller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jmt.indiego.service.AbTestService;
import com.jmt.indiego.service.FreeService;
import com.jmt.indiego.service.GameService;
import com.jmt.indiego.service.ReplyService;
import com.jmt.indiego.service.UsersService;

@Controller
public class IndexController {

	private UsersService usersService;

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	/**
	 * @name index \n
	 * @brief 인덱스 페이지 페이지 이동 \n
	 * @return String \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = { "/", "index" }, method = RequestMethod.GET)
	public String index() {
		return "index";
	}// index end

	/**
	 * @name indexList \n
	 * @brief 인덱스 페이지에 보여줄 리스트 출력 \n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@RequestMapping(value = { "/", "index" }, method = RequestMethod.GET)
	public Map<String, Object> indexList() {
		return usersService.indexList();
	}// indexList end

}
