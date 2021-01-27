		<div class='ui container'>
		<h1>공지글수정</h1>	
		<form method="post" enctype='multipart/form-data' action='/notice/update' class="ui big form">
		<input type='hidden' name='id' value='${dto.id}' />
		<input type='hidden' name='attach'/>
		<div class="field">
			<h3>제목</h3>
			<input type='text' title='제목' name='title' value='${dto.title}' />
		</div>
		<div class="field">
			<h3>작성자</h3>
			<div class="ui disabled input">
			<input type="text" value="${dto.writer}"/>
			</div>
		</div>
		<div class="field">
			<h3>내용</h3>
	    	<div class="ui corner labeled input">
		        <textarea name='content' class='ui input' title='내용'> ${dto.content}</textarea>
		   	</div>	
		</div>
			<button class='ui button primary' onclick="$('form').submit()">저장</button>
			<button class='ui button' href='javascript:history.go(-1)'>취소</button>
		</form>
	</div>







