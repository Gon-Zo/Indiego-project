package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.BuyList;
import com.jmt.indiego.vo.PageVO;

public interface BuyListDAO {

	public List<BuyList> selectBuyList(PageVO pageVO);

	public int selectBuyCount(int userNo);

}
