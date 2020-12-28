<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
</head>
<body>
<div class="wrap_cont wrap_notices">
	<div class="area_tit">
		<h4 class="tit_corp">대따 공지사항<br/>
							작성페이지</h4>
	</div>

<form method="post" action="insert.no" enctype="multipart/form-data">
<table>
<tr><th>제목</th>
	<td><input title="제목" class="mandatory" type="text" name="title" /></td>
</tr>
<tr><th>작성자</th>
	<td class='left'>${login_info.name}</td>
</tr>
<tr><th>내용</th>
	<td><textarea title='내용' class='mandatory' name='content'></textarea></td>
</tr>
<!-- <tr><th>첨부파일</th>
	<td class='left'>
		<label>
		<input type='file' name='file' id='attach-file' />
		<img src='image/select.png' class='file-img' /> 
		</label>
		<span id='file-name'></span>
		<a id='delete-file'><i class='fas fa-times'></i></a>
	</td>
</tr> -->
</table>
</form>
<div class='wrap_btn'>
<a class="btn_save" onclick='if( necessary() ) $("form").submit()'>저장</a> <!-- 아직 멤버가없어서 저장은 안됌, 커서로 바꾸고 싶음.. -->
<a class="btn_cancel" href='list.no' >취소</a>
</div>
</div>
<script type="text/javascript" src="script/file_attach.js"></script>
<script type="text/javascript" src="script/mandatory_check.js"></script>
</body>
</html>