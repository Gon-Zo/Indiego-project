package com.jmt.indiego.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.jmt.indiego.dao.AttackDAO;
import com.jmt.indiego.dao.GameDAO;
import com.jmt.indiego.dao.GameSpecDAO;
import com.jmt.indiego.dao.ImageDAO;
import com.jmt.indiego.dao.LikeDAO;
import com.jmt.indiego.dao.QuestionDAO;
import com.jmt.indiego.dao.ReplyDAO;
import com.jmt.indiego.dao.ReviewDAO;
import com.jmt.indiego.dao.TeamDAO;
import com.jmt.indiego.util.PaginateUtil;
import com.jmt.indiego.vo.Attack;
import com.jmt.indiego.vo.Game;
import com.jmt.indiego.vo.GameSpec;
import com.jmt.indiego.vo.Image;
import com.jmt.indiego.vo.Like;
import com.jmt.indiego.vo.PageVO;
import com.jmt.indiego.vo.Question;
import com.jmt.indiego.vo.Reply;

public class GameServiceImpl implements GameService {

	private GameDAO gameDAO;

	public void setGameDAO(GameDAO gameDAO) {
		this.gameDAO = gameDAO;
	}

	private PaginateUtil paginateUtil;

	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	private TeamDAO teamDAO;

	public void setTeamDAO(TeamDAO teamDAO) {
		this.teamDAO = teamDAO;
	}

	private ImageDAO imageDAO;

	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	private ReviewDAO reviewDAO;

	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	private GameSpecDAO gameSpecDAO;

	public void setGameSpecDAO(GameSpecDAO gameSpecDAO) {
		this.gameSpecDAO = gameSpecDAO;
	}

	private AttackDAO attackDAO;

	public void setAttackDAO(AttackDAO attackDAO) {
		this.attackDAO = attackDAO;
	}

	private QuestionDAO questionDAO;

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	public ReplyDAO replyDAO;

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	public LikeDAO likeDAO;

	public void setLikeDAO(LikeDAO likeDAO) {
		this.likeDAO = likeDAO;
	}

//	method
	@Override
	public List<Game> popularGame() {
		// TODO Auto-generated method stub
		return gameDAO.selectPopularGameList();
	}

	@Override
	public List<Game> bestGame() {
		// TODO Auto-generated method stub
		return gameDAO.selectBestGameList();
	}

	public List<Game> search(String title) {
		title = "%" + title + "%";
		return gameDAO.selectSearch(title);
	}

	@Override
	public Map<String, Object> latestPage(int pageNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();

		int numPage = 15;

		PageVO pageVO = new PageVO(pageNo, numPage);
		List<Game> list = gameDAO.selectPageList(pageVO);
		int total = gameDAO.selectTotal();
		int numBlock = 5;

		String url = "/game/main/page/";
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("list", list);
		map.put("paginate", paginate);
		System.out.println("GsecondeTest"+list.toString());
		
		return map;
	}

	@Override
	public Map<String, Object> popularPage(int pageNo) {
		Map<String, Object> map = new ConcurrentHashMap<>();

		int numPage = 15;

		PageVO pageVO = new PageVO(pageNo, numPage);
		List<Game> list = gameDAO.selectPopularPageList(pageVO);
		int total = gameDAO.selectTotal();
		int numBlock = 5;

		String url = "/game/main/page/";
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("list", list);
		map.put("paginate", paginate);

		return map;
	}// popularPage end

	public Map<String, Object> gameDeatil(int gameNo) {
		Map<String, Object> map = new ConcurrentHashMap<>();

		map.put("gameOne", gameDAO.selectOne(gameNo));
	/*	map.put("imageList", imageDAO.selectList(gameNo));
		
		map.put("teamList", teamDAO.selecTeamList(gameNo));
		map.put("mainImage", imageDAO.selectOne(gameNo));
		map.put("gameSpecM", gameSpecDAO.selectOneM(gameNo));
		map.put("gameSpecB", gameSpecDAO.selectOneB(gameNo));
		if (reviewDAO.selectAvg(gameNo) != null) {
			map.put("inderReview", reviewDAO.selectAvg(gameNo));
		}
		if(reviewDAO.selectAvg(gameNo)!=null) {
			map.put("inderReview", reviewDAO.selectAvg(gameNo));
		}*/
		return map;
	}// gameDeatil end

	@Override
	public Map<String, Object> attackPage(int pageNo, int gameNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();

		int numPage = 4;

		PageVO pageVO = new PageVO(pageNo, numPage, gameNo);
		List<Attack> list = attackDAO.selectListPage(pageVO);
		int total = attackDAO.selectAttackTotal(gameNo);
		int numBlock = 5;

		String url = "/ajax/attack/" + pageNo + "/list/" + gameNo;
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("list", list);
		map.put("paginate", paginate);

		return map;
	}// attackPage end

	@Override
	public Map<String, Object> questionPage(int pageNo, int gameNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();

		int numPage = 10;

		PageVO pageVO = new PageVO(pageNo, numPage, gameNo);
		List<Question> list = questionDAO.selectListPage(pageVO);
		int total = questionDAO.selectQuestionTotal(gameNo);
		int numBlock = 5;

		String url = "/ajax/question/" + pageNo + "/list/" + gameNo;
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("list", list);
		map.put("paginate", paginate);

		return map;
	}// attackPage end

	public Question questionDetail(int no) {
		return questionDAO.selectOne(no);
	}

	public List<Reply> replyQuestion(Reply reply) {

		return replyDAO.selectRiply(reply);
	}

	public int writeQuestion(Question question) {

		return questionDAO.insertQestion(question);
	}

	@Override
	public Map<String, Object> numAjext(int gameNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();

		map.put("heartNums", gameDAO.selectHeart(gameNo));
		map.put("downNums", gameDAO.downloads(gameNo));

		return map;
	}
	
	public boolean selectGameHeart(Like likes) {
		return likeDAO.selectGameHeart(likes);
	}

	public int touchHeart(Like likes) {
		int result = 0;
		if(likeDAO.selectGameHeart(likes)) {
			result = likeDAO.inesrtGameHeart(likes);
		}
		System.out.println("touchHeart Result" + result);
		return result;
	}
	
	@Override
	public int upLoadGame(Game game) {
		return gameDAO.insertGame(game);
	}

	@Override
	public int upLoadSpecM(GameSpec gameSpec) {
		return gameSpecDAO.insertSpecM(gameSpec);
	}

	@Override
	public int upLoadSpecB(GameSpec gameSpec) {
		return gameSpecDAO.insertSpecB(gameSpec);
	}

	@Override
	public int upLoadImage(Image image) {
		return imageDAO.insertGameImage(image);
	}
	
	
}
