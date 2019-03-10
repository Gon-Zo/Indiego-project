package com.jmt.indiego.dao;

import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.PageVO;
import com.jmt.indiego.vo.Question;
import java.util.List;

public class QuestionDAOImpl implements QuestionDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	public List<Question> selectListPage(PageVO pageVO) {
		return session.selectList("question.selectListPage", pageVO);
	} // selectListPage end

	public int selectQuestionTotal(int no) {
		return session.selectOne("question.selectQuestionTotal", no);
	} // selectQuestionTotal end

	public Question selectOne(int no) {
		return session.selectOne("question.selectOne", no);
	} // selectOne end

	public int insertQestion(Question question) {
		return session.insert("question.insertQestion", question);
	} // selectOne end

	public int deletList(int no) {
		return session.insert("question.deletList", no);
	} // selectOne end
}
