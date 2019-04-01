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

	/**
	 * @name selectListPage \n
	 * @brief 게임 상세 페이지에서 어텍탭에서 문의 대한 리스트 출력 \n
	 * @param PageVO pageVO \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Question> selectListPage(PageVO pageVO) {
		return session.selectList("question.selectListPage", pageVO);
	} // selectListPage end

	/**
	 * @name selectQuestionTotal \n
	 * @brief 게임 상세 페이지에서 어텍탭에서 문의 대한 리스트 전체 갯수 출력 \n
	 * @param int no \n
	 * @return int\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public int selectQuestionTotal(int no) {
		return session.selectOne("question.selectQuestionTotal", no);
	} // selectQuestionTotal end

	/**
	 * @name selectOne \n
	 * @brief 문의 대한 리스트에서 클릭시 팝업 출력 되는 데이터를 불러준다,\n
	 * @param int no \n
	 * @return Question \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public Question selectOne(int no) {
		return session.selectOne("question.selectOne", no);
	} // selectOne end

	/**
	 * @name insertQestion \n
	 * @brief 문의에 작성 함수\n
	 * @param Question question \n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public int insertQestion(Question question) {
		return session.insert("question.insertQestion", question);
	} // selectOne end

	public int deletList(int no) {
		return session.insert("question.deletList", no);
	} // selectOne end
}
