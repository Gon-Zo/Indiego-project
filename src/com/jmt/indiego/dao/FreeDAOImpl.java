package com.jmt.indiego.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.Free;
import com.jmt.indiego.vo.PageVO;

public class FreeDAOImpl implements FreeDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * @name selectIndexFree \n
	 * @brief 인기순위 탑10 의 자유게시판 리스트 출력 \n
	 * @return List<Free> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Free> selectIndexFree() {
		return session.selectList("free.selectIndexFree");
	}// selectIndexFree end

	@Override
	public List<Free> selectFreeProfile(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("free.selectFreeProfile", pageVO);
	}

	@Override
	public int selectFreeCount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("free.selectFreeCount", userNo);
	}
}
