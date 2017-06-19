<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>About Italy</title>
		<script src="${initParam.root}js/jquery.min.js"></script>
		<link href="${initParam.root}css/style.css" rel='stylesheet' type='text/css' />
		<!-- Bootstrap Core CSS -->
		<!-- Template CSS -->
		<link rel="stylesheet" href="${initParam.root}css/animate.css" rel="stylesheet">
		<link rel="stylesheet" href="${initParam.root}css/font-awesome.css" rel="stylesheet">
		<link rel="stylesheet" href="${initParam.root}css/nexus.css" rel="stylesheet">
		<link rel="stylesheet" href="${initParam.root}css/responsive.css" rel="stylesheet">
		<link rel="stylesheet" href="${initParam.root}css/custom.css" rel="stylesheet">

		<!-- script -->
		<script type="text/javascript" src="${initParam.root}js/scripts.js"></script>
		<!-- Isotope - Portfolio Sorting -->
		<script type="text/javascript" src="${initParam.root}js/jquery.isotope.js" type="text/javascript"></script>
		<!-- Mobile Menu - Slicknav -->
		<script type="text/javascript" src="${initParam.root}js/jquery.slicknav.js" type="text/javascript"></script>
		<!-- Modernizr -->
		<script src="${initParam.root}js/modernizr.custom.js" type="text/javascript"></script>
		<!-- Flexslider -->
		<script defer src="${initParam.root}js/jquery.flexslider.js"></script>
	</head>
	<body>
		<c:import url="../header.jsp" />
		<div class="header-banner">
    	<section class="bgi banner5"><h2>About Italy</h2> </section></div>
		<!-- jQuery -->
		<link rel="stylesheet" href="${initParam.root}css/flexslider.css" type="text/css" media="screen" >
		<script type="text/javascript">
			$(window).load(function(){
				$('.flexslider').flexslider({
					animation: "slide",
					animationLoop: true,
					itemWidth: 250,
					itemMargin: 5,
					start: function(slider){
						$('body').removeClass('loading');
					}
				});
			});
		</script>
		<!-- Place somewhere in the <body> of your page -->
		<section class="about_slider" style="padding: 30px">
			<div class="flexslider carousel">
				<ul class="slides">
					<li onclick="itemRequest('볼로냐')">
						<img src="${initParam.root}image/Bologna/Bologna2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">볼로냐</a></h4>
									<span>Bologna</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('칼리아리')">
						<img src="${initParam.root}image/Cagliari/Cagliari2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">칼리아리</a></h4>
									<span>Cagliari</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('카타니아')">
						<img src="${initParam.root}image/Catanzaro/Catania2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">카타니아</a></h4>
									<span>Catania</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('피렌체')">
						<img src="${initParam.root}image/Florence/Florence2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">피렌체</a></h4>
									<span>Florence</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('제노바')">
						<img src="${initParam.root}image/Genova/Genova2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">제노바</a></h4>
									<span>Genoa</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('밀라노')">
						<img src="${initParam.root}image/Milano/Milan2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">밀라노</a></h4>
									<span>Milan</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('나폴리')">
						<img src="${initParam.root}image/Napoli/Naples2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">나폴리</a></h4>
									<span>Naples</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('팔레르모')">
						<img src="${initParam.root}image/Palermo/Palermo2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">팔레르모</a></h4>
									<span>Palermo</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('페루자')">
						<img src="${initParam.root}image/Perugia/Perugia2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">페루자</a></h4>
									<span>Perugia</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('피사')">
						<img src="${initParam.root}image/Pisa/Pisa2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">피사</a></h4>
									<span>Pisa</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('로마')">
						<img src="${initParam.root}image/Roma/Rome2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">로마</a></h4>
									<span>Rome</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('소렌토')">
						<img src="${initParam.root}image/Torino/Sorrento2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">소렌토</a></h4>
									<span>Sorrento</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('토리노')">
						<img src="${initParam.root}image/Torino/Torino2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">토리노</a></h4>
									<span>Torino</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('베네치아')">
						<img src="${initParam.root}image/Venezia/Venice2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">베네치아</a></h4>
									<span>Venice</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
					<li onclick="itemRequest('트리에스테')">
						<img src="${initParam.root}image/Trieste/Trieste2.jpg" width="200px" height="200px" />
						<!-- place-caption-info -->
						<div class="caption-info">
							<div class="caption-info-head">
								<div class="caption-info-head-left">
									<h4><a href="#">트리에스테</a></h4>
									<span>Trieste</span>
								</div>
								<div class="caption-info-head-right">
									<span></span>
								</div>
								<div class="clear"> </div>
							</div>
						</div>
						<!-- //place-caption-info -->
					</li>
				</ul>
			</div>
		</section>
		<!-- //End content_slider -->
		<!-- //End-offers -->

		<!-- Box Layout -->
		<div id="header" class="container">
		<div class="row">
		<!-- === BEGIN CONTENT === -->
		<div id="content" class="container">
			<div class="row margin-vert-30">
				<div class="col-md-12">
					<!-- 주제 -->
					<h2>About Italy</h2>
					<!-- Filter Buttons -->
					<div class="portfolio-filter-container margin-top-20">
						<ul class="portfolio-filter">
							<li class="portfolio-filter-label label label-primary">
								Filter :
							</li>
							<li>
								<a href="#" class="portfolio-selected btn btn-default" data-filter="*" >&#35;All</a>
							</li>
							<li>
								<a href="#"  class="btn btn-default" data-filter=".touristsite">&#35;인기 관광지</a>
							</li>
							<li>
								<a href="#" class="btn btn-default" data-filter=".food">&#35;음식점</a>
							</li>
							<li>
								<a href="#"  class="btn btn-default" data-filter=".shopping">&#35;쇼핑</a>
							</li>
							<li>
								<a href="#"  class="btn btn-default" data-filter=".hotel">&#35;숙박</a>
							</li>
						</ul>
					</div>
					<!-- End Filter Buttons -->
				</div>
				<div class="portfolio-group col-md-12 margin-top-30 no-padding">
					<div id="ItemRow" class="row">
						<c:forEach var="e" items="${requestScope.tourList}" varStatus="cnt">
							<div class="portfolio-item col-md-3 ${e.category}">
								<div class="image-hover">
									<figure>
										<img src="${initParam.root}${e.imagepath}" width="180px" height="130px" data-toggle="modal" data-target="#myModal${cnt.count}">
									</figure>
									<h4 class="margin-top-20">${e.name}</h4>
									<p class="margin-top-10">${e.city}</p>
								</div>
							</div>
							
							<!-- Modal -->
							<div class="modal fade" id="myModal${cnt.count}" role="dialog">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal">×</button>
							        <h3 class="modal-title" id="myModalLabel" align="center">${e.name}</h3>
							      </div>
							      <div class="modal-body" align="center">
							      	<img src="${initParam.root}${e.imagepath}" width="300px" height="250px"><br><br>
							      	<b>${e.city}, ${e.address}</b><br><br>
							      	${e.description}<br>
							      </div>
							    </div>
							  </div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- === END CONTENT === -->
		</div>
	</div>
	<div class="col-md-12">
		<c:import url="../footer.jsp" />
	</div>
	
	<script type="text/javascript">	
		function itemRequest(city){
			location.href="${initParam.root}touristsite.do?command=getTouristSiteByCity&&city="+encodeURIComponent(city);
		}
	</script>
	
	</body>
</html>