package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.Reply;

public interface ReplyDAO {
	public List<Reply> replyListTopten();

	public List<Reply> selectRiply(Reply reply);
}
