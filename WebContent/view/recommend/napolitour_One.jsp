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
				<td><img alt="" src="${initParam.root }image/Napoli/hotel/Joyfull Hotel.jpg" class="img-circle"><br>
					   조이홀 호텔
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Napoli/food/Antica Pizzeria da Michele.jpg" class="img-circle"><br>
					  다 마켈레
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Napoli/randmark/Duomo.jpg" class="img-circle"><br>
					  두오모 성당
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Napoli/food/Pizzeria Brandi.jpg" class="img-circle"><br>
					  브랜드피자</td>
				
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Napoli/randmark/Santa Lucia.jpg" class="img-circle"><br>
					  산타루치아 항구</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Napoli/randmark/Galleria Umberto l.jpg" class="img-circle"><br>
					  움베르토 1세 갤러리</td>
			</tr>
		</table>
	</div>
</div>
	
	<div class="col-md-1"></div>
</body>
</html>