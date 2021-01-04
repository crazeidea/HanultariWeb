/* 뱃지 출력 */
function setBadge(paid) { 
    var data = "<div id='badge-set'>";
    if (paid == true) {
      data += "<span class='badge bg-secondary'>유료</span>";
    } else {
      data += "<span class='badge bg-primary'>무료</span>";
    }
    data += "</div>"
  
    return data;
  }
  
  /* 현재 위치와 특정 위치간의 거리 계산 */
  function getDistance(slat, slng, dlat, dlng) {
    function deg2rad(deg) {return deg * Math.PI / 180.0;}
    function rad2deg(rad) {return rad * 180.0 / Math.PI;}
    var theta = slng - dlng;
    var distance = Math.sin(deg2rad(slat))
                  * Math.sin(deg2rad(dlat))
                  + Math.cos(deg2rad(slat))
                  * Math.cos(deg2rad(dlat))
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
  
  /* 주차장 상세 정보 표시 */
  function showInfo(id, lat, lng) {
    $('#content').html('/')
    $.ajax({
      type: "GET",
      url: "/getSingleParkingData?id=" + id,
      success: function (response) {
        var html = "<h2>주차장 정보</h2>"
                    + "<div id='pano' style='width:400px; height:400px'></div>"
                    + "<h3>" + response.name + "</h3>"
                    + "<h4>지금 " + (response.total - response.parked) + "대 주차할 수 있어요.</h4>"
                    + "<h4>주차장 정보</h4>"
                    + "<h5>기본요금 " + response.fare + "</h5>"
                    + "<h5>추가요금" + response.added_fare + "</h5>"
                    + "";
        $('#content').html(html);
  
        var pano = new naver.maps.Panorama("pano", {
            position : new naver.maps.LatLng(lat, lng),
            // pov : {
            //   pan: -30,
            //   tilt: 10,
            //   fov: 100
            // },
            aroundControl : false
          });
  
          naver.maps.Event.addListener(pano, "init", function() {
            panomarker.setMap(pano);
  
            var proj = pano.getProjection();
            var lookAtPov = proj.fromCoordsToPov(panomarker.getPosition());
            if (lookAtPov) {
              pano.setPov(lookAtPov);
            }
          });
  
          var panomarker = new naver.maps.Marker({
            position: new naver.maps.Marker(lat, lng)
          })
        }
  
      })
    };
  
    
    /* 검색 결과 표시 */
    function showQuery(query) {
      if($("#searchresult").css('display') == 'none') $("#searchresult").css('display', 'grid');
      if($("input#query").val().length > 0) {
      $.ajax({
        type : "GET",
        url: "/searchLocation?query=" + query,
        success: function (response) {
            $("#locationSearchResult").html("").append("<h5>장소</h5>")
            if(response.length > 2) {
            for(let i = 0; i < response.length ; i++) {
                let latlng = naver.maps.TransCoord.fromTM128ToLatLng(new naver.maps.Point(response[i].mapx, response[i].mapy));
                let lat = latlng.lat();
                let lng = latlng.lng();
                var result = "<div class='searchitem' data-lat='" + lat + "' data-lng='" + lng + "'>" + response[i].title + "</div>";
                $("#locationSearchResult").append(result);
          }  
        } else {
            $("#locationSearchResult").html("").append("<h5>장소</h5>").append("<p>검색 결과가 없습니다.</p>")
        }
        }, error: function(error){},
        statusCode: {
            500: function(){}
        }
      });

      $.ajax({
          type: "GET",
          url: "/searchParking?query=" + query,
          success: function (response) {
              if (response.length > 1) {
              $("#parkingSearchResult").html("").append("<h5>주차장</h5>")
              for(let j = 0; j < response.length; j++) {
                  var result = "<div class='searchitem' data-id='" + response[j].id + "' data-lat='" + response[j].lat + "'data-lng='" + response[j].lng + "'>" + queryToBold(query, response[j].name) + "</div>";
                  $("#parkingSearchResult").append(result);
              }
            } else {
                $("#parkingSearchResult").html("").append("<h5>주차장</h5>").append("<p>검색 결과가 없습니다.</p>")
            }
          },
          error: function(error){},
          statusCode: {
              500: function(){}
          }

      });
    }

      if($('input#query').val() == "") $('#searchresult').css('display', 'none');

      function queryToBold (query, result) {
        var bolded = result.replace(query, '<b>' + query + '</b>');
        return bolded;
      }
    }