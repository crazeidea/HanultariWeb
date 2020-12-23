<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>home</h3>
<a class="btn_f" href="https://www.naver.com">btn_test</a>
<div style="position: absolute; right: 0px; top: 25px; overflow: hidden; margin-right: 100px;"> 
	<ul style="overflow: hidden;">
		<c:if test="${ empty login_info }">
			<li>
				<a class="btn_f" href="login">로그인</a>
				<a class="btn_f" href="sign-up">회원가입</a>
			</li>
		</c:if>
		
		<c:if test="${ !empty login_info }">
			<li>
				<label>${login_info.name}</label>님
				<a class="btn_f" href="logout">로그아웃</a>
			</li>
		</c:if>
	</ul>
</div>
</body>
</html>