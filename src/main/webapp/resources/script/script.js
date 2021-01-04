document.addEventListener("DOMContentLoaded", function () {
  /* 루트 폴더 설정 */
  var HOME_PATH = window.HOME_PATH || ".";
  /* 지도 생성 */
  map = new naver.maps.Map("map", {
    zoom: 17,
  });
  var currentLocation;

  /* 마커 데이터 수신 및 처리 */
  var markerList = [];
  $.ajax({
    type: "GET",
    url: "/getMarkerData",
    success: function (response) {
      for (var i = 0; i < Object.keys(response).length; i++) {
        var object = response[i];
        if(object.parked == object.total) {
          var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(object.lat, object.lng),
            icon: {
                url : HOME_PATH + '/image/marker-na.png'
            },
            map: map,
            id: object.id,
          });
          markerList.push(marker);
        } else {
          if (object.paid == 0) {
            var marker = new naver.maps.Marker({
              position: new naver.maps.LatLng(object.lat, object.lng),
              icon: {
                  url : HOME_PATH + '/image/marker-free.png'
              },
              map: map,
              id: object.id,
            });
            markerList.push(marker);
          } else {
            var marker = new naver.maps.Marker({
              position: new naver.maps.LatLng(object.lat, object.lng),
              icon: {
                  url : HOME_PATH + '/image/marker-paid.png'
              },
              map: map,
              id: object.id,
            });
            markerList.push(marker);
          }
        }
      
      }
      console.info("Markers Loaded");
    },
  });

 
  function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(
      position.coords.latitude,
      position.coords.longitude
    );
    currentLocation = location; // 거리 계산을 위해 현재 위치 변수 전달
    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정

    // 사용자 위치에 마커 생성
    var userMarker = new naver.maps.Marker({
      position: new naver.maps.LatLng(position.coords.latitude, position.coords.longitude),
      icon : {
        url : HOME_PATH + '/image/usermarker.gif'
      },
      map : map
    })
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
          console.log("Marker Clicked!" + marker.id);
          var infowindow = new naver.maps.InfoWindow({
            borderColor : "transparent",
            backgroundColor : "transparent"
          });
          $.ajax({
            type: "GET",
            url: "/getSingleParkingData?id=" + marker.id,
            success: function (response) {
              var info = "<div id='infowindow'><div>"
                       + "" + setBadge(response.paid) + ""
                       + "<span class='small'>현재 위치에서 " + getDistance(marker.position.lat(), marker.position.lng()) + "</span></div>"
                       + "<h2 class='parkingname'>" + response.name + "</h2>"
                       + "<h3>지금 <span class='txt-primary'>" + (response.total - response.parked) + "</span>자리 남았어요.</h3>"
                       + "<button class='btn bg-primary full' onclick='showInfo(" + marker.id + "," + marker.position.lat()+ "," + marker.position.lng() + ")'>상세정보</button>"
                       + "</div>";
              infowindow.setContent(info);
            }
          });
          infowindow.open(map, marker);
          map.panTo(marker.position);
        });
      });
    } else {
      var center = map.getCenter();
    }
  });

  /* 현재 지도 위치 주소 출력 */
  naver.maps.Event.addListener(map, "bounds_changed", function(bounds) {
    var latlng = map.getCenter();
    coordsToAddr(latlng);
  });

  naver.maps.Event.addListener(map, "click", function(e) {
    console.log("Map clicked!");
  });

  /* 좌측 메뉴 여닫기 */
  
  var navcircle = $('#navCircle');
  var navtoggle = 0;
  navcircle.on("click", function() {
    if ( navtoggle == 0) {
    $('#nav').css("display", "grid");
    navcircle.css("background-color", "white").css("border", "5px solid var(--primary-color)").css("color", "var(--primary-color)").css("border-radius", "40px 40px 0px 0px");
    navtoggle = 1;
    } else if (navtoggle == 1) {
      $('#nav').css("display", "none");
      navcircle.css("background-color", "var(--primary-color)").css("border", "none").css("color", "white").css("border-radius", "40px");
      navtoggle = 0;
    }
  });
  
  /* 검색 결과 클릭 */
  $(document).on('click', '.searchitem', function() {
    var latlng = new naver.maps.LatLng($(this).attr('data-lat'), $(this).attr('data-lng'));
    console.log("Searchitem Clicked " + latlng);
    showSearchItem(latlng);
  })

  /* 검색창 입력 시 지역정보 출력 */
  $("input#query").on("change keyup", function (e) {     
    var query = $("input#query").val();
    showQuery(query);
  });

}); // document.ready

