<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zz60pls79j"></script>
<script src="script/script.js?v=<%=new java.util.Date().getTime()%>"></script>
<link rel="stylesheet" type="text/css" href="css/style.css?v=<%=new java.util.Date().getTime()%>">
</head>
<body>
<tiles:insertAttribute name="header"/>
<div id="content">
<tiles:insertAttribute name="content"/>
</div>
<tiles:insertAttribute name="footer"/>
</body>
</html>