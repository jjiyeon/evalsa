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
		$('.scheduleView2').hide();
		$('.scheduleView3').hide();
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
				<td><img alt="" src="${initParam.root }image/Roma/hotel/Hotel Mari.jpg" class="img-circle"><br>
					   호텔 마리2
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/randmark/trevi.jpg" class="img-circle"><br>
					  트레비 분수
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/randmark/piazza di spagna.jpg" class="img-circle"><br>
					  스페인 광장
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Roma/hotel/Hotel Mari.jpg" class="img-circle"><br>
					  호텔 마리2</td>
				
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/randmark/pantheon.jpg" class="img-circle"><br>
					  판테온</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/food/Ristorante Alfredo.jpg" class="img-circle"><br>
					  알 프레도</td>
			</tr>
		</table>
	</div>
	
	<div class="scheduleView2" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Roma/hotel/Hotel Mari.jpg" class="img-circle"><br>
					   호텔 마리2
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/randmark/piazza venezia.jpg" class="img-circle"><br>
					  베네치아 광장
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/randmark/foro romano.jpg" class="img-circle"><br>
					  포로 로마노
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Roma/randmark/bocca della verita.jpg" class="img-circle"><br>
					  진실의 입</td>
				
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/randmark/colosseo.jpg" class="img-circle"><br>
					  콜로세움</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/food/Agata e Romeo.jpg" class="img-circle"><br>
					  아가타 에 로메오</td>
			</tr>
		</table>
	</div>
	
	<div class="scheduleView3" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Roma/hotel/BB Aloha Rome.jpg" class="img-circle"><br>
					   BB 알로하 호텔
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/food/Carlo Menta.jpg" class="img-circle"><br>
					  카를로메타
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Roma/randmark/musei vaticani.jpg" class="img-circle"><br>
					  바티칸 박물관
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td colspan="2"><img alt="" src="${initParam.root }image/Roma/shopping/La Rinascente.jpg" class="img-circle"><br>
					  라리라센터 백화점</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td colspan="2"><img alt="" src="${initParam.root }image/Roma/shopping/Trionfale Market.jpg" class="img-circle"><br>
					  트리온팔레 시장</td>
			</tr>
		</table>
	</div>
	
	</div>
	
	<div class="col-md-1"></div>
</body>
</html>