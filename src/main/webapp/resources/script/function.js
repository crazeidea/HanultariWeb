/* 뱃지 출력 */
function setBadge(paid) { 
    if (paid == true) {
      var data = "유료";
    } else {
      var data = "무료";
    }  
    return data;
  }
  
  /* 현재 위치와 특정 위치간의 거리 계산하여 m 단위로 출력 */
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
    return Math.round(distance * 1000)
  }
  
  
  /* 지도 중심점 -> 지번주소 */
  function coordsToAddr(latlng) {
    naver.maps.Service.reverseGeocode({
      coords: latlng,
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
      addr = address.jibunAddress;

      
    })
  }
  
  /* 주차장 상세 정보 표시 */
  function showInfo(id, lat, lng) {
    map.panTo(new naver.maps.LatLng(lat, lng));
    infowindow.close();
    $.ajax({
      type: "GET",
      url: "/getSingleParkingData?id=" + id,
      success: function (response) {
        var html = "<div><h1>" + response.name + "</h1>"
                    + "<div id='pano' style='width:400px; height:200px'></div></div>"
                    + "<div><h2>주차장 정보</h2>"
                    + "<h3>지금 " + (response.total - response.parked) + "대 주차할 수 있어요.</h3>"
                    + "<div id='layoutwrapper'></div>"
                    if(response.paid == 0) {
                        html = html + "<span class='content'>이용요금 무료</span>";
                    } else {
                    html = html + "<span class='content'>기본요금 " + response.fare + "원</span>"
                    + "<span class='subcontent''> 추가요금 " + response.added_fare + "원 / "
                    + response.duration_interval + "분"
                    + "</span>";
                    }                    
                    if (response.payment_cash == 1) html = html + "<span>현금결제</span>";
                    if (response.payment_card == 1) html = html + "<span>카드결제</span>";
                    if(response.payment_machine == 1) html = html + "<span>무인계산기</span>";
                    html = html + "</div>";

                    html = html 
                            + "<div><h3>운영시간</h3><span class='content'>" + response.start_time.substr(0, 2) + ":" + response.start_time.substr(2,2) + " ~ " + response.end_time.substr(0, 2) + ":" + response.end_time.substr(2, 2) + "</span>"
                            + "<h3>주소</h3><div style='display:grid; grid-template-rows:repeat(2, 1fr);'><span class='content'>" + response.addr + "</span><span class='subcontent'>" + response.prev_addr + "</span></div> "
                            + "<h3>관리자</h3><div style='display:grid; grid-template-rows:repeat(2, 1fr);'><span class='content'>" + response.manager + "</span><span class='subcontent'>" + response.contact + "</span></div> "
                            + "</div>";
                    $('#navContent').html(html);
                    showParkingLayout(response.layout);
  
        var pano = new naver.maps.Panorama("pano", {
            position : new naver.maps.LatLng(lat, lng),
          });

        var panomarker = new naver.maps.Marker({
          position: new naver.maps.Marker(lat, lng)
        })

          naver.maps.Event.addListener(pano, "init", function() {
            panomarker.setMap(pano);
  
            var proj = pano.getProjection();
            var lookAtPov = proj.fromCoordsToPov(panomarker.getPosition());
            if (lookAtPov) {
              pano.setPov(lookAtPov);
            }
          });
  

          if ($('#nav').hasClass('closed')) toggleNav();
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

    function showParkingLayout(layout){
      console.log("showParkingLayout()");
        let wrapper = $('#layoutwrapper');
        let seatcount = 1;
        if(layout != null) {
          let column = layout.search(/[/]/g);
          let row = 0;
          wrapper.css('grid-template-columns', 'repeat(' + column + ',' + (400 / column) + 'px)' );
          console.log(layout);
          for(let i = 0; i < layout.length; i++ ) {            
              if (layout.charAt(i) == "A") { wrapper.append("<div class='seat normal' data-tippy-content='주차 가능'>" + seatcount + "</div>"); seatcount++;}
              if (layout.charAt(i) == "B") {wrapper.append("<div class='seat normal na' data-tippy-content='주차 불가'>" + seatcount + "</div>"); seatcount++;}
              if (layout.charAt(i) == "C") {wrapper.append("<div class='seat disabled' data-tippy-content='장애인 차량 주차 가능'>" + seatcount + "</div>"); seatcount++;}
              if (layout.charAt(i) == "D") {wrapper.append("<div class='seat disabled na' data-tippy-content='주차 불가'>" + seatcount + "</div>"); seatcount++;}
              if (layout.charAt(i) == "E") {wrapper.append("<div class='seat woman' data-tippy-content='여성 운전자 주차 가능'>" + seatcount + "</div>"); seatcount++;}
              if (layout.charAt(i) == "F") {wrapper.append("<div class='seat woman na' data-tippy-content='주차 불가'>" + seatcount + "</div>"); seatcount++;}
              if (layout.charAt(i) == "_") {wrapper.append("<div class='seat road'></div>");}
              if (layout.charAt(i) == "/") row++;
          }
          tippy('[data-tippy-content]');
          wrapper.css('grid-template-rows', 'repeat(' + row + ',' + ((400 / column) * 1.3) + 'px)');
        }
      }

      function toggleNav() {
        $('#nav').toggleClass('closed');
        if($('#nav').hasClass('closed') == true) $('#navClose').css('left', '0px');
        else $('#navClose').css('left', '450px');
        if($('#searchresult').css('display') == 'grid') $('#searchresult').css('display', 'none')
      };

      function showParkingNearby(lat, lng) {
        if($('#nav').hasClass('closed')) toggleNav();
        $('#navContent').html("");
        $('#navContent').append("<div id='parkingnearby'></div>");
        let slat = lat;
        let slng = lng;
        let resultList = [];
        
        for (let i = 0; i < markerList.length ; i++) {
          let markerLatlng = markerList[i].position;
          let id = markerList[i].id;
          let dlat = markerLatlng.lat();
          let dlng = markerLatlng.lng();
          let distance = getDistance(slat, slng, dlat, dlng);
          var result = {id : id, lat : dlat, lng : dlng, distance : distance};
          if (distance < 1000) resultList.push(result);
        }
      
        resultList.sort(function(a, b){ // 거리순으로 정렬
          return a.distance - b.distance;
        });

        $('#parkingnearby').append("<span>주변 주차장</span>");
        $('#parkingnearby').append("<span style='float: right'>" + resultList.length + "개의 주차장</span>");
      
        for(let i = 0; i < resultList.length; i++) {
          let id = resultList[i].id;
          $.ajax({
            type: "GET",
            url: "/getSingleParkingData?id=" + id,
            success: function (response) {
              let paid = response.paid;
              let name = response.name;
              let distance = getDistance(slat, slng, response.lat, response.lng);
              let addr = response.addr;
              let badge = "";
              if(paid == 0) badge = "<span class='badge bg-primary'>무료</span>";
              else badge = "<span class='badge bg-secondary'>유료</span>";

              let html = "<div class='parkingnearbyitem' onclick='showInfo(" + id + ", " + response.lat + "," + response.lng + ")'>"
                          + badge
                          + "<h4>" + name + "</h4>"
                          + "<p>검색 장소로부터 " + distance + "m </p>"
                          + "</div>";

              $('#parkingnearby').append(html);
            }
          });
        }
      }