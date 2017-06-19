<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="${initParam.root}css/index-page.css">
<link href="${initParam.root}css/rotating-mycard.css" rel="stylesheet" type="text/css"/>

<link href="${initParam.root}css/bootstrap.css" rel="stylesheet" />

<script src="${initParam.root }js/jquery.chocolat.js"></script>

<script src="${initParam.root }js/modernizr.custom.97074.js"></script>

<link rel="stylesheet" href="${initParam.root }css/chocolat.css" type="text/css" media="screen">

<!-- css -->
<style type="text/css">
table {
	width: 800px;
	height: 200px;
}

table img {
	width: 200px;
	height: 200px;
}

#content {
	width: 600px;
	height: 200px;
	text-align: center;
	font-size: 20pt;
}

.buttonDiv {
	margin: 5px;
}


.gallery img{
	width: 300px;
	height: 300px;
}
</style>
<script type="text/javascript">
	$(function() {
		
		$('.buttonDiv').hide();
		
		$('.mycard').hover(function() {
			$(this).find(".buttonDiv").show();
		},
			function() {
			$(this).find(".buttonDiv").hide();
		});//hover
		
	}); //jQuery
	

	/* 일정 삭제 */
	
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
<title>My Page</title>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="header-banner">
		<section class="bgi banner5">
			<h2>My&nbsp;Schedule&nbsp;Management</h2>
		</section>
	</div>

	<br>
	<div class="gallery" id="gallery" align="center">
		<div class="container"  >
		<script type="text/javascript" src="${initParam.root }js/jquery.hoverdir.js"></script>	
		<script type="text/javascript">
			$(function() {
				$(' #da-thumbs > li ').each( function() { $(this).hoverdir(); } );

			});
		</script>
			<div class="gallery-grids">
				<c:choose>
					<c:when test="${scheduleList==null }">
						<div align="center">
							<table>
								<tr>
									<td>
										<h2 align="center">현재 등록된 일정이 없습니다.</h2>
									</td>
								</tr>
								<tr>
									<td align="center"><input type="button" value="일정만들러 가기"
										class="btn btn-info"
										onclick="javascript:location.href='${initParam.root}view/schedule/make_schedule.jsp';">
									</td>
								</tr>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${scheduleList }" varStatus="count">
						<c:if test="${count }/3==0">
							<p></p>
						</c:if>
						<section>
						<ul id="da-thumbs" class="da-thumbs">
							<li>
								<a href="${initParam.root}register.do?command=detailSchedule&no=${item.scheduleNo}" class="b-animate-go">
									<img src="${item.mainImage}" alt="" />
									<div>
										<h5>${item.title }</h5>
										<span>${item.theme }</span>
									</div>
								</a>
							</li>
						</ul>
						</section>
					</c:forEach>
					</c:otherwise>
				</c:choose>
				
	        </div>
		<!--script-->
			</div>
		</div>
		<!--//gallery-->
	<br>
	<div>
		<c:import url="../footer.jsp" />
	</div>
</body>
</html>