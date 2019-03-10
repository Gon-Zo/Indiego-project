
var parentsTmp =_.template($("#parentsTmp").html());

var parentStepTmp = _.template($("#parentStepTmp").html());


function getRoadmap(){
	
	$.ajax({
		
		url:"/ajax/project/"+projectNo+"/roadmap/",
		type:"get",
		dataType:"json",
		error:function(xhr,error,code){
			
			alert("서버 점검중")
		},
		success:function(data){
			console.log(data);
			
			$(".road_map").html(parentsTmp({list:data}));
		}
		
	})//getContents end
	
}

getRoadmap();



		


$('input[name="datefilter"]').daterangepicker({
	autoUpdateInput : false,
	locale : {
		applyLabel : '기간등록',
		cancelLabel : '취소'
	}
});

$('input[name="datefilter"]').on(
		'apply.daterangepicker',
		function(ev, picker) {

			$(this).val(
					picker.startDate.format('YYYY-MM-DD') + '~'
							+ picker.endDate.format('YYYY-MM-DD')).css({
				"background-image" : "none",
				"border-bottom" : "2px solid #c8ccd4"
			});
		});

$('input[name="datefilter"]').on('cancel.daterangepicker',
		function(ev, picker) {
			$(this).val('');
		});

var $addTitle = $('.add_title'),
	$popupBg = $('#popupBg'), 
	$statusPopup = $('.status.popup'), 
	$supportPopup = $('.support.popup'), 
	$milestonePopup = $('.milestone.popup'), 
	$projectWritePopup = $('.project_write.popup'), 
	$updateWritePopup = $('.update_write.popup'), 
	$checkListPopup = $('.check_list.popup'), 
	$sosRequestPopup = $('.sos_request.popup'), 
	$visibilityCheck = $("#visibilityCheck"), 
	$portfolioCheck = $("#portfolioCheck"), 
	$careerCheck = $("#careerCheck");

var addTitleInp = '<li><span><input style="margin-top: 4px" type="text" class="title_inp" data-value="title" placeholder="단계명입력"/></span></li>';

$('.sub_step_wirte').tuiEditor({
	initialEditType : 'wysiwyg',
	previewStyle : 'vertical',
	height : 600
}); // tuiEditor end

$('.update_wirte').tuiEditor({
	initialEditType : 'wysiwyg',
	previewStyle : 'vertical',
	height : 400
}); // tuiEditor end

$("#form").submit(function() {

	// 에디터에 입력한 모든 내용을 얻어옴
	var contents = $('.sub_step_wirte').tuiEditor("getValue");

	// 얻어온 에디터의 내용을 숨겨진 textarea에 값으로 저장후 submit
	$("#contents").val(contents);

});

if ($('.date_range').val != null) {
	$('.date_range').css({
		"background-image" : "none",
		"border-bottom" : "2px solid #c8ccd4",
		"cursor" : "pointer"
	});
} // 만약 달력에 값이 들어가 있으면 달력이미지를 없앤다

$visibilityCheck.click(function() {
	$(".project_visibility").toggle();
});
$portfolioCheck.click(function() {
	$(".portfolio_visibility").toggle();
});
$careerCheck.click(function() {
	$(".career_visibility").toggle();
});

function addStepTitle() {

	$(this).parents('li').after(addTitleInp);
	var $titleInp = $('.title_inp');
	$titleInp.focus();

	$titleInp.keyup(function(e) {
				var stepTitle = $titleInp.val();
				var addTitle = '<li><div class="dino_area" hidden><img src="img/dino.png" width="65px"/></div><span class="road_map_step" style="top:30px">'
						+ stepTitle
						+ '<div hidden>0%</div><div class="btn_hover area"><button class="remove_btn">단계삭제</button><button class="sos_btn">SOS요청</button></div></span></li>'

				if (e.keyCode == 13) {
					$(this).parents("li").after(addTitle)
					$(this).parents('li').before().remove();
					$(this).remove();
				}
				$('.remove_btn').click(function() {
					$(this).parents('li').remove();
				});

				$('.sos_btn').on('click', function() {
					$popupBg.show();
					$sosRequestPopup.show();
				});

			});

} // addStepTitle() end

$(".road_map").on('click','.add_title' ,function() {
	var addTitleInp = '<li><span><input style="margin-top: 4px" type="text" name="title" class="title_inp" data-value="title" placeholder="단계명입력"/></span></li>';
	alert("test");
	$(this).parent().after(addTitleInp);
	
	var $titleInp = $('.title_inp');
	$titleInp.focus();

	$titleInp.keyup(function(e) {
				var stepTitle = $titleInp.val();
				var addTitle = '<li><div class="dino_area" hidden><img src="/img/dino.png" width="65px"/></div><span class="road_map_step">'
						+ stepTitle
						+ '<div hidden>0%</div><div class="btn_hover area"><button class="remove_btn">단계삭제</button><button class="sos_btn">SOS요청</button></div></span></li>'

				if (e.keyCode == 13) {
					$(this).parents("li").after(addTitle)
					$(this).parents('li').before().remove();
					$(this).remove();
					
					$.ajax({
						url : "/ajax/project/stepTitle",
						type : "POST",
						dataType : "json",
						data : {title : stepTitle},
						error : function(xhr, error, code) {
							alert("서버 점검중")
						},
						success : function(data) {
							$("#projectTitleInp").val(data);
						}

					})
					
				}
				$('.remove_btn').click(function() {
					$(this).parents('li').remove();
				});

				$('.sos_btn').on('click', function() {
					$popupBg.show();
					$sosRequestPopup.show();
				});

			});
});

$('.remove_btn').click(function() {
	$(this).parents('li').remove();
});

$('.sos_btn').on('click', function() {
	$popupBg.show();
	$sosRequestPopup.show();
});

$('#projectTop i').click(function() {

	$('.on_bookmark').removeClass('on_bookmark');

	$(this).addClass("on_bookmark");
});

$('.project_write_save_btn').click(function() {
	alert("변경사항이 저장 되었습니다.")
	$('.project_write.popup').css('display', 'none');
	$popupBg.css("display", "none");
});

$('.check_list.popup button').click(function() {
	alert("변경사항이 저장 되었습니다.")
	$('.check_list.popup').css('display', 'none');
	$popupBg.css("display", "none");
	$('.progress_score').html("100%");
	$('.road_map li:eq(1) .dino_area').css('display', 'none');
	$('.road_map li:eq(2) .dino_area').css('display', 'block');
	$('#progressPercent').html("8%");
	$('.step_progress p').html("100%");

});

$('#downBtn').click(function() {
	$('.sub_step.area').css({
		height : 120
	});
});

var left = 0;
var $road_map = $('.road_map');

$('.right.move_btn').click(function() {
	var stop = $road_map.css("left");
	if (stop == "-2000px") {
		$(this).hide();
	} else {
		$('.left.move_btn').show();
		left -= 500;
		$road_map.css({
			left : left + "px"
		});
	}
});

$('.left.move_btn').click(function() {
	var stop = $road_map.css("left");
	if (stop == "0px") {
		$(this).hide();
	} else {
		$('.right.move_btn').show();
		left += 500;
		$road_map.css({
			left : left + "px"
		});
	}
});
$('.sub_step.area li').click(function() {
	$('.edit.area').show();

});

$('.project_status.tap').on('click', function() {
	$('.show').removeClass('show');
	$('.sos_status').addClass('show');
});

$('#updateDiaryTap').on('click', function() {
	$('.show2').removeClass('show2');
	$('.update_diary').addClass('show2');
	$(this).css({
		color : '#0e47a1',
		background : '#fdd734'
	})
	$('#projectDiaryTap').css({
		color : '#000',
		background : '#d2d2d2'
	})
});

$('#projectDiaryTap').on('click', function() {
	$('.show2').removeClass('show2');
	$('.project_diary').addClass('show2');
	$(this).css({
		color : '#0e47a1',
		background : '#fdd734'
	})
	$('#updateDiaryTap').css({
		color : '#000',
		background : '#d2d2d2'
	})
});

$('.sos_status.tap').on('click', function() {
	$('.show').removeClass('show');
	$('.project_status').addClass('show');
});

$('#supportStatusBtn').on('click', function() {
	$statusPopup.css.show();
	$popupBg.css.show();

});

$('.show_portfolio_btn').on('click', function() {
	$popupBg.show();
	$('.show_portfolio').show();
});
$('.show_help_btn').on('click', function() {
	$popupBg.show();
	$('.show_help').show();
});
$('.exit_btn').on('click', function() {
	$('.show_portfolio').hide();
	$('.show_help').hide();
});
$popupBg.on('click', function() {
	$popupBg.hide();
	$statusPopup.hide();
	$supportPopup.hide();
	$milestonePopup.hide();
	$projectWritePopup.hide();
	$checkListPopup.hide();
	$sosRequestPopup.hide();
	$('.step_guide.popup').hide();
	$updateWritePopup.hide();
});

$('.add_person').on("click", function() {
	$popupBg.show();
	$supportPopup.show();
});
$('.milestone_btn').on("click", function() {
	$popupBg.show();
	$milestonePopup.show();
});
$('.add_diary').on('click', function() {
	$popupBg.show();
	$projectWritePopup.show();

});

// $('.add_update_diary').on('click',function () {
// $popupBg.show();
// $updateWritePopup.show();
//
// });

$('.check_btn').on('click', function() {
	$popupBg.show();
	$checkListPopup.show();
});
$('.wirte_top_area .definitione_btn').on('click', function() {
	$('.step_guide.popup').show();
})
$('.edit.area .definitione_btn').on('click', function() {
	$('.sub_step_guide.popup').show();
});

$('.sub_step_guide.popup button').click(function() {
	$('.sub_step_guide.popup').hide();
});

$('.step_guide.popup button').click(function() {
	$('.step_guide.popup').hide();
});

$('.check_list_up button').click(function() {
	alert("할일이 등록 되었습니다.!")
	$(this).css({
		background : "red",
	}).html("삭제")
})
var img = null;

var changeTitle = -1;
var changeGameTitle = -1;
var changeMaxPersonnel = -1;
var changeOpen =-1;
var changeNotOpen = -1;
var changeStartDate=-1;
var changeEndDate=-1;
var changeSystem=-1;
var changeGenre=-1;
var changeImage=-1;

function updateCheck() {
	$.ajax({
		url : "/ajax/project/title",
		type : "POST",
		dataType : "json",
		data : {
			title : oldTitle,
			gameTitle : oldGameTitle,
			visibility : oldVisibility,
			maxPersonnel : oldmaxPersonnel,
			startDate : oldStartDate,
			endDate : oldEndDate,
			image : oldImage,
			system :oldSystem,
			genreNo : oldGenreNo,
			no : projectNo
		},
		error : function(xhr, error, code) {
			alert("서버 점검중")
		},
		success : function(data) {
			console.log(data);
			// $("#projectTitleInp").val(data);
		}

	})
}
$('#gameGenreCategory').click(function() {
	
	var $that = $(this);
	
	changeGenre = setInterval(function() {

		var nowGenreNo = $that.val();
		
		
		if (oldGenreNo != nowGenreNo) {
			console.log("값이 다름")
			oldGenreNo = nowGenreNo;
			updateCheck();
		}
		
		
	}, 500);

}).blur(function() {
		clearInterval(changeGenre);

	});


$('#gameSystemCategory').click(function() {
	
	var $that = $(this);
	
	changeSystem = setInterval(function() {

		var nowSystem = $that.val();
		
		
		if (oldSystem != nowSystem) {
			console.log("값이 다름")
			oldSystem = nowSystem;
			updateCheck();
		}
		
		
	}, 500);

}).blur(function() {
		clearInterval(changeSystem);

	});


$('.daterangepicker.ltr.show-calendar.opensright').focusout(function() {
	
	
	
	changeStartDate = setInterval(function() {

		var nowprojectDate = $('.date_range').val();
		
		var nowStartDate = nowprojectDate.substring(0,nowprojectDate.indexOf("~"));
		
		var nowEndDate = nowprojectDate.substring(nowprojectDate.indexOf("~")+1,nowprojectDate.length);
		
		if (oldStartDate != nowStartDate) {
			console.log("값이 다름")
			oldStartDate = nowStartDate;
			updateCheck();
		}
		
		if (oldEndDate != nowEndDate) {
			console.log("값이 다름")
			oldEndDate = nowEndDate;
			updateCheck();
		}		
	}, 500);

}).blur(function() {
	clearInterval(changeStartDate);

});


// 프로젝트 타이틀 변경 체크 업로드

$("#projectTitleInp").focus(function() {

	var $that = $(this);

	changeTitle = setInterval(function() {

		var nowTitle = $that.val();

		if (oldTitle != nowTitle) {
			console.log("값이 다름")
			oldTitle = nowTitle;
			updateCheck();
		}

	}, 500);

}).blur(function() {
	clearInterval(changeTitle);
});

$("#gameTitleInp").focus(function() {

	var $that = $(this);

	changeGameTitle = setInterval(function() {

		var nowTitle = $that.val();

		if (oldGameTitle != nowTitle) {
			console.log("값이 다름")
			oldGameTitle = nowTitle;
			updateCheck();
		}
	}, 500);

}).blur(function() {
	clearInterval(changeGameTitle);
});


$("#personLimit").focus(function() {

	var $that = $(this);

	changeMaxPersonnel = setInterval(function() {

		var nowTitle = $that.val();

		if (oldmaxPersonnel != nowTitle) {
			console.log("값이 다름")
			oldmaxPersonnel = nowTitle;
			updateCheck();
		}
	}, 500);

}).blur(function() {
	clearInterval(changeMaxPersonnel);
});


$("#open").click(function() {

	var $that = $(this);

	changeOpen = setInterval(function() {

		var nowTitle = $that.val();
	
		if (oldVisibility != nowTitle) {
			console.log("값이 다름")
			oldVisibility = nowTitle;
			updateCheck();
		}
	}, 500);

}).blur(function() {
	clearInterval(changeOpen);
});

$("#notOpen").click(function() {

	var $that = $(this);

	changeNotOpen = setInterval(function() {

		var nowTitle = $that.val();

		
		if (oldVisibility != nowTitle) {
			console.log("값이 다름")
			oldVisibility = nowTitle;
			updateCheck();
		}
	}, 500);

}).blur(function() {
	clearInterval(changeNotOpen);
});








