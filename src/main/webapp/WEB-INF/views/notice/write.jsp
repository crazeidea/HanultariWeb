<div class="ui container">
	<h1>공지글쓰기</h1>
	<form method="post" action='/notice/insert'
		enctype="multipart/form-data" class="ui big form">
		<div class="field">
			<h3>제목</h3>
			<input title='제목' class='mandatory' type='text' name='title' />
		</div>
		<div class="field">
			<h3>작성자</h3>
			<div class="ui disabled input">
				<input type="text" value="${user.nickname}" />
			</div>
		</div>
		<div class="field">
			<h3>내용</h3>
			<div class="ui corner labled input">
				<textarea name="content" class="ui input" title="내용"></textarea>
			</div>
		</div>
	</form>
	<div class='btnSet'>
		<button class='ui button primary' onclick='$("form").submit()'>저장</button>
		<button class='ui button' href='javascript:history.go(-1)'>
			취소</a>
	</div>
</div>















