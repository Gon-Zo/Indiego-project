package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.Free;
import com.jmt.indiego.vo.PageVO;

public interface FreeDAO {
	public List<Free> selectIndexFree();
	public List<Free> selectFreeProfile(PageVO pageVO ) ;
	
	public int selectFreeCount(int userNo);
}