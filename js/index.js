$(document).ready( function (init) {

    $('.img').each(function (index, item) {
        let width = Number($(item).css('width').replace(/[^-\d\.]/g, ''));
        if (width < 200) $(item).css('width', '200px');
    })

    // 카드 클릭시 해당 개시물 링크 이벤트를 건다
    $(".card").each(function (index, item) {
        $(item).click(function() {
            location.href = $(this).find('a').attr('href');
        })
    })
});