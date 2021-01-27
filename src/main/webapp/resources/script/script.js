var markerList = [];
var currentLocation;

$(document).ready(function () {

    var HOME_PATH = window.HOME_PATH || ".";
    map = new naver.maps.Map("map", {
    center: new naver.maps.LatLng(37.5666805, 126.9784147),
    zoom: 10,
    mapTypeId: naver.maps.MapTypeId.NORMAL,
  });

    infowindow = new naver.maps.InfoWindow();
    
    function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(
      position.coords.latitude,
      position.coords.longitude
    );
    currentLocation = location;

    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(16); // 지도의 줌 레벨을 변경합니다.

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
    };
  
    /* 마커 데이터 수신 및 클릭 이벤트 등록 */
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
        markerList.forEach(function(marker){
            naver.maps.Event.addListener(marker, "click", function(e){
              console.log("Marker Clicked!" + marker.id);
                infowindow = new naver.maps.InfoWindow({
                borderColor : "transparent",
                backgroundColor : "transparent"
              });
              $.ajax({
                type: "GET",
                url: "/getSingleParkingData?id=" + marker.id,
                success: function (response) {
                  var distance = getDistance(currentLocation.lat(), currentLocation.lng(), marker.position.lat(), marker.position.lng());
                  var info = "<div id='infowindow'>"
                           if(response.paid == true) {
                           info += "<div><div class='ui label large teal'>유료<a class='detail'>" + formatDistance(distance) + "</a>" + "</div></div>";
                           } else if (response.paid == false) {
                           info += "<div><div class='ui label large primary'>무료<a class='detail'>" + formatDistance(distance) + "</a>" + "</div></div>"; 
                           }
                           info += "<div><span class='ui text big' style='font-weight:700'>" + response.name + "</span></br></div>"
                                  + "<div><span class='ui text big' style='font-weight:700'>지금 <span class='ui text primary'>" + (response.total - response.parked) + "</span>자리 남았어요.</h3></div>"
                                  + "<div style='display:grid; place-items:center'><button class='ui button primary' style='margin:0 auto' onclick='showInfo(" + marker.id + "," + marker.position.lat()+ "," + marker.position.lng() + ")'>상세정보</button></div>"
                                  + "</div>";
                  infowindow.setContent(info);
                }
              });
              infowindow.open(map, marker);
            });
          });
      },
    }); // 마커 데이터 수신 및 클릭 이벤트 등록

 

     /* 검색창 입력 시 지역정보 출력 */
    $("input#query").on("keyup", function (e) {     
        var query = $("input#query").val();
        showQuery(query);
    });

    /* 검색 결과 상하 버튼 입력 시 선택 */
    var currentTabIndex = 0;
    $(document).on("keyup", function(e) {
      var code = e.which;
      console.log(code + ", " + currentTabIndex);
      if (code == 40 || code == 39) { $(".searchitem[tabindex=" + (currentTabIndex + 1) + "]").focus(); currentTabIndex++; };
      if (code == 38 || code == 37) { $(".searchitem[tabindex=" + (currentTabIndex - 1) + "]").focus(); currentTabIndex--; };
    })


    /* 장소 검색 결과 클릭 */
    var searchmarker = new naver.maps.Marker({
        position: null,
        map : map,
        animation : naver.maps.Animation.BOUNCE
    });
    $(document).on('click keypress', '.place', function(e) {
	        $('input#query').val($(this).text());
	        let lat = $(this).attr('data-lat');
	        let lng = $(this).attr('data-lng');
	        searchmarker.setPosition(new naver.maps.LatLng(lat, lng));
	        // map.setZoom(16);
	        map.panTo(new naver.maps.LatLng(lat, lng));
	        let name = $(this).html();
	        let info = "<div id='infowindow'><div>"
	        + "<h2 style='margin-bottom:10px; text-align:center'>" + name + "</h2>"
	        + "<button class='ui button primary' onclick='showParkingNearby(" + lat + ", " + lng +")'>주변 주차장 검색</button>"
	        + "</div>";
	
	        let infowindow = new naver.maps.InfoWindow({
	            borderColor : "transparent",
	            backgroundColor : "transparent",
	            content : info
	        })
	        
	        infowindow.open(map, searchmarker);
	        naver.maps.Event.addListener(searchmarker, "click", function(){
	            map.panTo(new naver.maps.LatLng(lat, lng));
	            infowindow.open(map, searchmarker);
	        })
	        $('#searchresult').css('display', 'none');
    })

    /* 주차장 검색 결과 클릭 */
    $(document).on('click keypress', '.parking', function() {
      console.log("주차장 검색 아이템 클릭")
        let id = $(this).attr('data-id');
        let lat = $(this).attr('data-lat');
        let lng = $(this).attr('data-lng');
        let latlng = new naver.maps.LatLng(lat, lng);
        let distance = formatDistance(getDistance(currentLocation.lat(), currentLocation.lng(), lat, lng))

        $.ajax({
            type: "GET",
            url: "/getSingleParkingData?id=" + id,
            success: function (response) {
              var info = "<div id='infowindow'>";
              if(response.paid == true) {
                info += "<div><div class='ui label large teal'>유료<a class='detail'>" + formatDistance(distance) + "</a>" + "</div></div>";
                } else if (response.paid == false) {
                info += "<div><div class='ui label large primary'>무료<a class='detail'>" + formatDistance(distance) + "</a>" + "</div></div>"; 
                }
                info += "<div><span class='ui text big' style='font-weight:700'>" + response.name + "</span></br></div>"
                       + "<div><span class='ui text big' style='font-weight:700'>지금 <span class='ui text primary'>" + (response.total - response.parked) + "</span>자리 남았어요.</h3></div>"
                       + "<div style='display:grid; place-items:center'><button class='ui button primary' style='margin:0 auto' onclick='showInfo(" + id + "," + lat+ "," + lng + ")'>상세정보</button></div>"
                       + "</div>";
              infowindow.setContent(info);
              infowindow.setOptions({
                borderColor : "transparent",
                backgroundColor : "transparent",
              });
              $('input#query').val(response.name);
            }
          });
          for (let i = 0; i < markerList.length; i++) {
              if (markerList[i].id == id) infowindow.open(map, markerList[i]);
          }
        map.panTo(latlng);
        $('#searchresult').css('display', 'none');
       

    })

    /* 검색 상호작용 이벤트 */

    /* 검색 창 클릭 시 */
    $('input#query').on('click', function(e) {
        if($('#searchresult').css('display') == 'none') $('#searchresult').css('display', 'grid'); // 이전의 검색 결과 표시
    })

    /* 검색 결과 클릭 시 */
    $('.searchitem').on('click', function(e){
        $('#searchresult').css('display', 'none');
        rcinfo.close(); // 열려있던 정보 창 제거
        rcmarker.setMap(null); // 표시된 마커 제거
    })

    /* 검색어 모두 삭제 시 검색 결과 창 숨김 */
    if ($('input#query').val() == "") $('#searchresult').css('display', 'none');

    /* 지도 상호작용 이벤트 */

    /* 지도 클릭 시 */
    naver.maps.Event.addListener(map, 'click', function() {
      if($('#searchresult').css('display') == 'grid') $('#searchresult').css('display', 'none'); // 검색 결과 숨김
    })

    /* 지도 스크롤 시 */
      naver.maps.Event.addListener(map, "bounds_changed", function(bounds) {
      var latlng = map.getCenter();
      coordsToAddr(latlng); // 현재 위치 지번주소 출력
      if($('#searchresult').css('display') == 'grid') $('#searchresult').css('display', 'none'); // 검색 결과 숨김
    });

    /* 지도 우클릭 시 */
    rcmarker = new naver.maps.Marker({
        position : null,
        map : map
    }); // 마커 초기화
    
    rcinfo = new naver.maps.InfoWindow({
      content : null,
      borderColor : "transparent",
      backgroundColor : "transparent"
    }) // 정보창 초기화

    naver.maps.Event.addListener(map, 'rightclick', function(e){
      naver.maps.Service.reverseGeocode({
        coords: e.latlng,
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
        addr = response.v2.address.jibunAddress
      });

      var content = "<div id='infowindow'>"  
                      + "<h3 class='ui header'>" + addr + "</h3>"
                      + "<div style='display:grid; place-items:center'><div class='ui button primary center' onclick='showParkingNearby(" + e.latlng._lat + ", " + e.latlng._lng + ")'>주변 주차장 검색</div></div>"
                      + "</div>";
      rcmarker.setPosition(e.latlng);
      rcinfo.setContent(content);
	    rcinfo.open(map, rcmarker); // 클릭 지점 정보 출력
	    map.panTo(e.latlng); // 클릭 지점 이동
    })

    /* 좌측 메뉴 열기 / 숨기기 */
    $("#navClose").on('click', function(e){
        toggleNav();
    })

    }); // window.onload
}); //document.ready
