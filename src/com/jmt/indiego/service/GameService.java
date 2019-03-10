package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;

import com.jmt.indiego.vo.Game;
import com.jmt.indiego.vo.GameSpec;
import com.jmt.indiego.vo.Image;
import com.jmt.indiego.vo.Like;
import com.jmt.indiego.vo.Question;
import com.jmt.indiego.vo.Reply;

public interface GameService {
	public List<Game> popularGame();

	public List<Game> bestGame();

	public List<Game> search(String title);

	public Map<String, Object> popularPage(int no);

	public Map<String, Object> latestPage(int no);

	public Map<String, Object> gameDeatil(int gameNo);

	public Map<String, Object> attackPage(int pageNo, int gameNo);

	public Map<String, Object> questionPage(int pageNo, int gameNo);

	public Question questionDetail(int no);

	public List<Reply> replyQuestion(Reply reply);

	public int writeQuestion(Question question);

	public Map<String, Object> numAjext(int gameNo);

	public int touchHeart(Like likes);
	
	public boolean selectGameHeart(Like likes);
	
	public int upLoadGame(Game game);

	public int upLoadSpecM(GameSpec gameSpec);
	
	public int upLoadSpecB(GameSpec gameSpec);
	
	public int upLoadImage(Image image);
}// GameService end
