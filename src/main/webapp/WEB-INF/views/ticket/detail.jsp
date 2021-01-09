<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<div class="ui container">
<div class="ui grid contaier">
	<div class="four column row">
		<div class="left floated column"><h1>공지사항</h1></div>
	</div>
	<table class="ui table">
<tr><th class='w-px150'>제목</th>
	<td class='left' colspan='5'>${dto.title}</td>
</tr>
<tr><th>작성자</th><td>${dto.writer}</td>
	<th class='w-px120'>작성일자</th><td class='w-px120'>${dto.writedate}</td>
	<th class='w-px80'>조회수</th><td class='w-px60'>${dto.readcnt}</td>
</tr>
<tr><th>내용</th>
	<td class='left' colspan='5'>${fn: replace(dto.content, crlf, '<br>') }</td>
</tr>
</table>
<div class='btnSet'>
	<button class='ui button' 
		onclick="location.href='/notice?curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}'">목록으로</a>
	<c:if test='${user.admin eq "y" and user.nickname eq dto.writer }'>
	<button class='ui button' onclick="location.href='/notice/edit?id=${dto.id}'">수정</a>
	<button class='ui button negative' 
	onclick="if( confirm('정말 삭제?') ){ href='delete?id=${dto.id}' }">삭제</a>
	</c:if>
</div>
</div>
</div>







