<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{text-align: left;}
.form{border:1px solid #e5e5e5;}
.title_text_after{
	font-size: 24px; 
	color: #252525; 
	font-weight: normal; 
	width: 100%;
}
.subtitle_text{
	font-size: 12px;
	color: black;
	font-weight: normal;
	margin-top: 40px;
}
.input_box{border-bottom: 1px solid #ccc}
#pw{margin-bottom: 10px;}
input::placeholder{color: #ccc}
.form{height: 100%;}
.content{
height: 1345px;
}
header{
font-size: 2em;
font-weight: bold;
text-align: center;
}
</style>
</head>
<body>
<header>logo</header>
<div class="content">
	<div class="form" style="border: none;">
		<form action="sign_up" method="post">
			<div style="margin-bottom: 23px;">
				<span class="title_text_after">정보를 입력해주세요</span>
			</div>
			<div class="subtitle_text">아이디</div>
			<div>
				<input type="text" id="id" class="input_box" placeholder="아이디 입력">
				<label class="error_info">아이디를 입력해주세요.</label>
				<button class="btn_e">중복확인</button>
			</div>
			<div>
				<div class="subtitle_text">비밀번호</div>
				<input type="password" id="pw" class="input_box" placeholder="비밀번호(8~32자리)" >
				<input type="password" id="pw_check" class="input_box" placeholder="비밀번호 재입력">
				<label class="error_info">비밀번호를 입력해주세요.</label>
			</div>
			<div>
				<div class="subtitle_text">닉네임</div>
				<input type="text" id="nickname" class="input_box" placeholder="닉네임을 입력해주세요" >
				<label class="error_info">닉네임이 등록되지 않았습니다. 닉네임을 입력해주세요.</label>
			</div>
			<div>
				<div class="subtitle_text">이름</div>
				<input type="text" id="name" class="input_box" placeholder="이름 입력">
				<label class="error_info">이름이 등록되지 않았습니다. 이름을 입력해주세요.</label>
			</div>
			<div>
				<div class="subtitle_text">이메일</div>
				<input type="text" id="email" class="input_box" placeholder="이메일 입력">
				<label class="error_info">이메일을 입력해주세요.</label>
			</div>
			<div>
				<div class="subtitle_text">전화번호</div>
				<input type="tel" class="input_box" placeholder="전화번호 입력">
				<label class="error_info">전화번호를 입력해주세요.</label>
				<button class="btn_e">중복확인</button>
			</div>
		</form>
		<div style="margin-bottom: 20px;">
			<a class='btn_e' style="float: right;" click='go_join()'>회원가입</a>
			<a class='btn_e' style="float: left;" href='javascript:history.go(-1)'>취소</a>
		</div>
	</div>
</div>
</body>
</html>