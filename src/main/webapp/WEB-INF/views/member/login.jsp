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

#id, #pw{margin: 10px 0;}
</style>
</head>
<body>
<div class="content">
	<div class="logo">logo</div>
		<div class="form">
			<form action="login" method="post">
				<div class="title_intro">
					<span class="title_text_before" >주차장을 찾는</span><br/>
					<span class="title_text_after">새로운 경험</span>
				</div>
				<input type="text" id="id" class="input_box" placeholder="아이디"/>
				<input onkeypress="if(event.keyCode==13){go_login()}" type="password" id="pw" class="input_box" placeholder="비밀번호"/>
				<input type="submit" class="btn_login" onclick="go_login()" value="로그인">
				<span class="line"></span>
				<a href="naverlogin"><img class="social" alt="네이버 로그인" src="imgs/naver_login.png"></a>
				<a href="sign_up" class="sign_up">회원가입</a>
			</form>
		</div>
	<div class="footer">footer</div>
</div>
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