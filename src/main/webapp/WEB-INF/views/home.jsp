<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<style type="text/css">
.form{
    position: absolute;
    top: 11px;	
    right: 37px;
    z-index: 10;
    width: 120px;
    padding: 1px 3px 5px;
}
.login{
    display: block;
    overflow: hidden;
    width: 69px;
    height: 16px;
    padding: 9px 0 11px;
    font-weight: bold;
    font-size: 12px;
    line-height: 16px;
    color: #1f8cff;
    text-align: center;	 
}
</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zz60pls79j"></script>
</head>
<body>
<div class="form">
	<a class="login" href="login">로그인</a>
</div>

<!-- 	map api key -->
<div id="map" style="width:100%;height:500px;">
</div>

<script>
var HOME_PATH = window.HOME_PATH || '.';

var position = new naver.maps.LatLng(35.15346218128609, 126.88823213648745);

var map = new naver.maps.Map('map', {
    center: position, //지도의 초기 중심 좌표
    zoom: 17, //지도의 초기 줌 레벨
    minZoom: 7, //지도의 최소 줌 레벨
    zoomControl: true, //줌 컨트롤의 표시 여부
    zoomControlOptions: { //줌 컨트롤의 옵션
    position: naver.maps.Position.TOP_RIGHT
    }
});

var latlngs = [
	new naver.maps.LatLng(35.15207140262052, 126.89022593876422),		//서구청 위.경도
    new naver.maps.LatLng(35.151772592691344 , 126.88873379208408),		//서구청 건너편 주차장 위.경도
    new naver.maps.LatLng(35.15273252752573, 126.88866665834313),		//농성 주차장1
    new naver.maps.LatLng(35.150329607773315, 126.89031881703804),		//농성2동 행복센터
    new naver.maps.LatLng(35.15431888401284, 126.88387664983391)
];

var markerList = [];

for (var i=0, ii=latlngs.length; i<ii; i++) {
    var icon = {
            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(i * 29, 0)
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon
        });

    marker.set('seq', i);

    markerList.push(marker);

    marker.addListener('mouseover', onMouseOver);
    marker.addListener('mouseout', onMouseOut);

    icon = null;
    marker = null;
}

function onMouseOver(e) {
    var marker = e.overlay,
        seq = marker.get('seq');

    marker.setIcon({
        url: HOME_PATH +'/img/example/sp_pins_spot_v3_over.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 50)
    });
}

function onMouseOut(e) {
    var marker = e.overlay,
        seq = marker.get('seq');

    marker.setIcon({
        url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
        size: new naver.maps.Size(24, 37),
        anchor: new naver.maps.Point(12, 37),
        origin: new naver.maps.Point(seq * 29, 0)
    });
}

var marker = new naver.maps.Marker({
    map: map,
    position: position
});

var contentString = [
    '<div class="iw_inner">',
    '   <h3>한울직업전문학교</h3>',
    '   <p>광주광역시 서구 농성동 | 광주광역시 서구 경열로 110 한울직업전문학교<br />',
    '       <a href="http://www.hanuledu.co.kr/" target="_blank">www.hanuledu.co.kr</a>',
    '   </p>',
    '</div>'
].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString,
    maxWidth: 140,
    backgroundColor: "#eee",
    borderColor: "#2db400",
    borderWidth: 5,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "#eee",
    pixelOffset: new naver.maps.Point(20, -20)
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

naver.maps.Event.addListener(map, 'click', function(e) {
    marker.setPosition(e.coord);
});



</script>
=======
    <p>test</p>
>>>>>>> c0d5386e4608eb40986a16056089c8cb971a0490
=======
    <a class="btn-f" href="https://www.naver.com">btn_test</a>
>>>>>>> a1af7219106caa196033eeeadccb147a100bd2d9
</body>
</html>