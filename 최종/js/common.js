// 버튼 링크 함수 (IE에서 동작하지 않아서 a태그 대신 사용하는 함수)
function link(url) { location.href = "./" + url; }

// 자동 초기화
$(document).ready(function(init){
    M.AutoInit();
});

// 파일 업로드/삭제
function fileInfo(f){
    let file = f.files; 
    let num=0;

    for(let i=0; i<file.length; i++){
        let reader = new FileReader(); 
        reader.onload = function(rst){
            $('#img_box').append('<img src="' + rst.target.result + '"width="99" height="100" id="num'+num+'" class="imgs">');
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