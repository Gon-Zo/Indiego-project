package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.GameSpec;

public class GameSpecDAOImpl implements GameSpecDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * @name selectOneB \n
	 * @brief 하나의 게임상세에서 보여주는 커퓨터 사양\n
	 * @param int no \n
	 * @return GameSpec \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public GameSpec selectOneB(int no) {
		return session.selectOne("gamespec.selectOneB", no);
	}// selectOneB end

	/**
	 * @name selectOneM \n
	 * @brief 하나의 게임상세에서 보여주는 모바일 사양\n
	 * @param int no \n
	 * @return GameSpec \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public GameSpec selectOneM(int no) {
		return session.selectOne("gamespec.selectOneM", no);
	}// selectOneM end

	@Override
	public int insertSpecM(GameSpec gameSpec) {
		return session.insert("gamespec.insertSpecM", gameSpec);
	}

	@Override
	public int insertSpecB(GameSpec gameSpec) {
		return session.insert("gamespec.insertSpecB", gameSpec);
	}
}
