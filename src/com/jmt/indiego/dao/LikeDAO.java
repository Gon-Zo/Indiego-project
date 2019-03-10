package com.jmt.indiego.dao;

import com.jmt.indiego.vo.Like;

public interface LikeDAO {
	public int inesrtGameHeart(Like likes);

	public boolean selectGameHeart(Like like);
}
