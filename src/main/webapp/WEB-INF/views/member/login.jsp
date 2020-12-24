<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
background-color: black;
color: white;
}

.social{
width: 100%;
height: 50px;
}
</style>
</head>
<body>
<div class="logo">logo</div>
<div class="wrap">
	<div class="form">
		<form>
			<div class="title_intro">
				<span class="title_text_before" >주차장을 찾는</span><br/>
				<span class="title_text_after">새로운 경험</span>
			</div>
			<input type="text" id="userid" placeholder="아이디"/>
			<input onkeypress="if(event.keyCode==13){go_login()}" type="password" id="userpw" placeholder="비밀번호"/>
			<button class="btn_login" onclick="go_login()">로그인</button>
			<span class="line"></span>
			<a href="naverlogin"><img class="social" alt="네이버 로그인" src="imgs/naver_login.png"></a>
			<a href="sign_up" class="sign_up">회원가입</a>
		</form>
	</div>
</div>
<div class="footer">footer</div>
<script type="text/javascript">
function go_login(){
	if($('#userid').val()==''){
		alert('아이디를 입력하세요!');
		$('#userid').focus();
	}else if($('#userpw').val()==''){
		alert('비밀번호를 입력하세요!');
		$('#userpw').focus();
		return;
	}
}
</script>
</body>
</html>