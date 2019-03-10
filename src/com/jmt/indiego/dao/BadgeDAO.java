package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.Badge;

public interface BadgeDAO {
	public List<Badge> selectUserBadge(int userNo);

}
