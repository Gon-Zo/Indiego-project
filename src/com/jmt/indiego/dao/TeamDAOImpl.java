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

//¹ÚÁ¤±Ô
	public List<Team> selecTeamList(int no) {
		return session.selectList("team.selectGameList", no);
	}
}
