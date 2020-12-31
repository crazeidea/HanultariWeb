<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body style="margin: 0">
    <div id="pano" style="width: 100vw; height: 100vh"></div>
  </body>

  <script>
    $(document).ready(function () {

        var lat = '${lat}';
        var lng = '${lng}';
        getPanorama(lat, lng);

    });

    function getPanorama(lat, lng) {

        var pano = new naver.maps.Panorama("pano", {
          position : new naver.maps.LatLng(lat, lng),
          pov : {
            pan: -30,
            tilt: 10,
            fov: 100
          },
          aroundControl : false
        });

    }
  </script>
</html>
