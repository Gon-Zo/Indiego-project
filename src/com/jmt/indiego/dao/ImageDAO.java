package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.Image;

public interface ImageDAO {
	public List<Image> selectList(int no);

	public Image selectOne(int no);

	public int insertGameImage(Image image);
}
