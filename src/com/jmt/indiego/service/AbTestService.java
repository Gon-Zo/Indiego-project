package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.jmt.indiego.vo.AbTest;

public interface AbTestService {

	public List<AbTest> bestABTest();

	public Map<String, Object> getAllAbTest(int pageNo);

	public boolean addAbTest(AbTest abTest);

	public Map<String, Object> mainABTest(HttpSession session);

	public Map<String, Object> detailABTest(int no, HttpSession session);
}
