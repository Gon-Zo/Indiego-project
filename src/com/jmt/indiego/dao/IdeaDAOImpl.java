package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.Idea;

public class IdeaDAOImpl implements IdeaDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * @name selctBestTenIdea \n
	 * @brief 프로젝트 메인페이지에 아이디어 탑10리스트 출력\n
	 * @return List<Idea> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Idea> selctBestTenIdea() {
		return session.selectList("idea.selctBestTenIdea");
	}
}