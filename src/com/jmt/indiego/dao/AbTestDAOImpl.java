package com.jmt.indiego.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.AbTest;
import com.jmt.indiego.vo.PageVO;

public class AbTestDAOImpl implements AbTestDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<AbTest> selectBestList() {
		return session.selectList("abtest.selectBsetList");
	}// selectBestList end
	

	@Override
	public int insert(AbTest abTest) {
		return session.insert("abtest.insert",abTest);
	}

	@Override
	public AbTest selectOne(int no) {
		return session.selectOne("abtest.selectOne",no);
	}

	@Override
	public List<AbTest> selectList(PageVO pageVO) {
		return session.selectList("abtest.selectList",pageVO);
	}

	@Override
	public int selectTotal() {
		return session.selectOne("abtest.selectTotal");
	}

	@Override
	public int selectFinished(int no) {
		return session.selectOne("abtest.selectFinished",no);
	}

	@Override
	public List<AbTest> selectOnGoing() {
		return session.selectList("abtest.selectOnGoing");
	}

	@Override
	public List<AbTest> selectNearClosing() {
		return session.selectList("abtest.selectNearClosing");
	}

	@Override
	public List<AbTest> selectMyAbTest(int userNo) {
		return session.selectList("abtest.selectMyAbTest",userNo);
	}

	@Override
	public List<AbTest> selectIVoed(int userNo) {
		return session.selectList("abtest.selectIVoed",userNo);
	}

}
