<div id="map" style="width: 100vw; height: 100vh" class="clearfix"></div>

<div id="nav">
    <div id="logo">
        <img src="image/logo.png" style="height:50%;">
        <div class="btn-set">
            <button class="btn bg-white" onclick="location.href = '/login'">로그인</button>
            <button class="btn bg-primary" onclick="location.href = '/signup'">회원가입</button>
        </div>
    </div>
    <div id="menu">
        <div class="btn bg-primary" onclick="location.href = '/list.no'"><i class="fas fa-bullhorn"></i></div>
        <div class="btn bg-primary" onclick="location.href = '#'"><i class="fas fa-star"></i></div>
        <div class="btn bg-primary" onclick="location.href = '/cs'"><i class="fas fa-user"></i></div>
        <div class="btn bg-primary" onclick="location.href = '#'"><i class="fas fa-cogs"></i></div>
        <p>공지사항</p>
        <p>즐겨찾기</p>
        <p>고객센터</p>
        <p>설정</p>
    </div>
    <div id="content"></div>
    <div id="closeNav">
    	<i class="fas fa-chevron-left"></i>
    </div>
</div>

<div id="search">
	<form id="searchParkinglot">
        <input type="text" id="query" name="query" placeholder=""/>
        <button class="btn bg-primary"><i class="fas fa-search"></i></button>
    </form>
</div>

<div id="current">
    <span id="si"></span>
    <span id="gu"></span>
    <span id="dong"></span>
</div>


