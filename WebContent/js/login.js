function wrapWindowBybodyMask() {
        //화면의 높이와 너비를 구한다.
        var bodyMaskHeight = $(document).height();
        var bodyMaskWidth = $(window).width();

        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#loginBodyMask').css({
            'width' : bodyMaskWidth,
            'height' : bodyMaskHeight
        });

        //애니메이션 효과 - 70% 불투명
        $('#loginBodyMask').fadeTo("slow", 0.7);

        //클래스명이 윈도우인 창을 띄운다.
        $('.login_background_window').show();
    }

    $(document).ready(function() {
        //검은 막 띄우기
        $('.login').click(function(e) {
            e.preventDefault();
            wrapWindowBybodyMask();
        });

        //검은 막을 눌렀을 때
        $('#loginBodyMask').click(function() {
            $(this).hide();
            $('.login_background_window').hide();
        });
    });

    $(".content_menu").click(function() {
        $("#loginWrap").hide();
        $("#idPwdWrap").show();
    });//click() end

    $(".content_menu2").click(function() {
        $("#loginWrap").hide();
        $("#idPwdWrap").show();
    });//click() end

    $(".btn_mail").click(function() {
        $("#idPwdWrap").hide();
        $("#loginWrap").show();
    });//click() end

    $(".btn_mail2").click(function() {
        $("#idPwdWrap").hide();
        $("#loginWrap").show();
    });//click() end

    //아이디 탭 이메일 직접입력
    function SetEmailTail(emailValue) {
        var email = document.all("email"); // 사용자 입력
        var emailTail = document.all("email2"); // Select box

        if (emailValue == "notSelected")
            return;
        else if (emailValue == "etc") {
            emailTail.readOnly = false;
            emailTail.value = "";
            emailTail.focus();
        } else {
            emailTail.readOnly = true;
            emailTail.value = emailValue;
        }
    }

    //비밀번호 탭 이메일 직접입력
    function SetEmailTail2(emailValue2) {
        var email2 = document.all("email3"); // 사용자 입력
        var emailTail2 = document.all("email4"); // Select box

        if (emailValue2 == "notSelected2")
            return;
        else if (emailValue2 == "etc2") {
            emailTail2.readOnly = false;
            emailTail2.value = "";
            emailTail2.focus();
        } else {
            emailTail2.readOnly = true;
            emailTail2.value = emailValue2;
        }
    }

    //아이디 찾기 클릭시 아이디 찾기 탭부터 보여짐
    $(".content_menu").click(function() {

        $(".tab_content").hide();
        $(".tab_content:first").show();

        $("ul.tabs li").click(function() {
            $("ul.tabs li").removeClass("active");
            //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
            $(this).addClass("active");
            $(".tab_content").hide()
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn()
        });

    });

    //비밀번호 찾기 클릭시 비밀번호 찾기 탭부터 보여짐
    $(".content_menu2").click(function() {

        $(".tab_content").hide();
        $(".tab_content:last").show();

        $("ul.tabs li").click(function() {
            $("ul.tabs li").removeClass("active");
            //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
            $(this).addClass("active");
            $(".tab_content").hide()
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn()
        });

    });