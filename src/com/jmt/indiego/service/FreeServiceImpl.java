package com.jmt.indiego.service;

import java.util.List;

import com.jmt.indiego.dao.FreeDAO;
import com.jmt.indiego.vo.Free;

public class FreeServiceImpl implements FreeService {

	private FreeDAO freeDAO;

	public void setFreeDAO(FreeDAO freeDAO) {
		this.freeDAO = freeDAO;
	}
}
