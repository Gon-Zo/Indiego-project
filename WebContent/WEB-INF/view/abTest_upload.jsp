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
   	<form action="/abTest/upload" method="post" enctype="multifile/form-data">
    <div><input placeholder="제목" id="titleInput" name="title" /></div>
    <div id="datePicker">
    <h2>마감일 선택</h2>
    <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
        <input type="text" id="datepicker-input1" aria-label="Date-Time" name="term">
        <span class="tui-ico-date"></span>
    </div> <!-- .tui-datepicker-input .tui-datetime-input .tui-has-focus end -->
    <div id="wrapper1" style="margin-top: -1px;"></div>
    </div> <!-- // #datePicker -->

    <div id="firstChoice" class="choice_size no_image">
        <div>
            <label>
            <i class="fas fa-plus-circle"></i>
	           <input class="hidden_input screen_out file" data-file="0" type="file"/>
	           <img class="img" width="380" height="260" />
			   <input type="hidden" name="imageA" />
            </label>
        </div>
        <div class="msg"></div>
        <textarea name="contentsA"></textarea>
    </div> <!-- //#firstChoice end  -->
    <div id="secondChoice" class="choice_size no_image">
        <div>
            <label>
            <i class="fas fa-plus-circle no_image"></i>
                <input class="hidden_input screen_out file" data-file="1" type="file"/>
                <img class="img" width="380" height="260"/>
				<input type="hidden" name="imageB"/>
            </label>
        </div>
		<div class="msg"></div>
        <textarea name="contentsB"></textarea>
    </div> <!-- //#secondChoice end  -->
    <div class="box_writing_btn">
    	<a href="/abTest/main" class="btn_write">취소</a>
     	<button class="btn_write">등록</button>
    </div>
    </form> <!-- // form action="/abTest/upload" method="post" enctype="multifile/form-data" -->
</div><!--// #ABTestUpload -->
</div>
<c:import url="/WEB-INF/template/footer.jsp"/>
<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src="/js/tui-time-picker.min.js"></script>
<script src="/js/tui-date-picker.min.js"></script>
<script src="/js/moment.min.js"></script>
<script>
	
	// Date 객체는 +1을하면 실행이 안되므로 moment라이브러리를 사용한다.
	// selectableRanges를 input다음에!
	var now = new Date((new Date()).valueOf() + 1000*3600*24);
	
    var datepicker3 = new tui.DatePicker('#wrapper1', {
        date: new Date(),
        input: {
            element: '#datepicker-input1',
            format: 'yyyy-MM-dd'
        },
        language:'ko',
        selectableRanges: [
        	[now, new Date(3000, 0, 7)]
        ]
    });

    datepicker3.on('change', function() {
        var newDate = datepicker.getDate();

        // console.log(newDate);
    });


    var datepicker = new tui.DatePicker('#wrapper3', {
        date: new Date(),
        input: {
            element: '#datepicker-input3',
            format: 'yyyy-MM-dd'
        },
        showAlways: true,
        language:'ko',
        timepicker: {
            layoutType: 'tab',
            inputType: 'spinbox'
        }
    });

    var profileReg = /^image/;
    var oldProfile = null;
    
    var $firstFileName = $("#firstFileName") ;
    var $secondFileName =$("#secondFileName") ;

    function checkImage() {
    	
    	// jquery $(this)
    	// jquery 식에 맞게 요소의 정보들이 object로 표시된다.
    	var $that = $(this);
    	
    	// alert(1);
    	// jquery객체에서 순수자바스크립트요소객체 얻기
    	// var profile = $(this).get(0);
  
    	// input type=file요소(순수자바스크립트)는 무조건
    	// files배열을 가지고 있습니다.
    	// console.log(profile);
    	
    	// 한 개의 파일
    	// 순수 자바 this
    	// html 태그 요소가 표시된다.
    	// console.log(this);
    	
    	var file = this.files[0];
    	
    	console.log(file);
    		
    	// File 객체의 속성
    	// - type : MIME( image/jpeg, audio/mp3, video/mp4...)
    	// - name : 파일명
    	// - lastModified : 최종수정일
    	// - size : 파일 크기
    	
    	// parents(부모에서 찾고자하는 요소 클래스명/ 아이디)
    	var $choice =  $that.parents(".choice_size");
    	// find(자식에서 찾고자하는 요소 클래스명/ 아이디)
    	var $msg =  $choice.find(".msg");
    	
    	if(file==null||file.size<=0) {
    		$msg.text("제대로 된 파일을 선택해주세요.");
    		return;
    	}//if end
    	
    	//이미지인지 확인!!
    	if(!profileReg.test(file.type)) {
    		$msg .text("이미지 파일을 선택해주세요.");
    		return;
    	}else {
    		$msg.text("");
    	}//if~else end
    	
    	if(oldProfile!=file.name) {
    		
    	oldProfile = file.name;
    	
    	//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
    	//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
    	
    	//ajax로 넘길 폼을 생성하고
    	var form = new FormData();
    	
    	//우리가 선택한 파일을 붙임
    	form.append("type","P");//일반적인 데이터
    	
    	//1)파라미터명, 2) 파일 3) 파일명
    	form.append("image",file,file.name);
    	
    	//multipart/form-data로 ajax처리
    	$.ajax({
    		url:"/ajax/image/upload",
    		dataType:"json",
    		type:"POST",//multipart/form-datas
    		processData:false,//multipart/form-data
    		contentType:false,//multipart/form-data
    		data:form,
    		error:function() {
    			alert("에러!");
    		},
    		// 파일업로드는 ajax로 처리되어서 metafile enctype으로 안해도 된다!
    		// json.src -> 실질 업로드 주소

    		success:function(json) {
    			// input 요소를 생성하여서 name을 같게하여 번지수로 받기
    			// img요소의 src속성을 바꾸는 것 
	    			$that.next().attr("src","/img/abTest/"+json.src);
	    			$that.next().next().val(json.src);
	    			$choice.removeClass("no_image");
    		}//success end
    	});//ajax() end
    	}//if end
    }//checkImage() end
    
	// label은 click을 하면 두번 걸리게 되어있다.
	// label/input의 이벤트 리스너를 붙이고 싶다면 무조건 change를 쓰도록!
	// checkImage()를하면 함수를 호출하는 것이다. checkImage를하여 함수를 사용하는것!
    $(".file").change(checkImage);
    
  	//FirstImage사진이 변경되면
    //$("#firstFile").change(checkImage);//change() end
    
 	//SecondImage사진이 변경되면
    //$("#secondFile").change(checkImage);//change() end
    

  //  $(".file").click(function () {
   // 	var idx = $(this).data("file");
  //      console.log(idx);
   // 	checkImage(idx);
  //  });
    
    var term = $("#datepicker-input1").val();
    var now= moment();
    
    
    //form submit
    $("#ABTestUpload form").submit(function() {
    	//checkFirstImage();
    	//checkSecondImage();
    	if($("#firstChoice").hasClass("no_image")){
    		alert(" 첫번째 파일 서브밋 안됨");
    		return false;
    	}else if($("#secondChoice").hasClass("no_image")){
    		alert(" 두번째 파일 서브밋 안됨");
    		return false;
    	}
    });//submit() end
    
</script>
</body>
</html>