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
          var infowindow = new naver.maps.InfoWindow({
            borderColor : "transparent",
            backgroundColor : "transparent"

          });
          $.ajax({
            type: "GET",
            url: "/app/getSingleParkingData?id=" + marker.id,
            success: function (response) {
              console.log(response);
              console.log(marker.position.lat() + ", " + marker.position.lng());
              console.log(response.paid);
              var info = "<div id='infowindow'><div>"
                       + "" + setBadge(response.paid, response.woman, response.disabled) + ""
                       + "<span class='small'>현재 위치에서 " + getDistance(marker.position.lat(), marker.position.lng()) + "</span></div>"
                       + "<h2 class='parkingname'>" + response.name + "</h2>"
                       + "<h3>지금 <span class='txt-primary'>" + (response.total - response.parked) + "</span>자리 남았어요.</h3>"
                       + "<button class='btn bg-primary full' onclick='showInfo(" + marker.id + ")'>상세정보</button>"
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

  /* 현재 지도 위치 출력 */
  naver.maps.Event.addListener(map, "bounds_changed", function(bounds) {
    var latlng = map.getCenter();
    coordsToAddr(latlng);
  })


  /* 좌측 메뉴 여닫기 */
  var closed = 0;
  $("#closeNav").click(function (e) {
    if (closed == 0) {
      $("#nav").animate({ left: "-403px" }, 300, "linear");
      $("#search").animate({ left: "50px" }, 300, "linear");
      $("#current").animate({ left: "370px" }, 300, "linear");
      closed = 1;
    } else {
      $("#nav").animate({ left: "0" }, 300, "linear");
      $("#search").animate({ left: "460px" }, 300, "linear");
      $("#current").animate({ left: "770px" }, 300, "linear");
      closed = 0;
    }
  });
}); // document.ready

/* 뱃지 출력 */
function setBadge(paid, woman, disabled) { 
  var data = "<div id='badge-set'>";
  if (paid == true) {
    data += "<span class='badge bg-primary'>유료</span>";
  } else {
    data += "<span class='badge bg-primary'>무료</span>";
  }
  // if(woman == true) {
  //   data += "<span class='badge woman'>여성</span>";
  // }
  // if(disabled == true) {
  //   data += "<span class='badge disabled'>장애인</span>";
  // }
  data += "</div>"

  return data;
}

/* 현재 위치와 마커간의 거리 계산 */
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

/* 지도 중심점 -> 지번주소 */
function coordsToAddr(coords) {
  var addrArray = [];
  naver.maps.Service.reverseGeocode({
    coords: coords,
    orders: [
      naver.maps.Service.OrderType.ADDR,
      naver.maps.Service.OrderType.ROAD_ADDR
    ].join(',')
  }, function(status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
      if (!latlng) {
        return alert('ReverseGeocode Error, Please check latlng');
      }
      if (latlng.toString) {
        return alert('ReverseGeocode Error, latlng:' + latlng.toString());
      }
      if (latlng.x && latlng.y) {
        return alert('ReverseGeocode Error, x:' + latlng.x + ', y:' + latlng.y);
      }
      return alert('ReverseGeocode Error, Please check latlng');
    }

    var address = response.v2.address;
    var jibun = address.jibunAddress.split(' ');
    $("#si").html(jibun[0]);
    $("#gu").html(jibun[1]);
    $("#dong").html(jibun[2]);
    
  })
}