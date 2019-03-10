<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>index</title>
	<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link href="css/indexPage.css" rel="stylesheet"/>
</head>

<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
    <div id="contents">
        <div class="box_banner">
            <div class="box_banner_contents">
                <img class="img_banner" src="/img/banner/banner1.png">
                <img class="img_banner" src="/img/banner/banner2.png">
                <img class="img_banner" src="/img/banner/banner3.png">
                <img class="img_banner" src="/img/banner/banner4.png">
            </div><!--// box_banner_contents end-->
            <div class="btn_banner" id="rightArrowBtn"><i class="fas fa-angle-right"></i></div><!-- //rightArrowBtn end -->
            <div class="btn_banner" id="leftArrowBtn"><i class="fas fa-angle-left" ></i></div><!-- //leftArrowBtn end -->
        </div><!--#bannerBox end-->
        <div id="listBox">
            <div class="box_tap tap">
                <div  class="btn_tap click">추천 게임</div><!--//btn_tap end-->
                <div  class="btn_tap">인기 순위</div><!--//btn_tap end-->
                <div  class="btn_tap">EarlyAccess</div><!--//btn_tap end-->
                <div  class="btn_tap">특별 할인</div><!--/btn_tap end-->
            </div><!-- #tapBox end-->

            <div class="box_gameList_tap tap on_index">
          		<c:forEach items="${gameBests }" var="bestgame">
         			<div class="box_card">
         			<a  class="text_href" href="/game/${bestgame.no }/detail">
        			<img class="img_thumbnail_game" src="/img/game/${bestgame.image }"/><!-- thumbnail_img -->
        			<div class="text_name">${bestgame.gameName }</div><!-- //text_name end-->
        			<div class="text_genre">${bestgame.genre }</div><!--//text_genre end-->
        			<div class="text_price">
        						<c:if test="${bestgame.price!=0}">
									<i class="fas fa-won-sign"></i> 
								</c:if>
								${bestgame.changePrice() }
        			</div><!-- text_price end-->
        			</a><!--//text_href end  -->
   					</div><!--//box_card end-->
          		</c:forEach>
   				
            </div><!--box_gameList_tap end-->

            <div class="box_gameList_tap tap">
            	<c:forEach items="${gamePopulars }" var="game">
         			<div class="box_card">
        			<a  class="text_href" href="/game/${game.no }/detail">
        			<img class="img_thumbnail_game" src="/img/game/${game.image }"/><!-- thumbnail_img -->
        			<div class="text_name">${game.gameName }</div><!-- //text_name end-->
        			<div class="text_genre">${game.genre }</div><!--//text_genre end-->
        			<div class="text_price">
        						<c:if test="${game.price!=0}">
									<i class="fas fa-won-sign"></i> 
								</c:if>
								${game.changePrice() }
        			</div><!-- text_price end-->
   					</a><!--//text_href end  -->
   					</div><!--//box_card end-->
            	</c:forEach>
            </div><!--box_gameList_tap end-->

            <div class="box_gameList_tap tap">
            </div><!--box_gameList_tap end-->


            <div class="box_gameList_tap tap">
            </div><!--box_gameList_tap end-->
        </div><!-- #listBox end-->

        <!--베스트 인더 박스-->
        <div id="listBestIndieerBox">
            <div class="box_content" id="inderAttackBox">
                <div id="inderAttackTitle">베스트 인더의 공략</div>
                <div class="box_inder" >
                    <div class="box_game_img ">
                        <img class="img_game_attack" src="img/game/game1.jpg" width="100" height="100" alt="게임이미지"/>
                        <br>
                        <strong> 게임 타이틀</strong>
                    </div>
                    <!--.box_game_img end-->
                    <div class="box_attack_list">
                        <div class="attack_nick"> 닉네임</div>
                        <div class="list_attack_inder">
                            <ul class="list_writing_inder">
                                <li class="title_writing_inder" data-parent="game1.jpg">
                                    인더의 공략글 1z인더의 공략글 1z인더의 공략글 1z인더의 공략글 1z
                                </li>
                                <li class="title_writing_inder" data-parent="game2.jpg">
                                    인더의 공략글 2
                                </li>
                                <li class="title_writing_inder" data-parent="game3.jpg">
                                    인더의 공략글 3
                                </li>
                                <li class="title_writing_inder" data-parent="game4.jpg">
                                    인더의 공략글 4
                                </li>
                                <li class="title_writing_inder" data-parent="game1.jpg">
                                    인더의 공략글 5
                                </li>
                                <li class="title_writing_inder" data-parent="game2.jpg">
                                    인더의 공략글 6
                                </li>
                            </ul>
                        </div>
                        <!--#inderAttackList end-->
                    </div>
                    <!--.box_attack_list end-->

                </div>
                <!--.box_inder end-->
                <div class="box_inder" >
                    <div class="box_game_img ">
                        <img class="img_game_attack" src="/img/game/game1.jpg" width="100" height="100" alt="게임이미지"/>
                        <br>
                        <strong> 게임 타이틀</strong>
                    </div>
                    <!--.box_game_img end-->
                    <div class="box_attack_list">
                        <div class="attack_nick"> 닉네임</div>
                        <div class="list_attack_inder">
                            <ul class="list_writing_inder">
                                <li class="title_writing_inder" data-parent="game1.jpg">
                                    인더의 공략글 1z인더의 공략글 1z인더의 공략글 1z인더의 공략글 1z
                                </li>
                                <li class="title_writing_inder" data-parent="game2.jpg">
                                    인더의 공략글 2
                                </li>
                                <li class="title_writing_inder" data-parent="game3.jpg">
                                    인더의 공략글 3
                                </li>
                                <li class="title_writing_inder" data-parent="game4.jpg">
                                    인더의 공략글 4
                                </li>
                                <li class="title_writing_inder" data-parent="game1.jpg">
                                    인더의 공략글 5
                                </li>
                                <li class="title_writing_inder" data-parent="game2.jpg">
                                    인더의 공략글 6
                                </li>
                            </ul>
                        </div>
                        <!--#inderAttackList end-->
                    </div>
                    <!--.box_attack_list end-->

                </div>
                <!--.box_inder end-->
                <div class="box_inder" >
                    <div class="box_game_img ">
                        <img class="img_game_attack" src="img/game/game1.jpg" width="100" height="100" alt="게임이미지"/>
                        <br>
                        <strong> 게임 타이틀</strong>
                    </div>
                    <!--.box_game_img end-->
                    <div class="box_attack_list">
                        <div class="attack_nick"> 닉네임</div>
                        <div class="list_attack_inder">
                            <ul class="list_writing_inder">
                                <li class="title_writing_inder" data-parent="game1.jpg">
                                    인더의 공략글 1z인더의 공략글 1z인더의 공략글 1z인더의 공략글 1z
                                </li>
                                <li class="title_writing_inder" data-parent="game2.jpg">
                                    인더의 공략글 2
                                </li>
                                <li class="title_writing_inder" data-parent="game3.jpg">
                                    인더의 공략글 3
                                </li>
                                <li class="title_writing_inder" data-parent="game4.jpg">
                                    인더의 공략글 4
                                </li>
                                <li class="title_writing_inder" data-parent="game1.jpg">
                                    인더의 공략글 5
                                </li>
                                <li class="title_writing_inder" data-parent="game2.jpg">
                                    인더의 공략글 6
                                </li>
                            </ul>
                        </div>
                        <!--#inderAttackList end-->
                    </div>
                    <!--.box_attack_list end-->

                </div>
                <!--.box_inder end-->
            </div>
        </div><!--listBestIndieerBox end-->

        <div id="communicationBox">
            <ul id="listFreeBoardBox" class="list_communication_box">

                <li id="freeBoardmTitle" class="mTitle_communication">자유게시판</li><!--//mTitle_communication end-->

                <li class=" list_box_one">
                    <div class="sTitle_FreeBoard">제목</div><!--//sTitle_FreeBoard end-->
                    <div class="text_ripple">댓글</div><!--//text_ripple end-->
                    <div class="text_writer">작성자</div><!--//text_writer end-->
                </li><!--//list_box ends-->
			<c:forEach items="${freeBests }" var="free">
 				 <li class="list_box">
        			<a  class="text_href" href="gameDetailPage.jsp?no=${free.no }">
        			<div class="sTitle_FreeBoard">${free.title }</div><!--//sTitle_FreeBoard end-->
       				<div class="text_ripple">[${free.replynum }]</div><!--//text_ripple end-->
        			<div class="text_writer">${free.nickname }</div><!--//text_writer end-->
    				</a>
    			</li><!--//list_box ends-->
			</c:forEach>
    			
            </ul><!--listFreeBoardBox end -->

            <ul id="listHotTalkBox" class="list_communication_box">
                <li class="mTitle_communication">Hot 토론</li><!--//mTitle_communication end-->
                <li class = " list_box_one">
                    <div class="list_elements">게임명</div><!--list_elements-->
                    <div class="list_game_name">토론이름</div><!--// list_game_name-->
          				<c:forEach items="${debateBsets }" var="debate">
                    	<li class = "list_box">
                    		<a  class="text_href" href="gameDetailPage.jsp?no=${debate.no }" >
        					<div class="list_elements">${debate.gameTitle }</div><!--list_elements-->
        					<div class="list_game_name">${debate.title }</div><!--// list_game_name-->
        					</a>
    					</li><!--//list_box end-->
          				</c:forEach>

                </li><!--//list_box end-->

            </ul><!--listHotTalkBox end-->

            <ul id="listHelpBox" class="list_communication_box">
                <li class="mTitle_communication">HELP</li><!--// mTitle_communication end-->
                <li class = " list_box_one">
                    <div class="list_game_name">게시판 제목</div><!--// list_game_name-->
                    <div  class="list_elements">작성자</div><!--// list_elements end-->
                </li><!--// list_box end-->
               			<c:forEach items="${abTestBests }" var="abTest">
                    	<li class = "list_box">
        					<a  class="text_href" href="/abTest/${abTest.no}/detail">
        					<div class="list_game_name">${abTest.title }</div><!--// list_game_name-->
        					<div class="list_elements">${abTest.nickname }</div><!--list_elements-->
    						</a>
    					</li><!--//list_box end-->
               			</c:forEach>
    			
            </ul><!--listHelpBox end-->

        </div><!--CommunicationBox end-->
    </div><!--// contents box  -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="js/underscore-min.js"></script>
<script>


    //자동롤링
    var moveCtrl ;
    /*setInterval(testMove, 1000);*/
    $('.box_banner').mouseover(function () {
        clearInterval(moveCtrl);
    });
    $(document).ready(function () {
        moveCtrl = setInterval(Move, 5000);
    })
    $('.box_banner').mouseout(function () {
        moveCtrl = setInterval(Move, 5000);
    });
    
    //배너 버튼 이벤트
    var banerPos = 0;
    $("#leftArrowBtn").click(function ()
    {
        console.log(banerPos);
        if(banerPos >=0){
            banerPos = 0
        }else {
            banerPos += 1000;
            $(".box_banner_contents").css("left", banerPos);
        }
    });//leftArrowBtn end

    $("#rightArrowBtn").click(function ()
    {
        console.log(banerPos);

        if(banerPos <= -2900){
            banerPos = -3000;
        }else {
            banerPos -=1000;
            $(".box_banner_contents").css("left", banerPos);
        }

    });//rightArrowBtn end

    //자동롤링 함수
    function Move() {
        if (banerPos <= -2900) {
            banerPos = 1000;
            console.log(banerPos)
        }
        else {
            banerPos -= 1000;
            $(".box_banner_contents").css("left", banerPos);
            console.log(banerPos)
        }
    }//Move end

    //텝 이벤트
    $(".btn_tap").on("click",function () {
        var tapIndex = $(this).index();

        $(".click").removeClass("click");
        $(".tap").find(".btn_tap:nth-child("+(tapIndex+1)+")").addClass("click");
        tapIndex = tapIndex+2
        $(".on_index").removeClass("on_index");
        $(".tap:nth-child("+tapIndex+")").addClass("on_index");

    });//.btn_tap click end

    //베스트 인더 카드
    $(".title_writing_inder").hover(function () {
        var img = $(this).data("parent");
        $(this).parent().parent().parent().prev().children(1).attr("src", "img/game/" + img);
        // $(".box_inder .img_game_attack").attr("src", "img/game/" + img);
    });

</script>

</body>
</html>