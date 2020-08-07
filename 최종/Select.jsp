<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>선택창</title>
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="./js/common.js"></script>
</head>
<style>
    html, body { height: 100%; }
</style>
<body>
    <div class="select container extendopen">
        <div class="select-box row w3-animate-zoom" style="margin:0">
            <div class="col s12 center">
                <button class="select-btn btn" id="" name="" onclick="link('Login.html')"><a class="white-text" href="Login.html">로그인</a></button>
            </div>
            <div class="col s12 center">
                <button class="select-btn btn" id="" name="" onclick="link('Sign.html')"><a class="white-text" href="Sign.html">회원가입</a></button>
            </div>
            <div class="col s12 center">
                <button class="select-btn btn" id="" name="" onclick="link('index.html')"><a class="white-text" href="index.html">되돌아가기</a></button>
            </div>
        </div>
    </div>
</body>
</html>