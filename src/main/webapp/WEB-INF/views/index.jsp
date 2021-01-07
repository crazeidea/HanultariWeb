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
<link rel="stylesheet" type="text/css" href="css/style.css?v=<%=new java.util.Date().getTime()%>">
${css}
</head>
<body>


<div id="map" style="width: 100vw; height: 100vh" class="clearfix"></div>
<div style="font-family:'vitro'; font-size:3rem; position: absolute; top:10px; left: 10px; color: var(--black);">대따</div>

<div id="nav" class="shadow closed">
    <div id="navContent">
    
    </div>
</div>

<div id="navClose" class="shadow">
    <i class="fas fa-chevron-left"></i>
</div>

<div id="search">
        <input type="text" id="query" name="query"/>
        <button class="btn bg-primary"><i class="fas fa-search"></i></button>
</div>

<div id="searchresult">
    <div id="locationSearchResult"></div>
    <div id="parkingSearchResult"></div>
</div>

<div id="current">
    <span id="si"></span>
    <span id="gu"></span>
    <span id="dong"></span>
</div>

<div id="profile" class="bg-primary"><i class="fas fa-user"></i>
</div>

<div id="profileMenu" style="display:none;">
    <c:if test="${empty user}">
	    <a href='/login'>로그인</a>
	    <a href='/notice'>공지사항</a>
	    <a href='/customer'>고객센터</a>
	    <a href='/signup'>회원가입</a>
    </c:if>
    <c:if test="${not empty user}">
        <p>${user.nickname}</p>
 	    <a href='/account'>계정 설정</a>
	    <a href='/notice'>공지사항</a>
	    <a href='/customer'>고객센터</a>
	    <a href='/logout'>로그아웃</a>
    </c:if>
</div>

