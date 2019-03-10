package com.jmt.indiego.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jmt.indiego.vo.BuyList;
import com.jmt.indiego.vo.PageVO;

public class BuyListDAOImpl implements BuyListDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public int selectBuyCount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("buyList.selectBuyCount",userNo);
	}

	@Override
	public List<BuyList> selectBuyList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("buyList.selectBuyList",pageVO);
	}
}
