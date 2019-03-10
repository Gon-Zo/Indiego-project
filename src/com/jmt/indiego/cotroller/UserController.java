package com.jmt.indiego.cotroller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jmt.indiego.service.UsersService;
import com.jmt.indiego.util.FileRenameUtil;
import com.jmt.indiego.vo.Follow;
import com.jmt.indiego.vo.User;
import com.jmt.indiego.vo.UserBadge;

@Controller
public class UserController {
	private UsersService userService;
	private FileRenameUtil fileRenameUtil;

	public void setUserService(UsersService userService) {
		this.userService = userService;
	}
	
	public void setFileRenameUtil(FileRenameUtil fileRenameUtil) {
		this.fileRenameUtil = fileRenameUtil;
	}



	@RequestMapping(value="/session",method=RequestMethod.POST)
	public String login(@RequestHeader String referer,User user,HttpSession session) {
		
		
		session.setAttribute("loginUser", userService.login(user));
		
		System.out.println("POST /session");
		
	return "redirect:"+referer;
	
	}
	@RequestMapping(value="/session",method=RequestMethod.DELETE)
	public String logout(@RequestHeader String referer,HttpSession session) {
		
		session.invalidate();
		
		System.out.println("DELETE /session");
		
		
		return "redirect:"+referer;
	}
	
	@RequestMapping(value = "/profile/{no}", method = RequestMethod.GET)
	public String profilePage(Model model, @PathVariable int no, HttpSession session) {
		System.out.println("GET /profile");

		int loginNo = 0;

		User loginUser = (User) session.getAttribute("loginUser");

		if (loginUser != null) {
			loginNo = loginUser.getUserNo();
		}

		model.addAllAttributes(userService.getProfile(no, loginNo));
		return "profile";
	};
	// 매핑,메서드 풋

	@RequestMapping(value = "/profile/badge/change", method = RequestMethod.PUT)
	public String changeBadge(int no, int userNo) {
		System.out.println("PUT /badge/change");
		UserBadge userBadge = new UserBadge(no, userNo);
		boolean result = userService.changeBadge(userBadge);
		return "redirect:/profile/" + userNo;
	}

	@RequestMapping(value = "/profile/follow", method = RequestMethod.PUT)
	public String addFollow(int userNo, int loginNo) {
		System.out.println("PUT /profile/follow");
		Follow follow = new Follow(userNo, loginNo);
		boolean result = userService.addFollow(follow);
		return "redirect:/profile/" + userNo;
	}

	@RequestMapping(value = "profile/follow/cancle", method = RequestMethod.DELETE)
	public String cancelFollow(int userNo, int loginNo) {
		System.out.println("DELETE /profile/follow");
		Follow follow = new Follow(userNo, loginNo);
		boolean result = userService.cancelFollow(follow);
		return "redirect:/profile/" + userNo;
	}

	@RequestMapping(value = "/ajax/profile/attack/{pageNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getProfileAttack(@PathVariable int pageNo, int userNo) {
		return userService.getProfileAttack(pageNo, userNo);
	}

	@RequestMapping(value = "/ajax/profile/free/{pageNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getProfileFree(@PathVariable int pageNo, int userNo) {
		return userService.getProfileFree(pageNo, userNo);
	}

	@RequestMapping(value = "/ajax/profile/review/{pageNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getProfileReview(@PathVariable int pageNo, int userNo) {
		return userService.getProfileReview(pageNo, userNo);
	}

	@RequestMapping(value = "/ajax/profile/heartList/{pageNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getProfileHeartList(@PathVariable int pageNo, int userNo) {
		return userService.getProfileHeartList(pageNo, userNo);
	}

	@RequestMapping(value = "/ajax/profile/buyList/{pageNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getProfileBuyList(@PathVariable int pageNo, int userNo) {
		return userService.getProfileBuyList(pageNo, userNo);
	}
	
	
}
