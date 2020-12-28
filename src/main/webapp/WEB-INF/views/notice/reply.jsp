<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글쓰기</title>
</head>
<body>
<h4>대따 공지사항 답글쓰기</h4>
<form method="post" enctype='multipart/form-data' action='reply_insert.no'>
<input type='hidden' name='root' value='${dto.root}'/>
<input type='hidden' name='step' value='${dto.step}'/>
<input type='hidden' name='indent' value='${dto.indent}'/>
<table>
<tr><th>제목</th>
	<td><input type='text' name='title' class='mandatory' title='제목' /></td>
</tr>
<tr><th>작성자</th>
	<td>${login_info.name}</td>
</tr>
<tr><th>내용</th>
	<td><textarea name='content' class='mandatory' title='내용'></textarea></td>
</tr>
<!-- <tr><th>파일첨부</th>
	<td class='left'>
		<label><input type='file' name='file' id='attach-file' />
			<img src='imgs/select.png' class='file-img' />	
		</label>
		<span id='file-name'></span>
		<a id='delete-file'><i class='fas fa-times'></i></a>
	</td>
</tr> -->
</table>
</form>
<div class='wrap_btn'>
	<a class="btn_save" onclick='if( necessary() ){ $("form").submit() }'>저장</a>
	<a class="btn_cancel" href='detail.no?id=${dto.id}'>취소</a>
</div>
<script type="text/javascript" src="script/file_attach.js"></script>
<script type="text/javascript" src="script/mandatory_check.js"></script>
</body>
</html>