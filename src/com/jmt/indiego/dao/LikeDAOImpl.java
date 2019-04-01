package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Like;

public class LikeDAOImpl implements LikeDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * @name inesrtGameHeart \n
	 * @brief 좋아요 테이블에 넣어준다.\n
	 * @param Like likes \n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public int inesrtGameHeart(Like likes) {
		return session.insert("likes.inesrtGameHeart", likes);
	}

	/**
	 * @name selectGameHeart \n
	 * @brief 좋아요 유무를 파악하는 함수\n
	 * @param Like likes \n
	 * @return boolean \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public boolean selectGameHeart(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectLikes", like) == null ? true : false;
		// return session.selectOne("likes.selectLikes", like);
	}
}
