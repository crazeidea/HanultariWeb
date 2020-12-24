document.addEventListener("DOMContentLoaded", function () {
  /* 루트 폴더 설정 */
  var HOME_PATH = window.HOME_PATH || ".";

  /* 지도 관련 변수 */
  var infowindow = new naver.maps.InfoWindow();

  /* 지도 생성 */
  var map = new naver.maps.Map("map", {
    zoom: 17,
  });

  /* 마커 데이터 수신 및 처리 */
 
  $.ajax({
    type: "GET",
    url: "/app/getMarkerData",
    success: function (response) {
      for (var i = 0; i < Object.keys(response).length; i++) {
        var object = response[i];
        var marker = new naver.maps.Marker({
            position : new naver.maps.LatLng(object.lat, object.lng),
            clickable : true,
            title : object.name,
            map : map
        });
        console.log("Marker Created / Count : " + Object.keys(response).length);

        var infowindow = new naver.maps.InfoWindow({
            content: '<div><p>Test infowindow</p></div>'
        });
        
        naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
        });
      }
    },
  });

  function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(
      position.coords.latitude,
      position.coords.longitude
    );

    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.

    infowindow.setContent(
      '<div style="padding:20px;">' +
        "geolocation.getCurrentPosition() 위치" +
        "</div>"
    );
    console.log("Coordinates: " + location.toString());
  }

  function onErrorGeolocation() {
    var center = map.getCenter();

    infowindow.setContent(
      '<div style="padding:20px;">' +
        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>' +
        "latitude: " +
        center.lat() +
        "<br />longitude: " +
        center.lng() +
        "</div>"
    );
  }

  $(window).on("load", function () {
    if (navigator.geolocation) {
      /**
       * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
       * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
       * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
       */
      navigator.geolocation.getCurrentPosition(
        onSuccessGeolocation,
        onErrorGeolocation
      );
    } else {
      var center = map.getCenter();
      infowindow.setContent(
        '<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>'
      );
    }
  });

  var closed = 0;
    $("#closeNav").click(function (e) { 
      if (closed == 0) {
      $("#nav").animate({left : '-400px'}, 300, 'linear')
      $("#search").animate({left : '10px'}, 300, 'linear')
      
      closed = 1;
    } else {
        $("#nav").animate({left : '0'}, 300, 'linear')
        $("#search").animate({left : '410px'}, 300, 'linear')
        closed = 0;
    }
  });
  


}); // document.ready
