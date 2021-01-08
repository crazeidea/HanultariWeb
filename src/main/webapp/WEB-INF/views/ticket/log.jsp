<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div id="ticket" class="ui grid container">
	
		<div class="four column row">
			<div class="left floated column"><h1>고객센터</h1></div>
		</div>
			<form method="post" action="/ticket" class="four column row">
			<input type='hidden' name='curPage' value='1' />
				<div class="three wide column">
					<select	name='search' class="ui selection dropdown">
						<option value='all' ${page.search eq 'all' ? 'selected' : ''}>전체</option>
						<option value='title' ${page.search eq 'title' ? 'selected' : ''}>제목</option>
						<option value='content'
							${page.search eq 'content' ? 'selected' : ''}>내용</option>
						<option value='writer'
							${page.search eq 'writer' ? 'selected' : ''}>작성자</option>
					</select>
				</div>
				<div class="ten wide column">
					<div class="ui icon input action">
					 <input type='text' name='keyword' value='${page.keyword}' />
					 <button class="ui icon button" onclick="$('form').submit()">
					 	<i class="search icon"></i>
					 </button>
					</div>
				</div>
				<div class="three wide column">
				<button class="ui button primary" onclick="location.href='ticket/write'">글쓰기</button>
				</div>
			</form>
		</div>

		<table class="ui single line table">
			<tr>
				<th class='w-px60'>번호</th>
				<th>제목</th>
				<th class='w-px100'>작성자</th>
				<th class='w-px120'>작성일자</th>
			</tr>
			<c:forEach items="${page.list}" var="dto">
				<tr>
					<td>${dto.no }</td>
					<td class='left'><c:forEach var='i' begin="1"
							end='${dto.indent}'>
			${i eq dto.indent ? "<img src='imgs/re.gif'/>" : "&nbsp;&nbsp;"}
		</c:forEach> <c:set var='title'
							value="<span class='search'>${page.keyword}</span>" /> <a
						href='ticket/detail?id=${dto.id}'>${fn:replace(dto.title, page.keyword, title)}</a></td>
					<td>${dto.writer}</td>
					<td>${dto.writedate}</td>
				</tr>
			</c:forEach>
		</table>
		<div class='btnSet'>
			<jsp:include page="/WEB-INF/views/include/page.jsp" />
		</div>
	</div>
</div>