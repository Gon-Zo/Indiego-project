package com.jmt.indiego.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import com.jmt.indiego.dao.AbTestDAO;
import com.jmt.indiego.dao.AttackDAO;
import com.jmt.indiego.dao.BadgeDAO;
import com.jmt.indiego.dao.BuyListDAO;
import com.jmt.indiego.dao.FollowDAO;
import com.jmt.indiego.dao.FreeDAO;
import com.jmt.indiego.dao.GameDAO;
import com.jmt.indiego.dao.ReplyDAO;
import com.jmt.indiego.dao.ReviewDAO;
import com.jmt.indiego.dao.UserBadgeDAO;
import com.jmt.indiego.dao.UsersDAO;
import com.jmt.indiego.util.PaginateUtil;
import com.jmt.indiego.vo.Attack;
import com.jmt.indiego.vo.Badge;
import com.jmt.indiego.vo.BuyList;
import com.jmt.indiego.vo.Follow;
import com.jmt.indiego.vo.Free;
import com.jmt.indiego.vo.Game;
import com.jmt.indiego.vo.PageVO;
import com.jmt.indiego.vo.Review;
import com.jmt.indiego.vo.User;
import com.jmt.indiego.vo.UserBadge;

public class UsersServiceImpl implements UsersService {

	private UsersDAO userDAO;
	private UserBadgeDAO userBadgeDAO;
	private BadgeDAO badgeDAO;
	private ReplyDAO replyDAO;
	private FollowDAO followDAO;
	private AttackDAO attackDAO;
	private FreeDAO freeDAO;
	private AbTestDAO abTestDAO;
	private ReviewDAO reviewDAO;
	private GameDAO gameDAO;
	private BuyListDAO buyListDAO;
	private PaginateUtil paginateUtil;

	public void setBuyListDAO(BuyListDAO buyListDAO) {
		this.buyListDAO = buyListDAO;
	}

	public void setUserDAO(UsersDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setGameDAO(GameDAO gameDAO) {
		this.gameDAO = gameDAO;
	}

	public void setFollowDAO(FollowDAO followDAO) {
		this.followDAO = followDAO;
	}

	public void setUserBadgeDAO(UserBadgeDAO userBadgeDAO) {
		this.userBadgeDAO = userBadgeDAO;
	}

	public void setBadgeDAO(BadgeDAO badgeDAO) {
		this.badgeDAO = badgeDAO;
	}

	public void setAttackDAO(AttackDAO attackDAO) {
		this.attackDAO = attackDAO;
	}

	public void setAbTestDAO(AbTestDAO abTestDAO) {
		this.abTestDAO = abTestDAO;
	}

	public void setFreeDAO(FreeDAO freeDAO) {
		this.freeDAO = freeDAO;
	}

	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	/**
	 * @name indexList \n
	 * @brief 인덱스 페이지에 보여줄 리스트 출력 \n
	 * @return Map<String, Object> \n
	 * @author park \n
	 * @version 1.0 \n
	 * @see None \n
	 */
	@Override
	public Map<String, Object> indexList() {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();

		map.put("gamePopulars", gameDAO.selectPopularGameList());
		map.put("freeBests", freeDAO.selectIndexFree());
		map.put("debateBsets", replyDAO.replyListTopten());
		map.put("gameBests", gameDAO.selectBestGameList());
		map.put("abTestBests", abTestDAO.selectBestList());

		return map;
	}

	@Override
	public User login(User user) {

		return userDAO.selectLogin(user);
	}

	@Override
	public boolean areYouCreator(int userNo) {
		return 1 == userDAO.selectCreator(userNo);
	}

	@Override
	public Map getProfile(int userNo, int loginNo) {
		// TODO Auto-generated method stub
		Map<String, Object> user = new HashMap<>();
		user.put("user", userDAO.selectProfileOne(userNo));
		user.put("mainBadge", userBadgeDAO.selectMainBadge(userNo));
		user.put("badgeList", badgeDAO.selectUserBadge(userNo));
		user.put("followCnt", (Integer) followDAO.selectFollow(userNo));
		// System.out.println(user.get("followCnt"));
		user.put("followerCnt", (Integer) followDAO.selectFollower(userNo));
		if (loginNo != 0) {
			System.out.println(loginNo);
			Follow followCheck = new Follow(userNo, loginNo);
			user.put("isFollowing", (Integer) followDAO.selectOne(followCheck));
		}

		return user;
	}

	@Override
	public boolean changeBadge(UserBadge userBadge) {
		// TODO Auto-generated method stub
		return 1 == userBadgeDAO.updateMainBadge(userBadge);
	}

	@Override
	public boolean addFollow(Follow follow) {
		// TODO Auto-generated method stub
		return 1 == followDAO.insert(follow);
	}

	@Override
	public boolean cancelFollow(Follow follow) {
		// TODO Auto-generated method stub
		return 1 == followDAO.delete(follow);
	}

	@Override
	public Map getProfileAttack(int pageNo, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();
		int numPage = 2;
		int numBlock = 5;

		PageVO pageVO = new PageVO(pageNo, numPage, userNo, 1);
		List<Attack> list = attackDAO.selectProfileAttack(pageVO);
		System.out.println(list.toString());

		int total = attackDAO.selectAttackCount(userNo);

		String url = "/profile/" + userNo;

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("attackList", list);
		map.put("paginate", paginate);
		return map;
	}

	@Override
	public Map getProfileFree(int pageNo, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();
		int numPage = 5;
		int numBlock = 5;

		PageVO pageVO = new PageVO(pageNo, numPage, userNo, 1);
		List<Free> list = freeDAO.selectFreeProfile(pageVO);

		int total = freeDAO.selectFreeCount(userNo);

		String url = "/profile/" + userNo;

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("freeList", list);
		map.put("paginate", paginate);
		return map;
	}

	@Override
	public Map getProfileReview(int pageNo, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();
		int numPage = 2;
		int numBlock = 5;

		PageVO pageVO = new PageVO(pageNo, numPage, userNo, 1);
		List<Review> list = reviewDAO.selectReviewProfile(pageVO);

		int total = reviewDAO.selectReviewCount(userNo);

		String url = "/profile/" + userNo;

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("reviewList", list);
		map.put("paginate", paginate);
		return map;
	}

	@Override
	public Map getProfileHeartList(int pageNo, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();
		int numPage = 5;
		int numBlock = 5;

		PageVO pageVO = new PageVO(pageNo, numPage, userNo, 1);
		List<Game> list = gameDAO.selectHerartList(pageVO);

		int total = gameDAO.selectHeartCount(userNo);
		String url = "/profile/" + userNo;

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("heartList", list);
		map.put("paginate", paginate);
		return map;
	}

	@Override
	public Map getProfileBuyList(int pageNo, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<>();
		int numPage = 5;
		int numBlock = 5;

		PageVO pageVO = new PageVO(pageNo, numPage, userNo, 1);
		List<BuyList> list = buyListDAO.selectBuyList(pageVO);
		int total = buyListDAO.selectBuyCount(userNo);
		System.out.println("서비스" + total);
		String url = "/profile/" + userNo;

		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);

		map.put("buyList", list);
		map.put("paginate", paginate);
		return map;
	}

}
