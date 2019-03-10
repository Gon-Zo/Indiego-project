<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로젝트만들기</title>
<link rel="stylesheet" href="/css/project_page.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<link rel="stylesheet"
	href="/css/daterangepicker.css" />
<link rel="stylesheet" href="/css/codemirror.css">
<link rel="stylesheet" href="/css/tui-editor.min.css">
<link rel="stylesheet" href="/css/tui-editor-contents.min.css">
<link rel="stylesheet" href="/css/tui-color-picker.min.css">
<%@ include file="/WEB-INF/template/link.jsp"%>
</head>
<body>

	<%@ include file="/WEB-INF/template/header.jsp"%>
	<div id="contents">



		<div id="projectTop">
			<form>
				<div id="projectImgAera">
					<i class="fas fa-plus"></i> <input id="projectImgUpload"
						type="file" title="프로젝트 대표이미지 변경하기" />

					<!--  	<canvas id="projectImg" width="150" height="150"></canvas>-->
					<img class="project_img" src="/img/project/${project.image }"
						width="150" height="150" />
				</div>

				<span id="projectTitleInpAera"> <label for="projectTitleInp"
					class="inp"> <input type="text" id="projectTitleInp"
						placeholder="&nbsp;" value="${project.title }"> <span
						class="label">프로젝트명</span> <span class="border"></span>
				</label>
				</span>

				<!--<c:if test="${loginUser.userNo!=project.userNo }">disabled</c:if>-->
				<div id="projectBookmarkAera">
					<i class="far fa-bookmark"></i><i
						class="fas fa-bookmark on_bookmark"></i>
				</div>
				<input content="프로젝트기간" type="button" name="datefilter"
					value="${project.startDate}~${project.endDate}" class="date_range" />

				<%--프로젝트장만 본다 --%>

				<%--	<c:if test="${loginUser.userNo.equals(project.userNo) }"> --%>
				<div class="visibility_area">


					<div class="label">공개여부</div>
					<label for="open"><input type="radio" name="visibility"
						value="Y" id="open"
						<c:if test="${project.visibility=='Y' }">checked</c:if>>공개</label>
					<label for="notOpen"> <input type="radio" name="visibility"
						value="N" id="notOpen"
						<c:if test="${project.visibility=='N' }">checked</c:if>>비공개
					</label>
				</div>


				<span id="personLimitAera"> <label for="personLimit"
					class="inp"> <input type="number" id="personLimit"
						placeholder="&nbsp;" value="${project.maxPersonnel}"> <span
						class="label" id="personLabel">참여제한인원</span> <span class="border"></span>
				</label>
				</span>
				<button id="supportStatusBtn">지원현황</button>
				<%-- 	</c:if>--%>

				<div id="projectPersonList">
					<ul>
						<c:forEach items="${projectTeam }" var="teamUser">
							<li><a href=""><img class="project person"
									src="/${teamUser.profileImg }"></a>
								<div class="person_info">
									<div>연락처:${teamUser.phoneNum }</div>
									<div>이메일:${teamUser.email }</div>
									<div>
										<a href="">경고하기${teamUser.userNo }</a>
									</div>
									<form action="/project/${teamUser.projectNo }/${teamUser.userNo }/deleteTeamUser" method="post">
										<input type="hidden" name="_method" value="DELETE">
										<button>강퇴하기</button>
									</form>
								</div></li>
						</c:forEach>
						<li><a class="add_person" title="프로젝트 지원하기">+</a></li>
					</ul>
				</div>
				<!--projectPersonList-->
		</div>
		<!--projectTop-->
		<div id="projectRoadMapArea">

			<div id="gameAttrArea">
				<span id="gameTitle"> <label for="gameTitleInp" class="inp">
						<input type="text" id="gameTitleInp" placeholder="&nbsp;"
						value="${project.gameTitle }"> <span id="gameTitleLabel">게임명</span>
						<span class="border"></span>
				</label></span>

				<div id="gameSystemAera">
					<label id="gameSystemLabel" for="gameSystemCategory"> <span>시스템</span>
						<select id="gameSystemCategory">
							<option class="option" value="P"
								<c:if test="${project.system=='P'}"> selected</c:if>>PC</option>
							<option class="option" value="M"
								<c:if test="${project.system=='M'}"> selected</c:if>>MOBILE</option>
					</select>
					</label>
				</div>
				<!-- gameSystemAera -->


				<div id="gameGenreAera">
					<label id="gameGenreLabel" for="gameGenreCategory"> <span>장르</span>
						<select id="gameGenreCategory">
							<c:forEach items="${genres}" var="genre">
								<c:choose>
									<c:when test="${project.genreNo==genre.no }">
										<option value="${genre.no}" selected>${genre.title }</option>
									</c:when>
									<c:otherwise>
										<option value="${genre.no}">${genre.title }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>

					</select>
					</label>
				</div>
				<!--gameGenreAera  -->



				<div id="progressAera">
					<div id="progress">진행률</div>
					<div id="progressPercent"><a href="/project/${project.no }/upload" class="upload_btn">업로드</a></div>
				</div>
				<!-- progressAera -->


			</div>
			<!--gameAttrArea-->

			<div class="title_aera">
				<div id="legend">
					<div>
						<span class="legend_icon ing"></span>현재진행정도
					</div>
					<div>
						<span class="legend_icon plus"></span>프로세스추가
					</div>
				</div>
				<!--legend  -->

				<button class="left move_btn">
					<i class="fas fa-angle-left"></i>
				</button>
				<button class="right move_btn">
					<i class="fas fa-angle-right"></i>
				</button>
				<ul class="road_map">

					
				</ul>
			</div>
			<!--title aera-->

			<button class="milestone_btn">마일스톤보기</button>
			<button class="check_btn">체크리스트보기</button>
		</div>
		<!--projectRoadMapArea-->
		<div id="diaryArea">
			<span id="projectDiaryTap">프로젝트일지</span> <span id="updateDiaryTap">런칭이후</span>
			<div class="project_diary show2">
				<ul class="show_step_area">

					<li>
						<div class="select_step">
							<div class="sos_check">
								<p>SOS</p>
							</div>
							<div class="step_progress">
								<p>0%</p>
							</div>
							<div class="step_title">아이디어기획</div>
						</div>
						<div class="step_show"></div>
						<div class="attachment_show">
							<dl>
								<dt>
									<img src="/img/profile_default.png">
								</dt>
								<dd>
									<div>
										<em> 브레인 스토밍.jpg</em>
									</div>
								</dd>
							</dl>
						</div> <!--attachment_show-->
						<div class="step_re">
							<form class="form_leave">
								<textarea class="inp_content"></textarea>
								<!-- .inp_content end -->
								<div class="btn_registration">
									<button class="btn_small2" type="button">쓰기</button>
								</div>
								<!-- .btn_registration end -->
							</form>
							<!-- form end -->
							<dl>
								<dt>
									<a><img src="/img/profile_default.png" width="50">닉네임<img
										class="badge" src="" width="5px"></a>
								</dt>
								<dd>댓글내용</dd>
							</dl>
							<dl>
								<dt>
									<a><img src="/img/profile_default.png" width="50">닉네임<img
										src="" width="5px"></a>
								</dt>
								<dd>댓글내용</dd>
							</dl>
						</div>
					</li>
				</ul>
				<!--show_step_area-->
				<button class="add_diary">+</button>
			</div>
			<!--projectDiary-->
			<div class="update_diary">
				<div>
					<a class="_list">문의글보기</a>
				</div>
				<div class="show_update_note_area">
					<form action="" method="">
						<input class="update_note_title" placeholder="제목입력" />

						<div class="update_wirte"></div>
						<button type="button" class="update_note_save_btn">등 록</button>
					</form>
				</div>
				<!--show_update_note_area-->
				<dl>
					<dt>업데이트 var1</dt>
					<dd>sdfjsdkfjklsdjkjklsdf</dd>
					<a class="delete_update" href="">삭 제</a>
				</dl>
			</div>
			<!--update_diary-->

		</div>
		<!--diaryArea-->

	</div>
	<!--diaryArea-->

	</div>
	<!--contents-->
	<%@ include file="/WEB-INF/template/footer.jsp"%>
	<div class="status popup">
		<span class="project_status tap">프로젝트 지원현황</span> <span
			class="sos_status tap">SOS 지원현황</span>
		<div class="project_status area">
			<ul>
				<li><a href=""><img class="profile"
						src="img/profile_default.png"></a> <span>닉네임<span><img
							src=""></span></span> <span class="status_date">1110-12-03</span>
					<button class="show_portfolio_btn">포트폴리오 보기</button>
					<button class="ok_btn">수락</button>
					<button class="cancal_btn">거절</button></li>
				<li><a href=""><img class="profile"
						src="img/profile_default.png"></a> <span>닉네임<span><img
							src=""></span></span> <span class="status_date">1110-12-03</span>
					<button class="show_portfolio_btn">포트폴리오 보기</button>
					<button class="ok_btn">수락</button>
					<button class="cancal_btn">거절</button></li>
				<li><a href=""><img class="profile"
						src="img/profile_default.png"></a> <span>닉네임<span><img
							src=""></span></span> <span class="status_date">1110-12-03</span>
					<button class="show_portfolio_btn">포트폴리오 보기</button>
					<button class="ok_btn">수락</button>
					<button class="cancal_btn">거절</button></li>
				<li><a href=""><img class="profile"
						src="img/profile_default.png"></a> <span>닉네임<span><img
							src=""></span></span> <span class="status_date">1110-12-03</span>
					<button class="show_portfolio_btn">포트폴리오 보기</button>
					<button class="ok_btn">수락</button>
					<button class="cancal_btn">거절</button></li>
			</ul>
		</div>
		<!--project_status area-->
		<div class="show_portfolio area">
			<div>
				<div class="exit_btn">X</div>
				<ul>
					<li>포트폴리오1</li>
				</ul>
			</div>
		</div>

		<div class="sos_status area show">
			<ul>
				<li><img class="profile" src="/img/profile_default.png">
					<span>닉네임<span><img src=""></span></span> <span
					class="status_date">1110-12-03</span>
					<button class="show_help_btn">도움내용 보기</button>
					<button class="ok_btn">수락</button>
					<button class="cancal_btn">거절</button></li>
			</ul>
		</div>
		<div class="show_help area">
			<div>
				<div class="exit_btn">X</div>
				<ul>
					<li>포트폴리오1</li>
				</ul>
			</div>
		</div>
	</div>
	<!--status popup-->
	<div class="support popup">
		<div class="popup_title_area">프로젝트 지원하기</div>

		<form method="get" action="">
			<span>포트폴리오 정보 <label class="switch"> <input
					id="portfolioCheck" type="checkbox"> <span
					class="slider round"></span>
			</label>
				<p class="portfolio_visibility" style="display: none;">비공개</p>
				<p class="portfolio_visibility">공개</p></span> </span>

			<div>
				<span>경력 정보 <label class="switch"> <input
						id="careerCheck" type="checkbox"> <span
						class="slider round"></span>
				</label>
					<p class="career_visibility" style="display: none;">비공개</p>
					<p class="career_visibility">공개</p>
				</span>
			</div>

			<button class="support_btn">지원하기</button>
		</form>
	</div>
	<!--support popup-->
	<div class="milestone popup">
		<div class="popup_title_area">마 일 스 톤</div>
		<div class="popup_legend_area">
			<ul>
				<li><div class="sample_one bar"></div> <span>기획</span></li>
				<li><div class="sample_two bar"></div> <span>개발</span></li>
				<li><div class="sample_three bar"></div> <span>런칭</span></li>
			</ul>
		</div>
		<div id="tableAera">
			<table>
				<tr>
					<th>단 계</th>
					<th>1주차</th>
					<th>2주차</th>
					<th>3주차</th>
					<th>4주차</th>
					<th>5주차</th>
					<th>6주차</th>
					<th>7주차</th>
					<th>8주차</th>
					<th>9주차</th>
					<th>10주차</th>
					<th>11주차</th>
					<th>12주차</th>

				</tr>
				<tr>
					<th><span>아이디어기획</span></th>
					<td class="milestone_one_checkd"></td>
					<td colspan="11"></td>
				</tr>
				<tr>
					<th><span>컨셉기획서작성</span></th>
					<td></td>
					<td class="milestone_one_checkd"></td>
					<td colspan="10"></td>
				</tr>
				<tr>
					<th><span>프로토 타이핑</span></th>
					<td></td>
					<td colspan="2" class="milestone_one_checkd"></td>
					<td colspan="9"></td>
				</tr>
				<tr>
					<th><span>디자인</span></th>
					<td colspan="2"></td>
					<td colspan="8" class="milestone_two_checkd"></td>
				</tr>
				<tr>
					<th><span>사운드</span></th>
					<td colspan="8"></td>
					<td colspan="3" class="milestone_two_checkd"></td>
				</tr>
				<tr>
					<th><span>기본플레이로직</span></th>
					<td colspan="5"></td>
					<td colspan="6" class="milestone_two_checkd"></td>
				</tr>
				<tr>
					<th><span>UI구현</span></th>
					<td colspan="6"></td>
					<td colspan="3" class="milestone_two_checkd"></td>
				</tr>
				<tr>
					<th><span>DB설계구축</span></th>
					<td colspan="6"></td>
					<td colspan="3" class="milestone_two_checkd"></td>
				</tr>
				<tr>
					<th><span>디버깅</span></th>
					<td colspan="9"></td>
					<td colspan="2" class="milestone_two_checkd"></td>
				</tr>
				<tr>
					<th><span>업로드</span></th>
					<td colspan="11"></td>
					<td class="milestone_three_checkd"></td>
				</tr>
			</table>
		</div>
	</div>
	<!--milestone popup-->
	<div class="check_list popup">
		<div class="popup_title_area">체크리스트</div>
		<table class="check_list_up">
			<thead>
				<tr>
					<th>연 번</th>
					<th>단계명</th>
					<th>할 일</th>
					<c:forEach items="${projectTeam }" var="teamUser">
						<th><img src="/${teamUser.profileImg }"
							class="check_list profile"></th>
					</c:forEach>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${projectCheck }" var="check">
					<tr>
						<td>${check.no }</td>
						<td>${check.title }</td>
						<td><div>${check.content }</div></td>
						<c:forEach items="${projectTeam }" var="teamUser">
							<c:choose>
								<c:when test="${teamUser.userNo.equals(check.userNo) }">
									<td><input class="check_box" type="checkbox"></td>
								</c:when>
								<c:otherwise>
									<td><input class="check_box" type="checkbox" hidden></td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button>저장하기</button>
	</div>
	<!--check_list popup-->
	<div class="project_write popup">
		<div class="wirte area">
			<div class="wirte_top_area">
				<!--<form  id="" action="">-->
				<span class="wirte_selet_aera"> <label id="wirteSeletLabel"
					class="field" for="wirteSeletCategory" data-value=""> <span>단계명</span>
						<div id="wirteSeletCategory" class="psuedo_select"
							name="imgCategory">
							<span class="selected">아이디어기획</span>
							<ul class="img_category_options" class="options">
								<li class="option" data-value="PC">아이디어기획</li>
								<li class="option" data-value="MOBILE">컨셉기획서작성</li>
								<li class="option" data-value="MOBILE">프로토타이핑</li>
								<li class="option" data-value="MOBILE">디자인</li>
								<li class="option" data-value="MOBILE">사운드</li>
								<li class="option" data-value="MOBILE">기본플레이 로직설계</li>
								<li class="option" data-value="MOBILE">UI구현</li>
								<li class="option" data-value="MOBILE">DB 설계&구축</li>
								<li class="option" data-value="MOBILE">디버깅</li>
							</ul>
						</div>
				</label>
				</span>
				<button class="definitione_btn" type="button">?</button>
				<input content="프로젝트기간" type="button" name="datefilter" value=""
					class="date_range" />
				<div class="sub_step area">
					<ul>
						<li><button type="button" class="add_title">+</button></li>
						<li><span class="road_map_step">브레인스토밍</span>
							<div class="btn_hover area">
								<button type="button" class="remove_btn">단계삭제</button>
								<button type="button" class="sos_btn">sos요청</button>
							</div></li>
						<li><span class="road_map_step">6-3-5방법</span>
							<div class="btn_hover area">
								<button type="button" class="remove_btn">단계삭제</button>
								<button type="button" class="sos_btn">sos요청</button>
							</div></li>
						<li><span class="road_map_step">명목적 집단 기법</span>
							<div class="btn_hover area">
								<button type="button" class="remove_btn">단계삭제</button>
								<button type="button" class="sos_btn">sos요청</button>
							</div></li>
					</ul>
					<div id="downBtn" title="세부단계내용 보기">
						<i class="fas fa-angle-down"></i>
					</div>
				</div>
			</div>
			<!--wirte_top_area-->
			<div class="edit area">
				<form>
					<div class="sub_step_title">브레인스토밍</div>
					<button type="button" class="definitione_btn">?</button>
					<div class="sub_step_wirte"></div>
					<input type="file">
					<button class="wirte_btn">작성하기</button>
				</form>
			</div>
			<div class="check_list area">
				<div class="check_list_title">체크리스트</div>
				<table class="check_list_up">
					<thead>
						<tr>
							<th>할 일</th>
							<th><img src="/img/profile_default.png"
								class="check_list profile"></th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label for="checkTitleInp" class="inp"> <input
									type="text" id="checkTitleInp" placeholder="할일을 입력해주세요."
									autocomplete="off"> <span class="label">할일을
										입력해주세요.</span> <span class="border"></span>
							</label></td>
							<td><input class="check_box" type="checkbox"></td>
							<td>
								<button>등 록</button>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
			<button type="button" class="project_write_save_btn">저장</button>
			<!--</form>-->
		</div>
		<!--wirte area-->
	</div>
	<!--project_write popup-->
	<div class="update_write popup">
		<div class="wirte area">



			<!--</form>-->
		</div>
		<!--wirte area-->
	</div>
	<!--project_write popup-->
	<div class="sos_request popup">
		<form action="" >
			<div class="popup_title_area">sos 요청하기</div>
			<textarea></textarea>
			<button>요청하기</button>
		</form>
	</div>
	<!--sos_request popup-->
	<div class="step_guide popup">
		<div class="popup_title_area">아이디어 기획</div>
		<button type="button">X</button>
		<div>
			<dl>
				<dt>단계정의</dt>
				<dd>개발을 하고자하는 게임이 명확히 없을때 구체적혹은 대략적 아이디어를 캐치하기 위한 작업입니다.</dd>
				<dt>사용툴</dt>
				<dd>문서파일,도화지 등 필기가능한곳 어디든</dd>
				<dt>결과물</dt>
				<dd>브레인스토밍,6-3-5 방법,명목적 집단 기법 등</dd>
				<dt>예 시</dt>
				<dd>각 세부사항 첨부이미지 참조</dd>
			</dl>

		</div>
	</div>
	<!--step_guide popup-->
	<div class="sub_step_guide popup">
		<div class="popup_title_area">브레인스토밍</div>
		<button type="button">X</button>
		<div>
			<dl>
				<dt>단계정의</dt>
				<dd>
					통상적으로 Ideation을 목적으로 하는 모든 미팅을 Brainstorming 이라고 부르기도 함.<br>
					브레이밍 스토밍의 4가지 원칙<br>
					<p>1. 아이디어의 양을 늘리는데 집중</p>
					<br>
					<p>2. 비판은 보류</p>
					<br>
					<p>3. 별난 아이디어 환영</p>
					<br>
					<p>4. 아이디어에 더하고 합한다.</p>
					<br>
				</dd>
				<dt>사용툴</dt>
				<dd>문서파일,도화지 등 필기가능한곳 어디든</dd>
				<dt>결과물</dt>
				<dd>이미지,문서파일 등</dd>
				<dt>예 시</dt>
				<dd>
					<img src="/img/Brainstorming.jpg" width="300">
				</dd>
			</dl>

		</div>
	</div>
	<!--sub_step_guide popup-->
	<%--<div class="progress_score">0%</div> --%>
	<div id="popupBg"></div>
	<!--popupBg-->
	<script type="text/template" id="parentsTmp">
					<li><button class="add_title">+</button></li>


					<@ _.each(list,function(parentStep){ @>
						<li><div class="dino_area">
								<img src="/img/dino.png" width="65px" />
							</div> <span class="road_map_step"> <@=parentStep.title @> 
								<div class="btn_hover area">
								<form action="" method="post">
								<input type="hidden" name="_method" value="DELETE"/>
									<button class="remove_btn">단계삭제</button>
									</form>
									<a class="sos_btn">SOS요청</a>
								</div>
						</span>
						<form action="/project/projectNo/insertStep" method="post"/>
						<input type="hidden" name="_method" value="PUT"/>
						<input type="hidden" name="title" value=""/>
							<button class="add_title">+</button></form></li>
					<@}) @>
					<li><a href="/project//upload" class="upload_btn">업로드</a></li>
	</script>
	
		<script type="text/template" id="parentStepTmp">
					<li><button class="add_title">+</button></li>
						<li><div class="dino_area">
								<img src="/img/dino.png" width="65px" />
							</div> <span class="road_map_step"> <@=parentStep.title @> 
								<div class="btn_hover area">
								<form action="" method="post">
								<input type="hidden" name="_method" value="DELETE"/>
									<button class="remove_btn">단계삭제</button>
									</form>
									<a class="sos_btn">SOS요청</a>
								</div>
						</span>
						<form action="/project/projectNo/insertStep" method="post"/>
						<input type="hidden" name="_method" value="PUT"/>
						<input type="hidden" name="title" value=""/>
							<button class="add_title">+</button></form>
</li>
			
	</script>
	
	
	<script src="/js/moment.min.js"></script>
	<script src="/js/daterangepicker.min.js"></script>
	<script src="/js/index.js"></script>
	<script src="/js/tui-code-snippet.min.js"></script>
	<script src='/js/markdown-it.js'></script>
	<script src="/js/to-mark.min.js"></script>
	<script src="/js/codemirror.js"></script>
	<script src="/js/highlight.js"></script>
	<script src="/js/squire-raw.js"></script>
	<script src="/js/tui-editor-Editor.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/markdown-it.js"></script>
	<script>
	_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
			};
		var oldTitle = '${project.title}';
		var projectNo = ${project.no};
		var oldGameTitle = '${project.gameTitle}';
		var oldmaxPersonnel = ${project.maxPersonnel};
		var oldVisibility = '${project.visibility}';
		var oldStartDate = '${project.startDate}';
		var oldEndDate = '${project.endDate}';
		var oldImage = '${project.image}';
		var oldSystem = '${project.system}';
		var oldGenreNo = ${project.genreNo};
	</script>
		<script src="/js/project_page.js"></script>



</body>
</html>