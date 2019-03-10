<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>GameDetailPage</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/tui-chart.css">
<link rel="stylesheet" href="/css/tui-editor.min.css">
<link rel="stylesheet" href="/css/tui-editor-contents.min.css" />
<link rel="stylesheet" href="/css/Nwagon.css" type="text/css">
<link rel="stylesheet" href="/css/GameDetailPage.css">
<link rel="stylesheet" href="/css/paging.css">
<style>
<c:if test ="${loginUser.userNo==null}">
#startQuestionBtn {
	display: none;
}
</c:if>
</style>
</head>

<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>

	<div id="contents">
		<div id="wrap">
			<div id="gameHeadWrap">

				<div id="gamemTitle">${gameOne.gameName }</div>
				<!--//gamemTitle end-->

				<div id="gameSystemText">
					<i class="fas fa-${gameOne.chanageSystemIcon() }"></i>
					${gameOne.chanageSystem() }
				</div>
				<!--//gameSystemText end-->
				<div id="gameHeartWrap">
					<div id="gameHeartBox" 
					<c:if test="${loginUser!=null}">
					class="click_heart" 
					</c:if>
					>
					<div id="heartbtn" class="fas fa-heart">
					</div>
					</div>
					<!--//gameHeartBox end-->
					<div id="gmaeHeartText"></div>
					<script type="text/template" id="heartNum">
						<div><@=test.heartNums@></div>
					</script>
					<!--//gmaeHeartText end-->
				</div>
				<!--//gameHeartWrap end-->
				<c:if test="${loginUser!=null && loginUser.userNo==gameOne.userNo}">
					<div id="configBtn">
						<i class="fas fa-cog"></i>
					</div>
					<!--//configBtn end-->
				</c:if>
			</div>
			<!--//gameHeadWrap end-->

			<div id="gameContents">
				<img class="view_thumbnail_img" src="/img/game/${gameOne.image }" />
				<!--//view_thumbnail_img end-->
				<div class="box_sub_contents">
					<div id="indersTitle">인더의 상세평가</div>
					<!--//indersTitle end-->
					<div class="evaluation_indier">
						<div id="Nwagon"></div>
					</div>
					<!--//evaluation_indier 둥-->
					<ul>
						<li>
							<div class="box_sTitle">평가</div>
							<div
								class="text_evaluation_size far fa-${gameOne.changeEvaluation()}">
								${gameOne.evaluation }%</div>
						</li>

						<li class="box_sTitle_list">
							<div class="box_sTitle">출시일</div>
							<div class="releaseDate">${gameOne.changeDate() }</div>
						</li>
						<li class="box_sTitle_list">
							<div class="box_sTitle">장르</div>
							<div class="releaseDate">${gameOne.genre }</div>
						</li>
						<li class="box_sTitle_list">
							<div class="box_sTitle">가격</div>
							<div class="releaseDate">
								<c:if test="${gameOne.price!=0}">
									<i class="fas fa-won-sign"></i> 
								</c:if>
								${gameOne.changePrice() }
							</div>
						</li>
					</ul>
				</div>
				<!--//box_sub_contents-->

				<div id="gameBtnBox">
					<div class="btn_big btn_game_pos">
						장바구니<i class="fas fa-cart-arrow-down"></i>
					</div>
					<!---->
					<div id="downBtn" class="btn_big btn_game_pos">다운로드</div>
					<div class="box_sTitle_gameBtn">다운로드 수</div>
					<!--//box_sTitle_gameBtn end-->
					<div id="downloadNum" class="box_sTitle_gameBtn"></div>
					<script type="text/template" id="downNum">
						<div><@=test.downNums@></div>
					</script>
					<!--//box_sTitle_gameBtn end-->
				</div>
				<!--//btn_box_game end-->
<c:if test="${mainImage!=null }">
				<img id="imgGamemTitle" class="box_game_img"
					src="/img/gameDetail/${mainImage.title }" /><!--//imgGamemTitle end-->
</c:if>

<c:if test="${imageList!=null}">
				<div id="subTitleImgBox" class="box_game_img">
					<div class="wrap_simg">
						<c:forEach items="${imageList}" var="img">
							<img class="simg_view" src="/img/gameDetail/${img.title }" />
							<!--//simg_view end-->
						</c:forEach>
					</div><!--//simgWrap end-->
				</div><!--//subTitleImgBox end-->
</c:if>
				<div id="leftGameBtn" class="btn_simg fas fa-angle-left"></div>
				<div id="rightGameBtn" class="btn_simg fas fa-angle-right"></div>
			</div>
			<!--//gameContents end-->


			<div id="projectTeamProfileBox">
				<div class="mTitle_gamePage">프로젝트프로필</div>
				<!--// projectTeammTitle end-->

				<div id="projectTeamContents">

					<div id="projectTeamCard">
						<a class="text_href" href="xxx.jsp?no=${gameOne.no }"> <img
							id="projectTeamImg" src="/img/project/${gameOne.projectImg }" />
							<div id="projectTeamsTitle">${gameOne.title }</div>
						</a>
					</div>
					<!--//projectTeamCard end-->
					<div id="profileBox">
						<div id="teamListmTitle">팀원 리스트</div>
						<!--//teamListmTitle end-->

						<div id="profilCardListWrap">
							<c:forEach items="${teamList }" var="team">
								<div class="card_profile">
									<a class="text_href" href="xxx.jsp?no=${team.no }"> <img
										class="box_badge pos_bage_team"
										src="/img/badge/download_lv4.jpg" /> <img
										class="img_card_profile img_card_pos"
										src="/img/profile/${team.profileImg }" />
									<!--//img_card_profile end-->
										<div class="name_card_profile">${team.nickName }</div>
										<!--//name_card_profile-->
									</a>
								</div>
								<!--//card_profile end-->
							</c:forEach>
						</div>
						<!--//profilCardListWrap end-->

					</div>
					<!--//profileBox end-->
					<div id="leftProfileBtn" class="btn_sub_arrow fas fa-angle-left"></div>
					<div id="rightProfileBtn" class="btn_sub_arrow fas fa-angle-right"></div>

				</div>
				<!--//projectTeamContents end-->
			</div>
			<!--//projectTeamProfileBox end-->


			<div id="gameContentsWrap">

				<div id="tapBox" class="tap">
					<div class="btn_tap click ">게임상세</div>
					<!--//btn_tap end-->
					<div class="btn_tap">리뷰</div>
					<!--//btn_tap end-->
					<div class="btn_tap">공략</div>
					<!--//btn_tap end-->
					<div class="btn_tap">토론</div>
					<!--//btn_tap end-->
					<div class="btn_tap">문의</div>
					<!--//btn_tap end-->
				</div>
				<!-- #tapBox end-->

				<!--///////////////////////////////////////////////////////////////////////////////////////////-->

				<div class="tap_diplay_none tap on_gameDetail">

					<div class="wrap_contents_tap">
						<div class="mTitle_gamePage">최신 업데이트</div>
						<!--//updatemTitle end-->
						<div class="contents_tap">안녕하세요 ~ 개발자입니다. 이번 업데이트는 우리 회원들의
							감사함을 위하여 게임 아이템을 무료로 배포 하도록 하였습니다. 핫핫 엽떡을 저희 가 배포하오니 11월 27일까지 받아
							주시기 바랍니다 ~~!! 뿅뿅~</div>
						<!--//contents_tap end-->
						<div id="updateBtnBox">
							<button id="goUpDateNodeBtn" class="btn_big"
								onclick="location.href='updateNotePage.html'">업데이트 노트</button>
							<!--//moreUpdateBtn end-->
						</div>
						<!--//updateBtnBox end-->
					</div>
					<!--//wrap_contents_tap end-->


					<div class="wrap_contents_tap">
						<div class="mTitle_gamePage">게임에 대하여</div>
						<!--//updatemTitle end-->
						<div class="contents_tap">${gameOne.contents }</div>
						<!--//contents_tap end-->
					</div>
					<!--//wrap_contents_tap end-->

					<div class="wrap_contents_tap system_test">
						<div class="mTitle_gamePage">시스템 요구 사항</div>
						<!--//updatemTitle end-->
						<ul id="systemWrap">

							<li id="systemmTitleWrap">
								<div id="leastmTitle" class="sTitle_system_minMax">최소</div>
								<div id="maximummTitle" class="sTitle_system_minMax">최대</div>
							</li>
							<li class="wrap_sTitle_system">
								<div class="sTitle_system">운영체제</div>
								<div class="sTitle_system_small">${gameSpecM.os }</div>
								<div class="sTitle_system_small">${gameSpecB.os }</div>
							</li>

							<li class="wrap_sTitle_system">
								<div class="sTitle_system">프로세서</div>
								<div class="sTitle_system_small">${gameSpecM.processor }</div>
								<div class="sTitle_system_small">${gameSpecB.processor }</div>
							</li>


							<li class="wrap_sTitle_system">
								<div class="sTitle_system">메모리</div>
								<div class="sTitle_system_small">${gameSpecM.memory }</div>
								<div class="sTitle_system_small">${gameSpecB.memory }</div>
							</li>

							<li class="wrap_sTitle_system">
								<div class="sTitle_system">그래픽</div>
								<div class="sTitle_system_small">${gameSpecM.graphic }</div>
								<div class="sTitle_system_small">${gameSpecB.graphic }</div>
							</li>

							<li class="wrap_sTitle_system">
								<div class="sTitle_system">DirectX</div>
								<div class="sTitle_system_small">${gameSpecM.directX }</div>
								<div class="sTitle_system_small">${gameSpecB.directX }</div>
							</li>

							<li class="wrap_sTitle_system">
								<div class="sTitle_system">네트워크</div>
								<div class="sTitle_system_small">${gameSpecM.network }</div>
								<div class="sTitle_system_small">${gameSpecB.network }</div>
							</li>

							<li class="wrap_sTitle_system">
								<div class="sTitle_system">저장공간</div>
								<div class="sTitle_system_small">${gameSpecM.storageSpec }</div>
								<div class="sTitle_system_small">${gameSpecB.storageSpec }</div>
							</li>

						</ul>
						<!--//wrap_systemList end-->
					</div>
					<!--//wrap_contents_tap end-->

				</div>
				<!--// 상세페이지 텝-->


				<div class="tap_diplay_none tap">

					<form>
						<div class="wrap_contents_fix wrap_input_inder">
							<div id="contentsTap">

								<div class="card_profile card_profile_inder">
									<img class="img_card_profile img_card_pos"
										src="img/default.jpg" />
									<!--//img_card_profile end-->
									<div class="name_card_profile">가나다라</div>
									<!--//name_card_profile-->
								</div>
								<!--//card_profile end-->

								<div id="inderEvaluationWrap">

									<div id="inderEvaluationsTitleWrap">
										<div class="sTitle_inder_Evaluation">1</div>
										<div class="sTitle_inder_Evaluation">2</div>
										<div class="sTitle_inder_Evaluation">3</div>
										<div class="sTitle_inder_Evaluation">4</div>
										<div class="sTitle_inder_Evaluation">5</div>
									</div>

									<div class="wrap_inder_evaluation_list">
										<div class="sTitle_inder_evaluation_list">그래픽</div>
										<!--//sTitle_inder_evaluation_list end-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="graphic" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="graphic" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="graphic" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="graphic" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="graphic" />
										</div>
										<!--//radio_inder_evaluation_list-->

									</div>
									<!--//wrap_inder_evaluation_list end-->


									<div class="wrap_inder_evaluation_list">
										<div class="sTitle_inder_evaluation_list">사운드</div>
										<!--//sTitle_inder_evaluation_list end-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="sound" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="sound" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="sound" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="sound" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="sound" />
										</div>
										<!--//radio_inder_evaluation_list-->

									</div>
									<!--//wrap_inder_evaluation_list end-->


									<div class="wrap_inder_evaluation_list">
										<div class="sTitle_inder_evaluation_list">스토리</div>
										<!--//sTitle_inder_evaluation_list end-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="story" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="story" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="story" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="story" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="story" />
										</div>
										<!--//radio_inder_evaluation_list-->

									</div>
									<!--//wrap_inder_evaluation_list end-->


									<div class="wrap_inder_evaluation_list">
										<div class="sTitle_inder_evaluation_list">난이도</div>
										<!--//sTitle_inder_evaluation_list end-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="difficulty" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="difficulty" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="difficulty" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="difficulty" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="difficulty" />
										</div>
										<!--//radio_inder_evaluation_list-->

									</div>
									<!--//wrap_inder_evaluation_list end-->


									<div class="wrap_inder_evaluation_list">
										<div class="sTitle_inder_evaluation_list">몰입감</div>
										<!--//sTitle_inder_evaluation_list end-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="immersion" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="immersion" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="immersion" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="immersion" />
										</div>
										<!--//radio_inder_evaluation_list-->

										<div class="radio_inder_evaluation_list ">
											<input type="radio" name="immersion" />
										</div>
										<!--//radio_inder_evaluation_list-->

									</div>
									<!--//wrap_inder_evaluation_list end-->

									<textarea class="text_review_input"></textarea>
									<div id="upDawonIconWrap">
										<div id="likeBtn" class="btn_icon far fa-thumbs-up "></div>
										<div id="unLikeBtn" class="btn_icon far fa-thumbs-down"></div>
									</div>
									<div id="inPutBtn">
										<div class="color_yellow btn_small_size">등록</div>
									</div>
								</div>
								<!--// inderEvaluationWrap end-->

							</div>
							<!--//contents_tap end-->
						</div>
						<!--//wrap_contents_tap end-->
					</form>
					<!--forom end -->


					<div class="wrap_contents_tap">
						<div class="mTitle_gamePage">인디의 리뷰</div>
						<!--//updatemTitle end-->
						<div class="wrap_list_inder">








							<div class="wrap_list_inderEvaluation">
								<div class="icon_upDon far fa-thumbs-up pos_updon_inder"></div>
								<!--//icon_upDon end-->

								<div class="wrap_inder_btn">
									<div id="deleteTest"
										class="btn_small_size color_bule btn_pos_inder">삭제</div>
									<!--//btn_delete end-->
									<div class="num_up  btn_pos_inder">25</div>
									<!--//num_up end-->
									<div class="btn_small_size color_bule btn_pos_inder">
										좋아요 <i class="far fa-thumbs-up"></i>
									</div>
									<!--//btn_up end-->
								</div>

								<div class="card_profile inderPostion">
									<img class="box_badge pos_bage_team"
										src="img/badge/game_lv3.jpg" /> <img
										class="img_card_profile img_card_pos"
										src="img/profile_img/profile_6.jpg" />
									<!--//img_card_profile end-->
									<div class="name_card_profile">원주</div>
									<!--//name_card_profile-->
								</div>
								<!--//card_profile end-->

								<div class="wrap_chart_area">
									<ul class="box_title">
										<li class="bar_title">그래픽</li>
										<li class="bar_title">사운드</li>
										<li class="bar_title">스토리</li>
										<li class="bar_title">난이도</li>
										<li class="bar_title">몰입감</li>

									</ul>
									<ul class="chart_area">
										<li id="test1" class="bar_graph"></li>
										<li id="test2" class="bar_graph"></li>
										<li id="test3" class="bar_graph"></li>
										<li id="test4" class="bar_graph"></li>
										<li id="test5" class="bar_graph"></li>
									</ul>
								</div>
								<!-- chart-area-->

								<div class="text_inder_card text_inderCard_pos ">엽떡의 여행
									상당히 좋은데요 제가 엽떡을 한번도 먹지 못했지만 이 게임으로 인하여 엽떡을 참 좋아하게 되었습니다. ㅎㅎ</div>
							</div>
							<!--//inderEvaluationListCard end-->





							<div class="wrap_list_inderEvaluation">
								<div class="icon_upDon far fa-thumbs-up pos_updon_inder"></div>
								<!--//icon_upDon end-->

								<div class="wrap_inder_btn">
									<div id="deleteTest"
										class="btn_small_size color_bule btn_pos_inder">삭제</div>
									<!--//btn_delete end-->
									<div class="num_up  btn_pos_inder">10</div>
									<!--//num_up end-->
									<div class="btn_small_size color_bule btn_pos_inder">
										좋아요 <i class="far fa-thumbs-up"></i>
									</div>
									<!--//btn_up end-->
								</div>

								<div class="card_profile inderPostion">
									<img class="box_badge pos_bage_team"
										src="img/badge/game_lv3.jpg" /> <img
										class="img_card_profile img_card_pos"
										src="img/profile_img/profile_7.jpg" />
									<!--//img_card_profile end-->
									<div class="name_card_profile">감모</div>
									<!--//name_card_profile-->
								</div>
								<!--//card_profile end-->

								<div class="wrap_chart_area">
									<ul class="box_title">
										<li class="bar_title">그래픽</li>
										<li class="bar_title">사운드</li>
										<li class="bar_title">스토리</li>
										<li class="bar_title">난이도</li>
										<li class="bar_title">몰입감</li>

									</ul>
									<ul class="chart_area">
										<li id="test6" class="bar_graph"></li>
										<li id="test7" class="bar_graph"></li>
										<li id="test8" class="bar_graph"></li>
										<li id="test9" class="bar_graph"></li>
										<li id="test10" class="bar_graph"></li>
									</ul>
								</div>
								<!-- chart-area-->

								<div class="text_inder_card text_inderCard_pos ">이게임은 스토리
									적으로 상당하며 한국미가 많이 느껴지는 게임입니다. 이렇게 보니깐 엽떡의 맛있는 장점을 시각적으로 잘 표현 하였
									습니다 ^^ 상당히 추천 드리고 싶습니다..</div>
							</div>
							<!--//inderEvaluationListCard end-->

						</div>
						<!--//contents_tap end-->
						<div class="paging"></div>
						<!--//paging end-->
					</div>
					<!--//wrap_contents_tap end-->


					<div id="reviewForm">
						<form class="wrap_contents_fix">
							<div class="card_profile card_profile_inder">
								<img class="img_card_profile img_card_pos"
									src="img/profile_img/profile_8.jpg" />
								<!--//img_card_profile end-->
								<div class="name_card_profile">호우호</div>
								<!--//name_card_profile-->
							</div>
							<!--//card_profile card_profile_inder end-->

							<div class="btn_upDown">
								<div class="btn_icon btn_color_review far fa-thumbs-up"></div>
								<div class="btn_icon btn_color_review far fa-thumbs-down"></div>
							</div>
							<!--//btn_upDown end-->

							<textarea id="reviewTextPos" class="text_review_input"></textarea>
							<!--//text_review end-->
							<div class="btn_input_pos">
								<div class="btn_small_size color_yellow">등록</div>
							</div>
							<!--//btn_input end-->
						</form>
						<!--//wrap_contents_tap end-->
					</div>
					<!--//reviewForm end-->


					<div class="wrap_contents_tap">
						<div class="mTitle_gamePage">리뷰</div>
						<!--//mTitle_gamePage end-->
						<div class="wrap_select_review">
							<div class="wrap_select">
								<div class="btn_select click_two">최신순</div>
								<!--//btn_select end-->
								<div class="btn_select">좋아요순</div>
								<!--//btn_select end-->
							</div>
							<!--//wrap_select end-->




						</div>
						<!--//wrap_select_review end-->


						<ul id="reviewListWrap">

							<li class="list_review">
								<div class="icon_upDon far fa-thumbs-up pos_updon_review"></div>
								<!--//icon_upDon end-->
								<div>
									<div class="btn_ btn_reive_pos btn_delete_pos">삭제</div>
									<!--//btn_delete end-->
									<div class="btn_ btn_reive_pos btn_declaration_pos">신고</div>
									<!--//btn_delete end-->
									<div class="num_up btn_reive_pos num_upReview_pos">22</div>
									<!--//num_up end-->
									<div class="btn_ btn_reive_pos btn_up">
										좋아요<i class="far fa-thumbs-up"></i>
									</div>
								</div> <!--//btn_up end-->

								<div class="card_profile card_profile_pos">
									<img class="box_badge pos_bage_team"
										src="img/badge/sos_lv3.jpg" /> <img
										class="img_card_profile img_card_pos"
										src="img/profile_img/profile_9.jpg" />
									<!--//img_card_profile end-->
									<div class="name_card_profile">꼬봉이</div>
									<!--//name_card_profile-->
								</div>
								<!--//card_profile card_profile_inder end-->
								<div class="text_review text_review_pos">크흠 참 좋습니다. 제가 게임
									회사였으면 이거 더 키웠을거 같습니닫 ~~</div>
								<!--//text_review end-->
								<div class="text_review_date pos_review_date">2018년11월15일</div>
							</li>
							<!--//list_review end-->




							<li class="list_review">
								<div class="icon_upDon far fa-thumbs-up pos_updon_review"></div>
								<!--//icon_upDon end-->
								<div>
									<div class="btn_ btn_reive_pos btn_delete_pos">삭제</div>
									<!--//btn_delete end-->
									<div class="btn_ btn_reive_pos btn_declaration_pos">신고</div>
									<!--//btn_delete end-->
									<div class="num_up btn_reive_pos num_upReview_pos">10</div>
									<!--//num_up end-->
									<div class="btn_ btn_reive_pos btn_up">
										좋아요<i class="far fa-thumbs-up"></i>
									</div>
								</div> <!--//btn_up end-->

								<div class="card_profile card_profile_pos">
									<img class="box_badge pos_bage_team"
										src="img/badge/idea_lv04.jpg" /> <img
										class="img_card_profile img_card_pos"
										src="img/profile_img/profile_10.jpg" />
									<!--//img_card_profile end-->
									<div class="name_card_profile">깜찍이</div>
									<!--//name_card_profile-->
								</div>
								<!--//card_profile card_profile_inder end-->
								<div class="text_review text_review_pos">이거 정말 재미가 있는데용 이거
									참 엽떡이 생각나는 게임인듯 합니다 ~~!!!!</div>
								<!--//text_review end-->
								<div class="text_review_date pos_review_date">2018년11월14알</div>
							</li>
							<!--//list_review end-->




							<li class="list_review">
								<div class="icon_upDon far fa-thumbs-up pos_updon_review"></div>
								<!--//icon_upDon end-->
								<div>
									<div class="btn_ btn_reive_pos btn_delete_pos">삭제</div>
									<!--//btn_delete end-->
									<div class="btn_ btn_reive_pos btn_declaration_pos">신고</div>
									<!--//btn_delete end-->
									<div class="num_up btn_reive_pos num_upReview_pos">33</div>
									<!--//num_up end-->
									<div class="btn_ btn_reive_pos btn_up">
										좋아요<i class="far fa-thumbs-up"></i>
									</div>
								</div> <!--//btn_up end-->

								<div class="card_profile card_profile_pos">
									<img class="box_badge pos_bage_team"
										src="img/badge/REVUEW_LV2.jpg" /> <img
										class="img_card_profile img_card_pos"
										src="img/profile_img/profile_11.jpg" />
									<!--//img_card_profile end-->
									<div class="name_card_profile">숙부</div>
									<!--//name_card_profile-->
								</div>
								<!--//card_profile card_profile_inder end-->
								<div class="text_review text_review_pos">이게임 참 좋은데요 제가 한번
									해봤는데 참 재미있습니다 !!!</div>
								<!--//text_review end-->
								<div class="text_review_date pos_review_date">2018년11월14일</div>
							</li>
							<!--//list_review end-->

						</ul>
						<!--///reviewListWrap end-->


						<div class="paging"></div>
						<!--//paging end-->

					</div>
					<!--//wrap_contents_tap end-->


				</div>
				<!--// 리뷰텝-->

				<div class="tap_diplay_none tap">
					<div class="list_explan">
						<div class="explan_com">댓글수</div>
						<div class="explan_like">좋아요수</div>
						<div class="explan_view">조회수</div>
					</div>
					<!--//list_explan end -->

					<div class="box_list_attack"></div>
					<!--//box_list_attack end -->
					<div id="attackPage" class="paging"></div>
				</div>
				<!--// 공략 텝-->


				<div class="tap_diplay_none tap">

					<div id="gameDebateList"
						class="wrap_debateTap_contents wrap_contents_tap_pos">

						<ul class="wrap_list_debute">

						</ul>
						<!--//wrap_list_debute end-->

						<div class="box_btn_input">
							<div id="startDebateBtn"
								class="btn_small_size color_bule btn_debate_start">토론시작</div>
						</div>
						<!--//box_btn_input end-->
						<div class="paging">페이징 구간입니다.</div>
						<!--//paging end-->

						<form class="wrap_search">
							<div class="box_search">
								<input class="input_search" />
								<button class="btn_search">
									<i class="fas fa-search"></i>
								</button>
							</div>
							<!--//box_search end-->
						</form>
						<!-- wrap_search end-->
					</div>
					<!--//wrap_list_debute end-->

				</div>
				<!--// 토론 텝-->



				<div class="tap_diplay_none tap">

					<div class="wrap_debateTap_contents wrap_contents_tap_pos">
						<ul class="wrap_question_list">


						</ul>
						<!--//wrap_list_debute end-->
						<div class="box_question_input">
							<div id="startQuestionBtn" class="btn_ btn_question_start">문의하기</div>
						</div>
						<!--//box_btn_input end-->
						<div id="questionPage" class="paging">페이징 구간입니다.</div>
						<!--//paging end-->

					</div>
					<!--//wrap_list_debute end-->

				</div>
				<!--// 문의 텝-->
				<!--///////////////////////////////////////////////////////////////////////////////////////////-->

			</div>
			<!--//gameContentsWrap end-->
		</div>
		<!--//wrap end-->
	</div>
	<!--//contents end-->

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

	<!-- 게임 토론 탭 인풋  (popup)-->
	<div id="debateFormpopUp" class="wrap_edit_input">
		<form class="box_edit">
			<label class="title_edit">제목 <input class="input_title_edit" /></label>
			<!--//editTitle end-->
			<!-- <div id="editTitle"></div>-->
			<div id="editSection"></div>
			<!--//section_edit end-->
			<div id="debateSuccessBtn" class="btn_ pos_btn_form btn_input">등록</div>
			<div id="debateCancelBtn" class="btn_ pos_btn_form ">취소</div>
		</form>
		<!--//box_edit end-->
	</div>
	<!--//wrap_contents_tap end-->
	<!-- 게임 토론 탭 인풋 -->

	<!-- 게임 문의 탭 인풋  (popup)-->
	<div id="questionFormpopUp" class="wrap_edit_input">

		<label class="title_edit">제목 <input id="questionTitle"
			name="title" class="input_title_edit foucs" /></label>
		<!--//editTitle end-->
		<div id="unLockIconWrap">
			<div class="icon_sTitle_size fas fa-unlock">
				<label class="label_cursor"><input class="foucs" name="lock"
					type="radio" value="Y" />공개</label>
			</div>
			<div class="icon_sTitle_size fas fa-lock">
				<label class="label_cursor"><input class="foucs" name="lock"
					type="radio" value="N" />비공개</label>
			</div>
		</div>
		<div id="editSectionTwe"></div>
		<!--//editSectionTwe end-->

		<div id="questionInputlBtn" class="btn_ pos_btn_form btn_input">등록</div>
		<div id="questionCancelBtn" class="btn_ pos_btn_form ">취소</div>
	</div>
	<!--//wrap_contents_tap end-->
	<div class="pop_up"></div>
	<!-- 게임 문의 탭 인풋  (popup)-->


	<!-- 게임 문의 상세   (popup)-->
	<div id="gameQuestionView" class="wrap_contents_popUp">
		<div class="testQue1"></div>

		<div class="testQue2"></div>

	</div>
	<!--//wrap_contents_tap end-->
	<!-- 게임 문의 상세 (popup)-->
	<!-- // 게임 문의 상세 텀플릿 -->
	<script type="text/template" id="questionOne">
<@
var flag =  "unlock";
var test = questionOne.visibility.includes("N") ;
console.log(test);
if(test){
	flag = "lock";
}
@>
        <div class="wrap_debate">
            <div class="wrap_debate_mTitle ">
                <div class="icon_mTitle_size fas fa-<@= flag@>"></div><!--//icon_mTitle_size end-->
                <div class="mTitle_font_size"><@= questionOne.title@></div><!--// mTitle_font_size end-->
            </div><!--//wrap_debate_mTitle end-->
            <div class="wrap_debate_sTitle sTitle_debate_pos">
                <img class="img_card_profile stitle_debate_pos" src="/img/profile/<@= questionOne.profileImg@>" /><!--//img_card_profile end-->
                <div class="text_small_size stitle_debate_pos text_profile_pos">
				<a class="text_href" href="xxx.jsp?no=<@= questionOne.userNo@>">
				<@= questionOne.nickName@>
				</a>
				</div>
                <!--//text_small_size end-->
                <div class="text_middle_size stitle_debate_pos view_debate_pos">조회수 : <@= questionOne.views@></div>
                <div class="text_big_size stitle_debate_pos  pos_date_write"><@=moment(questionOne.regdate).format('YYYY년MM월DD일')@></div>


            </div><!--//wrap_debate_sTitle end-->
			<@= questionOne.contents@>
            <div class="wrap_debate_contents">
           
            </div>
            <div class="wrap_btn_btn">
                <div class="btn_  btn_pos_debate">신고</div><!--//btn_delete end-->
                <div id="updateQuestionBtn"  class="btn_  btn_pos_debate btn_debate_pos_modified">수정</div><!--//btn_delete end-->
                <div id="deleteQuestionBtn" class="btn_ btn_pos_debate btn_debate_pos_delete">삭제</div><!--//btn_delete end-->
        </div><!--//wrap_btn_btn end-->

        </div><!--//wrap_debate end-->
</script>
	<!-- // 게임 문의 상세 텀플릿 -->
	<!-- // 리플 템플릿  주석-->
	<script type="text/template" id="replyTmp">
<@ _.each(replys,function(reply){@>
<div class="reply_wrap">
			<div class="reply_contents">
			<@=reply.contents@>
			</div><!-- .list_content3 end -->
			<img class="fa_profile" src="/img/profile/<@= reply.profileImg@>"/><!-- .fa_profile end -->
			<div class="reply_name"><@=reply.nickName@></div><!-- .reply_name end -->
</div><!-- .reply_wrap end -->
<@}) @>
</script>
	<!-- // 리플 템플릿 -->

	<script type="text/template" id="replyQuestionTmp">
<div class="reply_wrap">
			<div class="reply_contents">
			fasdfasdfsdafsdafsadfsdafsadf
			dassdafasdfsdafsadfasd
			f
			</div><!-- .list_content3 end -->
			<div class="btn_reply  btn_reply_pos btn_reply_update">
			수정
			</div>
			<!-- .btn_change end -->
			<div class="btn_reply btn_reply_pos btn_reply_delete">삭제</div><!-- .btn_delete end -->
			<div class="fa_profile"></div><!-- .fa_profile end -->
			<div class="reply_name">닉네임</div><!-- .reply_name end -->
</div><!-- .reply_wrap end -->
</script>
	<!--// 토론 상세페이지 팝업-->
	<div class="wrap_contents_popUp" id="gameDebateView">
		<!--text-align:justify-->

		<div class="wrap_debate">
			<div class="wrap_debate_mTitle ">
				<div class="icon_mTitle_size fas fa-comment-alt"></div>
				<!--//icon_mTitle_size end-->
				<div class="mTitle_font_size">ㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㅌㄴ</div>
				<!--// mTitle_font_size end-->
			</div>
			<!--//wrap_debate_mTitle end-->
			<div class="wrap_debate_sTitle sTitle_debate_pos">
				<img class="img_card_profile stitle_debate_pos"
					src="img/default.jpg" />
				<!--//img_card_profile end-->
				<div class="text_small_size stitle_debate_pos text_profile_pos">
					홍길동XX</div>
				<!--//text_small_size end-->
				<div class="text_middle_size stitle_debate_pos view_debate_pos">조회수
					: XXXX</div>
				<div class="text_big_size stitle_debate_pos  pos_date_write">XXXX년
					XX월 XX일</div>

				<div class="stitle_debate_pos wrap_icon_pos">
					<div class="btn_icon far fa-thumbs-up"></div>
					<div class="btn_icon far fa-thumbs-down"></div>
				</div>
				<!--//btn_upDown end-->
				<div class="stitle_debate_pos text_ssmall_size text_likeicon_pos">XXK</div>
				<div class="stitle_debate_pos text_ssmall_size text_unicon_pos">XXK</div>
			</div>
			<!--//wrap_debate_sTitle end-->

			<div class="wrap_debate_contents">상처만 커지는 걸 옆에 누운 널 볼 때마다 따뜻했던
				추억들을 왜 자꾸 더럽혀 잘 지내고 있다가도 어김없이 찾아오면 내 마음에 향수만 적시고 가 이 밤의 깊은 숨결들을 살며시
				내게 녹이고 넌 아무렇지 않게 떠나가 잊을만하면 다시 날 찾아와 지울만하면 널 또 찾아 헤메는데 넌 아무 일 없었다는 듯이
				날 거부할 수 없게 만들어 Oh yeah I’ve been thinking of you I’ve been thinking
				of you I’ve been thinking of you babe Oh yeah I’ve been thinking of
				you I’ve been thinking of you 날 어루만져 주던 그 때 그 때의 널 붙잡고 있어 상처는 그리움이
				되고 지독한 관계를 끊지 못하고 또 내 눈을 멀게 해 잘 지내고 있다가도 어김없이 밤이 오면 너가 올 그 시간만 기다려
				너가 떠난 내 침대 위에 남겨진 잔향이 날 괴롭게 해 잊을만하면 다시 날 찾아와 지울만하면 널 또 찾아 헤메는데 넌 아무
				일 없었다는 듯이 날 거부할 수 없게 만들어 안될걸 알면서도 널 끌어안을 때 감당할 대가를 받고 비참하게 남겨진 내
				자신보다 네가 너무 싫어 제발 날 좀 놓아줘 잊을만하면 다시 날 찾아와 지울만하면 널 또 찾아 헤메는데 넌 아무 일
				없었다는 듯이 날 거부할 수 없게 만들어</div>
			<div class="wrap_btn_btn">
				<div class="btn_  btn_pos_debate">신고</div>
				<!--//btn_delete end-->
				<div class="btn_  btn_pos_debate btn_debate_pos_modified">수정</div>
				<!--//btn_delete end-->
				<div class="btn_  btn_pos_debate btn_debate_pos_delete">삭제</div>
				<!--//btn_delete end-->
			</div>

			<!--/////////////////-->
			<ul class="wrap_debate" id="debateCommentList">
				<li class="wrap_debate_from">
					<form>
						<div class="card_profile form_debate_pos">
							<img class="img_card_profile img_card_pos" src="img/default.jpg" />
							<!--//img_card_profile end-->
							<div class="name_card_profile">가나다라</div>
							<!--//name_card_profile-->
						</div>
						<!--//card_profile card_profile_inder end-->
						<div class="wrap_debate_icon">
							<div class="far fa-thumbs-up icon_small_size"></div>
							<div class="far fa-thumbs-down icon_small_size"></div>
						</div>
						<textarea class="box_debate_form box_debate_pos"></textarea>
						<div class="btn_small_size color_yellow btn_debate_pos">등록</div>
					</form>
				</li>

			</ul>
			<!--//wrap_debate end-->
			<div class="paging">페이징 구간입니다</div>
			<!--//wrap_btn_more end-->

		</div>
		<!--//wrap_debate end-->


	</div>
	<!--//wrap_contents_tap end-->
	<!--// 토론 상세페이지 팝업-->

	<!--//템플릿-->
	<script type="text/template" id="reviewCardTmp">
    <li class="list_review">
        <div class="icon_upDon far fa-thumbs-up pos_updon_review"></div><!--//icon_upDon end-->
        <div>
        <div class="btn_ btn_reive_pos btn_delete_pos">삭제</div><!--//btn_delete end-->
        <div class="btn_ btn_reive_pos btn_declaration_pos">신고</div><!--//btn_delete end-->
        <div class="num_up btn_reive_pos num_upReview_pos">999</div><!--//num_up end-->
        <div class="btn_ btn_reive_pos btn_up">좋아요<i class="far fa-thumbs-up"></i></div>
        </div>
            <!--//btn_up end-->

        <div class="card_profile card_profile_pos">
            <div class="box_badge pos_bage_team"></div>
            <img class="img_card_profile img_card_pos" src="img/default.jpg" /><!--//img_card_profile end-->
            <div class="name_card_profile">가나다라</div><!--//name_card_profile-->
        </div><!--//card_profile card_profile_inder end-->
        <div class="text_review text_review_pos"></div><!--//text_review end-->
        <div class="text_review_date pos_review_date">XXXX년 XX월 XX일</div>
    </li><!--//list_review end-->
</script>
	<!--//cardTmp end-->

	<!--//템플릿-->


	<!--//템플릿-->
	<script type="text/template" id="debateCardTmp">
    <li class="wrap_debate_from">
        <div class="icon_upDon far fa-thumbs-up pos_debate_icon"></div><!--//icon_upDon end-->
        <div class="card_profile form_debate_pos">
            <img class="img_card_profile img_card_pos" src="img/default.jpg"/><!--//img_card_profile end-->
            <div class="name_card_profile">가나다라</div><!--//name_card_profile-->
        </div><!--//card_profile card_profile_inder end-->
        <div class="box_debate_text box_debate_pos"></div>
        <div class="btn_ btn_debate_pos">신고</div>
    </li>
</script>
	<!--//cardTmp end-->

	<!--//템플릿-->

	<!--//템플릿-->
	<script type="text/template" id="debatelistCard">
<li class="box_list_debute">
    <div class="icon_debate_size box_line fas fa-comment-alt"></div> <!--//icon_debate_size end-->
    <div class="mTItle_debate_size box_line hidden_text hidden_text">
        XXXXXXXXXXXXXXXXXXXXXXX
    </div><!--//mTItle_debate_size end-->
    <div class="writer_debate_size box_line hidden_text">
        XXX
    </div><!--//writer_debate_size end-->
    <div class="writer_debateDate_size box_line">
        XXXX년 XX월 XX일
    </div><!--//writer_debate_date end-->
    <div class="comment_size box_line fas fa-comments hidden_text">
        999
    </div><!--//writer_debate_date end-->
    <div class="icon_comment_size far fa-thumbs-up ">999</div>
    <div class="icon_comment_size pos_comment_down far fa-thumbs-down">999</div>
</li><!--//box_list_debute end-->
</script>
	<!--//cardTmp end-->

	<!--//템플릿-->
	<script type="text/template" id="inderReviewCardTmp">
<div class="wrap_list_inderEvaluation">
    <div class="icon_upDon far fa-thumbs-up pos_updon_inder"></div><!--//icon_upDon end-->

    <div class="wrap_inder_btn">
    <div id="deleteTest" class="btn_small_size color_bule btn_pos_inder">삭제</div><!--//btn_delete end-->
    <div class="num_up  btn_pos_inder">999</div><!--//num_up end-->
    <div class="btn_small_size color_bule btn_pos_inder">좋아요 <i class="far fa-thumbs-up"></i></div><!--//btn_up end-->
    </div>

    <div class="card_profile inderPostion">
        <div class="box_badge pos_bage_team"></div>
        <img class="img_card_profile img_card_pos" src="img/default.jpg"/><!--//img_card_profile end-->
        <div class="name_card_profile">가나다라</div><!--//name_card_profile-->
    </div><!--//card_profile end-->

    <div class="wrap_chart_area">
        <ul class="box_title">
            <li class="bar_title">그래픽</li>
            <li class="bar_title">사운드</li>
            <li class="bar_title">스토리</li>
            <li class="bar_title">난이도</li>
            <li class="bar_title">몰입감</li>

        </ul>
        <ul class="chart_area">
            <li class="bar_graph"></li>
            <li class="bar_graph"></li>
            <li class="bar_graph"></li>
            <li class="bar_graph"></li>
            <li class="bar_graph"></li>
        </ul>
    </div><!-- chart-area-->

    <div class="text_inder_card text_inderCard_pos ">
        상처만 커지는 걸 옆에 누운 널 볼 때마다
        따뜻했던 추억들을 왜 자꾸 더럽혀
        잘 지내고 있다가도 어김없이 찾아오면
        내 마음에 향수만 적시고 가
        이 밤의 깊은 숨결들을
        살며시 내게 녹이고 넌
        아무렇지 않게 떠나가
        잊을만하면 다시 날 찾아와
        지울만하면 널 또 찾아 헤메는데
    </div>
</div><!--//inderEvaluationListCard end-->
</script>
	<!--//템플릿-->

	<!--//템플릿-->
	<script type="text/template" id="questionListTmp">
<@ _.each(questions,function(question){
var flag =  "unlock";
var test = question.visibility.includes("N") ;
if(test){
	flag = "lock";
}
@>
    <li class="box_list_question" value="<@= question.no@>" data-value="<@=question.userNo@>" data-lock="<@=question.visibility@>">
        <div class="icon_debate_size box_line fas fa-<@= flag@>"></div> <!--//icon_debate_size end-->
        <div class="mTItle_debate_size box_line hidden_text hidden_text">
            <@= question.title@>
        </div><!--//mTItle_debate_size end-->
        <div class="writer_debate_size box_line hidden_text">
            <@= question.nickName@>
        </div><!--//writer_debate_size end-->
        <div class="writer_debateDate_size box_line">
            <@= moment(question.regdate).format('YYYY년MM월DD일') @>
        </div><!--//writer_debate_date end-->
    </li><!--//box_list_debute end-->
<@}) @>
</script>
	<!--//템플릿-->

	<script type="text/template" id="attackListTmp">
<@ _.each(attcks,function(attck){@>
    <div class="box_attack_writing">
        <div class="box_game_attack">
            <img class="img_attack" src="/img/attack/<@= attck.mainImg@>" width="100" height="100" alt="게임이미지"/>
            <br>
            <div class="title_game">
                <@= attck.gameTitle@>
            </div>
        </div>
        <div class="box_title_attack">
            <div class="title_attack"><a class="btn_title_go" href="xxxxx.jsp?no=<@= attck.no@>"><@= attck.title@></a></div>
            <div class="time_attack"><@=moment(attck.regdate).format('YYYY년MM월DD일')@></div>
            <div class="writer_attack"><@= attck.nickName@></div>
        </div>
        <div class="box_num_attack">
            <div >0</div>
            <div ><@= attck.views@></div>
            <div >0</div>
        </div>
    </div>
    <!--.box_attack_writing end-->
<@}) @>
</script>

	<script src="/js/moment-with-locales.js"></script>
	<script src="/js/tui-code-snippet.min.js"></script>
	<script src="/js/raphael.min.js"></script>
	<script src="/js/tui-chart.js"></script>
	<script src="/js/underscore-min.js"></script>

	<!--//에디터 사용-->
	<script src='/js/markdown-it.js'></script>
	<script src="/js/to-mark.min.js"></script>
	<script src="/js/codemirror.js"></script>
	<script src="/js/highlight.js"></script>
	<script src="/js/squire-raw.js"></script>
	<script src="/js/tui-editor-Editor.js"></script>

	<!--//ncc-->
	<script src="/js/Nwagon.js"></script>
	<script>
_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
		
var gameNo = ${gameOne.no };
var heartTmpl= _.template($("#heartNum").html());
var downTmpl= _.template($("#downNum").html());
/* 숫자 ajax */
function ajaxNum() {
	   	 $.ajax({
	 	    	url:"/ajax/heart/download/"+gameNo,
	 	    	type: "GET",
	 	    	dataType : "json",
	 	    	  error:function(){
	 	            alert("서버 정검중!")
	 	          },
	 	          success:function(json){
	 	        	 $("#gmaeHeartText div").remove();  
	 	        	 $("#downloadNum div").remove();  
	 	        	  
	 	        	 $("#gmaeHeartText").html(heartTmpl({test:json}));
	 	        	 $("#downloadNum").html(downTmpl({test:json}));
	 	          }
	 	    });//ajaxList end
	   }//questionList end
	   
	   ajaxNum();
	   
<c:if test="${loginUser.userNo !=null}">
	var loginUser = ${loginUser.userNo};
</c:if>

<c:if test="${inderReview!=null}">
//오각차트
var options = {
    'legend':{
        names: [
            '그래픽',
            '사운드',
            '스토리',
            '난이도',
            '몰입감'
        ]
    },
    'dataset': {
        title: '',
        values: [[
        	${inderReview.graphic},
        	${inderReview.story},
        	${inderReview.difficulty},
        	${inderReview.immersion},
        	${inderReview.sound}
        	]],
        bgColor: '#d6d1d1',  
        fgColor: '#0e47a1',
    },
    'chartDiv': 'Nwagon',
    'chartType': 'radar',
    'chartSize': { width: 300, height: 200 }
};
Nwagon.chart(options);
$('.accessibility').css('display','none');
$('.xAxis').css('display','none');
$('.Nwagon_radar').css('transform','rotate(-18deg)');
$('.chart_label').css({'transform':'rotate(18deg)',"font-size":"22px"});

function changeRadarSize(){
    var chart = document.getElementById("Nwagon");
    var chartSvg = chart.getElementsByTagName("svg");
    chartSvg[0].setAttribute("viewBox","-200 -150 400 300");
}
window.onload = changeRadarSize;  
</c:if>


/*클릭 이벤트*/
    $(".btn_select").on("click",function () {

        var test2 = $(this).index();
        $(".click_two").removeClass("click_two");
        $(".btn_select:nth-child("+(test2+1)+")").addClass("click_two");
    });
/*언더 스코어*/

/* var tmp = _.template($("#reviewCardTmp").html()); */
var tmp2 = _.template($("#debateCardTmp").html());
/* var tmp3= _.template($("#inderReviewCardTmp").html()); */
var tmp5= _.template($("#debatelistCard").html());
var questionListTmpl= _.template($("#questionListTmp").html());
var attackListTmpl= _.template($("#attackListTmp").html());
var questionOneTmpl= _.template($("#questionOne").html());
var replyTmpl= _.template($("#replyTmp").html());

/* for (var i = 0 ; i < 3 ; i++){
    $("#reviewListWrap").append(tmp());
}// template end */
for (var i = 0 ; i <3 ; i++){
    $("#debateCommentList").append(tmp2());
}// template end
/* for (var i = 0 ; i <4 ; i++){
    $(".wrap_list_inder").append(tmp3());
}// template end */
for (var i = 0 ; i <10 ; i++){
    $(".wrap_list_debute").append(tmp5());
}// template end

/*
 프로필 팀원 리스트 카드
* */
var spead2 = 0;
$('#leftProfileBtn').on('click',function () {
    if(spead2>=0){
        spead2 = 0;
    }else{
        spead2 += 500;
    $("#profilCardListWrap").css('left',spead2)
    }
})// leftProfileBtn end


$('#rightProfileBtn').on('click',function () {
    if(spead2 <=-1000)
    {
        spead2 = -1000
    }else{
        spead2 -= 500;
        $("#profilCardListWrap").css('left',spead2)
    }
})// leftProfileBtn end

/*
이미지 롤링
* */
var speed = 0;
$('#leftGameBtn').on("click",function () {

    if(speed >= 0){
        speed = 0
    }else {
        speed += 570;
        $(".wrap_simg").css('left',speed)
    }
});/*//leftGameBtn end*/

$("#rightGameBtn").click(function ()
{
    if(speed <= -570){
        speed = -570
    }else {
        speed -= 570;
        $(".wrap_simg").css('left',speed)
    }
}); /*rightGameBtn-click-end*/

/*텝*/
    $(".btn_tap").on("click",function () {

        var test2 = $(this).index();
        $(".click").removeClass("click");
        $(".tap").find(".btn_tap:nth-child("+(test2+1)+")").addClass("click");
        test2 = test2+2

        $(".on_gameDetail").removeClass("on_gameDetail");
        $(".tap:nth-child("+test2+")").addClass("on_gameDetail");

    });

    /*토론 시작 버튼*/
    $('#startDebateBtn').on("click",function () {
        $("#debateFormpopUp").css('display','block');
        $(".pop_up").css('display','block');
    });
    $("#debateCancelBtn").on("click", function () {
        $("#debateFormpopUp").css('display','none');
        $(".pop_up").css('display','none');
    });//#debateCancelBtn end
    $(".pop_up").click(function () {
        $(this).css('display','none');
        $("#debateFormpopUp").css('display','none');
    })
    $('#debateSuccessBtn').on('click',function () {
        $("#debateFormpopUp").css('display','none');
        $(".pop_up").css('display','none');
    });

/*문의 시작 버튼*/
    $('#startQuestionBtn').on("click",function () {
        $("#questionFormpopUp").css('display','block');
        $(".pop_up").css('display','block');
    });
    $("#questionCancelBtn").on("click", function () {
        $("#questionFormpopUp").css('display','none');
        $(".pop_up").css('display','none');
    });//#debateCancelBtn end
    $(".pop_up").click(function () {
        $(this).css('display','none');
        $("#questionFormpopUp").css('display','none');
    })

/*토론*/
    $('.box_list_debute').on('click',function () {
        $("#gameDebateView").css('display','block');
        $(".pop_up").css('display','block');
    });
    $(".pop_up").click(function () {
        $(this).css('display','none');
        $("#gameDebateView").css('display','none');
    })

/*이미지*/
    $('.simg_view').on('click',function () {
        var simgName = $(this).attr('src');
        $('#imgGamemTitle').attr('src',simgName);
       /* alert(simgName);*/
    })//

    //에디터 사용
    $('#editSection').tuiEditor({
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        height: '250px',
        language:"ko_KR"
    });

    
	    var editor = new tui.Editor({
        el: document.querySelector('#editSectionTwe'),
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        height: '250px',
        language:"ko",
        toolbarItems: [
            'heading','bold','italic','strike','divider',
            'hr','quote','divider',
            'ul','ol','task','divider',
            'table','link','divider'
        ]
    }); 

    /* 게임다운로드버튼 */
    $('#downBtn').on('click',function () {
      	alert("게임이 다운로드 되었습니다!");
      	ajaxNum();
    })
    /*  
    공략 리스트 ajax
    */
    
    function attackList(pageNo) {
   	 $.ajax({
 	    	url:"/ajax/attack/"+pageNo+"/list/"+gameNo,
 	    	type: "POST",
 	    	dataType : "json",
 	    	  error:function(){
 	              alert("서버 정검중!");
 	          },
 	          success:function(json){
 	      		$(".box_list_attack").html(attackListTmpl({attcks:json.list}));
       	     	$("#attackPage").html(json.paginate);
 	          }
 	    });//ajaxList end
   }//attackList end
  	
   attackList(1);
 
   $("#attackPage.paging").on("click",".paginate a",function(e) {
   	e.preventDefault();
   	var  no = $(this).attr("href");
   	var test = no.substring(no.length-1);
   	pageNo = test;
   	attackList(pageNo);
   });// end
   
   /* 
    문의ajax
   */
   function questionList(pageNo) {
	   	 $.ajax({
	 	    	url:"/ajax/question/"+pageNo+"/list/"+gameNo,
	 	    	type: "POST",
	 	    	dataType : "json",
	 	    	  error:function(){
	 	              alert("서버 정검중!")
	 	          },
	 	          success:function(json){
	 	      		$(".wrap_question_list").html(questionListTmpl({questions:json.list}));
	       	     	$("#questionPage").html(json.paginate); //호우
	 	          }
	 	    });//ajaxList end
	   }//questionList end
	   
	   questionList(1)
	   
	   $("#questionPage.paging").on("click",".paginate a",function(e) {
		   	e.preventDefault();
		 	var  no = $(this).attr("href");
		   	var test = no.substring(no.length-1);
		   	pageNo = test;
		    questionList(pageNo); 
		   }); 

	   /*문의*/
	   var noNum=0;
	   var listUserNo;
	   var listlock;
	   //호우!!
	   
	   <c:if test="${loginUser.userNo !=null}">
	   
	       $('.wrap_question_list').on('click','.box_list_question',function () {
	           listUserNo = $(this).data('value');
	           listlock = $(this).data('lock');
	           if(listlock=='Y' || loginUser == listUserNo){
	          		 var dataNo = $(this).attr('value');
			         $("#gameQuestionView").css('display','block');
			         $(".pop_up").css('display','block');
	          		 noNum = parseInt(dataNo)
	           		 questionOne();
		             //alert(noNum);
			         selectReply();
	           }else{
	        	   alert('게시글을 볼 수 없습니다.');	        	   
	           }
	       });
	       
	       $(".pop_up").click(function () {
	           $(this).css('display','none');
	           $("#gameQuestionView").css('display','none');
	       })
	        
	         /* 하트 이벤트 */
		    $('#heartbtn').on('click',function () {
		         insertGameHeart();
		    });
	    
		   //하트 인설트 에이젝스!!
		   	function insertGameHeart() {
		   	 $.ajax({
		 	    	url:"/ajax/heart/insert/"+gameNo+"/"+loginUser,
		 	    	type: "GET",
		 	    	dataType : "json",
		 	    	  error:function(){
		 	              alert("서버 정검중!")
		 	          },
		 	          success:function(json){
		 	        	  console.log(json.result);
		 	        	  if(json.result==1){
		 	        	  	 alert("하트 업업!!!");
		 	        		 $('#gameHeartBox').toggleClass('click_heart');
		 	        	  }else{
		 	        		 $('#gameHeartBox').toggleClass('click_heart');
		 	        	  }
		 	        	 ajaxNum();
		 	          }
		 	    });//ajaxList end
		   }//insertGameHeart end
		   
	    </c:if>

		//리뷰 좋아요 이벤트   
	    $('.btn_icon').on('click',function () {
	         $(".btn_click").removeClass("btn_click");
	         $(this).addClass("btn_click");
	     })
	 	$('.icon_small_size').on('click', function () {
	     $(".btn_click").removeClass("btn_click");
	     $(this).addClass("btn_click");
	 	})
	 	
	 	
	/*  
		문의 상세
	*/
	function questionOne() {
	   	 $.ajax({
	 	    	url:"/ajax/question/detail/"+noNum,
	 	    	type: "POST",
	 	    	dataType : "json",
	 	    	  error:function(){
	 	              alert("서버 정검중!")
	 	          },
	 	          success:function(json){
	 	      		$(".testQue1").html(questionOneTmpl({questionOne:json}));
	 	      		//주석 투
	 	      		if(loginUser != listUserNo){
	 	      			//#updateQuestionBtn, #deleteQuestionBtn,
	 	      			$('#updateQuestionBtn').css('display','none');
	 	      			$('#deleteQuestionBtn').css('display','none');
	 	      		}
	 	          }
	 	    });//ajaxList end
	   }//questionOne end
	   
		/*  
		댓글 이벤트  주석
		*/
	function selectReply() {
	   	 $.ajax({
	 	    	url:"/ajax/question/detail/reply",
	 	    	type: "GET",
	 	    	dataType : "json",
	 	   		data:{
 	    		"contentsNo" : gameNo , 
 	    		"seqNo" : noNum
 	    		},
	 	    	error:function(){
	 	              alert("서버 정검중!")
	 	          },
	 	          success:function(json){
	 	        		$(".testQue2").empty();  
		 	      		$(".testQue2").html(replyTmpl({replys:json})); 
	 	          }
	 	    });//ajaxList end
	   }//questionOne end
	   
	   /* 
	   	문의 하기 ajax
	   */
	var title;
    var contentsT;
    var lock;
	function insertQuestion() {
	   	 $.ajax({
	 	    	url:"/ajax/question/insert",
	 	    	type: "POST",
	 	    	data:{
	 	    		"title" : title , 
	 	    		"contents" : contentsT , 
	 	    		"visibility" : lock , 
	 	    		"userNo" : loginUser , 
	 	    		"gameNo" : gameNo , 
	 	    	},
	 	    	dataType : "json",
	 	    	  error:function(){
	 	              alert("서버 정검중!")
	 	          },
	 	          success:function(json){
				       $("#questionFormpopUp").css('display','none');
				       $(".pop_up").css('display','none');
				       editor.setValue("");
				       $("#questionTitle").val("");
				       questionList(1);
	 	        	  alert("${gameOne.gameName} 문의가 등록 되었습니다.");
	 	          }
	 	    });//ajaxList end
	   }//questionOne end
	   
	    $("#questionInputlBtn").click(function () {
		       var editorVal = editor.getValue();
		       var radioVal = $('input[name="lock"]:checked').val();
		       var titleVal = $("#questionTitle").val();
		       
		       if(radioVal==null){
		    	   alert("다시 입력하세요...");
		       }else{
		    	       title = titleVal;
				       lock = radioVal;
				       contentsT = editorVal;
				       insertQuestion();
				       $(".box_list_question").remove();
		       }
	    });//click() end
	    
	    /* 문의 삭제 버튼*/
	    
		$('#gameQuestionView').on('click','.wrap_debate .wrap_btn_btn #deleteQuestionBtn',function () {
			deleteQuestion();
	    });
		function deleteQuestion() {
		   	 $.ajax({
		 	    	url:"ajax/deleteQuestion.jsp",
		 	    	type: "POST",
		 	    	data:{
		 	    		"noStr" : noNum 
		 	    	},
		 	    	dataType : "json",
		 	    	  error:function(){
		 	              alert("서버 정검중!")
		 	          },
		 	          success:function(json){
		 	        	  $(".pop_up").css('display','none');
		 		          $("#gameQuestionView").css('display','none');
					      questionList(1);
		 	        	  alert("문의가 삭제 되었습니다.")
		 	          }
		 	    });//ajaxList end
		   }//deleteQuestion end
		   
		   /* 
		   문의 업데이트
		   */
			$('#gameQuestionView').on('click','.wrap_debate .wrap_btn_btn #updateQuestionBtn',function () {
		        $("#gameQuestionView").css('display','none');
		        $("#questionFormpopUp").css('display','block');
		        alert("업데이트");
		    });
		   
</script>

</body>
</html>