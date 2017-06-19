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
				<td><img alt="" src="${initParam.root }image/Torino/hotel/Hotel Urbani.jpg" class="img-circle"><br>
					   호텔 에비니
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Torino/randmark/Piazza San Carlo.jpg" class="img-circle"><br>
					  산카를로 광장
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Torino/food/Hamburgeria.jpg" class="img-circle"><br>
					  함바그
				</td>
				<td><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
				<td><img alt="" src="${initParam.root }image/Torino/shopping/Eataly Torino Lingotto.jpg" class="img-circle"><br>
					 Eataly Torino Lingotto
				</td>
			
			</tr>
			
		</table>
	</div>
</div>
	
	<div class="col-md-1"></div>
</body>
</html>