package com.jmt.indiego.dao;

import java.util.List;

import com.jmt.indiego.vo.Game;
import com.jmt.indiego.vo.PageVO;

public interface GameDAO {
	public List<Game> selectPopularGameList();

	public List<Game> selectBestGameList();

	public int selectTotal();

	public List<Game> selectSearch(String title);

	public Game selectOne(int no);

	public List<Game> selectPopularPageList(PageVO pageVO);

	public List<Game> selectPageList(PageVO pageVO);

	public int downloads(int gameNo);

	public int selectHeart(int gameNo);

	public int insertGame(Game game);

	public List<Game> selectHerartList(PageVO pageVO);

	public int selectHeartCount(int userNo);

}
