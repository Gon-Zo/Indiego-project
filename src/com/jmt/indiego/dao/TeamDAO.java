package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.Team;

public interface TeamDAO {

	public List<Team> selectList(int no);

	public int deleteTeamUser(Team team);

	public List<Team> selecTeamList(int no);
}
