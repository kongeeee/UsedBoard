$(document).ready(function () {

    // 비밀번호 input 태그에 password 타입을 지정함
    $("input[name*='pass']").each( function (index, item) {
        $(item).attr('type', 'password');
       
    });
    
    // placeholder와 label 겹침을 방지하기위해 포커싱을 해줌
    $('#phone').attr('placeholder', '010XXXXXXXX');
    $('#phone').focus();
    $('#name').focus();

    // 전화번호 하이픈 자동입력 코드
    $("input#phone").on("focus", function() {
        var x = $(this).val();
        if(!x || x.length == 0) x = "";
        else x = x.split("-").join("");
        $(this).val(x);

    })
    .on("focusout", function() {
        var x = $(this).val();
        phoneCheck(this);
        if(x && x.length > 0) {
            if(!$.isNumeric(x)) { x = x.replace(/[^0-9]/g,""); }
            x = x.toString().replace(/\B(?=(\d{4})+(?!\d))/g, "-");
            $(this).val(x);
        }
    })
    .on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });

    $("input#id").on("focusout", function() {
        $(this).attr('data-position', 'right');
        $(this).attr('data-tooltip', '이미 있는 아이디 입니다.');
        let instance = M.Tooltip.init($(this))[0];
            instance.options.exitDelay = 1000;
        $.ajax({
            url: "/idCheck.jsp",
            type: "POST",
            data: { id: $(this).val() },
            context: document.body
        }).done(function(data) {
            if (data.trim() == "true") { instance.open(); } 
            else { instance.destroy(); }
        });
    });

    // 비밀번호 체크
    $("#password2").on("focusout", function() {
        let pass1 = $("#password").val();
        $(this).attr('data-position', 'right');
        $(this).attr('data-tooltip', '비밀번호가 다릅니다.');
        let instance = M.Tooltip.init($(this))[0];
        instance.options.exitDelay = 1000;
        if ($(this).val() == "") {
            instance.destroy();
        } else if (pass1 != $(this).val()) {
            instance.open();
        } else {
            instance.destroy();
        }
    })
});

// 취소하기 버튼
function cancel(url){
    event.preventDefault();
    if(confirm("회원가입을 취소하시겠습니까?") == 0){
        return;
    }else{
        location.href = "/" + url;
    }
}

//비밀번호 확인 체크
function check(url) {
    input_check();
    if (!passCheck()) { 
        event.preventDefault();
        alert(" 비밀번호가 다릅니다."); 
    }else {
        location.href = "/" + url;
    }
}

// 비밀번호 체크 함수
function passCheck() {
    let pass1 = $('#password').val();
    let pass2 = $('#password2').val();
    let equals = true;
    if (pass1 != pass2) { equals = false; }
    return equals;
}

// 핸드폰번호 체크 함수
function phoneCheck(phone) {
    let length = $('#phone').val().length;
    let prefix = $('#phone').val().substring(0,3);
    let instance = M.Tooltip.init($(phone))[0];
    $(phone).attr('data-position', 'right');
    instance.options.exitDelay = 1000;
    if (length == 0) {
        instance.destroy();
    } else if (length != 11) {
        $(phone).attr('data-tooltip', '번호가 확실한가요?');
        instance.open();
    } else if (prefix != "010") {
        $(phone).attr('data-tooltip', prefix + '이(가) 맞으신가요?');
        instance.open();
    } else {
        instance.destroy();
    }
}