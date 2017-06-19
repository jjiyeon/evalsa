<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	li {
		padding: 10px;
		margin: 10px;
	}
	li>img{
		width: 80px;
		height: 80px;
	}
	
	tr img{
		width: 120px;
		height: 120px;
	}
	
	tr, td{
		padding: 20px;
		margin: 20px;
	}
	
	
</style>

<script type="text/javascript">
	$(function() {
		$('.scheduleView1').hide();
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-1"></div>
	<div class="col-md-10">
	
	<div class="scheduleView1" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Palermo/hotel/Palazzo Ducale Suites.jpg" class="img-circle"><br>
					   두레일 스웨트
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Palermo/shopping/Mercato Vucciria.jpg" class="img-circle"><br>
					  부리치아 시장
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Palermo/randmark/Quattro Canti.jpg" class="img-circle"><br>
					  콰드로 칸디
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td colspan="2"><img alt="" src="${initParam.root }image/Palermo/food/Pizzeria Bellini.jpg" class="img-circle"><br>
					  Pizzeria Bellini</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td colspan="2"><img alt="" src="${initParam.root }image/Palermo/randmark/Fontana Pretoria.jpg" class="img-circle"><br>
					  프레토리아 분수</td>
			</tr>
		</table>
	</div>
</div>
	
	<div class="col-md-1"></div>
</body>
</html>