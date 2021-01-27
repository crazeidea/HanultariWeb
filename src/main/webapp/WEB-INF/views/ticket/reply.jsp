<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>답글쓰기</h3>
<form method="post" enctype='multipart/form-data' action='reply_insert.no'>
<input type='hidden' name='root' value='${dto.root}'/>
<input type='hidden' name='step' value='${dto.step}'/>
<input type='hidden' name='indent' value='${dto.indent}'/>
<table>
<tr><th class='w-px150'>제목</th>
	<td><input type='text' name='title' class='mandatory' title='제목' /></td>
</tr>
<tr><th>작성자</th>
	<td>${login_info.name}</td>
</tr>
<tr><th>내용</th>
	<td><textarea name='content' class='mandatory' title='내용'></textarea></td>
</tr>
<tr><th>파일첨부</th>
	<td class='left'>
		<label><input type='file' name='file' id='attach-file' />
			<img src='imgs/select.png' class='file-img' />	
		</label>
		<span id='file-name'></span>
		<a id='delete-file'><i class='fas fa-times'></i></a>
	</td>
</tr>
</table>
</form>
<div class='btnSet'>
	<a class='btn-fill' onclick='if( necessary() ){ $("form").submit() }'>저장</a>
	<a class='btn-empty' href='detail.no?id=${dto.id}'>취소</a>
=======
﻿<div class="ui container">
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
>>>>>>> ff7d17e4b7560a8fe0b21bb0b0433af2a1bcb333
</div>















