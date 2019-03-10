package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.Attack;
import com.jmt.indiego.vo.PageVO;

public interface AttackDAO {
	public List<Attack> selectListPage(PageVO pageVO);

	public int selectAttackTotal(int no);
	
	public List<Attack> selectInderList(String nickName) ;
	
	public List<Attack> selectAttackList() ;
	public int selectAttackCount(int userNo) ;
	
	public List<Attack> selectProfileAttack(PageVO pageVO) ;

}
