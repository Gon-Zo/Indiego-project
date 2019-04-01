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

	/**
	 * @name selectListPage \n
	 * @brief 게임 상세 페이지에서 어텍탭에서 공략에 대한 리스트 출력 \n
	 * @param PageVO pageVO \n
	 * @return List<Attack> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Attack> selectListPage(PageVO pageVO) {
		return session.selectList("attack.selectListPage", pageVO);
	} // selectListPage end

	/**
	 * @name selectAttackTotal \n
	 * @brief 게임 상세 페이지에서 어텍탭에서 공략에 대한 리스트 전체 갯수 \n
	 * @param int no \n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public int selectAttackTotal(int no) {
		return session.selectOne("attack.selectAttackTotal", no);
	} // selectAttackTotal end

	@Override
	public List<Attack> selectInderList(String nickName) {
		// TODO Auto-generated method stub
		return session.selectList("attack.selectInderList", nickName);
	}

	@Override
	public List<Attack> selectAttackList() {
		// TODO Auto-generated method stub
		return session.selectList("attack.selectAttackList");
	}

	@Override
	public int selectAttackCount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("attack.selectAttackCount", userNo);
	}

	@Override
	public List<Attack> selectProfileAttack(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("attack.selectProfileAttack", pageVO);
	}
}
