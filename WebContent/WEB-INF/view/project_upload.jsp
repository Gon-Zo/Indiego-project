<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로젝트 업로드</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/tui-editor.min.css">
<link rel="stylesheet" href="/css/tui-editor-contents.min.css" />
<link rel="icon" href="/img/favicon.png" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link rel="stylesheet" href="/css/project_upload.css">
</head>
<body>
	<div id="wrap">
	
	${project.no }
	${project.gameTitle }
		<form action="/gameSpec" method="post">
			<div class="content_release_date">
				출시일 <input class="inp_release_date" name="releaseDate"
					value="${game.releaseDate }"
					placeholder="*필수 ex) 2010-10-10">
				<!-- .inp_release_date end -->
			</div>
			<!-- .content_release_date end -->
			<div class="content_price">
				가격 <input class="inp_price" name="price" value="${game.price }"
					placeholder="*필수 ex) 3000">
				<!-- .inp_price end -->
			</div>
			<!-- .content_price -->
			<div class="content_sale">
				할인가 <input class="inp_price" name="salePrice"
					placeholder="선택 ex) 1000">
				<!-- .inp_price end -->
			</div>
			<!-- .content_price -->
			<div class="inp_upload">
				<div class="fa_plus">
					<i class="fas fa-plus"></i>
				</div>
				<!-- .fa_plus end -->
				<input id="main" type="file" name="image" placeholder="썸네일 이미지"
					class="screen_out">
				<!-- #main end -->
				<canvas id="mainCanvas" width="150" height="150"></canvas>
				<!-- #mainCanvas end -->
			</div>
			<!-- .inp_upload end -->
			<div class="box_border">
				<div class="inp_upload2">
					<div class="fa_plus2">
						<i class="fas fa-plus"></i>
					</div>
					<!-- .fa_plus2 end 폰트어썸 + -->
					<input id="main2" type="file" name="title" placeholder="이미지"
						class="screen_out">
					<!-- #main2 end -->
					<canvas id="mainCanvas2" width="150" height="150"></canvas>
					<!-- #mainCanvas2 end -->
				</div>
				<!-- .inp_upload2 end -->
			</div>
			<!-- .box_border end -->

			<div>
				<label class="text_upload"> 게임업로드 : <input
					class="inp_file_upload" type="file" name="fileName">
				</label>
			</div>
			<div class="form_content1">
				<div class="game_introduction">게임 상세 소개</div>
				<!-- .game_introduction -->
				<div id="editSection"></div>

				<div class="system_specifications">시스템 사양</div>
				<div class="content_min">
					<div class="title_min">최소</div>
					<div>
						운영체제:<input class="inp_min_operating_system" name="osM"
							placeholder="ex) XP/Vista/7/8">
					</div>
					<div>
						프로세서:<input class="inp_min_processor" name="processorM"
							placeholder="ex) 2 Ghz Dual Core">
					</div>
					<div>
						메모리:<input class="inp_min_memory" name="memoryM"
							placeholder="ex) 2 GB RAM">
					</div>
					<div>
						그래픽:<input class="inp_min_graphics" name="graphicM"
							placeholder="ex) Graphics card supporting DirectX 9.0c">
					</div>
					<div>
						DirectX:<input class="inp_min_direct_x" name="directxM"
							placeholder="ex) DirectX 9.0">
					</div>
					<div>
						네트워크:<input class="inp_min_network" name="networkM"
							placeholder="ex) Lan">
					</div>
					<div>
						저장공간:<input class="inp_min_storage_space" name="storageSpaceM"
							placeholder="ex) 100 MB 사용 가능 공간">
					</div>
					<div>
						<input type="hidden" name=type value="M" placeholder="최소사양 타입"></i>
					</div>
				</div>
				<!-- .content_min end-->
				<div class="content_recommended">
					<form action="/gameSpec" method="post">
						<div class="title_recommended">권장</div>
						<div>
							운영체제:<input class="inp_recommended_operating_system" name="osB"
								placeholder="ex) XP/Vista/7/8">
						</div>
						<div>
							프로세서:<input class="inp_recommended_processor" name="processorB"
								placeholder="ex) 2 Ghz Dual Core">
						</div>
						<div>
							메모리:<input class="inp_recommended_memory" name="memoryB"
								placeholder="ex) 2 GB RAM">
						</div>
						<div>
							그래픽:<input class="inp_recommended_graphics" name="graphicB"
								placeholder="ex) Graphics card supporting DirectX 9.0c">
						</div>
						<div>
							DirectX:<input class="inp_recommended_direct_x" name="directxB"
								placeholder="ex) DirectX 9.0">
						</div>
						<div>
							네트워크:<input class="inp_recommended_network" name="networkB"
								placeholder="ex) Lan">
						</div>
						<div>
							저장공간:<input class="inp_recommended_storage_space"
								name="storageSpaceB" placeholder="ex) 100 MB 사용 가능 공간">
						</div>
						<div>
							<input type="hidden" name=typeM value="M" placeholder="권장사양 타입"></i>
						</div>
						<div>
							<input type="hidden" name=typeB value="B" placeholder="권장사양 타입"></i>
						</div>
				</div>
				<!-- .content_recommended -->
			</div>
			<!-- .form_content1 end -->
			<div class="btn_small_wrap">
				<button class="btn_small">업로드</button>
				<!-- .btn_small end -->
			</div>
			<!-- .btn_small_wrap end -->
		</form>
	</div>
	<!-- #wrap end -->
	<script src="/js/jquery.js"></script>
	<script src="/js/tui-code-snippet.min.js"></script>
	<script src='/js/markdown-it.js'></script>
	<script src="/js/to-mark.min.js"></script>
	<script src="/js/codemirror.js"></script>
	<script src="/js/highlight.js"></script>
	<script src="/js/squire-raw.js"></script>
	<script src="/js/tui-editor-Editor.js"></script>
	<script>
	
		//에디터
		$('#editSection').tuiEditor({
			initialEditType : 'wysiwyg',
			previewStyle : 'vertical',
			height : 300,
			language : "ko_KR"
		});

		$("#getBtn").click(function() {
			var value = $('#editSection').tuiEditor("getValue");
			$("#input type hidden").val(value);
		});//edit end

		
		/*   $sadfasfasfasf.submit(function() 
		 		{
		 	
		 	
		 	 var value = $('#editSection').tuiEditor("getValue");
		      $("#input type hidden").val(value);
		 	
		 	
		 		}) */

		//이미지 업로드
		var

		$mainCanvas = $("#mainCanvas"), $main = $("#main"), mainCanvas = $mainCanvas
				.get(0), mainCtx = mainCanvas.getContext("2d"), width = 0, height = 0, x = 0, y = 0;

		var img = null;

		$main.change(function() {

			var file = $main.get(0).files[0];

			//alert(file);

			var reg = /^image\//;

			if (!reg.test(file.type)) {

				alert("이미지를 선택해주세요~");

				$main.val("");

				return;
			}

			var reader = new FileReader();

			//파일을 DataURL로 읽어옵니다.
			reader.readAsDataURL(file);

			//다 읽었으면 onload 이벤트 발생
			reader.onload = function() {
				//alert("다 읽었어요!");

				//alert(reader.result);

				//$("img").attr("src",reader.result);

				//이미지 객체 생성후

				img = new Image();
				img.src = reader.result;

				//이미지 로딩후
				img.onload = function() {

					x = 0;
					y = 0;

					width = img.width;
					height = img.height;

					if (width <= 150 || height <= 150) {

						mainCtx.clearRect(0, 0, width, height);
						$main.val("");
						mainCtx.clearRect(0, 0, 200, 200);

						alert("더 큰 이미지를 선택하세요");

						return;
					}

					console.log(width);
					console.log(height);

					// img Width의 500px 기준 배율
					var imgWidthPct = 150 / img.width;
					// img Height의 500px 기준 배율
					var imgHeightPct = 150 / img.height;
					console.log(imgWidthPct);
					console.log(imgHeightPct);

					var rate = 0;

					if (imgWidthPct < 1 || imgHeightPct < 1) {
						if (imgWidthPct <= imgHeightPct) {
							width *= imgHeightPct;
							height *= imgHeightPct;

							rate = img.width * 150 / width;

							x = (img.width - rate) / 2;
							console.log("가로가 더 김");
						} else {
							width *= imgWidthPct;
							height *= imgWidthPct;

							rate = img.height * 150 / height;

							y = (img.height - rate) / 2;
							console.log("세로가 더 김");
						}
					}//

					console.log(width);
					console.log(height);
					console.log(rate);
					console.log(x);
					console.log(y);

					// $imgCan.attr({width:imgW,height:imgH}).css({left:x,top:y});

					mainCtx.clearRect(0, 0, 150, 150);
					// mainCtx.drawImage(img,0,0,width,height);

					mainCtx.drawImage(img, x, y, img.width, img.height, 0, 0,
							width, height);
				};
			};
		});
	</script>
</body>
</html>