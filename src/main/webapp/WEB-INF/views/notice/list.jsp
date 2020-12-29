<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
</head>
<style>
header ul, header ul li { margin:0; padding:0; display:inline; }
header div.category { font-size:18px; }
header div.category li:not(:first-child) { padding-left:30px; }
header div.category li a:hover, header div.category li a.active { 
		font-weight:bold; color:#0000cd; }
</style>
<body>
<h4>대따 공지사항 목록</h4>
<div id='list-top'>
<!-- 	로그인 테스트 -->
<div style='position:absolute; right:0; top:25px; margin-right:100px '>
	<ul>
		<c:if test='${ empty login_info }'>
		<li><a class='btn-fill' href='login'>로그인</a></li>
		<li><a class='btn-fill' href='member'>회원가입</a></li>
		</c:if>
		
		<c:if test='${ !empty login_info }'>
		<li><strong>${login_info.name}</strong> 님</li>
		<li><a class='btn-fill' href='logout'>로그아웃</a></li>
		</c:if>
	</ul>
	</div>
<div>
	<form method="post" action="list.no">
		<input type='hidden' name='curPage' value='1' />
		<ul>
			<li><select name='search'>
					<option value='all' ${page.search eq 'all' ? 'selected' : ''}>전체</option>
					<option value='title' ${page.search eq 'title' ? 'selected' : ''}>제목</option>
					<option value='content' ${page.search eq 'content' ? 'selected' : ''}>내용</option>
					<option value='writer' ${page.search eq 'writer' ? 'selected' : ''}>작성자</option>
				</select>
			</li>
			<li><input type='text' name='keyword' value='${page.keyword}'/></li>
			<li><a onclick="$('form').submit()">검색</a></li>
		</ul>
		<ul>
<%-- 		<c:if test='${login_info.admin eq "Y" }'> --%>
		<li><a href='create.no'>글쓰기</a></li>
<%-- 		</c:if> --%>
		</ul>
	</form>
</div>
</div>

<table>
<tr><th >번호</th><th>제목</th>
	<th >작성자</th><th>작성일자</th>
	<th>첨부파일</th>
</tr>
<c:forEach items="${page.list}" var="dto">
<tr><td>${dto.no }</td>
	<td class='left'>
		<c:forEach var='i' begin="1" end='${dto.indent}'>
			${i eq dto.indent ? "<img src='image/re.gif'/>" : "&nbsp;&nbsp;"}
		</c:forEach>
		<c:set var='title' value="<span class='search'>${page.keyword}</span>"/>
		<a href='detail.no?id=${dto.id}'>${fn:replace(dto.title, page.keyword, title)}</a></td>
	<td>${dto.name}</td>
	<td>${dto.writedate}</td>
	<td>${empty dto.filename ? '' : '<img class="file-img" src="image/attach.png"/>' }</td>
</tr>
</c:forEach>
</table>
</body>
</html>