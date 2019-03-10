package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.jmt.indiego.dao.AbTestDAO;
import com.jmt.indiego.util.PaginateUtil;
import com.jmt.indiego.vo.AbTest;
import com.jmt.indiego.vo.PageVO;

public class AbTestServiceImpl implements AbTestService {
	private AbTestDAO abTestDAO;
	private PaginateUtil paginateUtil;
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	public void setAbTestDAO(AbTestDAO abTestDAO) {
		this.abTestDAO = abTestDAO;
	}
	
	@Override
	public List<AbTest> bestABTest() {
		// TODO Auto-generated method stub
		return abTestDAO.selectBestList();
	}
	

	@Override
	public boolean addAbTest(AbTest abTest) {
		return 1==abTestDAO.insert(abTest);
	}

	@Override
	public AbTest showOne(int no) {
		return abTestDAO.selectOne(no);
	}

	@Override
	public Map<String, Object> getAllAbTest(int pageNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<>();
		
		int numPage = 10;
		int numBlock = 5;
		
		PageVO pageVO = new PageVO(pageNo,numPage);
		List<AbTest> list = abTestDAO.selectList(pageVO);
		
		int total = abTestDAO.selectTotal();
		
		String url = "/abTest/main/page/";
		
		String paginate= paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		map.put("list", list);
		map.put("paginate", paginate);
		
		return map;
	}

	@Override
	public boolean finishedAbTest(int no) {
		return 1==abTestDAO.selectFinished(no);
	}

	@Override
	public List<AbTest> showOnGoingEvent() {
		return abTestDAO.selectOnGoing();
	}

	@Override
	public List<AbTest> showNearClosing() {
		return abTestDAO.selectNearClosing();
	}

	@Override
	public List<AbTest> showMyAbTest(int userNo) {
		return abTestDAO.selectMyAbTest(userNo);
	}

	@Override
	public List<AbTest> showIVoted(int userNo) {
		return abTestDAO.selectIVoed(userNo);
	}
	
	
}
