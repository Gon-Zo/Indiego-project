<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>GameMainPage</title>
  	<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link href="/css/gameMainPage.css" rel="stylesheet">
    <link href="/css/paging.css" rel="stylesheet">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<div id="contents">
<div id="wrap">
    <div id="popularGameBox">
        <div id="popularGamemTitle">인기 게임 순위</div><!--// popularGameTitle end -->
		<div id="gameListBox">	
		<c:forEach items="${gamePopulars }" var="game">
         			<div class="box_card">
        			<a  class="text_href" href="/game/${game.no }/detail">
        			<img class="img_thumbnail_game" src="/img/game/${game.image }"/><!-- thumbnail_img -->
        			<div class="text_name">${game.gameName }</div><!-- //text_name end-->
        			<div class="text_genre">${game.genre }</div><!--//text_genre end-->
        			<div class="text_price">
        					<c:if test="${gameOne.price!=0}">
									<i class="fas fa-won-sign"></i> 
								</c:if>
								${game.changePrice() }
        			</div><!-- text_price end-->
   					</a><!--//text_href end  -->
   					</div><!--//box_card end-->
         </c:forEach>
    </div><!--//popularGameBOx end-->

    <form class="wrap_search">
        <fieldset>
            <div class="box_search"><div class="btn_search"><i class="fas fa-search"></i> 게임 검색</div></div><!--//box_search end-->
        </fieldset>
    </form><!-- wrap_search end-->

    <div id="filterWrap">
        <div id="filter">
            <ul class="wrap_sTitle_filter pos_system">
                <li class="size_sTitle_filter pos_sTitle_fiter">시스템</li><!--//size_sTitle_filter end-->
                <label>
                    <label ></label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> PC</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 모바일</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->

            <ul class="wrap_sTitle_filter pos_genre">
                <li class="size_sTitle_filter pos_sTitle_fiter">장르</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/>액션</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 캐쥬얼</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 전략</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 어드벤처</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 싱글플레이</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 롤플레이</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->

            <ul class="wrap_sTitle_filter pos_state">
                <li class="size_sTitle_filter pos_sTitle_fiter">가격</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 무료</li>
                </label></label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 할인</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 1000원~5000원</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 5000원~10000원</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 10000원~50000원</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 50000원 이상</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->

            <ul class="wrap_sTitle_filter pos_team">
                <li class="size_sTitle_filter pos_sTitle_fiter">출시일</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 하루</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 일주일</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 한달</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 일년</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 일년이상</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->
        </div><!--// filter end-->

        <div class="wrap_btn_more">
            <div id="filterMoreBtn" class="btn_more fas fa-sort-down"></div><!--//moreBtn end-->
        </div><!--//wrap_btn_more end-->
    </div><!--// filterWrap end-->

    <div id="gameListWrap">
        <div class="wrap_select">
     	   <div class="btn_select click_two">최신순</div><!--//btn_select end-->
            <div class="btn_select " >인기순</div><!--//btn_select end-->
        </div><!--//wrap_select end-->


        <div id="gamemList">
		</div><!--gamemList end-->
       <div class="paging"></div><!--//paging end-->

       
    </div><!--//wrap_list_project end-->


</div><!--//contents end-->

<!--// pop up-->
<div class="popup_search"></div><!--//popup_search end-->



<div class="popup_search_game">

    <div class="box_search_input">
        <input class="input_game_title" type="text"/>

        <i class="fas fa-search search_icon"></i>

    </div><!--//box_search_input end-->
    <div class="box_game_list">

	</div><!--//box_game_list end-->
	
</div><!--//popup_search_game end-->
</div>
<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script type="text/template" id="gameTmp">
<@ _.each(game,function(game){ @>
	<div class="card_search_game">
				  	<a  class="text_href" href="gameDetailPage.jsp?no=<@= game.no@>">
					<div class="img_game">
					<img src="/img/game/<@= game.image@>" width="100px" height="100px"alt="<@= game.image@>" data-parent="<@= game.gameName@>" />
					<div class="text_game_title_pop"><@= game.gameName@></div>
					<!--//text_game_title_pop end-->
				</div><!--//img_game end -->
				<div class="text_genre_pop card_text">장르 : <@= game.genre@></div><!--// text_genre_pop-->
				<div class="text_price_pop card_text">
					<i class="fas fa-won-sign"></i> <@= game.price@>
				</div><!--//text_price_pop end-->
				</a>
			</div><!--///card_search_game -->
<@}) @>
</script>

<script type="text/template" id="gameListTmp">
<@ _.each(games,function(game){
var flag=game.price;
@>
				<div class="box_card">
					<a  class="text_href" href="/game/<@= game.no@>/detail">
					<img class="img_thumbnail_game" src="/img/game/<@= game.image@>" />
					<!-- thumbnail_img -->
					<div class="text_name"><@= game.gameName@></div>
					<!-- //text_name end-->
					<div class="text_genre"><@= game.genre@></div>
					<!--//text_genre end-->
					<div class="text_price">
							<i class="fas fa-won-sign"></i> <@=flag@>
					</div>
					<!-- text_price end-->
					</a>
				</div>
				<!--//box_card end-->
<@}) @>
</script>

<script src="/js/underscore-min.js"></script>
<script>

_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
		
	var gameTmpl = _.template($("#gameTmp").html());
	var gameListTmpl = _.template($("#gameListTmp").html());
	
    /* more filter*/
    $('#filterMoreBtn').on('click',function () {
        var check = $(this).attr('class');

        if(check == 'btn_more fas fa-sort-down'){
            $(this).attr('class','btn_more fas fa-sort-up')
            $("#filter").css('height','350px');
        }else{
            $(this).attr('class','btn_more fas fa-sort-down')
            $("#filter").css('height','40px');
        }
    })//.btn_more end
    
    /*// 게임 서치*/
    $('.btn_search').on('click',function () {
        $('.popup_search').show();
        $('.popup_search_game').show();
        $(".input_game_title").focus();
    })
    $('.popup_search').on('click',function () {

        $(this).css('display','none');
        $(".popup_search_game").css('display','none');
    })
    
    
    $(".search_icon").on('click',function(){
    	searchGame();
    });
    
    $(".input_game_title").keyup(function (key) {
    	 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	searchGame();
        }
 
    });
    
    function searchGame() {
 	 var gameName = $('.input_game_title').val();
    	if(gameName.length == 0){
			alert('다시입력하세요');
    	}else{
    		 $.ajax({
     	    	url:"/ajax/game/search/title",
     	    	type: "post",
     	    	data:{
     	    		"title" : gameName
     	    	},
     	    	dataType : "json",
     	    	  error:function(){
     	              alert("서버 정검중!")
     	          },
     	          success:function(json){
     	              console.log(json)
     	        	  $(".box_game_list").html(gameTmpl({game:json}));
     	          }
     	    });//ajaxList end
    	}
	}
    
    function getPopuList(pageNo) {
   	 $.ajax({
 	    	url:"/ajax/game/popular/page/"+pageNo,
 	    	type: "post",
 	    	data:{
 	    		"pageNo" : pageNo
 	    	},
 	    	dataType : "json",
 	    	  error:function(){
 	              alert("서버 정검중!")
 	          },
 	          success:function(json){
 	        	  $("#gamemList").html(gameListTmpl({games:json.list}));
       	 	  $(".paging").html(json.paginate);
 	         }
 	    });//ajaxList end
   }
    
    function getList(pageNo) {
    
    	 $.ajax({
  	    	url:"/ajax/game/latest/page/"+pageNo,
  	    	type: "post",
  	    	data:{
  	    		"pageNo" : pageNo
  	    	},
  	    	dataType : "json",
  	    	  error:function(){
  	              alert("서버 정검중!")
  	          },
  	          success:function(json){
  	      	 	$("#gamemList").html(gameListTmpl({games:json.list}));
        	   $(".paging").html(json.paginate); 
  	          }
  	    });//ajaxList end
    }
    
    getList(1);
    
    var checkTitle;
    //최신순 , 인기순 클릭 이벤트
    $(".btn_select").on("click",function () {

        var tapIndex = $(this).index();
        $(".click_two").removeClass("click_two");
        $(".btn_select:nth-child("+(tapIndex+1)+")").addClass("click_two");
        
        checkTitle = $(this).text();
        if( checkTitle == "인기순" ){
        	pageNo=1;
        	getPopuList(pageNo);
        }else{
        	pageNo=1;
        	getList(pageNo);
        }
    });

    $(".paging").on("click",".paginate a",function(e) {
    	e.preventDefault();
    	
    	var  no = $(this).attr("href");
    	var test = no.substring(no.lastIndexOf("/")+1 , no.length);
    	pageNo = test;
        if( checkTitle == "인기순" ){
        	getPopuList(pageNo);
        }else{
        	getList(pageNo);
        }
    });
    
</script>
</body>
</html>