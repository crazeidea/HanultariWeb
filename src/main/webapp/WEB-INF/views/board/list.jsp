<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대따 방명록 리스트</title>
</head>
<body>
<div class="wrap_cont wrap_notices">
	<div class="area_tit">
		<h4 class="tit_corp">대따 방명록<br/>
							작성페이지</h4>
	</div>
<form method="post" action="list.bo">
<div>
<ul><li><select name='search'>
				<option value='all' ${page.search eq 'all' ? 'selected' :''}>전체</option>
				<option value='title' ${page.search eq 'title' ? 'selected' :''}>제목</option>
				<option value='content' ${page.search eq 'content' ? 'selected' :''}>내용</option>
				<option value='writer' ${page.search eq 'writer' ? 'selected' :''}>작성자</option>
			</select>
		</li>
		<li><input type='text' name='keyword' value='${page.keyword}' /></li>
		<li><a>검색</a></li>
<%-- 		<c:if test='${!empty login_info}'> --%>
		<li><a href='create.bo'>글쓰기</a></li>
<%-- 		</c:if> --%>
	</ul>
</div>
<input type='hidden' name='curPage' value='1' />
<input type='hidden' name='id' />
</form>
</div>
<div>
<table>
<tr><th >번호</th>
	<th>제목</th>
	<th >작성자</th>
	<th >작성일자</th>
	<th >첨부파일</th>
</tr>
<tr><td>${dto.no}</td>
	<td class='left'><a onclick="go_detail(${dto.id})">${fn: replace(dto.title, page.keyword, title)}</a></td>
	<td>${dto.name}</td>
	<td>${dto.writedate}</td>
	<td>${empty dto.filename ? '' : '<img src="image/attach.png" class="file-img" />' }</td>
</tr>
</table>
</div>
<script>
function go_detail(id){
	$('[name=id]').val( id );
	$('form').attr('action', 'detail.bo');
	$('form').submit();
}
</script>
</body>
</html>