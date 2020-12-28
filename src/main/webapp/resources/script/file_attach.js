/**
 * 파일첨부와 관련된 함수
 */
//파일을 선택하기
$('#attach-file').on('change', function(){
	if( this.files[0] ) $('#file-name').text( this.files[0].name );
	$('#delete-file').css('display', 'inline');
});

//첨부한 파일을 삭제하기
$('#delete-file').on('click', function(){
	$('#file-name').text(''); //화면에 보이는 파일명
	$('#attach-file').val('');//실제 첨부된 파일정보
	$('#delete-file').css('display', 'none');
});