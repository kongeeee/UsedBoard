<%@ page contentType="text/html; charset=utf8" %>
<form id="write_form" name="write_form" enctype="multipart/form-data" method="POST" action="write.jsp">

    <div class="row">
        <div class="input-field" style="margin: 2rem 0;">
            <input type="text" id='title' name='title'>
            <label for="title">제목</label>
        </div>
    </div>

    <div>
        <ul class="tabs">
            <input type="hidden" id="class" name="class" value="판매"/>
            <li class="tab line"><a class="black-text">판매</a></li>
            <li class="tab line"><a class="black-text">구매</a></li>
        </ul> 
    </div>

    <div class="row">
        <div class="input-field col s4" style="margin-top:2rem; width: 30%; margin-right: 0;">
            <input type="text" id="price" name="price" value="0">
            <label for="price">가격</label>
        </div>
        <p class="col s1" style="font-size: 16px; margin-top: 2rem;">원</p>
    </div>

    <div class="row linetop">
        <p class="col s3">판매자 정보</p>
        <p class="col s9"> ${sessionScope.name} / ${sessionScope.phone}</p>
    </div>

    <div id="img_box">
        <i class="large material-icons" onclick="$('#file_input').trigger('click')">add_a_photo</i>
        <input id="file_input" type="file" style="display: none" accept="image/*" onchange="fileInfo(this)" name="image"/>
    </div>

    <textarea name="content" id="content" rows="15" cols="60" placeholder="내용을 입력하세요"></textarea>

    <div class="center">
        <button id="check" class="btn waves-effect waves-light green lighten-1" onclick="FormCheck()">작성</button>
        <button class="btn waves-effect waves-light green lighten-1" onclick="cancel()">취소</button>
    </div>

</form>