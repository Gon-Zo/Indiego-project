package com.jmt.indiego.dao;

import com.jmt.indiego.vo.User;

public interface UsersDAO {

	public User selectLogin(User user); 
	
	public int selectCreator(int userNo);
	public User selectProfileOne(int userNo);
	public int updateProfile(User user);

}
