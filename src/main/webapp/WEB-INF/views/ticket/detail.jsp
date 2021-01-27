<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<div class="ui container">
<div class="ui grid contaier">
	<div class="four column row">
		<div class="left floated column"><h1>1:1 문의</h1></div>
	</div>
	<table class="ui table">
		<tr><th>제목</th>
		<td class='left' colspan='5'>${dto.title}</td>
		</tr>
		<tr><th>작성자</th><td>${dto.writer}</td>
		<th>작성일자</th><td>${dto.writedate}</td>
		</tr>
		<tr><th>내용</th>
		<td class='left' colspan='5'>${fn: replace(dto.content, crlf, '<br>') }</td>
		</tr>
	</table>
	<c:if test="${not empty answer }">
	<h3 class='ui header'>답변</h3>
	<table class="ui table">
		<tr><th>제목</th>
		<td class='left' colspan='5'>${answer.title}</td>
		</tr>
		<tr><th>작성자</th><td>${answer.writer}</td>
		<th>작성일자</th><td>${answer.writedate}</td>
		</tr>
		<tr><th>내용</th>
		<td class='left' colspan='5'>${fn: replace(answer.content, crlf, '<br>') }</td>
		</tr>
	</table>
	</c:if>
	

	<button class='ui button' 
		onclick="history.back() ">목록으로</a>
	<c:if test='${user.admin eq "y"}'>
	<button class='ui button' onclick="location.href='/ticket/reply?id=${dto.id}'">답변</button>
	<button class='ui button' onclick="location.href='/ticket/edit?id=${dto.id}'">수정</a>
	<button class='ui button negative' 
	onclick="if( confirm('정말 삭제하시겠습니까?') ){ location.href='/ticket/delete?id=${dto.id}' }">삭제</a>
	</c:if>

</div>
</div>







