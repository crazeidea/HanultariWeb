<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="map" style="width: 100vw; height: 100vh" class="clearfix"></div>
<div class="logo" style="font-size: 3em; position: absolute; top:30px; left: 10px; color: var(--black);">대따</div>

<div id="nav" class="shadow closed">
    <div id="navContent">
    
    </div>
</div>

<div id="navClose" class="shadow">
    <i class="fas fa-chevron-left"></i>
</div>

<div id="search" class="ui huge icon input">
  <input type="text" id="query", name="query">
  <i class="search icon"></i>
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

<div id="menuicon" tabindex="-1" class="ui icon top left pointing primary dropdown button" style="position: absolute; top: 10px; right: 10px;">
  <i class="user alternate icon"></i>
  <div class="menu">
	<div class="header">대따</div>
	<div class="ui divider"></div>
	<c:if test="${empty user}">
  		<div class="item" onclick="location.href='/login'">로그인</div>
  		<div class="item" onclick="location.href='/signup'">회원가입</div>
  	</c:if>
  	<c:if test="${not empty user}">
  		<div class="item" onclick="location.href='/logout'">로그아웃</div>
  	</c:if>
    <div class="ui divider"></div>
    <c:if test="${not empty user}">
      <div class="item" onclick="showFav(${user.id});">즐겨찾기</div>
    </c:if>
    <div class="item" onclick="location.href='/notice'">공지사항</div>
    <div class="item" onclick="location.href='/faq'">자주 묻는 질문</div>
  </div>
</div>
<c:if test="${not empty user}">
	<input type="hidden" value="1" id="islogined">
</c:if>
<c:if test="${empty user} }">
	<input type="hidden" value="0" id="islogined">
</c:if>
<script>
$('.ui.dropdown')
  .dropdown()
;
</script>

