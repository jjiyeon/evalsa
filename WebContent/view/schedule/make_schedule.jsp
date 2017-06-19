<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>일정 작성</title>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="${initParam.root }css/index-page.css">
<link rel="stylesheet" type="text/css" href="${initParam.root}css/lightslider.css">
<!-- JQuery 가져오는 부분 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/blitzer/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<script src="${initParam.root}js/jquery-1.11.3.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${initParam.root}js/lightslider.js"></script>

<script type="text/javascript">
	var days = 1;
	var myTour = new Array();
	var thumnail = new Array();
	var currentTab = 0;
	
	var roma = {lat: 41.886878, lng: 12.481606};
	var milano = {lat: 45.468561, lng: 9.147139};
	var napoli = {lat: 40.851789, lng: 14.268108};
	var venezia = {lat: 45.454167, lng: 12.335833};
	var palermo = {lat: 38.116667, lng: 13.366667};
	var pisa = {lat: 43.722839 , lng: 10.401689};
	var torino = {lat:45.070339 , lng:7.686864};
	
	var bologna = {lat:44.494886, lng:11.342617};
	var cagliari = {lat:39.223903, lng:9.122094};
	var catanzaro = {lat:37.507878, lng:15.083031};
	var florence = {lat:43.769561, lng:11.255814 };
	var genova = {lat:44.405650, lng:8.946256};
	var perugia = {lat:43.110717, lng:12.390828};
	var trento = {lat:40.628803, lng:14.381100 };
	var trieste = {lat:45.649528, lng:13.776819 };
		
	
	var spot = new Array();
	var lineQueue = new Array();
	var infowindow = null;
	var map = null;
	var liner = null;
	var markers = new Array();
	
	var contextPath = "${initParam.root}";
</script>
<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map_canvas {
	width: 790px;
	height: 400px;
	
}

h2 {
	margin-top: 10px;
	margin-bottom: 5px;
}

.ui-tabs-vertical {
	width: 500px;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width: 8em;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width: 100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active {
	padding-bottom: 0;
	padding-right: .1em;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: left;
	width: 340px;
}

ul{
	list-style: none outside none;
	padding-left: 0;
    margin: 0;
}

#item{
	background-color: gray;
}

#item li{
	padding: 7px;
}

.schTab{
	margin: 20px;
}

#schTable td{
	padding: 10px;
}

</style>
</head>
<body>
	<c:if test="${sessionScope.mdto==null }">
      <script type="text/javascript">
         alert("로그인이 필요합니다.");
         location.href = contextPath+"view/index.jsp";
      </script>
   	</c:if>
	<c:import url="../header.jsp" />
	<div class="header-banner">
    <section class="bgi banner5"><h2>Scheduling</h2> </section></div>
	<p></p>
	<div id="item">
		<ul id="responsive" class="responsive" style="height: 94px;">
		</ul>
	</div>
	<div class="row schTab">
	<table align="center" style="width: 800px;" id="schTable">
		<tr>
			<td colspan="2">
				
			</td>
		</tr>
		<tr>
			<td valign="top" align="center" style="padding-top: 10px;">
				<input type="button" value=" + " id="addDayBtn" class="btn btn-info">
				<input type="button" value=" - " id="subDayBtn" class="btn btn-info"> 
				<input type="button" value="작성 완료" id="saveSchedule" data-target="#layerpop" data-toggle="modal"
				 class="btn btn-info">
				<!-- 모달 -->
				<div class="modal fade" id="layerpop" >
					<div class="modal-dialog">
				    	<div class="modal-content">
				      		<!-- header -->
				      		<div class="modal-header">
		                        <h2>일정 저장하기
		                        <button type="button" class="close" data-dismiss="modal">×</button>
		                        </h2>
		                     </div>
				      		<!-- body -->
				      		<div class="modal-body">
				            	제목 : 
				            		<c:choose>
				            			<c:when test="${requestScope.scheduleDTO == null}">
				            				<input type="text" id="title" size="25" autofocus><br><br>
				            			</c:when>
				            			<c:otherwise>
				            				<input type="text" id="title" size="25" value="${requestScope.scheduleDTO.title}" readonly autofocus><br><br>
				            			</c:otherwise>
				            		</c:choose>
				            	기간 : <input type="text" id="term" size="25" readonly="readonly"><br><br>
				            	테마 : <select id="theme">
										<option value="">===테마 선택===</option>
			                              <option value="최저가여행">최저가여행</option>
			                              <option value="지식인여행">지식인여행</option>
			                              <option value="나홀로여행">나홀로여행</option>
			                              <option value="먹방여행">먹방여행</option>
			                              <option value="커플여행">커플여행</option>
			                              <option value="가족여행">가족여행</option>
			                              <option value="우정여행">우정여행</option>
									  </select><br><br>
				            	일정을 다른사람에게 공개하시겠습니까? 
                           <input type="radio" name="sharing" value="1">공개
                           <input type="radio" name="sharing" value="0">비공개
				      		</div>
				      		<!-- Footer -->
				      		<div class="modal-footer">
				        		<button type="button" class="btn btn-default" id="submitBtn">완료</button>
				      		</div>
				    	</div>
				  	</div>
				</div>
				<p><br></p>
				<!-- 일정탭 -->
				<div id="tabs" style="overflow: auto; height: 400px;">
					<ul id="ulTabs">
						<li><a href="#day1">day 1</a></li>
					</ul>
					<div id="day1"  style="border: solid darkgray 1px;"><ul id="sortable"></ul></div>
				</div></td>
			<td valign="top">
				<div class="form-group" >
					<select id="citySel" class="form-control">
						<option value="All">모든 도시</option>
						<option value="Roma">로마</option>
						<option value="Milano">밀라노</option>
						<option value="Genova">제노바</option>
						<option value="Venezia">베네치아</option>
						<option value="Cagliari">칼리아리</option>
						<option value="Palermo">팔레르모</option>
						<option value="Bologna">볼로냐</option>
						<option value="Perugia">페루자</option>
						<option value="Catanzaro">카타니아</option>
						<option value="Napoli">나폴리</option>
						<option value="Florence">피렌체</option>
						<option value="Trento">소렌토</option>
						<option value="Pisa">피사</option>
						<option value="Trieste">트리에스테</option>
						<option value="Torino">토리노</option>
					</select>
				</div>
				<!-- 지도 -->
				<div id="map_canvas" align="center"></div>
			</td>
		</tr>
	</table>
	</div>
	<div>
	<c:import url="../footer.jsp" />
	</div>
	<!-- User Definition Script -->
	<!-- 구글 맵 가져오는 부분 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5u8Oha8_wz1ivo9_VjVGOLIUFY3waZbw" async defer></script>
	<script type="text/javascript">
	$(function() {
		$("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
		$("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
		
		$( "#sortable" ).disableSelection();
	    $( "#sortable" ).sortable({
			  connectWith: "#sortable",
			  stop: function( event, ui ) {
				  setMyTour();
	    	  }
	    });
	    
	    $('#responsive').lightSlider({
		   	item: 6,
		    loop: true,
		    keyPress: true
		});
	    
	    $("#saveSchedule").click(function(){
	    	if(days == 1){
	    		$("#term").val("무박");
	    	}else{
	    		$("#term").val((days-1)+"박");
	    	}
	    	
	    	$("input:radio[name=sharing]").attr("checked", true);
	    	
	    	setTimeout(function(){
	    		$("#title").focus();
	    	}, 500);
	    });
	    
	    $("#submitBtn").click(function(){
			var title = $("#title").val();
			var term = $("#term").val();
			var sharing = $("input:radio[name=sharing]:checked").val();
			var theme = $("#theme").val();
			
			if(sharing == true) sharing = 1;
			else sharing = 0;
			
			var message = "";
			for(var i=0; i < myTour.length; i++)
				message += myTour[i].day + "t" + myTour[i].spot.touristsiteNo + ",";
			
			// Ajax
			$.ajax({
				url: contextPath+"register.do",
				type: "post",
				data: "command=register&title="+title
										+"&term="+term
										+"&theme="+theme
										+"&sharing="+sharing
										+"&message="+message
										+"&mainimage="+myTour[0].spot.imagepath
										+"&beforeScheduleNo=${requestScope.scheduleDTO.scheduleNo}",
				success: function(data){
					if(data.result == true){
						alert("성공적으로 저장했습니다.");
						location.href = contextPath+"schedule.do?command=getAllSchedule";
					}else{
						alert("저장에 실패했습니다.");
					}
				}
			})
		}); // submitBtn click
	    
		$("#addDayBtn").click(function() {
			days++;

			var tabs = $("#tabs").tabs();
			var ul = tabs.find("#ulTabs");

			var name = "day" + days;
			var ulText = "<li id='l" + name + "'><a href='#" + name + "'>day " + days + "</a></li>";
			var tabsText = "<div id='" + name + "' style='border: solid black 1px'><ul id='sortable' class='ui-sortable'></ul></div>";

			$(ulText).appendTo(ul);
			$(tabsText).appendTo(tabs);
			tabs.tabs("refresh");
			
			$( "#sortable" ).sortable("cancel");
			$( "#sortable" ).disableSelection();
		    $( "#" + name + " #sortable" ).sortable({
				  connectWith: "#sortable",
		    	  update: function( event, ui ) {
		    		  setMyTour();
		    	  }
		    });
		    
		}); // addDayBtn.click

		$("#subDayBtn").click(function() {
			if (days == 1)
				return;

			$("#lday" + days).remove();
			$("#day" + days).remove();
			
			var temp = myTour;
			for(var i = 0; i < myTour.length; i++)
				if(temp[i].day == days){
					var t = temp.splice(i,1);
					i--;
				}

			myTour = temp;
			days--;
			
			setLiner();
		}); // subDayBtn.click

		$('#tabs').tabs({
			activate : function(event, ui) {
				var $activeTab = $('#tabs').tabs('option', 'active');
				currentTab = $activeTab;
				
				setLiner();
			}
		}); // tabs
		
		$("#citySel").change(function(){
			var city = $(this).val();
			
			var latlng = ""; var zoom = 10;
			if(city == "All"){
				map.panTo(roma);
				map.setZoom(5);
				return;
			}else if(city == "Roma"){
				latlng = roma;
			}else if(city == "Milano"){
				latlng = milano
				zoom = 12;
			}else if(city == "Napoli"){
				latlng = napoli;
				zoom = 12;
			}else if(city == "Venezia"){
				latlng = venezia;
				zoom = 11;
			}else if(city == "Palermo"){
				latlng = palermo;
				zoom = 12;
			}else if(city == "Pisa"){
				latlng = pisa;
				zoom = 14;
			}else if(city == "Torino"){
				latlng = torino;
				zoom = 12;
			}else if(city == "Bologna"){
				latlng = bologna;
				zoom = 12;
			}else if(city == "Cagliari"){
				latlng = cagliari;
				zoom = 12;
			}else if(city == "Catanzaro"){
				latlng = catanzaro;
				zoom = 12;
			}else if(city == "Florence"){
				latlng = florence;
				zoom = 12;
			}else if(city == "Genova"){
				latlng = genova;
				zoom = 12;
			}else if(city == "Perugia"){
				latlng = perugia;
				zoom = 11;
			}else if(city == "Trento"){
				latlng = trento;
				zoom = 12;
			}else if(city == "Trieste"){
				latlng = trieste;
				zoom = 12;
			}
			
			map.panTo(latlng);
			map.setZoom(zoom);
		});
	}); // jquery
	
	$(window).load(function(){
  	  initMap();
    });
	
	function initMap() {
		initSpot();
		
		map = new google.maps.Map(document.getElementById('map_canvas'), {
			center : roma,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			zoom : 5,
			styles: [
                     {
                    	    "featureType": "landscape",
                    	    "elementType": "geometry",
                    	    "stylers": [
                    	      { "color": "#dfe2df" }
                    	    ]
                    	  },{
                    	    "featureType": "water",
                    	    "stylers": [
                    	      { "color": "#4fbcbf" }
                    	    ]
                    	  }
                    	]
		});
		
		liner = new google.maps.Polyline({
			strokeOpacity: 0.8,
		    strokeWeight: 3,
			icons: [{icon: {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW}, offset: '100%'}],
			strokeColor : '#0000FF'
		});

		initLiner();
		setLiner();
	}
	
	function initLiner(){
		var latlng = getLatLng();
		
		if(liner != null) liner.setMap(null);
		
		liner.setMap(map);
		lineQueue = new Array();
	}
	
	function initSpot(){
		$.ajax({
			type:"post",
			url: contextPath+"touristsite.do",
			data:"command=getAllTouirstSite",
			dataType:"json",
			///////////////////////////
			success:function(data){
				$(data.touristSiteList).each(function(index, site){
					spot.push({
						"touristsiteNo":site.touristsiteNo*1,
						"name":site.name,
						"city":site.city,
						"address":site.address,
						"category":site.category,
						"lat":site.lat*1,
						"lng":site.lng*1,
						"description": site.description,
						"imagepath":contextPath + site.imagepath,
						"index":index*1
					});
				}); //each
				setMarker();
				insertMyTour();
			}//callback
		, error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"error:"+error);
	       }//error
		});//ajax
	}
	
	function addLineList(){
		for(var i=0; i < myTour.length; i++)
			if(myTour[i].day == currentTab+1)
				lineQueue.push(myTour[i]);
	}
	
	function getLatLng() {
		var temp = new Array();

		for (var i = 0; i < lineQueue.length; i++) {
			temp.push({
				lat : lineQueue[i].spot.lat*1,
				lng : lineQueue[i].spot.lng*1
			});
		}

		return temp;
	}
	
	function setMyTour(){
		var liList = $("#sortable li");
		  
		var temp = new Array();
		for(var i = 0; i < liList.length; i++){
			var arr = liList[i].id.split("m");
			var day = arr[0].substr(3)*1;
			var no = arr[1].substr(2)*1;
			  
			for(var j = 0; j < myTour.length; j++)
				if(day == myTour[j].day && no == myTour[j].spot.touristsiteNo)
					temp.push(myTour[j]);
		}
		  
		myTour = temp;
		setLiner();
	}
	
	function addSchedule(day, no) {
		if (infowindow)
			infowindow.close();
		
		var result = $.grep(spot, function(e) {
			return e.touristsiteNo == no
		});
		
		var sw = false;
		for(var i=0; i<myTour.length; i++)
			if((day == myTour[i].day) && (no == myTour[i].spot.touristsiteNo))
				sw = true;
		
		if(sw){
			alert("같은 날에는 하나의 명소만 등록할 수 있습니다.\n다른 날에 등록하세요.");
			return;
		}

		myTour.push({
			"day" : day,
			"spot" : result[0]
		});
		
		// alert(myTour[0].day + "일에 " + myTour[0].spot.name + "을 예약했습니다.");
			var id = "#day" + day;
			var divId = "tab" + day + "mno" + result[0].touristsiteNo;
			var text = "<li id='" + divId + "'>"
					+ "<table border='1' width='300px' class='table table-bordered'>"
					+ "<tr>"
					+ "<td rowspan='2' width='70px'>"
					+ "<img class='img-rounded' width='70px' height='70px' src='"+ result[0].imagepath + "' onclick='centerMap("+result[0].touristsiteNo+")'>"
					+ "</td>"
					+ "<td align='center'>" + result[0].name + "</td>"
					+ "<td rowspan='2' width='20px' align='center'>"
					+"<button type='button' class='close' onclick='deleteTouristsite(\""  +divId + "\")' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
					+"</td></tr>"
					+ "<tr>" 
					+ "<td align='center'>" + result[0].city + "</td>"
					+ "</tr>"
					+ "</table><br></li>";
			$(id + " #sortable").append(text);
			setLiner();
	}

	function setMarker() {
		for (var i = 0; i < spot.length; i++) {
			var data = spot[i];
			var marker = new google.maps.Marker({
				position : {
					lat : data.lat*1,
					lng : data.lng*1
				},
				touristsiteNo : data.touristsiteNo,
				name : data.name,
				city : data.city,
				address : data.address,
				category : data.category,
				lat : data.lat,
				lng : data.lng,
				description : data.description,
				imagepath : data.imagepath,
				map : map,
			});
			
			markers.push(marker);

			google.maps.event.addListener(marker, 'click', function() {
				if (infowindow)
					infowindow.close();
				
				var sw = false;
				for(var i = 0; i < thumnail.length; i++)
					if(this == thumnail[i])
						sw = true;
				
				if(sw == false){
					if(thumnail.length < 10){
						thumnail.push(this);
					}else{
						for(var i = 1; i < thumnail.length; i++)
							thumnail[i-1] = thumnail[i];
						
						thumnail.pop();
						thumnail.push(this);
					}
					updateThumnailUI();
				}
				
				var text = "<img src='" + this.imagepath +"' width='90px' height='80px'><br>"
							+"<h2 style='font-family: Nanum Gothic;'>"+ this.name + "</h2>"
							+ this.address + "<br>카테고리 : "
							+ this.category + "<p><input type='button' value='일정 추가' onclick='addSchedule("+ (currentTab+1) + "," + this.touristsiteNo + ")'>";

				infowindow = new google.maps.InfoWindow();
				infowindow.setContent(text);
				infowindow.open(map, this);
			});
		}
	}
	
	function updateThumnailUI(){
		$(".lSSlideOuter").remove();
		$("#responsive").remove();
		$("#item").append("<ul id='responsive' class='responsive'>");
		$("#item").append("</ul>");
		
		for(var i = 0; i < thumnail.length; i++){
			$("#responsive").append("<li id='imgLi'><img src='"+thumnail[i].imagepath+"' width='150px' height='80px' onclick='centerMap("+thumnail[i].touristsiteNo+")'></li>");
		}
		
		$('#responsive').lightSlider({
	    	item: 6,
	    	loop: true,
	    	keyPress: true
	    });
	}
	
	function centerMap(no){
		for(var i = 0; i < markers.length; i++){
			if(no == spot[i].touristsiteNo && no == markers[i].touristsiteNo){
				map.panTo({lat: spot[i].lat*1, lng: spot[i].lng*1});
				
				if (infowindow)
					infowindow.close();
				
				var text = "<img src='" + spot[i].imagepath +"' width='90px' height='80px'><br>"+
							"<h2 style='font-family: Nanum Gothic;'>"+ spot[i].name + "</h2>"
							+ spot[i].address + "<br>카테고리 : "
							+ spot[i].category + "<p><input type='button' value='일정 추가' onclick='addSchedule(" + (currentTab+1) + "," + spot[i].touristsiteNo + ")'>";

				infowindow = new google.maps.InfoWindow();
				infowindow.setContent(text);
				infowindow.open(map, markers[i]);
				
				return;
			}
		}
	}

	function deleteTouristsite(divId){
		$(function(){
			var arr = divId.split("m");
			var tabNo = arr[0].substr(3);
			var no = arr[1].substr(2);
			
			$("#"+divId).remove();
			
			var myTourSize = myTour.length;
			for(var i=0; i < myTourSize; i++){
				if(myTour[i].day == tabNo && myTour[i].spot.touristsiteNo == no){
					myTour.splice(i, 1);
					setLiner();
					return;
				}
			}
		});
	}
	
	function setLiner(){
		addLineList();
		var latlng = getLatLng();
		liner.setPath(latlng);
		liner.setMap(map);
		lineQueue = new Array();
	}
	
	function insertMyTour(){
		var prepareRegister = new Array();
		
		<c:forEach var="e" items="${registerList}">
			prepareRegister.push({"day": "${e.day}"*1, "touristsiteNo": "${e.touristsiteNo}"*1});
		</c:forEach>
		
		if(prepareRegister.length > 0){
			var lastDay = 0;
			for(var i=0; i < prepareRegister.length; i++)
				if(prepareRegister[i].day > lastDay) lastDay = prepareRegister[i].day;
			
			for(var i = 1; i < lastDay; i++)
				$("#addDayBtn").click();
			
			// myTour를 tabs에 추가
			for(var i=0; i < prepareRegister.length; i++)
				addSchedule(prepareRegister[i].day, prepareRegister[i].touristsiteNo);
		}
	}
	
</script>
</body>
</html>