package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import com.jmt.indiego.dao.AbChoiceDAO;
import com.jmt.indiego.dao.AbTestDAO;
import com.jmt.indiego.util.PaginateUtil;
import com.jmt.indiego.vo.AbChoice;
import com.jmt.indiego.vo.AbTest;
import com.jmt.indiego.vo.PageVO;
import com.jmt.indiego.vo.User;

public class AbTestServiceImpl implements AbTestService {
	private AbTestDAO abTestDAO;
	private PaginateUtil paginateUtil;
	private AbChoiceDAO abChoiceDAO;

	public void setAbChoiceDAO(AbChoiceDAO abChoiceDAO) {
		this.abChoiceDAO = abChoiceDAO;
	}

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
		return 1 == abTestDAO.insert(abTest);
	}

	@Override
	public Map<String, Object> getAllAbTest(int pageNo) {

		Map<String, Object> map = new ConcurrentHashMap<>();

		int numPage = 10;
		int numBlock = 5;

		PageVO pageVO = new PageVO(pageNo, numPage);
		List<AbTest> list = abTestDAO.selectList(pageVO);

		int total = abTestDAO.selectTotal();

		String url = "/abTest/main/page/";

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("list", list);
		map.put("paginate", paginate);

		return map;
	}

	@Override
	public Map<String, Object> mainABTest(HttpSession session) {
		Map<String, Object> map = new ConcurrentHashMap<>();
		map.put("nearClosing", abTestDAO.selectNearClosing());
		map.put("onGoing", abTestDAO.selectOnGoing());
		User user = (User) session.getAttribute("loginUser");
		if (user != null) {
			map.put("iVoted", abTestDAO.selectIVoed(user.getUserNo()));
			map.put("myAbTest", abTestDAO.selectIVoed(user.getUserNo()));
		}
		return map;
	}

	@Override
	public Map<String, Object> detailABTest(int no, HttpSession session) {
		Map<String, Object> map = new ConcurrentHashMap<>();
		map.put("abTestResult", abTestDAO.selectOne(no));
		String flag = "C";
		User user = (User) session.getAttribute("loginUser");
		if (user != null) {
			flag = abChoiceDAO.selectedChoice(new AbChoice(user.getUserNo(), no));
		} // if end
		map.put("chosen", flag);
		map.put("resultA", abChoiceDAO.selectCountA(no));
		map.put("resultB", abChoiceDAO.selectCountB(no));
		map.put("finished", abTestDAO.selectFinished(no) == 1 ? true : false);
		return map;
	}

}
