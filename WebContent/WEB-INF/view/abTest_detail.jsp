<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ABTestUpload</title>
    <link rel="stylesheet" href="/css/tui-date-picker.css">
    <link rel="stylesheet" href="/css/tui-time-picker.css"/>
   	<link rel="stylesheet" href="/css/abTest_upload.css"/>
    <%@ include file="/WEB-INF/template/link.jsp"%>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<div id="contents">
<div id="ABTestUpload">
	<c:choose>
	<c:when test="${chosen==null }">
		<form action="/abChoice/AB" method="post">
	</c:when>
	<c:otherwise>
		<form action="/abChoice/edit" method="post">
		<input type="hidden" name="_method" value="PUT" />
	</c:otherwise>
	</c:choose>
    <div id="abChoiceTitle">${abTestResult.title } </div>
    <h3>마감일: ${abTestResult.term }</h3>
    <div id="firstChoice" class="choice_size">
        <div><img src="/img/abTest/${abTestResult.imageA }"/></div>
        <div id="firstInfo">${abTestResult.contentsA }</div>
        <label>
        <c:if test="${loginUser!=null&&finished==false}">
        	<input class="input_css" name="choice" type="radio" value="A" <c:if test="${chosen=='A'}">checked</c:if> >
        </c:if>
        <c:if test="${finished==true}">
        	${resultA }
        </c:if>
        </label>
    </div>
    <div id="secondChoice" class="choice_size">
        <div><img src="/img/abTest/${abTestResult.imageB }"/></div>
        <div id="secondInfo">${abTestResult.contentsB }</div>
        <label>
        <c:if test="${loginUser!=null&&finished==false}">
        	<input class="input_css" name="choice" type="radio" value="B" <c:if test="${chosen=='B'}">checked</c:if> />
       	</c:if>
        <c:if test="${finished==true}">
        	${resultB }
        </c:if>
        </label>
    </div>
    <input type="hidden" value="${abTestResult.no }" name="contentsNo" />
        <div class="box_writing_btn">
       		<a href="/abTest/main" class="btn_write">취소</a>
       		<c:if test="${loginUser!=null&&finished==false}">
            <button class="btn btn_write">AB투표</button>
            </c:if>
        </div>
    </form>
    </form>
</div>
<c:import url="/WEB-INF/template/footer.jsp"/>
</div>
<script src="/js/jquery.js"></script>
<script src="/js/moment.min.js"></script>
<script>


//form submit
$("form").submit(function() {
	var tets = $(':input[name=choice]:radio:checked').val();
	//var tets = $(".input_css").val();
	if(tets==null){
		alert("A나 B중 하나 선택해주세요");
		return false;
	}else{
		return true;
	}
});//submit() end

</script>
</body>
</html>