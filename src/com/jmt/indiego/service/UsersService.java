package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;

import com.jmt.indiego.vo.Badge;
import com.jmt.indiego.vo.Follow;
import com.jmt.indiego.vo.Project;
import com.jmt.indiego.vo.User;
import com.jmt.indiego.vo.UserBadge;

public interface UsersService {

	public User login(User user);
	public boolean areYouCreator(int userNo);
	public Map getProfile(int userNo,int loginNo);
	public boolean changeBadge(UserBadge userBadge);
	public boolean addFollow(Follow follow);
	public boolean cancelFollow(Follow follow);
	public Map getProfileAttack(int pageNo,int userNo);
	public Map getProfileFree(int pageNo,int userNo);
	public Map getProfileReview(int pageNo,int userNo);
	public Map getProfileHeartList(int pageNo,int userNo);
	public Map getProfileBuyList(int pageNo,int userNo);
}
