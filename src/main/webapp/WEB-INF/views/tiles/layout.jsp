<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" type="text/css" href="css/style.css?v=<%=new java.util.Date().getTime()%>">
</head>
<body>
<header>
<tiles:insertAttribute name="header"/>
</header>
<div id="content">
<tiles:insertAttribute name="content"/>
</div>
<footer>
<tiles:insertAttribute name="footer"/>
</footer>
</body>
</html>