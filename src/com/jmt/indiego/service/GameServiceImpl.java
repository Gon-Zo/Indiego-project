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
	private PaginateUtil paginateUtil;
	private TeamDAO teamDAO;
	private ImageDAO imageDAO;
	private ReviewDAO reviewDAO;
	private GameSpecDAO gameSpecDAO;
	private AttackDAO attackDAO;
	private QuestionDAO questionDAO;
	public ReplyDAO replyDAO;
	public LikeDAO likeDAO;

	public void setGameDAO(GameDAO gameDAO) {
		this.gameDAO = gameDAO;
	}

	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	public void setTeamDAO(TeamDAO teamDAO) {
		this.teamDAO = teamDAO;
	}

	public void setImageDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}

	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	public void setGameSpecDAO(GameSpecDAO gameSpecDAO) {
		this.gameSpecDAO = gameSpecDAO;
	}

	public void setAttackDAO(AttackDAO attackDAO) {
		this.attackDAO = attackDAO;
	}

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	public void setLikeDAO(LikeDAO likeDAO) {
		this.likeDAO = likeDAO;
	}

	/**
	 * @name popularGame \n
	 * @brief 인기순위 탑10 의 게임 리스트 출력 \n
	 * @return List<Game>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public List<Game> popularGame() {
		// TODO Auto-generated method stub
		return gameDAO.selectPopularGameList();
	}

	/**
	 * @name searchGame \n
	 * @brief 게임 페이지에서 검색 할시 자동완성 기능 함수 \n
	 * @param String title \n
	 * @return List<Game>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Game> search(String title) {
		title = "%" + title + "%";
		return gameDAO.selectSearch(title);
	}

	/**
	 * @name latestPage \n
	 * @brief 최근 순 정렬 게임 리스트 \n
	 * @param int pageNo \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
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

		return map;
	}

	/**
	 * @name popularPage \n
	 * @brief 인기 순 정렬 게임 리스트 \n
	 * @param int pageNo \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
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

	/**
	 * @name gameDeatil \n
	 * @brief 게임 상세 페이지로 이동 및 리스트 출력 하는 함수 \n
	 * @param int gameNo \n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public Map<String, Object> gameDeatil(int gameNo) {
		Map<String, Object> map = new ConcurrentHashMap<>();

		map.put("gameOne", gameDAO.selectOne(gameNo));
		map.put("imageList", imageDAO.selectList(gameNo));
		map.put("teamList", teamDAO.selecTeamList(gameNo));
		map.put("mainImage", imageDAO.selectOne(gameNo));
		map.put("gameSpecM", gameSpecDAO.selectOneM(gameNo));
		map.put("gameSpecB", gameSpecDAO.selectOneB(gameNo));
		map.put("inderReview", reviewDAO.selectAvg(gameNo));

		return map;
	}// gameDeatil end

	/**
	 * @name attackPage \n
	 * @brief 게임 상세 페이지에서 어텍탭에서 공략에 대한 리스트 출력 \n
	 * @param int pageNo \n
	 * @param int gameNol \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
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

	/**
	 * @name questionPage \n
	 * @brief 게임 상세 페이지에서 어텍탭에서 문의 대한 리스트 출력 \n
	 * @param int pageNo \n
	 * @param int gameNo \n
	 * @return Map<String, Object>\n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
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

	/**
	 * @name questionDetail \n
	 * @brief 문의 대한 리스트에서 클릭시 팝업 출력 되는 데이터를 불러준다,\n
	 * @param int no \n
	 * @return Question \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public Question questionDetail(int no) {
		return questionDAO.selectOne(no);
	}

	/**
	 * @name replyQuestion \n
	 * @brief 문의에 대한 댓글 리스트 출력\n
	 * @param Reply reply \n
	 * @return List<Reply> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public List<Reply> replyQuestion(Reply reply) {
		return replyDAO.selectRiply(reply);
	}

	/**
	 * @name writeQuestion \n
	 * @brief 문의에 작성 함수\n
	 * @param Question question \n
	 * @return int \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public int writeQuestion(Question question) {
		return questionDAO.insertQestion(question);
	}

	/**
	 * @name numAjax \n
	 * @brief 좋아요 수 와 다운로드 수 데이터를 불러오는 함수\n
	 * @param int gameNo \n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
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

	/**
	 * @name touchHeart \n
	 * @brief 버튼을 누를시 하트의 유무와 하트의 갯수를 높여주거나 낮춰준다.\n
	 * @param Like likes \n
	 * @return String \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	public int touchHeart(Like likes) {
		return likeDAO.selectGameHeart(likes) == true ? likeDAO.inesrtGameHeart(likes) : 0;
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
