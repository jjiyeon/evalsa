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
	<!-- Day 1 일정 -->
	<div class="scheduleView1" align="center">
		<table style="text-align: center;">
			<tr><!-- 첫번째 줄 -->
				<td><img alt="" src="${initParam.root }image/Milano/hotel/Hotel Ambrosiana.jpg" class="img-circle"><br>
					   호텔 암브로시아나
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/randmark/Galleria V Emanuele ll.jpg" class="img-circle"><br>
					  비토리오 에마누엘레 2세 갤러리
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/randmark/Castello Sforzesco.jpg" class="img-circle"><br>
					  스포르체스코 성
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Milano/food/Dogana.jpg" class="img-circle"><br>
					  도가나</td>
			</tr>
			<tr><!-- 두번째 줄 :: 아래쪽 방향 화살표 그리는 부분 -->
				<td colspan="6"></td>
				<td><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></td>
			</tr>
			<tr><!-- 세번째 줄 -->
				<td colspan="2"><img alt="" src="${initParam.root }image/Milano/food/Trattoria da Pino.jpg" class="img-circle"><br>
					  트라토리아 다 피노
				</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td colspan="2"><img alt="" src="${initParam.root }image/Milano/shopping/Excelsior Milano.jpg" class="img-circle"><br>
					  엑셀시오르 밀라노</td>
				<td><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></td>
				<td colspan="2"><img alt="" src="${initParam.root }image/Milano/randmark/duomo.jpg" class="img-circle"><br>
					  두오모 성당</td>
			</tr>
		</table>
	</div>
	</div><!-- col-md-10 -->
	
	<div class="col-md-1"></div>
</body>
</html>