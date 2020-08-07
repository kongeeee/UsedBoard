//3자리 단위마다 콤마 생성
function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 
//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}
$(document).ready(function() {
    $("input#price").on("focus", function() {
        var x = $(this).val();
        x = removeCommas(x);
        $(this).val(x);

    }).on("focusout", function() {
        var x = $(this).val();
        if(x && x.length > 0) {
            if(!$.isNumeric(x)) {
                x = x.replace(/[^0-9]/g,"");
            }
            x = addCommas(x);
            $(this).val(x);
        }
    }).on("keyup", function() {
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    });

    //tab value값 주기
    $(".tab").each(function (index,item){
        $(item).on("click",function(){
            $("#class").val($(this).find('a').text());
        });
    });
    $("#check").on("click", function FormCheck() {
        if(!input_check()) { 
            event.preventDefault();
        }
        // } if ($('#content').val() == "") {
        //     alert("내용을 입력하세요");
        //     $('#content').focus();
        // }
    })
});

// 파일 업로드/삭제
function fileInfo(f){
    let file = f.files; 
    let num=0;

    for(let i=0; i<file.length; i++){
        let reader = new FileReader(); 
        reader.onload = function(rst){
            $('#img_box').append('<img src="' + rst.target.result + '"width="100" height="100" id="num'+num+'" class="imgs">');
            num++;
        }
        reader.readAsDataURL(file[i]);
    }
    document.getElementsByClassName('material-icons')[0].textContent = "";
}

$(document).on("click","#img_box .imgs",function(){ 
    $(this).remove();
    if (document.getElementById('img_box').children.length <= 2) {
        document.getElementById('file_input').value = "";
        document.getElementsByClassName('material-icons')[0].textContent = "add_a_photo";
    }
    console.log(document.getElementById('file_input').value);
});

//글쓰기


//수정 취소
function List(idx) {
    event.preventDefault();
    if(confirm("글쓰기를 취소하시겠습니까?") == 0){
        return;
    }else{
        location.href = "content.jsp?idx=" + idx;
    }
}

//글수정
function check()
{
    if(modify.title.value == "") {
        event.preventDefault();
        alert("제목을 입력해주세요");
        $('#title').focus();
        return;

    }else if(modify.content.value == "") {
        event.preventDefault();
        alert("내용을 입력해주세요");
        $('#content').focus();
        return;
    }
}

function cancel() {
    event.preventDefault();
    if (confirm("글쓰기를 취소하시겠습니까?")) {
        location.href = '/';
    }
}