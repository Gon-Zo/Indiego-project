package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;

import com.jmt.indiego.vo.AbTest;

public interface AbTestService {

	public List<AbTest> bestABTest();
	public Map<String, Object> getAllAbTest(int pageNo);
	public boolean addAbTest(AbTest abTest);
	public AbTest showOne(int no);
	public boolean finishedAbTest(int no);
	public List<AbTest> showOnGoingEvent();
	public List<AbTest> showNearClosing();
	public List<AbTest> showMyAbTest(int userNo);
	public List<AbTest> showIVoted(int userNo);
}
