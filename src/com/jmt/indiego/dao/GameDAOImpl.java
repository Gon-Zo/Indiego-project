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

	public List<Game> selectPopularGameList() {
		return session.selectList("game.selectPopularGameList");
	}// selectPopularGameList end

	public List<Game> selectBestGameList() {
		return session.selectList("game.selectBestGameList");
	}// selectBestGameList end

	public int selectTotal() {
		return session.selectOne("game.selectTotal");
	}// selectTotal end

	public List<Game> selectSearch(String title) {
		return session.selectList("game.selectSearch", title);
	}// selectSearch end

	public Game selectOne(int no) {
		return session.selectOne("game.selectOne", no);
	}// selectOne end

	@Override
	public List<Game> selectPopularPageList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("game.selectPageList", pageVO);
	}

	@Override
	public List<Game> selectPageList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("game.selectPopularPageList", pageVO);
	}

	@Override
	public int downloads(int gameNo) {
		return session.selectOne("game.selectDowns", gameNo);
	}

	@Override
	public int selectHeart(int gameNo) {
		// TODO Auto-generated method stub
		return session.selectOne("game.selectHeart", gameNo);
	}
	
	@Override
	public int insertGame(Game game) {
		return session.insert("game.insertGame",game);
	}
	
	@Override
	public List<Game> selectHerartList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("game.selectHerartList",pageVO);
	}

	@Override
	public int selectHeartCount(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("game.selectHeartCount",userNo);
	}
}
