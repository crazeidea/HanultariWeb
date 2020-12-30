<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대따 방명록 수정화면</title>
</head>
<body>
<div class="wrap_cont wrap_notices">
	<div class="area_tit">
		<h4 class="tit_corp">대따<br/>
					방명록 수정페이지</h4>
	</div>
	<form enctype='multipart/form-data' method="post" action='update.bo'>
<input type='hidden' name='id' value='${dto.id}'/>
<input type='hidden' name='attach' />
<table>
<tr><th>제목</th>
	<td><input value='${dto.title}' type='text' name='title' title='제목' class='mandatory' /></td>
</tr>
<tr><th>작성자</th>
	<td class='left'>${login_info.name}</td>
</tr>
<tr><th>내용</th>
	<td><textarea class='mandatory' name='content' title='내용'>${dto.content}</textarea></td>
</tr>
<tr><th>첨부파일</th>
	<td class='left'>
		<label>
			<input type='file' name='file' id='attach-file' />
			<img src='image/select.png' class='file-img' />
		</label>
		<span id='file-name'>${dto.filename}</span>
		<span id='preview'></span>
		<a id='delete-file'><i class='fas fa-times'></i></a>
	</td>
</tr>
</table>
</form>
<div class='wrap_btn'>
	<a class='btn_save' 
			onclick="if( necessary() ){ $('[name=attach]').val( $('#file-name').text() );  $('form').submit() }">저장</a>
	<a class='btn_cancel' href='detail.bo?id=${dto.id}'>취소</a>
</div>
</div>
<script type="text/javascript" src='script/mandatory_check.js'></script>
<script type="text/javascript" src='script/file_attach.js'></script>
<script type="text/javascript">
if( ${!empty dto.filename} ){
	$('#delete-file').css('display', 'inline');
}

</script>
</body>
</html>