package com.jmt.indiego.dao;

import com.jmt.indiego.vo.Follow;

public interface FollowDAO {

	public int selectFollower(int userNo) ;
	
	public int selectFollow(int userNo) ;
	public int selectOne(Follow follow);
	public int insert(Follow follow) ;
	public int delete(Follow follow) ;
}
