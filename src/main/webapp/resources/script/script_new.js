$(document).ready(function () {

    var HOME_PATH = window.HOME_PATH || ".";
    map = new naver.maps.Map("map", {
    center: new naver.maps.LatLng(37.5666805, 126.9784147),
    zoom: 10,
    mapTypeId: naver.maps.MapTypeId.NORMAL,
  });

  var infowindow = new naver.maps.InfoWindow();
  var currentLocation;

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
        markerList.forEach(function(marker){
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
                           + "<span class='small'>현재 위치에서 " + getDistance(currentLocation.lat(), currentLocation.lng(), marker.position.lat(), marker.position.lng()) + "</span></div>"
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
      },
    }); // 마커 데이터 수신 및 클릭 이벤트 등록

    /* 현재 지도 위치 주소 출력 */
    naver.maps.Event.addListener(map, "bounds_changed", function(bounds) {
        var latlng = map.getCenter();
        coordsToAddr(latlng);
    });

     /* 검색창 입력 시 지역정보 출력 */
    $("input#query").on("change keyup", function (e) {     
        var query = $("input#query").val();
        showQuery(query);
    });

    /* 장소 검색 결과 클릭 */
    var searchmarker = new naver.maps.Marker({
        position: null,
        map : map,
        animation : naver.maps.Animation.BOUNCE
    });
    $(document).on('click', '#locationSearchResult .searchitem', function() {
        $('input#query').val($(this).text());
        let lat = $(this).attr('data-lat');
        let lng = $(this).attr('data-lng');
        searchmarker.setPosition(new naver.maps.LatLng(lat, lng));
        // map.setZoom(16);
        map.panTo(new naver.maps.LatLng(lat, lng));
        let name = $(this).html();
        let info = "<div id='infowindow'><div>"
        + "<h2 style='margin-bottom:10px; text-align:center'>" + name + "</h2>"
        + "<button class='btn bg-primary full'>주변 주차장 검색</button>"
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
    })

    /* 주차장 검색 결과 클릭 */
    $(document).on('click', '#parkingSearchResult .searchitem', function() {
        let id = $(this).attr('data-id');
        let lat = $(this).attr('data-lat');
        let lng = $(this).attr('data-lng');
        let latlng = new naver.maps.LatLng(lat, lng);
        $.ajax({
            type: "GET",
            url: "/getSingleParkingData?id=" + id,
            success: function (response) {
              var info = "<div id='infowindow'><div>"
                       + "" + setBadge(response.paid) + ""
                       + "<span class='small'>현재 위치에서 " + getDistance(currentLocation.lat(), currentLocation.lng(), lat, lng) + "</span></div>"
                       + "<h2 class='parkingname'>" + response.name + "</h2>"
                       + "<h3>지금 <span class='txt-primary'>" + (response.total - response.parked) + "</span>자리 남았어요.</h3>"
                       + "<button class='btn bg-primary full' onclick='showInfo(" + response.id + "," + $(this).attr('data-lat')+ "," + $(this).attr('data-lng') + ")'>상세정보</button>"
                       + "</div>";
              infowindow.setContent(info);
              infowindow.setOptions({
                borderColor : "transparent",
                backgroundColor : "transparent",
              });
            }
          });
          for (let i = 0; i < markerList.length; i++) {
              if (markerList[i].id == id) infowindow.open(map, markerList[i]);
          }
        map.panTo(latlng);

    })

    /* 검색 창 클릭 시 검색 결과 출력 */
    $('input#query').on('click', function(e) {
        if($('#searchresult').css('display') == 'none') $('#searchresult').css('display', 'grid');
    })

    $('.searchitem').on('click', function(e){
        $('#searchresult').css('display', 'none');
    })

    /* 검색어 모두 삭제 시 검색 결과 창 숨김 */
    if ($('input#query').val() == "") $('#searchresult').css('display', 'none');

    /* 검색결과 이동 */
    $('input#query').keydown(function(e) {
        
        if(e.keyCode == 40) {
            console.log("Key down pressed!");
            $('.searchitem:first-child').focus();
        }
    })



    

    }); // window.onload
}); //document.ready