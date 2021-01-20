<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="ui container">
		<h1>고객센터</h1>
		<table class="ui single line table" id="ticketlist">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${ticket}" var="ticket">
			<tr>
				<td>${ticket.id}</td>
				<td><a href="/ticket/detail?id=${ticket.id}">${ticket.title}</a></td>
				<td>${ticket.writer }</td>
				<td>${ticket.writedate }</td>			
			</tr>			
			</c:forEach>

			</tbody>
		</table>
	</div>
<script>
$(document).ready( function () {
    $('#ticketlist').DataTable({
        language : {
            url : 'http://cdn.datatables.net/plug-ins/1.10.22/i18n/Korean.json'
        },
        "ordering": false
    });
} );
</script>