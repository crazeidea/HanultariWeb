<div id="map" style="width: 100vw; height: 100vh" class="clearfix"></div>

<div style="font-family:'vitro'; font-size:3rem; position: absolute; top:10px; left: 10px; color: var(--black);">대따</div>
<div id="navCircle" class="bg-primary"><i class="fas fa-bars"></i></div>

<div id="nav" class="shadow">
    <div id="logo">
        <div style="font-family:'vitro'; font-size:2.4em; color:var(--black);">대따</div>
        <button class="btn bg-white" onclick="location.href = '/login'">로그인</button>
        <button class="btn bg-primary" onclick="location.href = '/signup'">회원가입</button>
    </div>
    <div id="menu">
        <div class="btn bg-primary" onclick="location.href = '/list.no'"><i class="fas fa-bullhorn"></i></div>
        <div class="btn bg-primary" onclick="location.href = '#'"><i class="fas fa-star"></i></div>
        <div class="btn bg-primary" onclick="location.href = '/cs'"><i class="fas fa-user"></i></div>
        <div class="btn bg-primary" onclick="location.href = '#'"><i class="fas fa-cogs"></i></div>
        <p>공지사항</p>
        <p>즐겨찾기</p>
        <p>회원정보</p>
        <p>설정</p>
    </div>
    <div id="content">
    
    </div>
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

<div id="profile" class="bg-primary"><i class="fas fa-user"></i></div>

