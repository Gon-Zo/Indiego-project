package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Image;

public class ImageDAOImpl implements ImageDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * @name selectList \n
	 * @brief 하나의 게임상세에서 보여주는 이미지 리스트\n
	 * @param int no \n
	 * @return List<Image> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Image> selectList(int no) {
		return session.selectList("image.selectList", no);
	}// selectList end

	/**
	 * @name selectOne \n
	 * @brief 하나의 게임상세에서 보여주는 대표 이미지\n
	 * @param int no \n
	 * @return Image \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public Image selectOne(int no) {
		return session.selectOne("image.selectOne", no);
	}// selectOne end

	@Override
	public int insertGameImage(Image image) {
		return session.insert("image.insertGameImage", image);
	}
}
