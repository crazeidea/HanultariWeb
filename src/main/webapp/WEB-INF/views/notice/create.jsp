<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
</head>
<body>
<h3>공지사항 작성페이지</h3>

<form method="post" action="insert.no" enctype="multipart/form-data">
<table>
<tr><th>제목</th>
	<td><input title="제목" type="text" name="title" /></td>
</tr>
<tr><th>작성자</th>
	<td class='left'>${login_info.name}</td>
</tr>
<tr><th>내용</th>
	<td><textarea title='내용' name='content'></textarea></td>
</tr>
</table>
</form>
<div >
<a onclick='if( necessary() ) $("form").submit()'>저장</a>
<a href='list.no' >취소</a>
</div>
</body>
</html>