<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- login modal -->
<link href="${initParam.root }css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<script src="${initParam.root }js/bootstrap.js" type="text/javascript"></script>

<!-- css -->
<link href="${initParam.root}css/bootstrap.min.css" rel="stylesheet" />
<link href="${initParam.root }css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="header" id="home">
		<nav class="navbar navbar-default">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${initParam.root}view/index.jsp"><h1>Evalsa</h1>
						<br />
					<span>Traveling</span></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right margin-top cl-effect-2">
						<%-- <li><a href="${initParam.root}view/index.jsp"><span data-hover="Home">Home</span></a></li> --%>
						<li><a href="${initParam.root}touristsite.do?command=getTouristSiteByCity&&city=로마"><span data-hover="About Italy">About Italy</span></a></li>
						<li><a href="${initParam.root }view/recommend/recommend_theme.jsp"><span data-hover="Recommend">Recommend</span></a></li>
						<li><a href="${initParam.root}schedule.do?command=findScheduleListBySharing"><span data-hover="Sharing Board">Sharing Board</span></a></li>
						<li><a href="${initParam.root}gallery.do?command=getAllGalleryList&&currentPage=1&&currentGroup=1"><span data-hover="Gallery">Gallery</span></a></li>
						<li><a href="${initParam.root}board.do?command=getAllBoard&&category=notice"><span data-hover="Community">Community</span></a></li>
						<c:choose>
							<c:when test="${sessionScope.mdto!=null}">
								<li><a href="${initParam.root}view/schedule/make_schedule.jsp"><span data-hover="Make Schedule">Make Schedule</span></a></li>
							</c:when>
							<c:otherwise>
																
							</c:otherwise>
						</c:choose>
						
					</ul>
					<div class="clearfix"></div>
				</div>
				<!-- /.navbar-collapse -->
				<div class="clearfix"></div>
			</div>
			<!-- /container-fluid -->
		</nav>
	</div>
	<!--  end navbar -->
</body>
</html>