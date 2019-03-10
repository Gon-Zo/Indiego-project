package com.jmt.indiego.dao;

import com.jmt.indiego.vo.UserBadge;

public interface UserBadgeDAO {
	public UserBadge selectMainBadge(int userNo);
	public int updateMainBadge(UserBadge userBadge);

}
