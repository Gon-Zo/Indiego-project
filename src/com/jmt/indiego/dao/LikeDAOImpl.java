package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.Like;

public class LikeDAOImpl implements LikeDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public int inesrtGameHeart(Like likes) {
		return session.insert("likes.inesrtGameHeart", likes);
	}

	@Override
	public boolean selectGameHeart(Like like) {
		// TODO Auto-generated method stub
		Like selectL = session.selectOne("likes.selectLikes", like);
		boolean flag = selectL == null;

		return flag;
		// return session.selectOne("likes.selectLikes", like);
	}
}
