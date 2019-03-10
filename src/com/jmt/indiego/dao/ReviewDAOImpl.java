package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.PageVO;
import com.jmt.indiego.vo.Review;

public class ReviewDAOImpl implements ReviewDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public Review selectAvg(int gameNo) {
		return session.selectOne("review.selectAvg", gameNo);
	}// selectAvg end
	
	@Override
	public List<Review> selectReviewProfile(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("review.selectReviewProfile",pageVO);
	}

	@Override
	public int selectReviewCount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("review.selectReviewCount",userNo);
	}
}
