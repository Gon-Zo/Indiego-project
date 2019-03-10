<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="loginBodyMask"></div>


	<div class="login_background_window">
		<!-- 로그인폼 -->
		<div id="loginWrap">
			<img class="img_logo" src="/img/logo.png">
			<!-- .img_logo end -->
			<div class="content">
				<form action="/session" method="post">
					<div>
						<input class="inp_id" name="id" placeholder="아이디">
					</div>
					<!-- .inp_id end -->
					<div>
						<input class="inp_pwd" name="pwd" type="password" placeholder="비밀번호">
					</div>
					<!-- .inp_pwd end -->
					<div class="btn_login">
						<button class="btn_small">로그인</button>
					</div>
					<!-- .btn_login end -->
				</form>
			</div>
			<div class="content_menu_wrap">
				<!-- .content end -->
				<div class="content_menu">아이디 찾기 |</div>
				<!-- .content_menu end -->
				<div class="content_menu2">비밀번호 찾기 |</div>
				<!-- .content_menu2 end -->
				<div class="content_menu3" onclick = "location.href = 'join_membership_Form.jsp' ">회원가입</div>
				<!-- .content_menu3 end -->
			</div>
			<!-- .content_menu_wrap end -->
		</div>
		<!-- #loginWrap end -->


		<!-- 아이디 및 비밀번호 찾기 상단 탭 -->
		<div id="idPwdWrap">
			<ul class="tabs">
				<li class="active btn_big find" rel="tab1">아이디 찾기</li>
				<!-- .tab-link current end -->
				<li class="btn_big find" rel="tab2">비밀번호 찾기</li>
				<!-- .tab-link end -->
			</ul>
			<!-- .tabs end -->


			<!-- 아이디 찾기 탭 -->
			<div id="tab1" class="tab_content current">
				<form class="content_form">
					<div>
						<input class="inp_nickname" name="" placeholder="닉네임">
					</div>
					<!-- .inp_nickname end -->
					<div>
						<input class="inp_mail" type="text" name="email1" value=""
							placeholder="이메일" />
						<!-- .inp_mail end -->
						@ <input class="inp_mail2" type="text" name="email2" value=""
							ReadOnly="true" />
						<!-- .inp_mail2 end -->
						<select class="select_mail" name="emailCheck"
							onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
							<option value="notSelected">::선택하세요::</option>
							<option value="etc">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="empal.com">empal.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="msn.com">msn.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="korea.com">korea.com</option>
							<option value="kornet.net">kornet.net</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="kebi.com">kebi.com</option>
							<option value="orgio.net">orgio.net</option>
							<option value="paran.com">paran.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<!-- .select_mail end -->
					</div>
					<div class="btn_mail">
						<button class="btn_small1">이메일로 아이디 전송</button>
					</div>
					<!-- .btn_mail end -->
				</form>
				<!-- .content_form end -->
			</div>
			<!-- #tab1 .tab_content current end -->


			<!-- 비밀번호 찾기 탭 -->
			<div id="tab2" class="tab_content current2">
				<form class="content_form2">
					<div>
						<input class="inp_id2" name="" placeholder="아이디">
					</div>
					<!-- .inp_id2 end -->
					<div>
						<input class="inp_nickname2" name="" placeholder="닉네임">
					</div>
					<!-- .inp_nickname2 end -->
					<div>
						<input class="inp_mail3" type="text" name="email3" value=""
							placeholder="이메일" />
						<!-- inp_mai3 end -->
						@ <input class="inp_mail4" type="text" name="email4" value=""
							ReadOnly="true" />
						<!-- inp_mail4 end -->
						<select class="select_mail2" name="emailCheck"
							onchange="SetEmailTail2(emailCheck.options[this.selectedIndex].value)">
							<option value="notSelected2">::선택하세요::</option>
							<option value="etc2">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="empal.com">empal.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="msn.com">msn.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="yahoo.com">yahoo.com</option>
							<option value="korea.com">korea.com</option>
							<option value="kornet.net">kornet.net</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="kebi.com">kebi.com</option>
							<option value="orgio.net">orgio.net</option>
							<option value="paran.com">paran.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<!-- .select_mail2 end -->
					</div>
					<div class="btn_mail2">
						<button class="btn_small1">이메일로 비밀번호 전송</button>
					</div>
					<!-- .btn_mail2 end -->
				</form>
				<!-- .content_form2 end -->
			</div>
			<!-- #tab2 .tab_content current2 end -->
		</div>
		<!-- #idPwdWrap end -->
	</div>
	<!-- login, id, pwd, find end -->




	<div id="header">
		<div id="headerArea">
			<a href=""><img class="header logo" src="/img/logo.png"
				alt="로고이미지"></a>
				<c:choose>
				<c:when test="${loginUser==null}">
			<div id="loginBeforeArea">
				<button class="login btn" >로그인</button>
				<button class="join btn" onclick="location.href='join_membership_Form.jsp'">회원가입</button>
			</div><!--btnArea -->
			</c:when>
			<c:otherwise>
			
			<div id="loginAfterBtnArea">
				<i id="creatorHome" class="fas fa-desktop"><a href=""></a></i> <i
					id="newsPide" class="far fa-newspaper"><a href=""></a></i> <i
					id="bell" class="far fa-bell"><a href=""></a></i>
				<div id="bellDropDownBox">
					<!--<ul>-->
					<!--<li><a>1</a></li>-->
					<!--<li><a>2</a></li>-->
					<!--<li><a>3</a></li>-->
					<!--<li><a>4</a></li>-->
					<!--</ul>-->
				</div>
				<a href="/profile/${loginUser.userNo }">
				<img id="headerProfile" src="/${loginUser.profileImg}" alt="프로필이미지">
				</a>
				<i id="dropDownBtn" class="fas fa-sort-down"></i>
				<div id="dropDownBox">
					<ul>
						<li><a href="new_profile_main_page.jsp">프로필페이지</a></li>
						<li><a>장바구니</a></li>
						<li><a id="A">크리에이터 모드</a></li>
						<!--<li><a>유저 모드</a></li>-->
						<li><form action="/session" method="post"><input type="hidden" name="_method" name="DELETE"><button class="header_btn_logout">로그아웃</button></form></li>
					</ul>
				</div>
				<!--dropDownBox-->
			</div>
			<!--loginAfterBtnArea-->
			</c:otherwise>
		</c:choose>
			<ul class="header_menu">
				<li><a id="gameBtn" class="on" href="gameMainPage.jsp">게임</a></li>
				<li><a id="attackBtn">공략</a></li>
				<li><a id="helpBtn">HELP</a></li>
				<li><a id="freeBoardBtn">자유게시판</a></li>
				<li><a id="projectBtn">프로젝트</a></li>
			</ul>
			<!--header_menu -->


		</div>
		<!--headerArea-->


	</div>
	<!--header-->
	<div class="header_menu_back"></div>