<div class="ui container">
	<h1>1:1 문의 답변</h1>
	<h2>1:1 문의</h2>
	<form class="ui big form">
		<div class="field">
			<h3>제목</h3>
			<div class="ui input">
				<input type='text' value="${ticket.title}" disabled/>
			</div>
		</div>
		<div class="two fields">
			<div class="field">
				<h3>작성자</h3>
				<div class="ui input">
					<input type="text" value="${ticket.writer}" disabled/>
				</div>
			</div>
			<div class="field">
				<h3>작성일자</h3>
				<div class="ui input">
					<input type="text" value="${ticket.writedate }" disabled/>
				</div>
			</div>
		</div>
		<div class="field">
			<h3>내용</h3>
			<div class="ui corner disabled input">
				<textarea class="ui input" title="내용">${ticket.content }</textarea>
			</div>
		</div>
	</form>
	<h2>답변 작성</h2>
	<form id="ticketReply" class="ui big form" method="post" action="/ticket/answer?id=${ticket.id}">
		<div class="field">
			<h3>제목</h3>
			<div class="ui input">
				<input type='text' name="title"/>
			</div>
		</div>
		<div class="field">
			<h3>작성자</h3>
			<div class="ui input">
				<input type="text" value="대따" name="writer" disabled/>
			</div>
		</div>
		<div class="field">
			<h3>답변 내용</h3>
			<div class="ui input">
				<textarea name="content"></textarea>
			</div>
		</div>
		<input type="hidden" value="${ticket.id}" name="root"/>
	</form>
	<div class='btnSet'>
		<button class='ui button primary' onclick='$("#ticketReply").submit()'>저장</button>
		<button class='ui button' href='javascript:history.go(-1)'>취소</button>
	</div>
</div>















