package com.jmt.indiego.service;

import java.util.List;

import com.jmt.indiego.dao.ReplyDAO;
import com.jmt.indiego.vo.Reply;

public class ReplyServiceImpl implements ReplyService {
	
	private ReplyDAO replyDAO;

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	@Override
	public List<Reply> debateBestList() {
		// TODO Auto-generated method stub
		return replyDAO.replyListTopten();
	}
}
