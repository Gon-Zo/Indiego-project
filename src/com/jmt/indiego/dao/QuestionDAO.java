package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.PageVO;
import com.jmt.indiego.vo.Question;

public interface QuestionDAO {
	public List<Question> selectListPage(PageVO pageVO);

	public int selectQuestionTotal(int no);

	public Question selectOne(int no);

	public int insertQestion(Question question);

	public int deletList(int no);
}
