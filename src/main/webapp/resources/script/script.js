document.addEventListener("DOMContentLoaded", function () {
  /* 루트 폴더 설정 */
  var HOME_PATH = window.HOME_PATH || ".";
  /* 지도 생성 */
  var map = new naver.maps.Map("map", {
    zoom: 17,
  });

  /* 마커 데이터 수신 및 처리 */
  var markerList = [];
  $.ajax({
    type: "GET",
    url: "/app/getMarkerData",
    success: function (response) {
      for (var i = 0; i < Object.keys(response).length; i++) {
        var object = response[i];
        var marker = new naver.maps.Marker({
          position: new naver.maps.LatLng(object.lat, object.lng),
          map: map,
          id: object.id,
        });
        markerList.push(marker);
      }
      console.info("Markers Loaded");
    },
  });

 
  function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(
      position.coords.latitude,
      position.coords.longitude
    );
    currentLocation = location;
    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
  }

  function onErrorGeolocation() {
    var center = map.getCenter();
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

      markerList.forEach(function(marker, i){
        naver.maps.Event.addListener(marker, "click", function(e){
          console.log("Marker Clicked / ID : " + marker.id);
          var infowindow = new naver.maps.InfoWindow();
          $.ajax({
            type: "GET",
            url: "/app/getSingleParkingData?id=" + marker.id,
            success: function (response) {
              console.log(response);
              console.log(marker.position.lat() + ", " + marker.position.lng());
              var info = "<div id='infowindow'>"
                       + "<h3>" + response.name + "</h3>"
                       + "<p>현재 위치에서" + getDistance(marker.position.lat(), marker.position.lng()) + "</p>"
                       + "지금 " + (response.total - response.parked) + "자리 남았어요."
                       + "</div>";
              infowindow.setContent(info);
            }
          });
          infowindow.open(map, marker);
        });
      });
    } else {
      var center = map.getCenter();
    }
  });

  var closed = 0;
  $("#closeNav").click(function (e) {
    if (closed == 0) {
      $("#nav").animate({ left: "-400px" }, 300, "linear");
      $("#search").animate({ left: "10px" }, 300, "linear");
      closed = 1;
    } else {
      $("#nav").animate({ left: "0" }, 300, "linear");
      $("#search").animate({ left: "410px" }, 300, "linear");
      closed = 0;
    }
  });
}); // document.ready

function setMarker(state) {

}

function getDistance(lat, lng) {
  function deg2rad(deg) {return deg * Math.PI / 180.0;}
  function rad2deg(rad) {return rad * 180.0 / Math.PI;}

  navigator.geolocation.getCurrentPosition(function(position){
    currentLocation = new naver.maps.LatLng(
      position.coords.latitude, position.coords.longitude
    )
  });
  var currentlat = currentLocation.lat();
  var currentlng = currentLocation.lng();
  var theta = currentlng - lng;
  var distance = Math.sin(deg2rad(currentlat))
                * Math.sin(deg2rad(lat))
                + Math.cos(deg2rad(currentlat))
                * Math.cos(deg2rad(lat))
                * Math.cos(deg2rad(theta));
  distance = Math.acos(distance);
  distance = rad2deg(distance);
  distance = distance * 60 * 1.1515 / 0.62137;

  if ((distance * 1000) > 1000) {
    return Math.round(distance * 10) / 10 + "km";
  } else {
    return Math.round(distance * 1000) + "m"
  }

}
