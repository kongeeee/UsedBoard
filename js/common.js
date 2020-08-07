$(document).ready (function () {
    // 매터리얼 요소 자동 초기화
    M.AutoInit();
});

function input_check() {
    $(".input-field > input").each( function (index, item) {
        if ($(item).val() == "") {
            $(item).focus();
            let label = $("label[for='" + $(item).attr('id') + "']").text();
            alert(label + "를(을) 입력해 주세요");
            event.preventDefault();
            return false;
        }
    })
    return true;
}