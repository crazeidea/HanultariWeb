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
  
  /* 거리를 km, m 단위로 출력 */
  function formatDistance(distance) {
	if (distance > 1000) {
		var result = Number(distance/1000).toFixed(1);
		return result + "km";
	} else {
		return distance.toString() + "m";
	}
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
  var interval = null;
  function showInfo(id, lat, lng) {
    map.panTo(new naver.maps.LatLng(lat, lng));
    infowindow.close();
    
    rcinfo.close();

    $.ajax({
      type: "GET",
      url: "/getSingleParkingData?id=" + id,
      success: function (response) {
      var html = "";
        if($("#islogined").val() == 1) {
          html += "<div><div id='favButton' class='ui circular icon button right floated' onclick='toggleFav(" + response.id +")' tabindex='0'>"
                 + "<i class='star icon'></i>"
                 + "</div></div>";
                 setFavState(id);
         }
			      html += "</div>";
            html += "<h2 class='ui header' style='font-weight: 700; margin-right:1rem; word-break:keep-all;'>" + response.name + "</h2>";

             html += "<div>"
	                  + "<div id='pano' style='width:400px; height:200px'></div>"
					          + "</div>"
                    + "<h2 class='ui header'>지금 " + (response.total - response.parked) + "대 주차할 수 있어요.</h2>"
                    + "<div id='layoutwrapper'></div>";
                    if(response.paid == 0) {
                      html = html + "<h2 class='ui header'>이용요금 무료</h2>";
                    } else {
                      html = html + "<h4 class='ui header'><span class='ui text large' style='font-weight:700'>기본요금 " + response.fare + "원</span>"
                      + "<span class='ui text medium' style='font-weight:700'> 추가요금 " + response.added_fare + "원 / "
                      + response.duration_interval + "분"
                      + "</span></h4>";
                    }
                    html += "<div class='ui labels blue'>"
                    if (response.payment_cash == 1) html = html + "<div class='ui label '><i class='money bill icon'></i>현금 결제</div>";
                    if (response.payment_card == 1) html = html + "<div class='ui label '><i class='credit card outline icon'></i>카드결제</div>";
                    if(response.payment_machine == 1) html = html + "<div class='ui label '><i class='cash register icon'></i>무인계산기</div>";
                    html = html 
                            + "</div><div style='margin-top:2em;'><h2  class='ui header'>운영시간</h2><span class='ui text large' style='font-weight:700;' >" + response.start_time.substr(0, 2) + ":" + response.start_time.substr(2,2) + " ~ " + response.end_time.substr(0, 2) + ":" + response.end_time.substr(2, 2) + "</span>"
                            + "<h2  class='ui header'>주소</h2><div style='display:grid; grid-template-rows:repeat(2, 1fr);'><h3 class='ui header'>" + response.addr + "</h3><span class='ui text medium' style='font-weight:400;' >" + response.prev_addr + "</span></div> "
                            + "<h2  class='ui header'>관리자</h2><div style='display:grid; grid-template-rows:repeat(2, 1fr);'><h3 class='ui header'>" + response.manager + "</h3><span class='ui text medium' style='font-weight:400;' >" + response.contact + "</span></div> "
                            + "</div>"
                            + "<div style='margin-top:2em;'><h2 class='ui header'>이용 후기</h2>"
                            + "<div id='comments' class='ui comments'>작성된 리뷰가 없습니다.</div>";
                            if($("#islogined").val() == 1) {
                            html += "<div><form class='ui form'>" 
                            + "<input type='hidden' name='parking_id' value=" + response.id + ">"
                            + "<input type='hidden' name='rating' value='5'>"
                            + "<div class='field'><div class='ui yellow rating' data-icon='star' data-max-rating='5' data-rating='5'></div></div><div class='field'><input type='text' name='content'></div></div><button type='button' onclick='submitReview(" + response.id + ")' class='ui button primary'>저장</button></form></div>";
                            }
        $('#navContent').html(html);
        interval = setInterval(showParkingLayout(response.layout), 5000);
        getReviews(response.id);
        $(".ui.rating").rating({
          onRate: function(value) {
            $("input[name=rating]").attr("value", value);
          }
        });

        var pano = new naver.maps.Panorama("pano", {
            position : new naver.maps.LatLng(lat, lng),
          });

          if ($('#nav').hasClass('closed')) toggleNav();
          
        }  
      })

    };
  
    
    /* 검색 결과 표시 */
    function showQuery(query) {
      if($("input#query").val().length > 0) {
       
      $.ajax({
        type : "GET",
        url: "/searchLocation?query=" + query,
        success: function (response) {
          if($("#searchresult").css('display') == 'none') $("#searchresult").css('display', 'grid');
            $("#locationSearchResult").html("").append("<h5>장소</h5>")
            if(response.length > 2) {
            for(let i = 0; i < response.length ; i++) {
                let latlng = naver.maps.TransCoord.fromTM128ToLatLng(new naver.maps.Point(response[i].mapx, response[i].mapy));
                let lat = latlng.lat();
                let lng = latlng.lng();
                var result = "<div class='searchitem place' tabindex='" + (i + 1) + "' data-lat='" + lat + "' data-lng='" + lng + "'>" + response[i].title + "</div>";
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
                  var result = "<div class='searchitem parking' tabindex='" + (j + 6) + "' data-id='" + response[j].id + "' data-lat='" + response[j].lat + "'data-lng='" + response[j].lng + "'>" + queryToBold(query, response[j].name) + "</div>";
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
        let wrapper = $('#layoutwrapper');
        let seatcount = 1;
        if(layout != null) {
          let column = layout.search(/[/]/g);
          let row = 0;
          wrapper.css('grid-template-columns', 'repeat(' + column + ',' + (400 / column) + 'px)' );
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
        $('#navContent').append("<div id='itemlist'></div>");
        infowindow.close();
        rcinfo.close();
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

        $('#itemlist').append("<span class='ui text large' style='font-weight: 700;'>주변 주차장</span>");
        $('#itemlist').append("<span class='ui text medium' style='float: right'>" + resultList.length + "개의 주차장</span>");
        if(resultList.length > 0) {
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

              let html = "<div class='item' onclick='showInfo(" + id + ", " + response.lat + "," + response.lng + ")'>";
              if($("#islogined").val() == 1) html += "<button id='favButton' class='circular ui right floated icon button yellow' onclick='toggleFav('" + id + "')><i class='star icon'></i></button>";
                          if(paid == true ) {
                            html += "<div class='ui label large teal'>유료<a class='detail'>" + formatDistance(distance) + "</a>" + "</div>";
                          } else if (paid == false) {
                            html += "<div class='ui label large primary'>무료<a class='detail'>" + formatDistance(distance) + "</a>" + "</div>";
                          }
                          html += "<h4>" + name + "</h4>"
                          + "<p>검색 장소로부터 " + distance + "m </p>"
                          + "</div>";

              $('#itemlist').append(html);
            }

          });
        }
      } else {
        let html = "<div style='display: grid; place-items: center; height:100%;'>"
                        + "<h2 class='ui header'>주변에 가까운 주차장이 없습니다.</h2>"
                        + "</div>";
        $("#itemlist").append(html);
      }
    }

      function toggleFav(id) {
        $("#favButton").toggleClass("yellow");
        $.ajax({
          type: "GET",
          url: "/checkFavorite?id=" + id,
          success: function (response, status, xhr) {
            if(response) {
              $.ajax({
                type: "POST",
                url: "/insertFavorite?id=" + id,
                success: function (response) {
                  setFavState(id);
                  $('body').toast({
                        class: 'success',
                        position: 'bottom right',
                        message: '즐겨찾기에 추가되었습니다.'
                  });
                }
              });

            } else if (!response) {
                $.ajax({
                  type: "POST",
                  url: "/deleteFavorite?id=" + id,
                  success: function (response) {
                    setFavState(id);
                    $('body').toast({
                      class: 'warning',
                      position: 'bottom right',
                      message: '즐겨찾기에서 제거되었습니다.'
                    });
                  }
                });
            }
          }
        });
      }

      function showFav(id) {
        if($('#nav').hasClass('closed')) toggleNav();
        $("#navContent").html("");
        $("#navContent").append("<div id='itemlist'></div>");

        $.ajax({
          type: "GET",
          url: "/getFavorite?id=" + id,
          success: function (response) {
            var result = [];
            for (let i = 0; i < response.length ; i++) {
              result.push(response[i]);
            }
            if (response.length > 0) {
            for (let i = 0; i < result.length; i++) {
              let id = result[i].parking_id;
              
              $.ajax({
                type: "GET",
                url: "/getSingleParkingData?id=" + id,
                success: function (response) {
                  let paid = response.paid;
                  let name = response.name;
                  let distance = getDistance(currentLocation.y, currentLocation.x, response.lat, response.lng);
                  let addr = response.addr;
                  let html = "<div class='item' onclick='showInfo(" + id + ", " + response.lat + "," + response.lng + ")'>"
                              + "<button class='circular right floated ui icon button yellow' onclick='toggleFav('" + id + "')><i class='star icon'></i></button>";
                  if(paid == true ) {
                    html += "<div class='ui label large teal'>유료<a class='detail'>" + formatDistance(distance) + "</a>" + "</div>";
                  } else if (paid == false) {
                    html += "<div class='ui label large primary'>무료<a class='detail'>" + formatDistance(distance) + "</a>" + "</div>";
                  }
                  html += "<h4>" + name + "</h4>"
                  + "<p>" + addr + "</p>"
                  + "</div>";

                  $("#itemlist").append(html);
                }
              });
            }
          } else {
            let html = "<div style='display: grid; place-items: center; height:100%;'>"
                        + "<h2 class='ui header'>등록된 즐겨찾기가 없습니다.</h2>"
                        + "</div>";
            $("#itemlist").append(html);
                      
          }
        }        
        });
      }

      function setFavState(id) {
          $.ajax({
            type: "GET",
            url: "/checkFavorite?id=" + id,
            success: function (response) {
              if(response) {
                $("#favButton").removeClass("yellow");
              } else {
                $("#favButton").addClass("yellow");
              }
            }
          });
      }

      function getReviews(id) {
        let comments = $("#comments")
        let total = 0;
        $.ajax({
          type: "GET",
          url: "/getReviews?id=" + id,
          success: function (review) {
            comments.html("");
            for (let i = 0; i < review.length ; i++) {
              total += review[i].rating;
              $.ajax({
                type: "GET",
                url: "/getUserData?id=" + review[i].member_id,
                success: function (user) {
                  let html = "<div class='comment'>"
                              + "<a class='avatar'><i class='user alternate icon'></i></a>"
                              + "<div class='content'>"
                              + "<span class='author'>" + user.nickname + "</span>"
                              + "<div class='metadata'><div class='rating'><i class='star icon'></i>" + review[i].rating + "</div></div>"
                              + "<div class='text'>" + review[i].content +"</div>"
                              + "</div>";
                comments.append(html);
				        $("#ratingdetail").html(total / review.length);
                },
				      });
            }
          }
        });
      }

      function submitReview(id) {
        let parking_id = $("input[name=parking_id]").val();
        let rating = $("input[name=rating]").val();
        let content = $('input[name=content]').val();
        $.ajax({
          type: "post",
          url: "/review/insert?parking_id=" + parking_id + "&rating=" + rating + "&content=" + content,
          success: function (response) {
            if (response) {
              $('input[name=content]').val("");
              getReviews(id);
            }
          }
        });
      }
