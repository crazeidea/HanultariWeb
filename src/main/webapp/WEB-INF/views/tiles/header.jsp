<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="ui container">
	<div class="ui massive secondary menu">
		<div class="item">
			<span onclick='location.href="/"' class="ui text huge logo">대따</span>
		</div>
		<div class="right menu">
			<a href="/about" class="item">대따소개</a> <a href="/notice" class="item">공지사항</a>
			<div class="ui simple dropdown item">
				고객센터 <i class="dropdown icon"></i>
				<div class="menu">
					<a class="item" href="/ticket/faq">자주 묻는 질문</a>
					<c:if test="${not empty user and user.admin eq 'n'}">
						<a class="item" href="/ticket/log">1:1 문의</a>
					</c:if>
					<c:if test="${user.admin eq 'y'}">
						<a class="item" href="/ticket/list">문의 관리</a>
					</c:if>
				</div>
			</div>
			<c:if test="${user.admin eq 'y'}">
			<a href="/manage" class="item">주차장 관리</a>
			</c:if>
			<div class="ui simple dropdown item">
				<c:if test="${empty user}">
				로그인
				<i class="dropdown icon"></i>
					<div class="menu">
						<a class="item" href="/login">로그인</a>
						<a class="item" href="/signup">회원가입</a>
					</div>
				</c:if>
				<c:if test="${not empty user}"> 
				${user.nickname} 
				<i class="dropdown icon"></i>
					<div class="menu">
						<a class="item" href="/account">계정 설정</a> 
						<a class="item" href="/logout">로그아웃</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
