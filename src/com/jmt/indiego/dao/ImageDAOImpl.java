package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.Image;

public class ImageDAOImpl implements ImageDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<Image> selectList(int no) {
		return session.selectList("image.selectList", no);
	}// selectList end

	public Image selectOne(int no) {
		return session.selectOne("image.selectOne", no);
	}// selectOne end
	
	@Override
	public int insertGameImage(Image image) {
		return session.insert("image.insertGameImage",image);
	}
}
