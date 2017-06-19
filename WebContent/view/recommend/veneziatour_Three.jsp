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
				<td><img alt="" src="${initParam.root }image/Venezia/hotel/Nuova Locanda Belvedere.jpg" class="img-circle"><br>
					   누오바 롤킨다 벨베데즈
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/food/Osteria Enoteca Giorgione.jpg" class="img-circle"><br>
					  오스테리아 이노테마
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/shopping/Rialto Market.jpg" class="img-circle"><br>
					  리알로마켓
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Venezia/hotel/Hotel Astoria.jpg" class="img-circle"><br>
					  호텔 아스토리아</td>
				
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/randmark/Piazza di San Marco.jpg" class="img-circle"><br>
					  산마르코 대성당</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/shopping/Disney Store.jpg" class="img-circle"><br>
					  디즈니스토어</td>
			</tr>
		</table>
	</div>
	
	<div class="scheduleView2" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Venezia/hotel/Hotel Astoria.jpg" class="img-circle"><br>
					   아스토리아
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/randmark/Palazzo Ducale.jpg" class="img-circle"><br>
					  두칼레궁전
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/shopping/Officina di Santa Maria Novella.jpg" class="img-circle"><br>
					  산타마리아 노벨라 약국
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td colspan="2"><img alt="" src="${initParam.root }image/Venezia/hotel/Generator Venice Hostel.jpg" class="img-circle"><br>
					  제네라트로 베니스 호텔</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td colspan="2"><img alt="" src="${initParam.root }image/Venezia/randmark/Lido.jpg" class="img-circle"><br>
					  리도</td>
			</tr>
		</table>
	</div>
	
	<div class="scheduleView3" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Venezia/hotel/Generator Venice Hostel.jpg" class="img-circle"><br>
					   제네라트로 베니스 호텔
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/food/Taverna San Trovaso.jpg" class="img-circle"><br>
					  안트로베니
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/randmark/duomo.jpg" class="img-circle"><br>
					  산마르코 광장
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Venezia/food/Brek bar ristorante.jpg" class="img-circle"><br>
					  브렉바 레스토란테
				</td>
			
			</tr>
			
		</table>
	</div>
	
	</div>
	
	<div class="col-md-1"></div>
</body>
</html>