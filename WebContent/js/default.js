var $header_menu = $('.header_menu li'),
    $contents = $('#contents')
$dropDownBtn = $('#dropDownBtn');

$header_menu.on("click",function () {
    $('.on').removeClass('on');
    $(this).addClass('on');
    $contents.css({"border-top":"3px solid #fdd734"});
});

$dropDownBtn.on("click",function () {
    $(this).next().slideToggle(200);
});