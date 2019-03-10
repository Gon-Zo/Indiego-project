package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.AbChoice;

public class AbChoiceDAOImpl implements AbChoiceDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int insert(AbChoice abChoice) {
		return session.insert("abchoices.insert",abChoice);
	}

	@Override
	public String selectedChoice(AbChoice abChoice) {
		return session.selectOne("abchoices.selectedChoice",abChoice);
	}

	@Override
	public int updateChoice(AbChoice abChoice) {
		return session.insert("abchoices.updateChoice",abChoice);
	}

	@Override
	public int selectCountA(int contentsNo) {
		return session.selectOne("abchoices.selectCountA",contentsNo);
	}

	@Override
	public int selectCountB(int contentsNo) {
		return session.selectOne("abchoices.selectCountB",contentsNo);
	}

}
