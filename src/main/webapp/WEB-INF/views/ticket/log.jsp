<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="ui container">
	<h1>고객센터</h1>
	<table class="ui single line table" id="log">
		<thead>
			<tr>
				<th></th>
				<th class='w-px60'>번호</th>
				<th>제목</th>
				<th class='w-px120'>작성일자</th>
			</tr>
		</thead>		
		<tbody>
			<c:forEach items="${ticket}" var="dto" varStatus="status">
				<tr>
					<c:if test="${dto.status eq 0 }">
					<td><a class="ui yellow label">답변 대기</a></td>
					</c:if>
					<c:if test="${dto.status eq 1 }">
					<td><a class="ui green label">답변 완료</a></td>
					</c:if>
					<td>${status.index + 1 }</td>
					<td><a href='/ticket/detail?id=${dto.id}'>${dto.title }</a></td>
					<td>${dto.writedate }
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type='button' class='ui button primary' onclick="location.href = '/ticket/write'">문의 작성</button>
</div>
<script>
$(document).ready( function () {
    $('#log').DataTable({
        language : {
            url : 'http://cdn.datatables.net/plug-ins/1.10.22/i18n/Korean.json'
        },
        "ordering": false
    });
} );
</script>
		