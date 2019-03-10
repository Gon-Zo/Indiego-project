

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
<link href="/img/favicon/favicon.ico" rel="icon" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/profile_main_page.css" />
<link rel="stylesheet" href="/css/paging.css" />

<%@ include file="/WEB-INF/template/link.jsp"%>
<style>
#guestBookBox {
	display: none;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/template/header.jsp"%>
	<div class="wrap">

		<div class="box_profile_title">

			<!--<div class="slide_bar"></div>-->
			<div class="box_profile">
			
			<c:if test="${loginUser.userNo == user.userNo }">
				<label>
				<button class="btn_profile_edit">+</button>			
				<input id="profileInput" type="file" name="profileInput"
					placeholder="이미지" class="screen_out">
				</label>
			</c:if>
				<img src="/${user.profileImg }" width="200" height="200" id="profileCanvas" />
			</div>
			<!--#profileImgBox end-->
			<div class="box_profile" id="profileNameBox">
			${user.nickName }
				<img class="img_profile_image" src="/img/badge/${mainBadge.image }" />
			</div>
			<!--#profileNameBox end-->

			<div class="box_follow">
				<div class="box_follow_two" id="followerBox">
					팔로워<br>
					<br> <a class="follow_num" href="">${followerCnt}</a>
				</div>
				<!--#followerBox end-->
				<div class="box_follow_two" id="followingBox">
					팔로잉<br>
					<br> <a class="follow_num" href="">${followCnt}</a>
				</div>
				<!--#followingBox end-->
				<c:if test="${loginUser!=null&&(loginUser.userNo!=user.userNo)}">
				
				<c:choose>
				<c:when test="${isFollowing==0}">
				<form action="/profile/follow" method="post">
				<button class="btn btn_follow">팔로우</button>
					<input type="hidden" name="_method" value="PUT"/>
					<input type="hidden" name="userNo" value="${user.userNo }"/>
					<input type="hidden" name="loginNo" value="${loginUser.userNo }"/>
				</form>
				</c:when>
				
				<c:otherwise>
				<form action="/profile/follow/cancle" method="post">
				<button class="btn btn_follow">팔로잉</button>
					<input type="hidden" name="_method" value="DELETE"/>
					<input type="hidden" name="userNo" value="${user.userNo }"/>
					<input type="hidden" name="loginNo" value="${loginUser.userNo }"/>
				</form>
				</c:otherwise>
				</c:choose>
			</c:if>


						
			</div>
			<!--#foolowBox end-->
			<button class="btn_creator_home">
				<a href="creator_main_page.jsp?userNo=3&myUserNo=4">크리에이터	홈</a>
			</button>
			<div class="btn_config">
				<i class="fas fa-cog"></i>
			</div>
			<!--.btn_config end-->
		</div>
		<div class="contents">
			<div class="box_tap">
				<div class="tap on_profile profile">프로필</div>
				<div class="tap guestbook">방명록</div>

			</div>
			<!--#tapProfileBox end-->
			<div class="box_profile_con" id="profileBox">

				<div class="slide_bar"></div>
				<div class="box_badge ">
					<div class="title_category">뱃지</div>
					<div class="title_stick"></div>
					<ul class="list_badge">
					<c:forEach items="${badgeList }" var="badge">
						<c:choose>
							<c:when test="${mainBadge.mainNo==badge.no}">
						<li class="badge on_badge" >
												
							</c:when>
							<c:otherwise>
						
						<li class="badge">
							</c:otherwise>
						</c:choose>
<form action="/profile/badge/change" method="POST">

<label>
						<input type="hidden" name="userNo" value="${user.userNo }"/>
						<input type="hidden" name="no" value="${badge.getNo() }"/>
						
						<input type="hidden" name="_method" value="PUT"/>
							<div class="badge_img ">
								<img src="/img/badge/${badge.image }" width="50px"
									height="50px" /> <i class="check_icon fas fa-crown on_badge"></i>
							</div>
							<button class="btn_none"></button>
</label>
</form>
							<div class="badge_title">${badge.title }
							</div>
							<div class="badge_text">
								${badge.text }
							</div>
						</li>
					</c:forEach>

					</ul>
					<!--ul #badgeList end-->

					<div class="btn_show open">
						<i class="fas fa-sort-down"></i>
					</div>
				</div>
				<!--.box_badge end-->


				<div class="box_attack box_content">
					<div class="title_category">공략</div>
					<div class="title_stick"></div>


					<div class="list_explan">
						<div class="explan_com">댓글수</div>
						<div class="explan_like">좋아요수</div>
						<div class="explan_view">조회수</div>
					</div>
					<div id="attackBox">
					
					
					</div>
					
					
				</div>
				<!--.box_attack end-->

	<div class="paging" id="attackPaging"></div>
				<div class="box_writing box_content">

					<div class="title_category">자유 게시판</div>

					<div class="title_stick"></div>
					<div class="box_commuity_content">
						<ul class="list_content">

						</ul>
					</div>



				</div>
				<!--.box_writing end-->
				<div class="paging" id="freePaging"></div>

				<div class="box_review box_content">
					<div class="title_category">리뷰</div>
					<div class="title_stick"></div>
					<ul class="list_reviews">


					</ul>
					<!--.list_reviews end-->

				</div>
				<!--.box_review end-->
				<div class="paging" id="reviewPaging"></div>


				<div class="box_heart_list box_content">
					<div class="title_category">하트리스트</div>
					<div class="title_stick"></div>
					<div class="list_heart"></div>
					<!--.box_heart_list end-->
				</div>
				<!--#heartListBox end-->

				<div class="paging" id="heartListPaging"></div>

<!-- 
				<div class="box_buy_list box_content">
					<div class="title_category">최근 구매 리스트</div>
					<div class="title_stick"></div>
					<div class="list_buy"></div>
				</div>

				<div class="paging" id="buyListPaging"></div>
			</div>
 -->

			<div class="box_profile_con on" id="guestBookBox">
				<div class="slide_bar"></div>
				<div class="title_guestbook">방명록 남기기</div>
				<!-- .title_guestbook end -->
				<div>
					<form class="form_leave">
						<label class="lab_nondisclosure"> <input name=""
							type="checkbox"> 비공개
						</label>
						<!-- .lab_nondisclosure end -->
						<textarea class="inp_content"></textarea>
						<!-- .inp_content end -->
						<div class="btn_registration">
							<button class="btn_small" type="button">등록</button>
						</div>
						<!-- .btn_registration end -->
					</form>
					<!-- form end -->
				</div>
				<!-- 방명록남기기 end -->
				<div class="list_content2">방명록 리스트</div>
				<!-- .list_content2 end -->
				<div>
					<form class="form_leave2">
						<div class="write_none1">
							<div class="list_content3"></div>
							<!-- .list_content3 end -->
							<div class="btn_change">
								<button class="btn_small">수정</button>
							</div>
							<!-- .btn_change end -->
							<div class="btn_delete">
								<button class="btn_small">삭제</button>
							</div>
							<!-- .btn_delete end -->
							<div class="btn_registration2">
								<button class="btn_small" type="button">답변달기</button>
							</div>
							<!-- .btn_registration2 end -->
							<div class="fa_profile">
								<i class="fas fa-user-circle"></i>
							</div>
							<!-- .fa_profile end -->
							<div class="list_nick">닉네임</div>
							<!-- .list_nick end -->
						</div>
						<!-- .write_none1 end -->
						<div class="write_none2">
							<textarea class="inp_content4 "></textarea>
							<!-- .inp_content4 end -->
							<div class="btn_change2">
								<button class="btn_small">수정</button>
							</div>
							<!-- .btn_change2 end -->
							<div class="btn_delete2">
								<button class="btn_small">삭제</button>
							</div>
							<!-- .btn_delete2 end -->
							<div class="btn_registration3">
								<button class="btn_small" type="button">등록</button>
							</div>
							<!-- .btn_registration3 end -->
							<div class="fa_profile2">
								<i class="fas fa-user-circle"></i>
							</div>
							<!-- .fa_profile2 end -->
							<div class="list_nick2">닉네임</div>
							<!-- .list_nick2 -->
						</div>
						<!-- .write_none2 end -->
						<div class="write_none3">
							<div class="list_content5"></div>
							<!-- .list_content5 end -->
							<div class="btn_change3">
								<button class="btn_small">수정</button>
							</div>
							<!-- .btn_change3 end -->
							<div class="btn_delete3">
								<button class="btn_small">삭제</button>
							</div>
							<!-- .btn_delete3 end -->
							<div class="btn_registration4">
								<button class="btn_small">답변달기</button>
							</div>
							<!-- .btn_registration4 end -->
							<div class="fa_profile3">
								<i class="fas fa-user-circle"></i>
							</div>
							<!-- .fa_profile3 end -->
							<div class="list_nick3">닉네임</div>
							<!-- .list_nick3 end -->
						</div>
						<!-- .write_none3 end -->
						<div id="paging"></div>
						<!-- #paging end -->
					</form>
					<!-- .form_leave2 end -->
				</div>
				<!-- 방명록리스트 end -->


			</div>
			<!-- #guestBookBox end -->

		</div>
		<!--.content end-->
	</div>
	</div>
	<!--.wrap end-->

	<%@ include file="/WEB-INF/template/footer.jsp"%>

	<script type="text/template" id="heartListTmp">
<@_.each(heartList,function(game){@>
    <div class="box_card">
        <img class="img_thumbnail_game" src="/img/game/<@=game.image@>"/><!-- thumbnail_img -->
        <div class="text_name"><@=game.gameTitle@></div><!-- //text_name end-->
        <div class="text_genre"><@=game.genre@></div><!--//text_genre end-->
        <div class="text_price"><i class="fas fa-won-sign"></i> <@=game.price@></div><!-- text_price end-->

    </div><!--//box_card end-->

<@})@>
</script>



	<script type="text/template" id="buyListTmp">
<@_.each(buyList,function(game){@>
    <div class="box_card">
        <img class="img_thumbnail_game" src="img/game/<@=game.image@>"/><!-- thumbnail_img -->
        <div class="text_name"><@=game.gameTitle@></div><!-- //text_name end-->
        <div class="text_genre"><@=game.genre@></div><!--//text_genre end-->
        <div class="text_price"><i class="fas fa-won-sign"></i><@=game.price@></div><!-- text_price end-->

    </div><!--//box_card end-->

    <@})@>
</script>
	<!--//buyListTmp end-->

	<script type="text/template" id="freeListTmp">
<@if(freeList.length==0){ @>
		<li class="board_writing">
			<div>	게시글이 없습니다.  </div>
		</li>
	<@} else{ @>
<@_.each(freeList,function(free){@>
    <li class="board_writing">
        <div class="board list_one"> <@=free.r@></div>
        <div class="title_board list_one"><a href="free_detail_page.html"> <@=free.title@></a></div>
        <div class="time_board list_one"><@=moment(free.regdate).format("YYYY년 MM월 DD일")@></div>
        <div class="hits_board list_one"><@=free.views@></div>
        <div class="like_board list_one"><@=free.like@></div>
    </li>


    <@})@>
<@}@>
    <!--freeListTmp end-->
</script>
	<script type="text/template" id="reviewListTmp">
<@if(reviewList.length==0){ @>
		<div class="review">
			<p> 작성된 리뷰가 없습니다. </p>
		</div>
		<div class="review">
			<p> 작성된 리뷰가 없습니다. </p>
		</div>
	<@} else{ @>
<@_.each(reviewList,function(review){
var test = review.recommend.includes("L");
var test1 = "비추천";
if(test){
test1 = "추천";
}
@>
    <div class="review">
        <div class="box_review_in" id="reviewGame">
            <img class="img_review" src="/img/game/<@=review.gameImage@>" width="100" height="100" alt="게임이미지"/>
            <br>
            <div class="title_game_review">
                <@=review.gameTitle@>
            </div>

        </div>
        <div class="box_review_in" id="reviewContent">
            <div id="recommend">
			<@=test1@>

</div>
            <@=review.contents@>
        </div>
    </div>
    <@})@>
<@}@>
</script>
	<script type="text/template" id="attackListTmp">
	<@if(attackList.length==0){ @>
		<div class="box_attack_writing">
			<p> 공략 게시글이 없습니다. </p>
		</div>
	<@} else{ @>
    <@_.each(attackList,function(attack){@>
    <div class="box_attack_writing">
        <div class="box_game_attack">
            <img class="img_attack" src="/img/attack/<@=attack.mainImg@>" width="100" height="100" alt="공략이미지"/>
            <br>
            <div class="title_game">
                <@=attack.game@>
            </div>
        </div>
        <div class="box_title_attack">
            <div class="title_attack"><a href=""><@=attack.title@></a></div>
            <div class="time_attack"><@=attack.date@></div>
            <div class="writer_attack"><@=attack.writer@></div>
        </div>
        <div class="box_num_attack">

            <div class="comment_num"> 0</div>
            <div class="view_num"><@=attack.views@></div>
            <div class="like_num"> <@=attack.likeNum@></div>
        </div>
    </div>
    <!--.box_attack_writing end-->

    <@})@>

	<@}@>
    <!--attackListTmp end-->

</script>


	<script src="/js/jquery.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script>
_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
		
    $(".tap").click(function () {
        $(".tap").removeClass("on_profile");
        $(this).addClass("on_profile");
        if ($(this).hasClass("profile")) {
            $("#guestBookBox").css("display", "none");
            $("#profileBox").css("display", "block");
        } else {
            $("#profileBox").css("display", "none");
            $("#guestBookBox").css("display", "block");
        }
    });//box_tap>.tap end

    $(".btn_show").click(function () {
        if($(this).hasClass("open")){
            $(".box_badge").css("height","550px");
            $(".btn_show>i").attr("class","fas fa-sort-up");

        }else{
            $(".box_badge").css("height","200px");
            $(".btn_show>i").attr("class","fas fa-sort-down");
        }
        $(this).toggleClass("open");
    });//.btn_show_badge click end


</script>
	<script>
   

    
</script>
	<script>
    /*
    	페이징
    */
    var attackListTmp=_.template($("#attackListTmp").html());

    
    function getAttackList(pageNo){
        $.ajax({
        	
            url: "/ajax/profile/attack/"+pageNo,
            type: "get",
            data: {
            	"userNo":${user.userNo}
            	},
            dataType: "json",
            error: function () {
                alert("에러");
            }, success: function (json) {

                $("#attackBox").html(attackListTmp({attackList: json.attackList}));
                $("#attackPaging").html(json.paginate);
            }
        });
    }//attackpaginate end
    
    getAttackList(1);

    
    $("#attackPaging").on("click",".paginate a",function(e){
       	var  href = $(this).attr("href");
       //console.log(no);
       	var test = href.substring(href.length-1);
        //console.log(test);
       	pageNo = test;
       // console.log(pageNo);
        
        getAttackList(pageNo);
       	e.preventDefault();
    });//#attackPaging click end
    

    
    //
    var freeListTmp=_.template($("#freeListTmp").html());
    
    	
    getFreeList(1);
    
    function getFreeList(pageNo){
        $.ajax({
            url: "/ajax/profile/free/"+pageNo,
            type: "get",
            data: {
            	"userNo":${user.userNo}
            	},
            dataType: "json",
            error: function () {
                alert("에러");
            }, success: function (json) {
                $(".list_content").html(freeListTmp({freeList: json.freeList}));
                $("#freePaging").html(json.paginate);
            }
        });
    }//freePaginate end
    
    $("#freePaging").on("click",".paginate a",function(e){
       	var  href = $(this).attr("href");
       //console.log(no);
       	var test = href.substring(href.length-1);
        //console.log(test);
       	pageNo = test;
       // console.log(pageNo);
        
        getFreeList(pageNo);
       	e.preventDefault();
    });
    
    var reviewListTmp = _.template($("#reviewListTmp").html());
    	
    function getReviewList(pageNo){
        $.ajax({
            url: "/ajax/profile/review/"+pageNo,
            type: "get",
            data: {
            	"userNo":${user.userNo}
            	},
            dataType: "json",
            error: function () {
                alert("에러");
            }, success: function (json) {
                $(".list_reviews").html(reviewListTmp({reviewList: json.reviewList}));
                $("#reviewPaging").html(json.paginate);
            }
        });
    }//reviewPaginate end
    
    getReviewList(1);
    
    $("#reviewPaging").on("click",".paginate a",function(e){
       	var  href = $(this).attr("href");
       //console.log(no);
       	var test = href.substring(href.length-1);
        //console.log(test);
       	pageNo = test;
       // console.log(pageNo);
        
        getReviewList(pageNo);
       	e.preventDefault();
    });
    
    var heartListTmp = _.template($("#heartListTmp").html());
    	
    function getHeartList(pageNo){
        $.ajax({
            url: "/ajax/profile/heartList/"+pageNo,
            type: "get",
            data: {
            	"userNo":${user.userNo}
            	},
            dataType: "json",
            error: function () {
                alert("에러");
            }, success: function (json) {
                $(".list_heart").html(heartListTmp({heartList: json.heartList}));
                $("#heartListPaging").html(json.paginate);
            }
        });
    }//heartListPaginate end

	getHeartList(1);

    $("#heartListPaging").on("click",".paginate a",function(e){
       	var  href = $(this).attr("href");
       //console.log(no);
       	var test = href.substring(href.length-1);
        //console.log(test);
       	pageNo = test;
       // console.log(pageNo);
       	getHeartList(pageNo);
       	e.preventDefault();
    });
    
    

    var buyListTmp = _.template($("#buyListTmp").html());
    
    if(0>1){
    	
        function getBuyList(pageNo){
            $.ajax({
                url: "/ajax/profile/buyList/"+pageNo,
                type: "get",
                data: {
                	"userNo":${user.userNo}
                	},
                dataType: "json",
                error: function () {
                    alert("에러");
                }, success: function (json) {
                    $(".list_buy").html(buyListTmp({buyList: json.buyList}));
                    $("#buyListPaging").html(json.paginate);
                }
            });
        }//heartListPaginate end

        getBuyList(1);
    }
        
        $("#buyListPaging").on("click",".paginate a",function(e){
         	var  href = $(this).attr("href");
            var test = href.substring(href.length-1);
            //console.log(test);
           	pageNo = test;
           // console.log(pageNo);
            getBuyList(pageNo);
           	e.preventDefault();
        });
        
</script>
	<script>

    
    $(".btn_registration").click(function () {
        $(".write_none1").show();
    });

    $(".btn_registration2").click(function () {
        $(".write_none2").show();
    });

    $(".btn_registration3").click(function () {
        $(".write_none2").hide();
        $(".write_none3").show();
    });
    
    
    
    var $profile=$("#profileInput");
  //MIME-image로 시작하는 유효성검사
    var profileReg=/^image/;
    var oldProfile=null;
  
  //프로필 사진이 변경되면 
    $profile.change(function(){
    	//jquery객체에서 순수자바스크립트요소객체 얻기
    	var profile=$profile.get(0);
    	//input type=file 요소(순수 자바스크립트)는 무조건
    	//files 배열을 가지고 있습니다.
    	
    	//한개의파일
    	var file=profile.files[0];
    	
    	//File 객체의 속성
    	//- type : MIME (이런거->image/jped,audio/mp3,video/mp4...)
    	//- name : 파일명
    	//- lastModified :최종수정일
    	//- size : 파일크기
    	console.log(file);
    	
    	if(file==null||file.size<=0){
    		alert("제대로 된 파일을 선택해주세요.");
    	return;
    	}//if end
    	if(!profileReg.test(file.type)){
    		alert("이미지 파일을 선택해주세요.");
    		return;
    	}//if end

    	if(oldProfile!=file.name){
    		oldProfile = file.name;
    	  
    	var form=new FormData();
    	
    	//우리가 선택한 파일을 붙임
    	form.append("type","P");//일반적인 데이터
    	//(1:파라미터명,2:파일,3:파일명)
    	form.append("uploadImg",file,file.name);
    	
    	//multipart/form-data로 ajax처리~~
    	//업로드를 같은데서 처리
    	$.ajax({
    		url:"/ajax/profile/upload",
    		dataType:"json",
    	 	type:"POST",
    		processData:false,//multipart/form-data로 처리하기위해 꼭 필요ㅋ
    		contentType:false,//multipart/form-data로 처리하기위해 꼭 필요ㅎ
    		data:form,
    		error:function(){
    			alert("서버 점검중!");
    		},
    		success:function(json){
    			$("#profileCanvas").attr("src",json.src);
    		}
    		
    	});//ajax end
    	}
    });//change() end


</script>




</body>
</html>