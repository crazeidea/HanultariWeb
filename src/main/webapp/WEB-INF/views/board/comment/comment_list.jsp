<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:forEach items="${list }" var="dto">
<div data-seq=${dto.id }>
	${dto.name } [${dto.writedate }]
	<c:if test="${login_info.id eq dto.writer}">
	<span style='float:right'>
		<a class='btn-modify-save'>수정</a>
		<a class='btn-delete-cancel'>삭제</a>
	</span>
	</c:if>
	<div class='original'>${fn:replace(   fn:replace(dto.content, lf, '<br>')   , crlf, '<br>')}</div>
	<div class='modify' style='display:none; margin-top:6px'></div>
</div><hr>
</c:forEach>
