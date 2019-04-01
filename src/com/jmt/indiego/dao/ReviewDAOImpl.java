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

	/**
	 * @name selectAvg \n
	 * @brief 하나의 게임상세에서 보여주는 게임 평가 평균 데이터\n
	 * @param int gameNo \n
	 * @return Review \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public Review selectAvg(int gameNo) {
		return session.selectOne("review.selectAvg", gameNo);
	}// selectAvg end

	@Override
	public List<Review> selectReviewProfile(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("review.selectReviewProfile", pageVO);
	}

	@Override
	public int selectReviewCount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("review.selectReviewCount", userNo);
	}
}
