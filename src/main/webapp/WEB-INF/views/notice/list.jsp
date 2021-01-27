<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="ui container">

	<h1>공지사항</h1>
	<table class="ui single line table" id="notice">
	<thead>
		<tr>
			<th class='w-px60'>번호</th>
			<th>제목</th>
			<th class='w-px100'>작성자</th>
			<th class='w-px120'>작성일자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${notice}" var="dto">
			<tr>
				<td>${dto.id }</td>
				<td><a href='notice/detail?id=${dto.id}'>${dto.title}</a></td>
				<td>${dto.writer}</td>
				<td>${dto.writedate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<button class='ui button primary' onclick='location.href = "/notice/write" '>공지글 작성</button>
</div>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>  
<script>
$(document).ready( function () {
    $('#notice').DataTable({
        language : {
            url : 'http://cdn.datatables.net/plug-ins/1.10.22/i18n/Korean.json'
        },
        "ordering": false
    });
} );

</script>