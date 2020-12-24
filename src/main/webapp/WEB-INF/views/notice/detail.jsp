<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 안내</title>
</head>
<body>
<h3>공지사항 안내</h3>
<table>
<tr><th>제목</th>
	<td class="left" colspan="5">${dto.title }</td>
</tr>
	<tr><th>작성자</th><td >${dto.name }</td>
	<th>작성일자</th><td >${dto.writedate }</td>
	<th>조회수</th><td >${dto.readcnt }</td>
</tr>
<tr><th>내용</th>
	<td class='left' colspan='5'>${fn: replace(dto.content, crlf, '<br>') }</td>
</tr>
</table>
<div>
	<a href="list.no?curPage=${page.curPage }&search=${page.search}&keyword=${page.keyword}">목록으로</a>
	<a href='modify.no?id=${dto.id}'>수정</a>
	<a onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='delete.no?id=${dto.id}' }">삭제</a>
	<c:if test='${not empty login_info}'>
	<a href='reply.no?id=${dto.id}'>답글쓰기</a>
	</c:if>
</div>
</body>
</html>