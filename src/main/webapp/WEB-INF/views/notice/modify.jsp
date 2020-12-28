<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<h4>대따 공지사항 수정</h4>
<form method="post" enctype='multipart/form-data' action='update.no'>
<input type='hidden' name='id' value='${dto.id}' />
<input type='hidden' name='attach'/>
<table>
<tr><th>제목</th>
	<td><input type='text' class='mandatory' title='제목' name='title' value='${dto.title}' /></td>
</tr>
<tr><th>작성자</th>
	<td class='left'>${dto.name}</td>
</tr>
<tr><th>내용</th>
	<td><textarea name='content' class='mandatory' title='내용'>${dto.content}</textarea> </td>
</tr>
<%-- <tr><th>첨부파일</th>
	<td class='left'>
		<label>
			<input type='file' name='file' id='attach-file' />
			<img src='image/select.png' class='file-img' />
		</label>
		<span id='file-name'>${dto.filename}</span>
		<a id='delete-file'><i class='fas fa-times'></i></a>
	</td>
</tr> --%>
</table>
</form>
<div class='wrap_btn'>
	<a class='btn_save' 
			onclick="if( necessary() ){ $('[name=attach]').val( $('#file-name').text() );  $('form').submit() }">저장</a>
	<a class='btn_cancel' href='detail.no?id=${dto.id}'>취소</a>
</div>

<script type="text/javascript" src='script/mandatory_check.js'></script>
<script type="text/javascript" src='script/file_attach.js'></script>
<script type="text/javascript">
if( ${!empty vo.filename} ){
	$('#delete-file').css('display', 'inline');
}

</script>
</body>
</html>