package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Team;

public class TeamDAOImpl implements TeamDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Team> selectList(int no) {

		return session.selectList("team.selectList", no);
	}

	@Override
	public int deleteTeamUser(Team team) {

		return session.delete("team.deleteTeamUser", team);
	}

	/**
	 * @name selecTeamList \n
	 * @brief 하나의 게임상세에서 프로젝트 팀 리스트 출력하는 함수\n
	 * @param int no \n
	 * @return List<Team> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Team> selecTeamList(int no) {
		return session.selectList("team.selectGameList", no);
	}
}
