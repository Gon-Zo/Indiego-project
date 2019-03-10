package com.jmt.indiego.dao;

import com.jmt.indiego.vo.Review;

import java.util.List;

import com.jmt.indiego.vo.PageVO;

public interface ReviewDAO {

	public Review selectAvg(int gameNo);

	public List<Review> selectReviewProfile(PageVO pageVO);

	public int selectReviewCount(int userNo);
}
