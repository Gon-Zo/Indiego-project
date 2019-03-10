<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>projextMainPage</title>
	<c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/projectMainPage.css"/>
    <link rel="stylesheet" href="/css/paging.css"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<div id="contents">
<div id="wrap">
    <div class="box_banner">
        <div class="box_banner_contents">
        		<img class="img_banner" src="/img/banner/banner1.png">
                <img class="img_banner" src="/img/banner/banner2.png">
                <img class="img_banner" src="/img/banner/banner3.png">
                <img class="img_banner" src="/img/banner/banner4.png">
        </div><!--// box_banner_contents end-->
        <div class="btn_banner" id="rightArrowBtn"><i class="fas fa-angle-right"></i></div>
        <div class="btn_banner" id="leftArrowBtn"><i class="fas fa-angle-left" ></i></div>
    </div><!--#box_banner end-->

    <div id="listBox">
        <div class="box_tap tap">
            <div class="btn_tap click">Hot 프로젝트</div><!--//btn_tap end-->
            <div class="btn_tap">SOS 프로젝트</div><!--//btn_tap end-->
            <div class="btn_tap">아이디어</div><!--//btn_tap end-->
        </div><!-- #tapBox end-->

        <div id="hotProjectList" class="box_project_list tap on_projectMain">
        <c:forEach items="${hotProjects }" var="hotproject">
        <div class="box_card_project">
		<a class="text_href" href="project.jsp?no=${hotproject.no }">
					<img class="img_thumbnail_project" src="/img/project/${hotproject.image }" />
					<div class="box_state">모집중</div>
					<!--//box_state end-->
					<div class="box_state_sos">SOS</div>
					<div class="text_name_project">${hotproject.title }</div>
					<!-- //text_name end-->
					<div class="text_genre_project">${hotproject.genrename }</div>
					<!--//text_genre end-->
			</a>	
			</div>
        </c:forEach>
        </div><!--//box_project_list end-->

        <div id="sosListWrap" class=" box_project_list tap">
        </div><!--//box_project_list end-->

        <ul id="ideaListWrap" class="box_project_list tap ">
           <ul class="list_content_idea">
           <li class="idea_writing idea_writing_pos">
       			 <div class="no_idea list_one">분류</div>
       			 <div class="title_idea list_one">글 제목</div>
        		 <div class="writer_idea list_one">작성자</div>
        		 <div class="time_idea list_one">시간</div>
        	     <div class="hits_idea list_one">히트수</div>
       			 <div class="like_idea list_one">추천수</div>
   			 </li>
			<c:forEach items="${ideaTens }" var="idea"> 
  			<li class="idea_writing idea_writing_pos">
  			<a class="text_href" href="idea_detail_page.jsp?no=${idea.no }">
       			 <div class="no_idea list_one">${idea.typeReturn() }</div>
       			 <div class="title_idea list_one">${idea.title }</div>
        		 <div class="writer_idea list_one">${idea.nickname }</div>
        		 <div class="time_idea list_one">${idea.changeDate() }</div>
        	     <div class="hits_idea list_one">0</div>
       			 <div class="like_idea list_one">0</div>
       			 </a>
   			 </li>
			</c:forEach>
           </ul>
            <!-- <div class="paging">페이징 구간</div>//paging end -->

        </ul><!--//box_project_list end-->


    </div><!-- //box_project_list end-->

	<div class="wrap_search">
            <div class="box_search"><div class="btn_search"><i class="fas fa-search"></i> 프로젝트 검색</div></div><!--//box_search end-->
    </div><!-- wrap_search end-->



    <div id="filterWrap">
        <div id="filter">
            <ul class="wrap_sTitle_filter pos_system">
                <li class="size_sTitle_filter pos_sTitle_fiter">시스템</li><!--//size_sTitle_filter end-->
                <label>
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
                <li class="size_sTitle_filter pos_sTitle_fiter">상태</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 모집중</li>
                </label></label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 진행중</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 런칭</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->

            <ul class="wrap_sTitle_filter pos_team">
                <li class="size_sTitle_filter pos_sTitle_fiter">인원</li><!--//size_sTitle_filter end-->
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 1명</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 2인 ~ 5인</li>
                </label>
                <label>
                    <li class="size_sTitle_filter"><input type="checkbox" class="input_filter"/> 6인 이상</li>
                </label>
            </ul><!--//wrap_sTitle_filter end-->
        </div><!--// filter end-->

        <div class="wrap_btn_more">
            <div id="filterMoreBtn" class="btn_more fas fa-sort-down"></div><!--//moreBtn end-->
        </div><!--//wrap_btn_more end-->
    </div><!--// filterWrap end-->

    <div class="wrap_list_project">
        <div class="wrap_select">
            <div class="btn_select click_two">최신순</div><!--//btn_select end-->
            <div class="btn_select">인기순</div><!--//btn_select end-->
        </div><!--//wrap_select end-->

        <div id="projectList">
     
			</div><!--projectList end-->
        <div class="paging"></div><!--//paging end-->

    </div><!--//wrap_list_project end-->


</div><!--// wrap end-->
</div><!--// contents end-->

<div class="popup_search"></div><!--//popup_search end-->
<div class="popup_search_game">

    <div class="box_search_input">
        <input class="input_game_title" type="text"/>

        <i class="fas fa-search search_icon"></i>

    </div><!--//box_search_input end-->
    <div class="box_game_list">
	</div><!--//box_game_list end-->
</div><!--//popup_search_game end-->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script type="text/template" id="sosListCard">
    <div class="box_card_sos">
        <img class="img_thumbnail_project" src="/img/testImg.jpg"/>
        <div class="box_state">모집중</div><!--//box_state end-->
        <div class="box_state_sos">SOS</div>
        <div class="text_name_project">NBA2K19</div><!-- //text_name end-->
        <div class="text_genre_project">스포츠</div><!--//text_genre end-->
        <div class="view_sos">SOS 단계 표시</div><!--//view_sos end-->
        <div class="text_sos_view">SOS 사유 표시</div><!--//text_sos_view end -->
    </div><!--//box_card_sos end-->
</script><!--//listFreeBoardCard end-->

<script type="text/template" id="projectTmp">
<@ _.each(projects,function(project){ @>
<div class="box_card_project">
<a class="text_href" href="project.jsp?no=<@= project.no@>">
					<img class="img_thumbnail_project" src="/img/project/<@= project.image@>" />
					<div class="box_state">모집중</div>
					<!--//box_state end-->
					<div class="box_state_sos">SOS</div>
					<div class="text_name_project"><@= project.title@></div>
					<!-- //text_name end-->
					<div class="text_genre_project"><@= project.genrename@></div>
					<!--//text_genre end-->
</a>	
			</div>
				<!--//box_card_project end-->
<@}) @>
</script>


<script src="/js/underscore-min.js"></script>
<script>
_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
		
var projectTmpl = _.template($("#projectTmp").html());

    //자동롤링
    var moveCtrl ;
    $('.box_banner').mouseover(function () {
        clearInterval(moveCtrl);
    });
    $(document).ready(function () {
        moveCtrl = setInterval(Move, 5000);
    })
    $('.box_banner').mouseout(function () {
        moveCtrl = setInterval(Move, 5000);
    });
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
    
    //필터 이벤트
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


    //텝 이벤트
    $(".btn_tap").on("click",function () {
        var tapIndex = $(this).index();

        $(".click").removeClass("click");
        $(".tap").find(".btn_tap:nth-child("+(tapIndex+1)+")").addClass("click");
        tapIndex = tapIndex+2
        $(".on_projectMain").removeClass("on_projectMain");
        $(".tap:nth-child("+tapIndex+")").addClass("on_projectMain");

    });//.btn_tap click end



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
    	searchProject();
    });
    
    $(".input_game_title").keyup(function (key) {
    	 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	searchProject();
        }
 
    }); 
    
    function searchProject() {
     	var title = $('.input_game_title').val();
        	
        	if(title.length == 0){
    			alert('다시입력하세요');
        	}else{
        		 $.ajax({
         	    	url:"/ajax/project/search/title",
         	    	type: "post",
         	    	data:{
         	    		"title" : title
         	    	},
         	    	dataType : "json",
         	    	  error:function(){
         	              alert("서버 정검중!")
         	          },
         	          success:function(json){
         	        	  if(json!=null){
         	        	 	 $(".box_game_list").html(projectTmpl({projects:json}));
         	        	  }
         	          }
         	    });//ajaxList end
        	}
    	}// 함수 end
    	
    	
    	/* 프로젝트 페이징 처리 */

    	   //최신순 , 인기순 클릭 이벤트
 var checkTitle;
    	
 getList(1);
 
    	$(".btn_select").on("click",function () {
        	var tapIndex = $(this).index();
        	$(".click_two").removeClass("click_two");
        	$(".btn_select:nth-child("+(tapIndex+1)+")").addClass("click_two");
   		
        	 checkTitle = $(this).text();
             if( checkTitle == "인기순" ){
             	pageNo=1;
             	popularList(pageNo);
             }else{
             	pageNo=1;
             	getList(pageNo);
             }
    	
    	});
    	
    	function getList(pageNo) {
    	 $.ajax({
  	    	url: "/ajax/project/latest/page/"+pageNo,
  	    	type: "post",
  	    	data:{
  	    		"pageNo" : pageNo
  	    	},
  	    	dataType : "json",
  	    	  error:function(){
  	              alert("서버 정검중!")
  	          },
  	          success:function(json){
  	      	   $("#projectList").html(projectTmpl({projects:json.list}));
        	   $(".paging").html(json.paginate); 
  	          }
  	    });//ajaxList end
    }//getList end
    
	function popularList(pageNo) {
   	 $.ajax({
 	    	url:"/ajax/project/popular/page/"+pageNo,
 	    	type: "post",
 	    	data:{
 	    		"pageNo" : pageNo
 	    	},
 	    	dataType : "json",
 	    	  error:function(){
 	              alert("서버 정검중!")
 	          },
 	          success:function(json){
 	      		 $("#projectList").html(projectTmpl({projects:json.list}));
       	  		 $(".paging").html(json.paginate);
 	          }
 	    });//ajaxList end
   }//getList end
   
   
   $(".paging").on("click",".paginate a",function(e) {
   	e.preventDefault();
   	
   	var  no = $(this).attr("href");
   	var test = no.substring(no.lastIndexOf("/")+1 , no.length);
   	pageNo = test;
       if( checkTitle == "인기순" ){
    	   popularList(pageNo);
       }else{
       	   getList(pageNo);
       }
   });
 
</script>


</body>
</html>