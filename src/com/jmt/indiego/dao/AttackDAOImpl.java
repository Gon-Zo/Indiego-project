package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Attack;
import com.jmt.indiego.vo.PageVO;

public class AttackDAOImpl implements AttackDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<Attack> selectListPage(PageVO pageVO) {
		return session.selectList("attack.selectListPage", pageVO);
	} // selectListPage end

	public int selectAttackTotal(int no) {
		return session.selectOne("attack.selectAttackTotal", no);
	} // selectAttackTotal end
	
	@Override
	public List<Attack> selectInderList(String nickName) {
		// TODO Auto-generated method stub
		return session.selectList("attack.selectInderList",nickName);
	}

	@Override
	public List<Attack> selectAttackList() {
		// TODO Auto-generated method stub
		return session.selectList("attack.selectAttackList");
	}

	@Override
	public int selectAttackCount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("attack.selectAttackCount",userNo);
	}

	@Override
	public List<Attack> selectProfileAttack(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("attack.selectProfileAttack",pageVO);
	}
}
