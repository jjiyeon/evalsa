<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${initParam.root}js/jquery-1.11.3.js"></script>
<link rel="stylesheet" type="text/css" href="${initParam.root}css/index-page.css">
<link rel="stylesheet" type="text/css" href="${initParam.root}css/recommend/style.css">
<style type="text/css">
.themeMenu img{
   width: 105px;
   height: 105px;
}

.themeMenu {
	padding: 20px;
	margin: 10px;
}

li>img {
	width: 100px;
	height: 100px;
}

.themeBar {
	padding: 20px;
	margin: 10px;
}

.themeBar img {
	width: 80px;
	height: 80px;
}

.cityView{
	padding-top: 20px;

}

</style>

<script type="text/javascript">
	$(function() {
		setBar("roma");
		
		$("#tab-content").hide();
		$("#dayTab").empty();

		/* 도시 선택 */
		/* 로마 hover */
		$('#roma').hover(function() {
							$(this).attr('src','${initParam.root}image/Roma/roma_choice.jpg');
							$(this).click(function() {
								setBar("roma");
								
								$("#tab-content").hide();
								$("#dayTab").empty();
							});//click
						},
						function() {
							$(this).attr('src','${initParam.root}image/Roma/randmark/colosseo.jpg');
						});
		
		/* 밀라노 hover */
		$('#milano').hover(function() {
							$(this).attr('src','${initParam.root}image/Milano/Castello Sforzesco_choice.jpg');
							$(this).click(function() {
								setBar("milano");
								
								$("#tab-content").hide();
								$("#dayTab").empty();
							});//click

						},
						function() {
							$(this).attr('src','${initParam.root}image/Milano/randmark/Castello Sforzesco.jpg');
						});

		/* 베네치아 hover */
		$('#venezia')
				.hover(
						function() {
							$(this).attr('src','${initParam.root}image/Venezia/Lido_choice.jpg');
							$(this).click(function() {
								setBar("venezia");
								
								$("#tab-content").hide();
								$("#dayTab").empty();
							});//click

						},
						function() {
							$(this).attr('src','${initParam.root}image/Venezia/randmark/Lido.jpg');
						});

		/* 나폴리 hover */
		$('#napoli').hover(function() {
							$(this).attr('src','${initParam.root}image/Napoli/napoli_choice.jpg');
							$(this).click(function() {
								setBar("napoli");
								
								$("#tab-content").hide();
								$("#dayTab").empty();
							});//click

						},
						function() {
							$(this).attr('src','${initParam.root}image/Napoli/randmark/Galleria Umberto l.jpg');
						});

		/* 팔레르모 hover */
		$('#palermo')
				.hover(
						function() {
							$(this).attr('src','${initParam.root}image/Palermo/Palermo_choice.jpg');
							$(this).click(function() {
								setBar("palermo");
								
								$("#tab-content").hide();
								$("#dayTab").empty();
							});//click
						},
						function() {
							$(this).attr('src','${initParam.root}image/Palermo/randmark/Fontana Pretoria.jpg');
						});

		/* 피사 hover */
		$('#pisa')
				.hover(
						function() {
							$(this).attr('src','${initParam.root}image/Pisa/Pisa_choice.jpg');
							$(this).click(function() {
								setBar("pisa");
								
								$("#tab-content").hide();
								$("#dayTab").empty();
							});//click
						},
						function() {
							$(this).attr('src','${initParam.root}image/Pisa/randmark/Piazza dei Miracoli.jpg');
						});

		/* 토리노 hover */
		$('#torino').hover(function() {
							$(this).attr('src','${initParam.root}image/Torino/Torino_choice.jpg');
							$(this).click(function() {
								setBar("torino");
								
								$("#tab-content").hide();
								$("#dayTab").empty();
							});//click
						},
						function() {
							$(this).attr('src','${initParam.root}image/Torino/randmark/Piazza San Carlo.jpg');
						});
	});//jQuery
	
	function showTourByDay(city, day){
		var tabHtml="";
		var contentHtml = "";
		
		$("#dayTab").empty();
		$("#tab-content").show();
		
		for(var i=1; i<=day;i++){
			tabHtml += "<li class='active' style='margin: 10px;' id='day"+i+"'><a href='#sample-3a' onclick='showSchedule("+city+","+day+","+i+")' data-toggle='tab'>"+i+"일</a></li>";
		}
		$("#dayTab").append(tabHtml);
		
		switch(city){
			case "roma":
				if(day == 3) setContents(1);
				else if(day == 5) setContents(2);
				
				break;
			case "pisa":
				if(day == 1) setContents(9);
				
				break;
			case "milano":
				if(day == 1) setContents(4);
				else if(day == 3) setContents(3);
				
				break;
			case "palermo":
				if(day == 1) setContents(8);
				
				break;
			case "venezia":
				if(day == 1) setContents(6);
				else if(day == 3) setContents(5);
				
				break;
			case "torino":
				if(day == 1)
					setContents(10);
				
				break;
			case "napoli":
				if(day == 1) setContents(7);
				
				break;
		}
	}
	
	function setContents(index){
		var arr = new Array();
		
		arr.push($('.romaTour_Three'));
		arr.push($('.romaTour_Five'));
		arr.push($('.milanoTour_Three'));
		arr.push($('.milanoTour_One'));
		arr.push($('.veneziaTour_Three'));
		arr.push($('.veneziaTour_One'));
		arr.push($('.napoliTour_One'));
		arr.push($('.palermoTour_One'));
		arr.push($('.pisaTour_One'));
		arr.push($('.torinoTour_One'));
		
		$('.romaTour_Three').hide();
		$('.romaTour_Five').hide();
		$('.milanoTour_Three').hide();
		$('.milanoTour_One').hide();
		$('.veneziaTour_Three').hide();
		$('.veneziaTour_One').hide();
		$('.napoliTour_One').hide();
		$('.palermoTour_One').hide();
		$('.pisaTour_One').hide();
		$('.torinoTour_One').hide();
		
		arr[index-1].show();
	}
	
	function setBar(city){
		$('.napoliBar').hide();
		$('.romaBar').hide();
		$('.milanoBar').hide();
		$('.veneziaBar').hide();
		$('.palermoBar').hide();
		$('.pisaBar').hide();
		$('.torinoBar').hide();
		
		$('.'+city+'Bar').show();
	}
	
	function getClassName(city, day){
		var sday = "";
		
		switch(day){
			case 1:
				sday = "One";
				break;
			case 3:
				sday = "Three";
				break;
			case 5:
				sday = "Five";
				break;
		}
		
		return className = city + "Tour_" + sday;
	}
	
	function showSchedule(city, selectedDay, day){
		for(var i=1; i<=selectedDay; i++){
			$(".scheduleView"+i).hide();
		}
		
		$(".scheduleView"+day).show();
	}
</script>
<title>발바닥 추천 테마</title>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="header-banner">
    <section class="bgi banner5"><h2>Recommend City</h2> </section>
    </div>
	<div class="col-md-1 "></div>
	<div class="col-md-10" style="height: 1000px;">
		<div class="themeMenu" align="center">
			<ul class="list-inline">
				<li>
					<img id="roma" alt="roma" src="${initParam.root }image/Roma/randmark/colosseo.jpg"	class="img-circle">
				</li>
				<li>
					<img id="pisa" alt="pisa" src="${initParam.root }image/Pisa/randmark/Piazza dei Miracoli.jpg"class="img-circle">
				</li>
				<li>
					<img id="milano" alt="milano"  src="${initParam.root }image/Milano/randmark/Castello Sforzesco.jpg" class="img-circle">
				</li>
				<li>
					<img id="palermo" alt="palermo"	src="${initParam.root }image/Palermo/randmark/Fontana Pretoria.jpg" class="img-circle">
				</li>
				<li>
					<img id="venezia" alt="venezia"	src="${initParam.root }image/Venezia/randmark/Lido.jpg" class="img-circle">
				</li>
				<li>
					<img id="torino" alt="torino" src="${initParam.root }image/Torino/randmark/Piazza San Carlo.jpg"
						class="img-circle">
				</li>
				<li>
					<img id="napoli" alt="napoli" src="${initParam.root }image/Napoli/randmark/Galleria Umberto l.jpg" class="img-circle">
				</li>
			</ul>
		</div>
		<!-- end themeMenu -->
		
		<!-- tourBar 시작-->
		<div class="themeBar">
			<div class="romaBar" align="center">
				<ul class="list-inline">
					<li>
						<img alt="romaTerm1" src="${initParam.root }image/Day/day3_tour.jpg" class="img-circle" id="romaTerm1"
						onclick="showTourByDay('roma',3)">
					</li>
					<li>
						<img alt="romaTerm2" src="${initParam.root }image/Day/day5_tour.jpg" class="img-circle" id="romaTerm2"
						onclick="showTourByDay('roma',5)">
					</li>
				</ul>
			</div>

			<div class="milanoBar" align="center">
				<ul class="list-inline">
					<li><img alt="milanoTerm1"
						src="${initParam.root }image/Day/day1_tour.jpg" class="img-circle"
						id="milanoTerm1" onclick="showTourByDay('milano',1)"></li>
					<li><img alt="milanoTerm2"
						src="${initParam.root }image/Day/day3_tour.jpg" class="img-circle"
						id="milanoTerm2" onclick="showTourByDay('milano',3)"></li>
				</ul>
			</div>

			<div class="veneziaBar" align="center">
				<ul class="list-inline">
					<li><img alt="veneziaTerm1"
						src="${initParam.root }image/Day/day1_tour.jpg" class="img-circle"
						id="veneziaTerm1" onclick="showTourByDay('venezia',1)"></li>
					<li><img alt="veneziaTerm2"
						src="${initParam.root }image/Day/day3_tour.jpg" class="img-circle"
						id="veneziaTerm2" onclick="showTourByDay('venezia',3)"></li>
				</ul>
			</div>
			
			<div class="napoliBar" align="center">
				<ul class="list-inline">
					<li><img alt="napoliTerm1"
						src="${initParam.root }image/Day/day1_tour.jpg" class="img-circle"
						id="napoliTerm1" onclick="showTourByDay('napoli',1)"></li>
				</ul>
			</div>
			
			
			<div class="palermoBar" align="center">
				<ul class="list-inline">
					<li><img alt="palermoTerm1"
						src="${initParam.root }image/Day/day1_tour.jpg" class="img-circle"
						id="palermoTerm1" onclick="showTourByDay('palermo',1)"></li>
				</ul>
			</div>
			
			<div class="pisaBar" align="center">
				<ul class="list-inline">
					<li><img alt="pisaTerm1"
						src="${initParam.root }image/Day/day1_tour.jpg" class="img-circle"
						id="pisaTerm1" onclick="showTourByDay('pisa',1)"></li>
				</ul>
			</div>
			
			<div class="torinoBar" align="center">
				<ul class="list-inline">
					<li><img alt="torinoTerm1"
						src="${initParam.root }image/Day/day1_tour.jpg" class="img-circle"
						id="torinoTerm1" onclick="showTourByDay('torino',1)"></li>
				</ul>
			</div> 
		</div>
		<!-- tourBar 끝-->
		<div class="row tabs cityView">
                <div class="col-sm-3">
                    <ul class="nav nav-pills nav-stacked" id="dayTab">
                    </ul>
                </div>
                <div class="col-sm-9 contentsArea">
                    <div class="tab-content" id="tab-content">
                        <div class="themeBar">
							<!-- 로마 -->
							<div class="romaTour_Three">
								<jsp:include page="romatour_Three.jsp" />
							</div>
							<div class="romaTour_Five">
								<jsp:include page="romatour_five.jsp" />
							</div>
							<!-- 밀라노 -->
							<div class="milanoTour_One">
								<jsp:include page="milanotour_One.jsp" />
							</div>
							<div class="milanoTour_Three">
								<jsp:include page="milanotour_Three.jsp" />
							</div>
							<!-- 베네치아 -->
							<div class="veneziaTour_One">
								<jsp:include page="veneziatour_One.jsp" />
							</div>
							<div class="veneziaTour_Three">
								<jsp:include page="veneziatour_Three.jsp" />
							</div>
							<!-- 나폴리 -->
							<div class="napoliTour_One">
								<jsp:include page="napolitour_One.jsp" />
							</div>
							<!-- 팔레르모  -->
							<div class="palermoTour_One">
								<jsp:include page="palermotour_One.jsp" />
							</div>
							<!-- 피사 -->
							<div class="pisaTour_One">
								<jsp:include page="pisatour_One.jsp" />
							</div>
							<!-- 토리노 -->
							<div class="torinoTour_One">
								<jsp:include page="torinotour_One.jsp" />
							</div> 
						</div> 
                    </div>
                </div>
            </div>
            <!-- Tab v3 -->
	</div>
	 
	<!-- end col-md-10 -->
	<div class="col-md-1"></div>

	<div class="col-md-12">
		<c:import url="../footer.jsp" />
	</div>
</body>
</html>