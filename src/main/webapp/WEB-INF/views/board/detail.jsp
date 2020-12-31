<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 상세화면</title>
</head>
<body>
<div class="wrap_cont wrap_notices">
	<div class="area_tit">
		<h4 class="tit_corp">대따 방명록<br/>
					상세페이지</h4>
	</div>
	<table>
<tr><th >제목</th>
	<td class='left' colspan='5'>${dto.title}</td>
</tr>
<tr><th>작성자</th>
	<td>${dto.name}</td>
	<th >작성일자</th>
	<td >${vo.writedate}</td>
	<th >조회수</th>
	<td >${dto.readcnt}</td>
</tr>
<tr><th>내용</th>
	<td colspan='5'>${fn:replace(dto.content, crlf, '<br>')}</td>
</tr>
<tr><th>첨부파일</th>
	<td colspan='5'>${dto.filename}
		<c:if test='${not empty dto.filename}'>
		<span id='preview'></span>
		<a href='download.bo?id=${dto.id}'><i class='fas fa-download'></i></a>
		</c:if>
	</td>
</tr>
</table>
<div class="wrap-cont">>
	<a href="list.bo?curPage=${page.curPage }&search=${page.search}&keyword=${page.keyword}">목록</a>
	<a href='modifys.bo?id=${dto.id}'>수정</a>
	<a onclick="if( confirm('정말 삭제하시겠습니까?') ){ href='delete.bo?id=${dto.id}' }">삭제</a>
	<c:if test='${not empty login_info}'>
	</c:if>
</div>
</div>

<div style='margin:0 auto; padding-top:20px; width:500px;'>
	<div id='comment_regist'>
		<span class='left'><strong>댓글작성</strong></span>
		<span class='right'><a onclick='comment_regist()'>댓글등록</a></span>  <!-- onclick 안먹음... -->
		<textarea id='comment' style='width:99%; height:60px; resize:none; margin-top:5px'></textarea>
	</div>
	<div id='comment_list' class='left'>
	</div>
</div>

<form method="post" action='list.bo'>
<input type='hidden' name='id' value='${dto.id}' />
<input type='hidden' name='curPage' value='${page.curPage}' />
<input type='hidden' name='search' value='${page.search}' />
<input type='hidden' name='keyword' value='${page.keyword}' />
<input type='hidden' name='pageList' value='${page.pageList}' />
<input type='hidden' name='viewType' value='${page.viewType}' />
</form>

<div id='popup-background' onclick="$('#popup, #popup-background').css('display', 'none');"></div>
<div id='popup'></div>

<script type="text/javascript">
if( ${!empty dto.filename} ){ //첨부파일이 있는 경우 이미지파일인지를 판단하여 미리보기
	showAttachedImage( '#preview', '${dto.filename}', '${dto.filepath}' );
}
$('#preview-img').click(function(){
	$('#popup, #popup-background').css('display', 'block');
	showAttachedImage( '#popup', '${dto.filename}', '${dto.filepath}' );
});

//여기가 안되는데...
function comment_regist(){
	//로그인되어 있어야 댓글저장 가능
	if( ${empty login_info} ){
		alert('댓글을 등록하려면 로그인하세요');
		return;
	}else if( $('#comment').val().trim()=='' ){
	//댓글이 입력되어 있어야 저장 가능
		alert('댓글을 입력하세요');
		$('#comment').val('');
		$('#comment').focus();
		return;
	}		

	$.ajax({
		type: 'post',
		url: 'board/comment/insert',
		data: { pid:${dto.id}, content:$('#comment').val() },
		success: function( response ){
			if( response==1 ){
				alert('댓글이 등록되었습니다');
				$('#comment').val('');
				comment_list();
			}else if( response==0 ) alert('댓글등록 실패!');
			else {
				location = 'list.bo';
			}
			
		},error: function(req, text){
			alert(text + ':' + req.status);
		}
	});
}

function comment_list(){
	$.ajax({
		url: 'board/comment/${dto.id}',
		success: function(response){
			$('#comment_list').html( response );
		},error: function(req, text){
			alert(text + ':' + req.status);
		}		
	});
}
comment_list();
</script>
</body>
</html>