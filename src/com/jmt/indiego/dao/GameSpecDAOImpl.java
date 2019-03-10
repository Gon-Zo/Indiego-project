package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.GameSpec;

public class GameSpecDAOImpl implements GameSpecDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public GameSpec selectOneB(int no) {
		return session.selectOne("gamespec.selectOneB", no);
	}// selectOneB end

	public GameSpec selectOneM(int no) {
		return session.selectOne("gamespec.selectOneM", no);
	}// selectOneM end
	
	@Override
	public int insertSpecM(GameSpec gameSpec) {
		return session.insert("gamespec.insertSpecM",gameSpec);
	}

	@Override
	public int insertSpecB(GameSpec gameSpec) {
		return session.insert("gamespec.insertSpecB",gameSpec);
	}
}
