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

<div id="menuicon" class="ui icon top left pointing primary dropdown button" style="position: absolute; top: 10px; right: 10px;">
  <i class="user alternate icon"></i>
  <div class="menu">
	<div class="header">대따</div>
	<div class="ui divider"></div>
	<c:if test="${empty user}">
  		<div class="item" onclick="location.href='/login'">로그인</div>
  	</c:if>
  	<c:if test="${not empty user}">
  		<div class="item" onclick="location.href='/logout'">로그아웃</div>
  	</c:if> 
  		<div class="item">
	      <i class="dropdown icon"></i>
	      <span class="text">설정</span>
	      <div class="menu">
	        <div class="item">
	          Convert Uploaded Files to PDF
	        </div>
	      </div>
    	</div>
  		

    
    <div class="item">Comfortable</div>
    <div class="item">Cozy</div>
    <div class="item">Compact</div>
    <div class="ui divider"></div>
    <div class="item">Settings</div>
    
    <div class="item">Manage Apps</div>
    <div class="item">Keyboard Shortcuts</div>
    <div class="item">Help</div>
  </div>
</div>
<script>
$('.ui.dropdown')
  .dropdown()
;
</script>

