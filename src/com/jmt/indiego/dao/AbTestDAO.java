package com.jmt.indiego.dao;

import java.util.List;
import com.jmt.indiego.vo.AbTest;
import com.jmt.indiego.vo.PageVO;

public interface AbTestDAO {

	public List<AbTest> selectBestList();
	public List<AbTest> selectList(PageVO pageVO);
	public int insert(AbTest abTest);
	public AbTest selectOne(int no);
	public int selectTotal();
	public int selectFinished(int no);
	public List<AbTest> selectOnGoing();
	public List<AbTest> selectNearClosing();
	public List<AbTest> selectMyAbTest(int userNo);
	public List<AbTest> selectIVoed(int userNo);
}
