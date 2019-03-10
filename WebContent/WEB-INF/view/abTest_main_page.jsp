<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디어 메인</title>
    <link rel="stylesheet" href="/css/abTest_main.css"/>
    <link rel="stylesheet" href="/css/paging.css"/>
    <%@ include file="/WEB-INF/template/link.jsp"%>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<div id="contents">

    <div id="ideaBox">
        <div class="box_menu">
            <div class="menu_sub" id="ideaMenu">아이디어 주세요</div>
            <div class="menu_sub" id="testMenu">AB테스트</div>
        </div>

        <div id="ideaContentBox">
            <div class="title_idea_main">AB테스트</div>
            <div id="stick"></div>
            <div class="definition_idea">
                AB테스트란 A와 B들 중 하나의 의견을 선택하여 크리에이터 등 결정이 필요한 사람들에게 다수의 의견을 들려줌으로써 선택에 도움을 주는 컨텐츠입니다.
            </div>

            <div id="ABTestInfo">
                <dl id="currentParticipant" class="ABTest_info_box">
                <c:choose>
                	<c:when test="${loginUser!=null}">
                		<dt>내가 쓴 글</dt>
                			<dd class="dd1">제목</dd>
                			<dd class="dd2">참여자수</dd>
		                <c:forEach items="${iVoted}" var="event">
		                    <dd class="dd1"><a href="/abTest/${event.no}/detail">${event.title }</a></dd>
		                    <dd class="dd2">${event.voteNum }</dd>
		                </c:forEach>
		                <dt>내가 참여한 글</dt>
                			<dd class="dd1">제목</dd>
                			<dd class="dd2">참여자수</dd>
		                <c:forEach items="${myAbTest}" var="event">
		                    <dd class="dd1"><a href="/abTest/${event.no}/detail">${event.title }</a></dd>
		                    <dd class="dd2">${event.voteNum }</dd>
		                </c:forEach>
                	</c:when>
                	<c:otherwise>
                		<dt>진행중인 테스트</dt>
                			<dd class="dd1">제목</dd>
                			<dd class="dd2">참여자수</dd>
		                <c:forEach items="${onGoing}" var="event">
		                    <dd class="dd1"><a href="/abTest/${event.no }/detail">${event.title }</a></dd>
		                    <dd class="dd2">${event.voteNum }</dd>
		                </c:forEach>
                	</c:otherwise>
                </c:choose>
                </dl>
                <dl id="lastMinute" class="ABTest_info_box">
                    <dt>마감임박</dt>
               			<dd class="dd1">제목</dd>
               			<dd class="dd3">마감일</dd>
                    <c:forEach items="${nearClosing}" var="event">
                    <dd class="dd1"><a href="/abTest/${event.no }/detail">${event.title }</a></dd>
                    <dd class="dd3">${event.term }</dd>
                </c:forEach>
                </dl>

            </div>
			<c:if test="${loginUser!=null}">
			<c:if test="${loginUser.userMode=='C' }">
	            <div class="box_writing_btn">
	                <div class="btn btn_write"><a href="/abTest/upload">글쓰기</a></div>
	            </div>
            </c:if>
            </c:if>

            <div class="box_content_idea">
                <div class="list_title no_idea list_one">NO</div>
                <div class="list_title title_idea list_one">제목</div>
                <div class="list_title writer_idea list_one">기간(마감기간 D-DAY)</div>
                <div class="list_title time_idea list_one">참여자수</div>
                <div id="AbTestAll">
                
                </div>
            </div>
            <!--listtmp-->
            
            <!--.list_content end-->
            <div class="box_search">
                <form action="#" method="get">
                <select class="select_search" name="search">
                    <option value="">검색기준</option>
                    <option value="">작성자</option>
                    <option value="">제목+내용</option>
                    <option value="">제목</option>
                </select>
                    <button type="submit" class="box_search_icon">
                        <i class="fas fa-search search_icon"></i>
                    </button>
                <input class="text_search" type="text" name="search_input"/>
                </form>
            </div>
        </div>
         <!--#ideaContentBox end-->

    </div>
    <!--#ideaBox-->
</div> <!-- #contents end -->

<script type="text/template" id="AbContentsTmp" >
<@if(list.length==0){ @>
	  <i class="fas fa-skull-crossbones"></i> 아직 게시글이 없습니다.</div>
	<@} else{ @>
	<ul class="list_content_idea">
		<@ _.each(list, function(abTest){ @>
		    <li class="idea_writing">
	        <div class="no_idea list_one"><@=abTest.r @></div>
	        <div class="title_idea list_one detail">
	        <a href="/abTest/<@=abTest.no @>/detail"><@=abTest.title @></a></div>
	        <div class="writer_idea list_one dday"> 
			<@	var dday =moment(abTest.term).format("D")-moment().format("D")
				if(dday>0){@>
					D-<@= dday@>
				<@} else{@>
					마감
				<@}@>
			</div>
	        <div class="time_idea list_one"><@=abTest.voteNum @></div>
		    </li>
		<@ }) @>
	</ul>
	<div id="abTestPaginate">
		<@=paginate@>
	</div>
<@ } @>
	

</script>

<c:import url="/WEB-INF/template/footer.jsp"/>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/moment.min.js"></script>
<script>

		_.templateSettings = {
				interpolate: /\<\@\=(.+?)\@\>/gim,
				evaluate: /\<\@([\s\S]+?)\@\>/gim,
				escape: /\<\@\-(.+?)\@\>/gim
		};
		
		var abContentsTmpl = _.template($("#AbContentsTmp").html());
	
		function getAbTests(pageNo){
			$.ajax({
				url:"/ajax/abTest/main/page/"+pageNo,
				type:"get",
				dataType:"json",
				error:function(xhr,error,code){
					alert("서버 점검중!");
				},
				success:function(abTest){
					$("#AbTestAll").html(abContentsTmpl(abTest));
				}
			})
		}
	
		getAbTests(1);
		
		$("#AbTestAll").on("click",".paginate a",function(evt){
			var href = $(this).attr("href");
			var pageNo = href.substring(href.lastIndexOf("/")+1,href.length);
			getAbTests(pageNo);
			evt.preventDefault();
			
		});
		
		function changeDday(){
			
		}
		
		var now = moment();
		//var momentB = moment("11/07/2017","DD/MM/YYYY");
		var diffInDays = now.diff(momentB, 'days'); // 1 day
		console.log($(".dday").eq(1).text());
		
		for(var i=0;i<10;i++){
			var momentB=moment($(".dday").eq(i).text());
			console.log($(".dday").eq(i).text());
			var diffInDays = now.diff(momentB, 'days');
			$(".dday").eq(i).text(diffInDays);
		}
</script>
</body>
</html>