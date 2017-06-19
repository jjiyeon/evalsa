<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${initParam.root}js/jquery-1.11.3.js"></script>
<!-- CSS -->
<link href="${initParam.root}css/rotating-card.css" rel="stylesheet" />

<link rel="stylesheet" type="text/css" href="${initParam.root}css/index-page.css">

<link href="${initParam.root}css/bootstrap.css" rel="stylesheet" />
<script src="${initParam.root }js/jquery.chocolat.js"></script>
<script type="text/javascript" src="${initParam.root }js/jquery.hoverdir.js"></script>	
<script src="${initParam.root }js/modernizr.custom.97074.js"></script>
<link rel="stylesheet" href="${initParam.root }css/chocolat.css" type="text/css" media="screen">

<style type="text/css">
	
.gallery img{
	width: 300px;
	height: 300px;
}
#top-three img{
	
	height: 200px;
}
</style>
<title>내가 만난 이탈리아</title>
<script type="text/javascript">
			$(function() {
				$(' #da-thumbs > li ').each( function() { $(this).hoverdir(); } );

			});
		</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="header-banner">
    <section class="bgi banner5"><h2>SharingBoard</h2> </section></div>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
	<!-- 인기일정 3개 가지고 와서 띄우는 부분 -->
		<div class="col-md-8">
	<h3 align="center">인기 여행 일정</h3>
	<div class="box" onload="getScheduleByLikeUpTopTrhee()">
		<div class="gallery-grid" id="top-three" >
		</div>

				<script type="text/javascript">
					var schList = [ ] ;
				
					$.ajax({
						type:"post",
						url:"${initParam.root}schedule.do",
						data:"command=getScheduleByLikeUpTopThree",
						dataType:"json",
						/////////////////////////////////
						success:function(data) {
							//alert(data.scheduleList.length);
						var textHtml="";
						$(data.scheduleList).each(function(index, schedule){
							//alert(.schedule.id);
							schList.push({
								"scheduleNo":schedule.SCHEDULE_NO*1,
								"title":schedule.TITLE,
								"theme":schedule.THEME,
								"term":schedule.TERM,
								"sharing":schedule.SHARING,
								"id":schedule.ID,
								"mainImage":schedule.MAINIMAGE,
								"nickname":schedule.NICKNAME,
								"hit":schedule.HIT,
								"likeup":schedule.LIKEUP
							});
							//alert(schList[index].id);
							
							textHtml =  "<section>"+
									      "<ul id='da-thumbs' class='da-thumbs'>" +
									      "<li align='center'>"+
									      "<a href='${initParam.root}register.do?command=detailSchedule&&no="+schList[index].scheduleNo+"'>"+
									      "<img src='"+schList[index].mainImage+"' alt=''/>"+
									      "<h2 style='color:black;'>"+schList[index].title+"</h2>"+
									      "<span style='color:black;'>"+schList[index].theme+"<br>"+schList[index].nickname+"</span>"+
									      "</a>"+
									      "</li>"+
									      "</ul>"+
									      "</section>";
									      
							$('#top-three').append(textHtml);
									
							});//each
							}//callback
						});//ajax
					</script>
		</div>
		</div>
		<div class="col-md-2"></div>
		
	</div>
	<br><br><br>
	<hr>
	<br>
	<h1 align="center">최신 여행 일정</h1>
	<!-- 공개된 모든 일정들을 가지고 와서 띄우는 부분 -->
	<div class="gallery" id="gallery" align="center">
		<div class="container"  >
			<div class="gallery-grids">
						<c:forEach var="sharing" items="${slist}" varStatus="count">
						<c:if test="${count }/3==0">
							<p></p>
						</c:if>
						<section>
						<ul id="da-thumbs" class="da-thumbs">
							<li>
								<a href="${initParam.root}register.do?command=detailSchedule&no=${sharing.SCHEDULE_NO}" class="b-animate-go">
									<img src="${sharing.MAINIMAGE}" alt="" />
									<div>
										<h5>${sharing.TITLE }</h5>
										<span>${sharing.THEME }<br>${sharing.NICKNAME}</span>
									</div>
								</a>
							</li>
						</ul>
						</section>
					</c:forEach>
					
				
	        </div>
		<!--script-->
			</div>
		</div>
		<!--//gallery-->
		
		<div align="center">
		<nav>
		<ul class="pagination">
			<c:if test="${requestScope.paging.prevGroup}">
			<li>
				<a href="schedule.do?command=findScheduleListBySharing&&currentPage=${requestScope.paging.prevGroupPage}&&currentGroup=${(requestScope.paging.currentGroup)-1}">
				<span aria-hidden="true">&laquo;</span></a>
			</li>
			</c:if>
			<c:forEach begin="${requestScope.paging.startPage}" end="${requestScope.paging.endPage}" var="i">
				<c:choose>
					<c:when test="${requestScope.paging.currentPage == i}"><li class="active"><a href="#">${i}</a></li></c:when>
					<c:otherwise>
						<li><a href="schedule.do?command=findScheduleListBySharing&&currentPage=${i}&&currentGroup=${requestScope.paging.currentGroup}">${i}</a></li>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${requestScope.paging.nextGroup}">
				<li>
				<a href="schedule.do?command=findScheduleListBySharing&&currentPage=${requestScope.paging.nextGroupPage}&&currentGroup=${(requestScope.paging.currentGroup)+1}">
				<span aria-hidden="true">&raquo;</span></a>
				</li>
			</c:if>
		</ul>
		</nav>
		</div>
	
	<br>
	<div>
		<c:import url="../footer.jsp" />
	</div>
</body>
</html>