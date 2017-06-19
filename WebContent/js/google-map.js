var roma = {
	lat : 41.883331,
	lng : 12.466667
};

// 관광명소를 배열의 형태로 추가해야한다. 하드코딩되어 있는 부분을 json으로 연결한다.
var spot = [ {
	"touristNo" : "200",
	"lat" : 43.7687,
	"lng" : 11.2569,
	"name" : "콜로세움",
	"category" : "카테고리 : 관광/사진",
	"image" : "${initParam.root}/image/Roma/colosseo.jpg",
	"address" : "Piazza del Colosseo, 9, 00100 Rome, Italy",
	"description" : "<img src='${initParam.root}image/Roma/colosseo.jpg' width='90px' height='80px'><br>Piazza del Colosseo, 9, 00100 Rome, Italy<h2>콜로세움</h2><br>카테고리 : 관광/사진<p><input type='button' value='일정 추가' onclick='addSchedule(200)'>",
	"index" : 1
} ];

var infowindow = null;

function addSchedule(no) {
	var result = $.grep(spot, function(e) {
		return e.touristNo == no
	});

	myTour.push({
		"day" : currentTab + 1,
		"spot" : result
	});

	// alert(myTour[0].day + "일에 " + myTour[0].spot[0].name + "을 예약했습니다.");
	$(function() {
		var id = "#day" + (currentTab + 1);
		var text = "<table>" + "<tr>" + "<td rowspan='2'>"
				+ "<img width='50px' height='50px' src='"
				+ myTour[0].spot[0].image + "'>"
		"</td>" + "</tr>" + "<tr><td>" + myTour[0].spot[0].name + "</td></tr>"
				+ "<tr><td>" + myTour[0].spot[0].address + "</td></tr>"
				+ "</table><br>";
		$(id).append(text);
	});
}

function initMap() {
	var map = new google.maps.Map(document.getElementById('map'), {
		center : roma,
		zoom : 6
	});

	var latlng = getLatLng();
	var liner = new google.maps.Polyline({
		path : latlng,
		strokeColor : '#0000FF'
	});

	setMaker(map);
	liner.setMap(map);
}

function setMaker(map) {
	for (var i = 0; i < spot.length; i++) {
		var data = spot[i];
		var marker = new google.maps.Marker({
			position : {
				lat : data.lat,
				lng : data.lng
			},
			description : data.description,
			map : map,
			title : data[0],
			zIndex : data[3]
		});

		google.maps.event.addListener(marker, 'click', function() {
			if (infowindow) {
				infowindow.close();
			}

			infowindow = new google.maps.InfoWindow();
			infowindow.setContent(this.description);
			infowindow.open(map, this);
		});
	}
}

function getLatLng() {
	var temp = new Array();

	for (var i = 0; i < spot.length; i++) {
		temp.push({
			lat : spot[i].lat,
			lng : spot[i].lng
		});
	}

	return temp;
}