<div class='ui container'>
	<h2 class='ui header'>계정 정보</h2>
	<form class='ui large form'>
		<div class='two fields'>
			<dlv class='field'>
				<h3 class='ui header'>이메일</h3>
				<span class='ui text medium'>${user.email}</span>
			</dlv>
		</div>
		<div class='two fields'>
			<dlv class='field'>
				<h3 class='ui header'>이름</h3>
				<span class='ui text medium'>${user.name}</span>
			</dlv>
			<dlv class='field'>
				<h3 class='ui header'>별명</h3>
				<span class='ui text medium'>${user.nickname}</span>
			</dlv>
		</div>
		<div class='two fields'>
			<dlv class='field'>
				<h3 class='ui header'>전화번호</h3>
				<span class='ui text medium'>${user.tel}</span>
			</dlv>
		</div>
	</form>
	<button class='ui button primary' onclick="location.href = '/account/update' ">정보 수정</button>
	<button class='ui button' onclick="location.href = '/'">돌아가기</button>
</div>