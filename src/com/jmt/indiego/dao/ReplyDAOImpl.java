package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.Reply;
import java.util.List;

public class ReplyDAOImpl implements ReplyDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * @name replyListTopten \n
	 * @brief 리플순위 탑10 의 토론 리스트 출력 \n
	 * @return List<Free> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Reply> replyListTopten() {
		return session.selectList("reply.replyListTopten");
	}

	/**
	 * @name selectRiply \n
	 * @brief 문의에 대한 댓글 리스트 출력\n
	 * @param Reply reply \n
	 * @return List<Reply> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Reply> selectRiply(Reply reply) {
		return session.selectList("reply.selectRiply", reply);
	}
}
