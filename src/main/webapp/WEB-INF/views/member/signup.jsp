<div class="wrapper">
	<div class="left-section">
	<span onclick="location.href = '/'">대따</span>
		<div>
			<h1>
				주차장을 찾는 <br /> 새로운 경험
			</h1>
			<span style="font-family: 'vitro'">대따</span>
		</div>
	</div>
	<div class="right-section">
		<div class="signup-form">
			<form id="signup">
				<p style="font-weight: 800">아이디</p>
				<input type="text" id="id" class="input_box" placeholder="" />
				<p style="font-weight: 800">비밀번호</p>
				<input onkeypress="if(event.keyCode==13){go_login()}"
					type="password" id="pw" class="input_box" placeholder="" />
				<div class="btn bg-white shadow" onclick="go_login()">로그인</div>
				<div class="btn bg-primary shadow"
					onclick="location.href = '/signup'">회원가입</div>
			</form>
		</div>

	</div>


</div>