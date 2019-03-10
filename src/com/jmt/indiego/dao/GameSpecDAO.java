package com.jmt.indiego.dao;

import com.jmt.indiego.vo.GameSpec;

public interface GameSpecDAO {
	
	public GameSpec selectOneB(int no);

	public GameSpec selectOneM(int no);

	public int insertSpecM(GameSpec gameSpec);

	public int insertSpecB(GameSpec gameSpec);
	
}
