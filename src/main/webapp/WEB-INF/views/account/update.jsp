<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class='ui container'>
	<h2 class='ui header'>계정 정보 수정</h2>
	<form class='ui large form' id='account' method='post' action="/account/update">
	<input type='hidden' name='id' value='${user.id}'>
		<div class='two fields'>
			<div class='field'>
				<label>이메일</label>
				<input type='text' name='email' value='${user.email }' disabled/>
			</div>
		</div>
				<div class='two fields'>
			<div class='field'>
				<label>비밀번호</label>
				<input type='password' id='pw' name='pw' value=''/>
			</div>
			<div class='field'>
				<label>비밀번호 확인</label>
				<input type="password" id='pw-check' name='pw-check' value=''/>				
			</div>
		</div>
		<div class='two fields'>
			<div class='field'>
				<label>이름</label>
				<input type='text' id='name' name='name' value='${user.name }' disabled />
			</div>
			<div class='field'>
				<label>별명</label>
				<input type="text" name='nickname' value='${user.nickname }'/>				
			</div>
		</div>
		<div class='two fields'>
			<div class='field'>
				<label>전화번호</label>
				<input type='text' name='tel' id='tel' value='${user.tel }' />
			</div>
		</div>
		<button type='button' class='ui button primary' onclick='updateAccount()'>저장</button>
		<button type='button' class='ui button'>취소</button>
		
	</form>
</div>

<script>

	function updateAccount() {
		var pw = $("#pw").val();
		var pwcheck = $("#pw-check").val();
		var tel = $("#tel");

		if(pw == "") {
			$('#pw').popup({content : '비밀번호를 입력하세요', on:'manual', position:'left center'});
			$('#pw').popup('show');
			$('#pw').focus();
		}

		if(pw != pwcheck) {
			$("#pw-check").popup({content: '비밀번호가 일치하지 않습니다', on:'manual', position:'left center'});
			$("#pw-check").popup('show');
			$("#pw-check").focus();
			return; 
		}

		if(tel.val() == "") {
			$('#tel').popup({content : '휴대전화번호를 입력하세요', on:'manual', position:'left center'});
			$('#tel').popup('show');
			$('#tel').focus();
		}
		$("#account").submit();

	}

</script>