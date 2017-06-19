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
	
	<!-- Day 1 일정 -->
	<div class="scheduleView1" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Milano/hotel/Hotel Ambrosiana.jpg" class="img-circle"><br>
					   호텔 암브로시아나
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/food/Mamma Rosa.jpg" class="img-circle"><br>
					  맘마 로사
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/randmark/Galleria V Emanuele ll.jpg" class="img-circle"><br>
					  비토리오 에마누엘레 2세 갤러리
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Milano/hotel/Hotel Central Station.jpg" class="img-circle"><br>
					  센트럴 스테이션 시티 호텔</td>
				
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/food/Dogana.jpg" class="img-circle"><br>
					  도가나</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/randmark/duomo.jpg" class="img-circle"><br>
					  두오모 성당</td>
			</tr>
		</table>
	</div>
	
	<!-- Day 2 일정 -->
	<div class="scheduleView2" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Milano/hotel/Hotel Central Station.jpg" class="img-circle"><br>
					  센트럴 스테이션 시티 호텔</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/food/Trattoria da Pino.jpg" class="img-circle"><br>
					  트라토리아 다 피노
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/randmark/Castello Sforzesco.jpg" class="img-circle"><br>
					  스포르체스코 성
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/randmark/Chiesa Santa Maria delle Grazie.jpg" class="img-circle"><br>
					  산타 마리아 델레 그라치에 성당
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="6"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td colspan="2"><img alt="" src="${initParam.root }image/Milano/hotel/Idea Hotel Milano San Siro.jpg" class="img-circle"><br>
					  밀라노 산시로 호텔</td>
				
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/food/Le Tournedos.jpg" class="img-circle"><br>
					  드립 어드바이저</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td colspan="2"><img alt="" src="${initParam.root }image/Milano/shopping/Excelsior Milano.jpg" class="img-circle"><br>
					  밀라노 벼룩시장</td>
			</tr>
		</table>
	</div>
	
	<!-- Day 3 일정 -->
	<div class="scheduleView3" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Milano/hotel/Idea Hotel Milano San Siro.jpg" class="img-circle"><br>
					  밀라노 산시로 호텔</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/randmark/Lo Stadio San Siro.jpg" class="img-circle"><br>
					  산 시로 경기장
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/food/Il Luogo di Aimo e Nadia.jpg" class="img-circle"><br>
					  일 루오고 디 아이모 에 니디아
				</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="4"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td colspan="2"><img alt="" src="${initParam.root }image/Milano/shopping/Gogol Company.jpg" class="img-circle"><br>
					  고골 앤 컴퍼니</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td colspan="2"><img alt="" src="${initParam.root }image/Milano/shopping/La Rinascente.jpg" class="img-circle"><br>
					  리나센터 백화점</td>
			</tr>
		</table>
	</div>
	
	</div>
	
	<div class="col-md-1"></div>
</body>
</html>