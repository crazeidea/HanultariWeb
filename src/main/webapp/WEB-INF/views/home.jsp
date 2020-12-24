<<<<<<< HEAD
<div id="map" style="width:100vw; height:100vh;">
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<style type="text/css">
.form{
    position: absolute;
    top: 11px;	
    right: 37px;
    z-index: 10;
    width: 120px;
    padding: 1px 3px 5px;
}
.login{
    display: block;
    overflow: hidden;
    width: 69px;
    height: 16px;
    padding: 9px 0 11px;
    font-weight: bold;
    font-size: 16px;
    line-height: 16px;
    color: #1f8cff;
    text-align: center;	 
}
</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zz60pls79j"></script>
</head>
<body>
<div class="form">
	<a class="login" href="login">로그인</a>
</div>

<!-- 	map api key -->
<div id="map" style="width:100%;height:500px;">
</div>

<script>
var HOME_PATH = window.HOME_PATH || '.';

var position = new naver.maps.LatLng(35.15346218128609, 126.88823213648745);

var map = new naver.maps.Map('map', {
    center: position, //지도의 초기 중심 좌표, 해놨는데 안됨...
    zoom: 17, //지도의 초기 줌 레벨 줌17
    minZoom: 7, //지도의 최소 줌 레벨
    zoomControl: true, //줌 컨트롤의 표시 여부
    zoomControlOptions: { //줌 컨트롤의 옵션
    position: naver.maps.Position.TOP_RIGHT
    },
	mapTypeControl: true
});

//폴리곤 주차구역 표시에 좋을듯..
var polygon = new naver.maps.Polygon({
    map: map,
    paths: [
        [	//농성 주차장을 예로 해봄
            new naver.maps.LatLng(35.151986688161756, 126.88875819358326),
            new naver.maps.LatLng(35.151812934424456, 126.88849503911594 ),
            new naver.maps.LatLng(35.151635067369426, 126.88865990075612 ),
            new naver.maps.LatLng(35.15182237634732 , 126.8889614477661 ),
            new naver.maps.LatLng(35.152006963704224 , 126.88875267866297 )
            
        ]
    ],
    fillColor: '#ff0000',
    fillOpacity: 0.3,
    strokeColor: '#ff0000',
    strokeOpacity: 0.6,
    strokeWeight: 3
});
    
var MARKER_ICON_URL = HOME_PATH +'/img/example/sp_pins_spot_v3.png';
var MARKER_HIGHLIGHT_ICON_URL = HOME_PATH +'/img/example/sp_pins_spot_v3_over.png';
var MARKER_SPRITE_X_OFFSET = 35.15346218128609;			//위도
var MARKER_SPRITE_Y_OFFSET = 126.88823213648745;		//경도
//주차장 정보 배열 넣기
var MARKER_SPRITE_POSITION = {

    "A0": [0, 0],
    "B0": [MARKER_SPRITE_X_OFFSET, 0],
    "C0": [MARKER_SPRITE_X_OFFSET*2, 0],
    "D0": [MARKER_SPRITE_X_OFFSET*3, 0],
    "E0": [MARKER_SPRITE_X_OFFSET*4, 0],
    "F0": [MARKER_SPRITE_X_OFFSET*5, 0],
    "G0": [MARKER_SPRITE_X_OFFSET*6, 0],
    "H0": [MARKER_SPRITE_X_OFFSET*7, 0],
    "I0": [MARKER_SPRITE_X_OFFSET*8, 0],

    "A1": [0, MARKER_SPRITE_Y_OFFSET],
    "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
    "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
    "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
    "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
    "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
    "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
    "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
    "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],

    "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
    "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
    "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
    "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
    "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
    "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
    "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
    "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
    "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
};

var bounds = map.getBounds(),
southWest = bounds.getSW(),
northEast = bounds.getNE(),
lngSpan = northEast.lng() - southWest.lng(),
latSpan = northEast.lat() - southWest.lat();

var MarkerOverlapRecognizer = function(opts) {
    this._options = $.extend({
        tolerance: 5,
        highlightRect: true,
        highlightRectStyle: {
            strokeColor: '#ff0000',
            strokeOpacity: 1,
            strokeWeight: 2,
            strokeStyle: 'dot',
            fillColor: '#ff0000',
            fillOpacity: 0.5
        },
        intersectNotice: true,
        intersectNoticeTemplate: '<div style="width:180px;border:solid 1px #333;background-color:#fff;padding:5px;"><em style="font-weight:bold;color:#f00;">{{count}}</em>개의 마커가 있습니다.</div>',
        intersectList: true,
        intersectListTemplate: '<div style="width:200px;border:solid 1px #333;background-color:#fff;padding:5px;">'
            + '<ul style="list-style:none;margin:0;padding:0;">'
            + '{{#repeat}}'
            + '<li style="list-style:none;margin:0;padding:0;"><a href="#">{{order}}. {{title}}</a></li>'
            + '{{/#repeat}}'
            + '</ul>'
            + '</div>'
    }, opts);

    this._listeners = [];
    this._markers = [];

    this._rectangle = new naver.maps.Rectangle(this._options.highlightRectStyle);
    this._overlapInfoEl = $('<div style="position:absolute;z-index:100;margin:0;padding:0;display:none;"></div>');
    this._overlapListEl = $('<div style="position:absolute;z-index:100;margin:0;padding:0;display:none;"></div>');
};
MarkerOverlapRecognizer.prototype = {
    constructor: MarkerOverlapRecognizer,

    setMap: function(map) {
        var oldMap = this.getMap();

        if (map === oldMap) return;

        this._unbindEvent();

        this.hide();

        if (map) {
            this._bindEvent(map);
            this._overlapInfoEl.appendTo(map.getPanes().floatPane);
            this._overlapListEl.appendTo(map.getPanes().floatPane);
        }

        this.map = map || null;
    },

    getMap: function() {
        return this.map;
    },

    _bindEvent: function(map) {
        var listeners = this._listeners,
            self = this;

        listeners.push(
            map.addListener('idle', $.proxy(this._onIdle, this)),
            map.addListener('click', $.proxy(this._onIdle, this))
        );

        this.forEach(function(marker) {
            listeners = listeners.concat(self._bindMarkerEvent(marker));
        });
    },

    _unbindEvent: function(map_) {
        var map = map_ || this.getMap();

        naver.maps.Event.removeListener(this._listeners);
        this._listeners = [];

        this._rectangle.setMap(null);
        this._overlapInfoEl.remove();
        this._overlapListEl.remove();
    },

    add: function(marker) {
        this._listeners = this._listeners.concat(this._bindMarkerEvent(marker));
        this._markers.push(marker);
    },

    remove: function(marker) {
        this.forEach(function(m, i, markers) {
            if (m === marker) {
                markers.splice(i, 1);
            }
        });
        this._unbindMarkerEvent(marker);
    },

    forEach: function(callback) {
        var markers = this._markers;

        for (var i=markers.length-1; i>=0; i--) {
            callback(markers[i], i, markers);
        }
    },

    hide: function() {
        this._overlapListEl.hide();
        this._overlapInfoEl.hide();
        this._rectangle.setMap(null);
    },

    _bindMarkerEvent: function(marker) {
        marker.__intersectListeners = [
            marker.addListener('mouseover', $.proxy(this._onOver, this)),
            marker.addListener('mouseout', $.proxy(this._onOut, this)),
            marker.addListener('mousedown', $.proxy(this._onDown, this))
        ];

        return marker.__intersectListeners;
    },

    _unbindMarkerEvent: function(marker) {
        naver.maps.Event.removeListener(marker.__intersectListeners);
        delete marker.__intersectListeners;
    },

    getOverlapRect: function(marker) {
        var map = this.getMap(),
            proj = map.getProjection(),
            position = marker.getPosition(),
            offset = proj.fromCoordToOffset(position),
            tolerance = this._options.tolerance || 3,
            rectLeftTop = offset.clone().sub(tolerance, tolerance),
            rectRightBottom = offset.clone().add(tolerance, tolerance);

        return naver.maps.PointBounds.bounds(rectLeftTop, rectRightBottom);
    },

    getOverlapedMarkers: function(marker) {
        var baseRect = this.getOverlapRect(marker),
            overlaped = [{
                marker: marker,
                rect: baseRect
            }],
            self = this;

        this.forEach(function(m) {
            if (m === marker) return;

            var rect = self.getOverlapRect(m);

            if (rect.intersects(baseRect)) {
                overlaped.push({
                    marker: m,
                    rect: rect
                });
            }
        });

        return overlaped;
    },

    _onIdle: function() {
        this._overlapInfoEl.hide();
        this._overlapListEl.hide();
    },

    _onOver: function(e) {
        var marker = e.overlay,
            map = this.getMap(),
            proj = map.getProjection(),
            offset = proj.fromCoordToOffset(marker.getPosition()),
            overlaped = this.getOverlapedMarkers(marker);

        if (overlaped.length > 1) {
            if (this._options.highlightRect) {
                var bounds;

                for (var i=0, ii=overlaped.length; i<ii; i++) {
                    if (bounds) {
                        bounds = bounds.union(overlaped[i].rect);
                    } else {
                        bounds = overlaped[i].rect.clone();
                    }
                };

                var min = proj.fromOffsetToCoord(bounds.getMin()),
                    max = proj.fromOffsetToCoord(bounds.getMax());

                this._rectangle.setBounds( naver.maps.LatLngBounds.bounds(min, max) );
                this._rectangle.setMap(map);
            }

            if (this._options.intersectNotice) {
                this._overlapInfoEl
                    .html(this._options.intersectNoticeTemplate.replace(/\{\{count\}\}/g, overlaped.length))
                    .css({
                        left: offset.x,
                        top: offset.y
                    })
                    .show();
            }
        } else {
            this.hide();
        }
    },

    _onOut: function(e) {
        this._rectangle.setMap(null);
        this._overlapInfoEl.hide();
    },

    _guid: function() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c){
            var r = Math.random()*16|0, v = c == "x" ? r : (r&0x3|0x8);
            return v.toString(16);
        }).toUpperCase();
    },

    _renderIntersectList: function(overlaped, offset) {
        if (!this._options.intersectList) return;

        var listLayer = this._overlapListEl;

        var REPEAT_REGEX = /\{\{#repeat\}\}([\s\S]*)\{\{\/#repeat\}\}/gm,
            template = this._options.intersectListTemplate,
            itemTemplate = null,
            itemPlace = null,
            matches = REPEAT_REGEX.exec(template),
            uid = this._guid(),
            self = this;

        listLayer.empty();

        if (matches && matches.length >= 2) {
            template = template.replace(matches[0], '<div id="intersects-'+ uid +'"></div>');
            itemTemplate = matches[1];

            listLayer.append($(template));

            var placeholder = $('#intersects-'+ uid);

            itemPlace = placeholder.parent();

            placeholder.remove();
            placeholder = null;
        } else {
            itemTemplate = template;
            itemPlace = listLayer;
        }

        var items = [];
        for (var i=0, ii=overlaped.length; i<ii; i++) {
            var c = overlaped[i],
                item = $(itemTemplate.replace(/\{\{(\w+)\}\}/g, function(match, symbol) {
                    if (symbol === 'order') {
                        return i+1;
                    } else if (symbol in marker) {
                        return c.marker[symbol];
                    } else if (c.marker.get(symbol)) {
                        return c.marker.get(symbol);
                    } else {
                        match;
                    }
                }));

            item.on('click', $.proxy(self._onClickItem, self, c.marker));
            items.push(item);
        };

        for (var j=0, jj=items.length; j<jj; j++) {
            itemPlace.append(items[j]);
        }

        listLayer.css({
                    left: offset.x + 5,
                    top: offset.y
                })
                .show();
    },

    _onDown: function(e) {
        var marker = e.overlay,
            map = this.getMap(),
            proj = map.getProjection(),
            offset = proj.fromCoordToOffset(marker.getPosition()),
            overlaped = this.getOverlapedMarkers(marker),
            self = this;

        naver.maps.Event.resumeDispatch(marker, 'click');

        if (overlaped.length <= 1) {
            return;
        }

        naver.maps.Event.stopDispatch(marker, 'click');
        this._renderIntersectList(overlaped, offset);
        this._overlapInfoEl.hide();

        naver.maps.Event.trigger(this, 'overlap', overlaped);
    },

    _onClickItem: function(marker, e) {
        naver.maps.Event.resumeDispatch(marker, 'click');

        naver.maps.Event.trigger(this, 'clickItem', {
            overlay: marker,
            originalEvent: e.originalEvent
        });

        marker.trigger('click');
    }
};

var recognizer = new MarkerOverlapRecognizer({
    highlightRect: false,
    tolerance: 5
});
recognizer.setMap(map);

function highlightMarker(marker) {
    var icon = marker.getIcon();

    if (icon.url !== MARKER_HIGHLIGHT_ICON_URL) {
        icon.url = MARKER_HIGHLIGHT_ICON_URL;
        marker.setIcon(icon);
    }

    marker.setZIndex(1000);
}

function unhighlightMarker(marker) {
    var icon = marker.getIcon();

    if (icon.url === MARKER_HIGHLIGHT_ICON_URL) {
        icon.url = MARKER_ICON_URL;
        marker.setIcon(icon);
    }

    marker.setZIndex(100);
}

for (var key in MARKER_SPRITE_POSITION) {

    var position = new naver.maps.LatLng(
        southWest.lat() + latSpan * Math.random(),
        southWest.lng() + lngSpan * Math.random());

    var marker = new naver.maps.Marker({
        map: map,
        position: position,
        title: key,
        icon: {
            url: MARKER_ICON_URL,
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
        },
        shape: {
            coords: [11, 0, 9, 0, 6, 1, 4, 2, 2, 4,
                0, 8, 0, 12, 1, 14, 2, 16, 5, 19,
                5, 20, 6, 23, 8, 26, 9, 30, 9, 34,
                13, 34, 13, 30, 14, 26, 16, 23, 17, 20,
                17, 19, 20, 16, 21, 14, 22, 12, 22, 12,
                22, 8, 20, 4, 18, 2, 16, 1, 13, 0],
            type: 'poly'
        },
        zIndex: 100
    });

    var contentString = [
        '<div class="iw_inner">',
        '   <h3>한울직업전문학교</h3>',
        '   <p>광주광역시 서구 농성동 | 광주광역시 서구 경열로 110 한울직업전문학교<br />',
        '       <a href="http://www.hanuledu.co.kr/" target="_blank">www.hanuledu.co.kr</a>',
        '   </p>',
        '</div>'
    ].join('');

    var infowindow = new naver.maps.InfoWindow({
        content: contentString,
        anchorSkew: true
    });

    map.setCursor('pointer');	//마우스 커서까지는 됌

    naver.maps.Event.addListener(marker, "click", function(e) {
        if (infowindow.getMap()) {
            infowindow.close();
        } else {
            infowindow.open(map, marker);
        }
    });


    naver.maps.Event.addListener(map, 'click', function(e) {
        marker.setPosition(e.coord);
    });

    marker.addListener('mouseover', function(e) {
        highlightMarker(e.overlay);
    });
    marker.addListener('mouseout', function(e) {
        unhighlightMarker(e.overlay);
    });
    marker.addListener('click', function(e) {
        var m = e.overlay;

        //alert(m.title);	//클릭시 alert 
    });
    recognizer.add(marker);
};

var overlapCoverMarker = null;
naver.maps.Event.addListener(recognizer, 'overlap', function(list) {
    if (overlapCoverMarker) {
        unhighlightMarker(overlapCoverMarker);
    }

    overlapCoverMarker = list[0].marker;

    naver.maps.Event.once(overlapCoverMarker, 'mouseout', function() {
        highlightMarker(overlapCoverMarker);
    });
});

naver.maps.Event.addListener(recognizer, 'clickItem', function(e) {
    recognizer.hide();

    if (overlapCoverMarker) {
        unhighlightMarker(overlapCoverMarker);

        overlapCoverMarker = null;
    }
});

map.setZoom(15);
</script>
</body>
</html>
>>>>>>> 83b768098c37c106b4dc9b91cc0902e177234c9c
