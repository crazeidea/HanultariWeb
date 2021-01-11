<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="area">
	<ul class="circles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
<div class="wrapper">
	<span class="logo" onclick="location.href = '/'">대따</span>
	<div class="ui large form">
		<div class="ui stacked segment">
			<div class="ui field">
				<h1>
					주차장을 찾는 <br /> 새로운 경험
				</h1>
			</div>
			<div class="ui field">
				<h3>이메일</h3>
				<div class="ui left icon input">
					<i class="user icon"></i> <input type="text" id="email"
						name='email' placeholder="" />
				</div>
			</div>
			<div class="ui field">
				<h3>비밀번호</h3>
				<div class="ui left icon input">
					<i class="lock icon"></i> <input
						onkeypress="if(event.keyCode==13){login()}" type="password"
						id="pw" name='pw' placeholder="" />
				</div>
			</div>

			<button class="ui primary button fluid large" onclick="login()">로그인
		</div>

		<div class="ui message">
			<h4>회원이 아니신가요?</h4>
			<button class="ui primary button fluid large"
				onclick="location.href = '/signup'">회원가입
		</div>
	</div>
</div>


</div>
</div>

<script type="text/javascript">
	tippy.setDefaultProps({
		placement : 'left'
	});

	tippy('#email', {
		content : '❗ 이메일과 비밀번호가 일치하지 않습니다.',
		trigger : 'manual'
	});
	const idinstance = document.getElementById('email');
	idinstance._tippy.disable();

	function login() {
		var idcheck, pwcheck;
		if ($('#email').val() == "") {
			tippy('#email', {
				content : '❗ 이메일을 입력하세요.'
			});
			$('#email').focus();
			return;
		} else {
			idcheck = true;
		}

		if ($('#pw').val() == "") {
			tippy('#pw', {
				content : '❗ 비밀번호를 입력하세요.'
			});
			$('#pw').focus();
			return;
		} else {
			pwcheck = true;
		}

		if (idcheck && pwcheck) {
			$.ajax({
				type : "GET",
				url : "login/execute",
				data : {
					email : $('#email').val(),
					pw : $('#pw').val()
				},
				success : function(response) {
					console.log(response);
					if (response == true) {
						location.href = document.referrer;
					} else if (response == false) {
						idinstance._tippy.enable();
						idinstance._tippy.show();
					}

				}
			});
		}
	}
</script>