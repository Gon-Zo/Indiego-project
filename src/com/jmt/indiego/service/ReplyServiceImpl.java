package com.jmt.indiego.service;

import java.util.List;

import com.jmt.indiego.dao.ReplyDAO;

public class ReplyServiceImpl implements ReplyService {

	private ReplyDAO replyDAO;

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

}
