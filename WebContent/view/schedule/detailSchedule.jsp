<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${initParam.root }css/index-page.css">
<style type="text/css">
   #map_canvas {
      width: 305px;
      height: 305px;
      margin: 0px auto;
      margin-top: 20px;
   }
   #likeImage{
      width: 30px;
      height: 30px;
   
   }
   #detail-header{
   	width: 100%;
   }
   #detail-header td{
   		padding: 3px;
   }
   .sideDay-nav{
   	position: fixed;
   	background-color: white;
   	border-top: 2px solid #dedede;
    border-bottom: 2px solid #dedede;
    padding: 10px;
    margin: 10px;
    cursor: pointer;
   }
   
   .sideDay-nav a{
   		padding: 10px;
   		margin: 5px;
   		margin-top: 5px;
   		margin-bottom: 5px;
   }
</style>

<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
   var lastDay = ${requestScope.lastDay};
   var scheduleNo = ${sdto.SCHEDULE_NO};

   var sdto = {nickname: "${sdto.NICKNAME}", 
            title: "${sdto.TITLE}", 
            term: "${sdto.TERM}",
            theme: "${sdto.THEME}",
            hit: "${sdto.HIT}",
            likeup: "${sdto.LIKEUP}",
            sharing: "${sdto.SHARING}"};
   
   var slist = new Array(); 
   <c:forEach var="i" items="${requestScope.resultList}">
      slist.push({scheduleNo: "${i.SCHEDULE_NO}",
               touristsiteNo: "${i.TOURISTSITE_NO}",
               day: "${i.DAY}",
               name: "${i.NAME}",
               city: "${i.CITY}",
               address: "${i.ADDRESS}",
               imagepath: "${i.IMAGEPATH}",
               lat: "${i.LAT}",
               lng: "${i.LNG}"});
   </c:forEach>
</script>
<title>Insert title here</title>

<script type="text/javascript">
function deleteSchedule(scheduleNo) {
	if(confirm("일정을 삭제하시겠습니까?")){
		//alert(scheduleNo);
		location.href="register.do?command=removeRegister&&scheduleNo="+scheduleNo;
	}else
		return;
}

/* 일정 수정 */
function updateSchedule(scheduleNo){
	if(confirm("일정을 수정하시겠습니까?")){
		location.href="register.do?command=updateRegister&&scheduleNo="+scheduleNo;
	}
}

</script>
</head>
<body>
	<c:if test="${sessionScope.mdto==null }">
      <script type="text/javascript">
         alert("로그인이 필요합니다.");
         location.href = "${initParam.root}view/index.jsp";
      </script>
   	</c:if>

   <div>
      <c:import url="../header.jsp" />
   </div>
   <div class="header-banner">
    <section class="bgi banner5"><h2>Detail Schedule</h2> </section></div>
   
   <div class="row">
      <div id="nav-days" class="col-md-1">
      	<div style="position: fixed;" class="sideDay-nav" align="center">
      		<span class="glyphicon glyphicon-chevron-up" aria-hidden="true" 
      		onclick="javascript:location.href='#top'"></span><br>
	         <c:forEach begin="1" end="${requestScope.lastDay}" varStatus="cnt">
	            <div onclick="javascript:location.href='#day${cnt.count}';">Day ${cnt.count}</div>
	         </c:forEach>
	         <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"
	         onclick="javascript:document.body.scrollTop = document.body.scrollHeight;"></span>
         </div>
      </div>
      <div id="content" class="col-md-8" style="margin-top:  10px;" align="center">
         <div>
               <div class="cover-header" align="right" >
                 <h1>HIT : ${sdto.HIT } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                 <a href="${initParam.root}schedule.do?command=increaseLikeup&no=${sdto.SCHEDULE_NO}"><img alt="" src="${initParam.root }image/schedule/likeup.png" id="likeImage">
                 </a> ${sdto.LIKEUP }</h1>
              </div>
              <div class="cover-body" align="left">
              <table id="detail-header">
              	<tr>
              		<td><h1>${sdto.TITLE }&nbsp;</h1><h4>${sdto.NICKNAME }</h4></td>
              	</tr>
             	<tr>
             		<td><h4>${sdto.TERM}</h4></td>
             	</tr>
             	<tr>
             		<td> <h4>${sdto.THEME } 여행</h4></td>
             		<td></td>
             		<td align="right">
             			<input type="button" value="수정" id="updateCardBtn" onclick="updateSchedule(${sdto.SCHEDULE_NO})" class="btn"> 
						 <input type="button" value="삭제" id="deleteCardBtn" class="btn" onclick="deleteSchedule(${sdto.SCHEDULE_NO})">     
             		</td>
             	</tr>
              </table>
              </div>
         </div>
         <hr>
         <div style="width: 100%;">
         	<c:set var="i" value="1" property="int"/>
            <c:forEach begin="1" end="${requestScope.lastDay}" varStatus="cnt">
            <div id="day${cnt.count}" style="background-color:#71c6c1; border-radius: 3px; padding: 5px;">
            <br>
            <h3 align="left">Day ${cnt.count}</h3>
            <br>
            <c:forEach var="e" items="${requestScope.resultList}">
               <c:if test="${cnt.count == e.DAY}" >
                  <div style="background-color: white; border-radius: 5px;  margin-left: 10px; margin-right:10px;" >
                     <table style="width: 80%;"  >
                        <tr>
                           <td rowspan="4" align="center" width="5%">${i}</td>
                           <c:set var="i" value="${i+1}"/>
                        </tr>
                        <tr>
                           <td rowspan="4" align="center" width="20%" style="padding-top: 5px; padding-bottom: 5px;">
                              <img alt="" src="${initParam.root}${e.IMAGEPATH}" width="130px" height="130px">
                           </td>
                        </tr>
                        <tr>
                        	<td width="40%">이름 : ${e.NAME}</td>
                        	<td width="30%">도시 : ${e.CITY}</td>
                        	<td width="5%" align="center"><a onclick="setPoint(${e.LAT}, ${e.LNG})">
                        		<img alt="" src="${initParam.root }image/etc/지도 마크.png" style="width: 40px; height: 50px;">
                        	</a></td>
                        </tr>
                        <tr>
                        	<td colspan="3" width="75%">주소 : ${e.ADDRESS}</td>
                        </tr>
                     </table>
                  </div>
                  <br>
               </c:if>
            </c:forEach>
            </div>
            <br><br>
            <hr>
            <br><br>
            </c:forEach>
            </div>
         </div>
         <div id="nav-map" class="col-md-3" >
	      	<div style="position: fixed;">
	       		<div id="map_canvas" align="center" ></div>
	       	</div>
	     </div>
      </div>
      <div>
      	<br><br><br><br><br><br><br><br>
      </div>
   
   <div>
      <c:import url="../footer.jsp" />
   </div>
   
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5u8Oha8_wz1ivo9_VjVGOLIUFY3waZbw" async defer></script>
   <script type="text/javascript">
      var roma = {lat: 41.886878, lng: 12.481606};
      var lastDay = ${requestScope.lastDay};
      var map = null;
      var arr = new Array();
      var markers = new Array();
      var liner = null;
      
      function initMap(){
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
      }
      
      function moveMap(_lat, _lng){
         map.panTo({lat: _lat, lng: _lng});
      }
      
      setInterval(updateLikeup, 1000*5);
      
      function updateLikeup(){
    	  $.ajax({
     		 type: "get",
     		 url: "${initParam.root}schedule.do?command=getLikeupByScheduleNo&no="+scheduleNo,
     		 dataType: "json",
     		 success: function(data){
     			 $("#likeImage").html(data.likeup);
     		 }
     	 });
      }
      
      $(window).load(function(){
    	  initMap();
    	  window.scrollTo(0, 10);
      });
      
      $(function(){
          for(var i=1; i <= lastDay; i++){
        	  var temp = $('#day'+i).offset().top;
        	  arr.push(temp);
          }
    	  
    	 $(window).scroll(function(){
    		var currentScrollPosition = $(document).scrollTop();
   		 	for(var i=0; i < arr.length; i++){
   		 		if(currentScrollPosition < parseInt(arr[i])-130){
   		 			setMap(1);
   		 			break;
   		 		}else if(i == arr.length - 1){
   		 			setMap(arr.length);
   		 			break;
   		 		}else if(parseInt(arr[i])-130 < currentScrollPosition && currentScrollPosition < parseInt(arr[i+1])-130){
   		 			setMap(i+1);
   		 			break;
   		 		}
   		 	}
    	 });
      });
      
      function setPoint(_lat, _lng){
    	  for(var i = 0; i < markers.length; i++)
    		  markers[i].setMap(null);
    	  
    	  markers = new Array();
    	  
    	  var marker = new google.maps.Marker({
              position : new google.maps.LatLng(_lat, _lng),
              map : map,
              zIndex : 1
          });
    	  
    	  markers.push(marker);
    	  map.setZoom(10);
    	  
    	  moveMap(_lat, _lng);
      }

      function setMap(day){
    	  var idx = -1;
    	  var latlng = new Array();
    	  
    	  for(var i = 0; i < markers.length; i++)
    		  markers[i].setMap(null);
    	  
    	  if(liner != null) {
    		  liner.setMap(null); 
    		  liner = null;
    	  }
    	  markers = new Array();
    	  
    	  for(var i = 0; i < slist.length; i++){
    		  if(day == slist[i].day){
    			  if(idx == -1) idx = i;
    			  
    			  latlng.push({lat: slist[i].lat*1, lng: slist[i].lng*1});
    			  var marker = new google.maps.Marker({
    	              position : new google.maps.LatLng(slist[i].lat*1, slist[i].lng*1),
    	              map : map,
    	              zIndex : 1
    	          });
    			  markers.push(marker);
    		  }
    	  }
    	  
    	  liner = new google.maps.Polyline({
    		    path: latlng,
    		    strokeOpacity: 0.8,
    		    strokeWeight: 3,
    			icons: [{icon: {path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW}, offset: '100%'}],
    			strokeColor : '#0000FF'
    	  });
    	  
    	  moveMap(slist[idx].lat*1, slist[idx].lng*1);
    	  map.setZoom(5);
    	  
    	  liner.setMap(map);
      }
   </script>
</body>

</html>