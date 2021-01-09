<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${page eq 'login'}">
		<c:set var="css" value="<link rel='stylesheet' type='text/css' href='css/login.css'"/>
		<c:set var="title" value="로그인"/>
	</c:when>
	<c:when test="${page eq 'signup'}">
		<c:set var="css" value="<link rel='stylesheet' type='text/css' href='css/signup.css'"/>
		<c:set var="title" value="회원가입"/>
	</c:when>
</c:choose>
<title>대따 ⁝ ${title}</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fomantic-ui/2.8.7/semantic.min.js"></script>
${css}
</head>
<body>
<tiles:insertAttribute name="content"/>
</body>
</html>