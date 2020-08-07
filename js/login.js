//비밀번호 * 표시
$(document).ready(function() {
    $("input[name*='pass']").each( function (index, item) {
        $(item).attr('type', 'password');
    });
    $("input#id").focus(); 
});

// 취소 버튼
function cancel(url){
    event.preventDefault();
    if(confirm("로그인을 취소하시겠습니까?") == 0){
        return;
    }else{
        location.href = url;
    }
}
 
// 로그인 버튼
function check(){
    input_check();
}