package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.Reply;
import java.util.List;

public class ReplyDAOImpl implements ReplyDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<Reply> replyListTopten() {
		return session.selectList("reply.replyListTopten");
	}

	public List<Reply> selectRiply(Reply reply) {
		return session.selectList("reply.selectRiply", reply);
	}
}
