package com.jmt.indiego.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.jmt.indiego.vo.Game;
import com.jmt.indiego.vo.PageVO;

public class GameDAOImpl implements GameDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/**
	 * @name selectPopularGameList \n
	 * @brief 인기순위 탑10 의 게임 리스트 출력 \n
	 * @return List<Game>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Game> selectPopularGameList() {
		return session.selectList("game.selectPopularGameList");
	}// selectPopularGameList end

	/**
	 * @name selectBestGameList \n
	 * @brief 최근 순 정렬 게임 리스트 \n
	 * @return List<Game>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Game> selectBestGameList() {
		return session.selectList("game.selectBestGameList");
	}// selectBestGameList end

	/**
	 * @name selectBestGameList \n
	 * @brief 게임 리스트 의 갯수 값 출력 함수 \n
	 * @return int\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public int selectTotal() {
		return session.selectOne("game.selectTotal");
	}// selectTotal end

	/**
	 * @name selectSearch \n
	 * @brief 게임 페이지에서 검색 할시 자동완성 기능 함수 \n
	 * @param String title \n
	 * @return List<Game>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Game> selectSearch(String title) {
		return session.selectList("game.selectSearch", title);
	}// selectSearch end

	/**
	 * @name selectOne \n
	 * @brief 하나의 게임상세에서 보여주는 데이터를 출력하는 함수\n
	 * @param int no \n
	 * @return Game \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public Game selectOne(int no) {
		return session.selectOne("game.selectOne", no);
	}// selectOne end

	/**
	 * @name selectPopularPageList \n
	 * @brief 인기 순 정렬 게임 리스트 \n
	 * @param PageVO pageVO \n
	 * @return List<Game>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public List<Game> selectPopularPageList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("game.selectPageList", pageVO);
	}

	/**
	 * @name latestPage \n
	 * @brief 최근 순 정렬 게임 리스트 \n
	 * @param PageVO pageVO \n
	 * @return List<Game>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public List<Game> selectPageList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("game.selectPopularPageList", pageVO);
	}

	/**
	 * @name downloads \n
	 * @brief 다운로드 수 데이터를 불러오는 함수\n
	 * @param int gameNo \n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public int downloads(int gameNo) {
		return session.selectOne("game.selectDowns", gameNo);
	}

	/**
	 * @name selectHeart \n
	 * @brief 좋아요 수 데이터를 불러오는 함수\n
	 * @param int gameNo \n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public int selectHeart(int gameNo) {
		// TODO Auto-generated method stub
		return session.selectOne("game.selectHeart", gameNo);
	}

	@Override
	public int insertGame(Game game) {
		return session.insert("game.insertGame", game);
	}

	@Override
	public List<Game> selectHerartList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("game.selectHerartList", pageVO);
	}

	@Override
	public int selectHeartCount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("game.selectHeartCount", userNo);
	}
}
